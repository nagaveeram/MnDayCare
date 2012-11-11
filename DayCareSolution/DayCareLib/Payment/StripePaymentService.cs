using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;
using DayCareLib.Common;
using DayCareLib.Common.Logging;
using System.Text.RegularExpressions;

namespace DayCareLib.Payment
{   

    public sealed class StripePaymentService
    {
        #region Constants
        private const decimal MAX_AMOUNT = 1000;
        private const decimal MIN_AMOUNT = 0;
        #endregion

        #region Custom Exception
        private class CreditCardServiceException : Exception, ISerializable
        {
            public CreditCardServiceException()
                : base()
            {
            }

            public CreditCardServiceException(string message)
                : base(message)
            {
            }

            public CreditCardServiceException(string message, Exception inner)
                : base(message, inner)
            {
            }

            public CreditCardServiceException(SerializationInfo info, StreamingContext context)
                : base(info, context)
            {
            }
        }
        #endregion


        #region AddVerifyNewCreditCard
        /// <summary>
        /// Add a new credit card by first verifying it via an AUTHORIZATION only transaction.
        /// </summary>
        /// <returns>PaymentMethodID of the newly added credit card if success. If an error occurred, the returned PaymentMethodID will be 0.</returns>
        public int AddAndVerifyNewCreditCard(string externalType, int externalID, int subscriptionID, string description, int ccType, string ccNum, DateTime expDate, string csc,
                string firstName, string lastName, string company, string email, string address1, string address2,
                string city, string state, string province, string zip, int countryID, string phone, string mobilePhone,
                string ip, string userAgent, string surferID)
        {
            decimal amount = 0;

            CreditCardPaymentResult result = new CreditCardPaymentResult();

            int paymentID = ProcessPaymentUsingActualCcNum(externalType, externalID, subscriptionID, Constants.Enumerators.TransactionType.Authorization, Constants.Enumerators.PaymentType.Verification,
                ccType, ccNum, expDate, csc, amount, description, firstName, lastName, company, email, address1, address2, city, state, province, zip, countryID, phone, mobilePhone, ip, userAgent, surferID, ref result);

            CreditCardPayment creditCardPayment = CreditCardService.GetCreditCardPaymentByID(paymentID, externalType, externalID);

            if (creditCardPayment.TransactionResult.ResultFinal == Constants.Enumerators.PaymentResultFinal.Approved)
                return creditCardPayment.PaymentMethodUsed.PaymentMethodID;
            else
                return 0;
        }
        #endregion

        #region ProcessPaymentUsingActualCcNum
        /// <summary>
        /// Process AUTHORIZATION or SALE transaction using new credit card number by checking ccNumHash of previous cards used by the same customer.
        /// </summary>
        /// <returns>PaymentID which can be used to lookup the detailed results in the Payments table. If an error occurred, the returned PaymentID will be 0.</returns>
        public int ProcessPaymentUsingActualCcNum(string externalType, int externalID, int subscriptionID, Constants.Enumerators.TransactionType transactionType, Constants.Enumerators.PaymentType paymentType, int ccType, string ccNum, DateTime expDate, string csc,
                decimal amount, string description, string firstName, string lastName, string company, string email, string address1, string address2,
                string city, string state, string province, string zip, int countryID, string phone, string mobilePhone,
                string ip, string userAgent, string surferID, ref CreditCardPaymentResult result)
        {
            try
            {
                // Validate input data
                if (ccType != 1 && ccType != 2 && ccType != 3)
                    throw new CreditCardServiceException("Invalid credit card type.");

                if (!Regex.IsMatch(ccNum, @"^\d{13,19}$"))
                    throw new CreditCardServiceException("Invalid credit card number format.");

                if (expDate < DateTime.UtcNow)
                    throw new CreditCardServiceException("Invalid expiration date.");

                if (!Regex.IsMatch(csc, @"^\d{3,4}$"))
                    throw new CreditCardServiceException("Invalid card security code format.");

                if (amount < MIN_AMOUNT || amount >= MAX_AMOUNT)
                    throw new CreditCardServiceException("Invalid deposit amount.");

                // Calculate brute-force-resistant ccNumHash using  SHA256 with long secret salt 
                // and large number of iterations
                string ccNumHash = GetCreditCardNumberHash(ccNum);
                string ccLast4 = ccNum.Substring(ccNum.Length - 4);
                string ccFirst6 = ccNum.Substring(0, 6);

                // Velocity limit to prevent brute forcing
                int velocityLimitCode = GetVelocityLimitCode(externalType, externalID, ccNumHash, ip, userAgent, surferID);
                if (velocityLimitCode != 0)
                    throw new CreditCardServiceException(string.Format("Transaction cannot be processed. Please contact Customer Support and reference code [{0}].", velocityLimitCode));

                CreditCardPaymentMethod existingCc = CreditCardService.GetCreditCardByCcNumHash(externalType, externalID, ccNumHash);

                // Pass externalType and externalID to Payflow in comment1 field
                string comment1 = externalType + "-" + externalID;
                string comment2 = subscriptionID.ToString();

                CreditCardPaymentMethod updatedCc = new CreditCardPaymentMethod(externalType, externalID, ccType, ccNumHash, ccLast4, expDate,
                    firstName, lastName, company, email, address1, address2,
                    city, state, province, zip, countryID, phone, mobilePhone, ip);

                updatedCc.PaymentMethodID = existingCc.PaymentMethodID;

                // Current ccNum is NOT yet associated with the current externalID
                if (existingCc.PaymentMethodID == 0)
                {
                    // Create new credit card record with AuthPending status

                    // Save credit card information
                    updatedCc.PaymentMethodID = CreditCardService.AddCreditCard(updatedCc);

                    if (updatedCc.PaymentMethodID == 0)
                        throw new CreditCardServiceException("Provided credit card could not be added to your account. Please contact Customer Support.");
                }
                else
                {
                    // Update credit card payment method information
                    CreditCardService.UpdateCreditCard(updatedCc);
                }

                if (transactionType == Constants.Enumerators.TransactionType.Sale)
                {
                    // Perform sale transaction using the actual ccNum
                    result = StripePaymentHelper.DoSale(ccNum, csc, updatedCc, amount, description, comment1, comment2, ip, userAgent);
                }
                else
                {
                    // Perform authorization transaction using the actual ccNum
                    result = StripePaymentHelper.DoAuthorization(ccNum, csc, updatedCc, amount, description, comment1, comment2, ip, userAgent);
                }

                result.PaymentType = (int)paymentType;

                // Add credit card payment 
                // This call will save the payment result and insert register record, etc.
                result.SubscriptionID = subscriptionID;
                result.Description = description;
                result.PaymentID = CreditCardService.AddCreditCardPayment(updatedCc, result);

                // Check the ResultFinal and void the transaction (both Sale and Auth) if it was AVSFailed or CSCFailed
                VoidInvalidApprovedPayment(result, externalType, externalID, ip, userAgent);

               

                // Return paymentID
                return result.PaymentID;
            }
            catch (CreditCardServiceException e)
            {
                throw (Exception)e;
            }
            catch (Exception e)
            {
                LogError("ProcessPaymentUsingActualCcNum", e);
                throw new Exception("Error processing transaction.");
            }
        }
        #endregion

        #region ProcessPaymentUsingReferenceTransaction
        /// <summary>
        /// Process SALE transaction using reference transaction and the last approved transaction id.
        /// </summary>
        /// <returns>PaymentID which can be used to lookup the detailed results in the Payments table. If an error occurred, the returned PaymentID will be 0.</returns>
        public int ProcessPaymentUsingReferenceTransaction(string externalType, int externalID, int subscriptionID, Constants.Enumerators.PaymentType paymentType, int paymentMethodID, decimal amount, string description, string ip, string userAgent, string surferID, ref CreditCardPaymentResult result)
        {
            try
            {
                // Validate input data
                if (amount < MIN_AMOUNT || amount >= MAX_AMOUNT)
                    throw new CreditCardServiceException("Invalid deposit amount.");

                CreditCardPaymentMethod existingCc = CreditCardService.GetCreditCardByID(paymentMethodID, externalType, externalID);

                // Credit card must exist (status=3 means deleted)
                if (existingCc.PaymentMethodID == 0 || existingCc.Status == Constants.Enumerators.PaymentMethodStatus.Deleted)
                    throw new CreditCardServiceException("Credit card does not exist.");

                // LastApprovedTransactionID must be present and must have taken place within the last 11 months
                if (existingCc.LastApprovedTransactionID == "" || existingCc.LastApprovedTransactionDate < DateTime.Now.AddMonths(-11))
                    throw new CreditCardServiceException("This credit card was not used for a while and the actual credit card number must be provided anew.");

                // Expiration date must be valid
                if (existingCc.CcExpDate < DateTime.Now)
                    throw new CreditCardServiceException("Invalid expiration date.");

                // Velocity limit to prevent brute forcing
                int velocityLimitCode = GetVelocityLimitCode(externalType, externalID, existingCc.CcNumHash, ip, userAgent, surferID);
                if (velocityLimitCode != 0)
                    throw new CreditCardServiceException(string.Format("Transaction cannot be processed. Please contact Customer Support and reference code [{0}].", velocityLimitCode));

                // Pass externalID to Payflow in comment1 field
                string comment1 = externalType + "-" + externalID;
                string comment2 = subscriptionID.ToString();

                // Perform sale transaction using the lastApprovedTransactionID
                result = PayflowHelper.DoSaleByReference(existingCc, amount, "", comment1, comment2, ip, userAgent);

                // Set current IP
                existingCc.IP = ip;

                // Assign the appropriate payment type
                result.PaymentType = (int)paymentType;

                // Add credit card payment and determine the ResultFinal of this payment
                // This call will save the payment result and insert register record, etc.
                result.SubscriptionID = subscriptionID;
                result.Description = description;

                result.PaymentID = CreditCardService.AddCreditCardPayment(existingCc, result);

                // Check the ResultFinal and void the transaction (both Sale and Auth) if it was AVSFailed or CSCFailed
                VoidInvalidApprovedPayment(result, externalType, externalID, ip, userAgent);

                // Return paymentID
                return result.PaymentID;
            }
            catch (CreditCardServiceException e)
            {
                throw (Exception)e;
            }
            catch (Exception e)
            {
                LogError("ProcessPaymentUsingReferenceTransaction", e);
                throw new Exception("Error processing transaction.");
            }
        }
        #endregion


        #region Helpers
        private string GetCreditCardNumberHash(string ccNum)
        {
            string ccNumHash = Convert.ToBase64String(BruteForceResistantHash.ComputeBruteForceResistantHash(ccNum, Constants.AppSettingKeys.BruteForceResistantHashSalt, Constants.AppSettingKeys.BruteForceResistantHashIterations));
            return ccNumHash;
        }

        private int GetVelocityLimitCode(string externalType, int externalID, string ccNumHash, string ip, string userAgent, string surferID)
        {
            // Brute force prevention
            return CreditCardService.GetVelocityLimitCode(externalType, externalID, ccNumHash, ip, userAgent, surferID);
        }

        private void LogError(string error, Exception exception)
        {
            LoggingFactory.GetLogger().LogError(error, exception);
        }

        private void LogInfo(string error, Exception exception)
        {
            LoggingFactory.GetLogger().LogInfo(error, exception);
        }

        private void VoidInvalidApprovedPayment(CreditCardPaymentResult result, string externalType, int externalID, string ip, string userAgent)
        {
            // Verification transactions cannot be voided
            if (result.PaymentType == (int)Constants.Enumerators.PaymentType.Verification)
                return;

            // Check the ResultFinal and void the transaction (both Sale and Auth) if it was AVSFailed or CSCFailed
            CreditCardPayment payment = CreditCardService.GetCreditCardPaymentByID(result.PaymentID, externalType, externalID);

            if (payment.TransactionResult.ResultFinal == Constants.Enumerators.PaymentResultFinal.AVSFailed || payment.TransactionResult.ResultFinal == Constants.Enumerators.PaymentResultFinal.CSCFailed)
            {
                string errorMessage = "";

                // Perform the void transaction
                CreditCardPaymentResult voidResult = PayflowHelper.DoVoid(payment.TransactionResult.TransactionID, externalType, externalID, "", externalType + "-" + externalID, "VOID " + payment.TransactionResult.ResultFinal.ToString(), ip, userAgent);

                // If void transaction succeeded, mark the original payment as voided
                if (voidResult.ResultCode == 0)
                {
                    if (!CreditCardService.MarkCreditCardPaymentAsVoided(result.PaymentID, externalType, externalID, voidResult))
                        errorMessage = string.Format("Void succeeded but was not marked properly in the database; (PaymentID={0}; TranID={1}; Amount={2}; VoidTranID={3}; ExternalType={4}; ExternalID={5})", result.PaymentID, result.TransactionID, result.Amount, voidResult.TransactionID, externalType, externalID);
                }
                else
                {
                    // Void failed
                    errorMessage = string.Format("Void failed; (PaymentID={0}; TranID={1}; Amount={2}; VoidTranID={3}; VoidResultCode={4}; VoidResponseMessage={5}; ExternalType={6}; ExternalID={7})", result.PaymentID, result.TransactionID, result.Amount, voidResult.TransactionID, voidResult.ResultCode, voidResult.ResponseMessage, externalType, externalID);
                }

                // Log the error message
                if (errorMessage != "")
                    LogError(errorMessage, null);
                else
                    LogInfo(string.Format("Void succeeded; (PaymentID={0}; TranID={1}; Amount={2}; VoidTranID={3}; ExternalType={4}; ExternalID={5})", result.PaymentID, result.TransactionID, result.Amount, voidResult.TransactionID, externalType, externalID), null);
            }
        }
        #endregion


    }
}
