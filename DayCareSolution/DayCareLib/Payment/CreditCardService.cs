using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DayCareLib.Common;
using DayCareLib.Payment.DAL;

namespace DayCareLib.Payment
{
    public sealed class CreditCardService
    {
        #region Get Credit Cards
        public static List<CreditCardPaymentMethod> GetCreditCards(string externalType, int externalID)
        {
            return CreditCardData.GetCreditCards(externalType, externalID, false);
        }

        public static List<CreditCardPaymentMethod> GetCreditCards(string externalType, int externalID, bool includeInactive)
        {
            return CreditCardData.GetCreditCards(externalType, externalID, includeInactive);
        }

        public static CreditCardPaymentMethod GetCreditCardByID(int ccID, string externalType, int externalID)
        {
            return CreditCardData.GetCreditCardByID(ccID, externalType, externalID);
        }

        public static CreditCardPaymentMethod GetCreditCardByCcNumHash(string externalType, int externalID, string ccNumHash)
        {
            return CreditCardData.GetCreditCardByCcNumHash(externalType, externalID, ccNumHash);
        }

        public static CreditCardPaymentMethod GetPrimaryCreditCard(string externalType, int externalID)
        {
            return CreditCardData.GetPrimaryCreditCard(externalType, externalID);
        }

        public static int FindPrimaryPaymentMethodID(List<CreditCardPaymentMethod> ccList)
        {
            int paymentMethodID = 0;
            for (int i = 0; i < ccList.Count; i++)
                if (ccList[i].IsPrimary)
                {
                    paymentMethodID = ccList[i].PaymentMethodID;
                    break;
                }
            return paymentMethodID;
        }
        #endregion

        #region Add Credit Cards
        public static int AddCreditCard(CreditCardPaymentMethod cc)
        {
            return CreditCardData.AddCreditCard(cc);
        }
        #endregion

        #region Update Credit Card
        public static bool MarkAsPrimary(int paymentMethodID, string externalType, int externalID)
        {
            return CreditCardData.MarkAsPrimary(paymentMethodID, externalType, externalID);
        }

        public static bool MarkAsBackup(int paymentMethodID, string externalType, int externalID)
        {
            return CreditCardData.MarkAsBackup(paymentMethodID, externalType, externalID);
        }

        public static bool MarkAsDeleted(int paymentMethodID, string externalType, int externalID)
        {
            return UpdatePaymentMethodStatus(paymentMethodID, externalType, externalID, Constants.Enumerators.PaymentMethodStatus.Deleted);
        }

        public static bool UpdateCreditCard(CreditCardPaymentMethod cc)
        {
            return CreditCardData.UpdateCreditCard(cc);
        }

        public static bool UpdateCreditCardIssuingBankInfo(CreditCardPaymentMethod cc, string issuingBankInfo)
        {
            return CreditCardData.UpdateCreditCardIssuingBankInfo(cc, issuingBankInfo);
        }

        public static bool UpdatePaymentMethodStatus(int paymentMethodID, string externalType, int externalID, Constants.Enumerators.PaymentMethodStatus newStatus)
        {
            return CreditCardData.UpdatePaymentMethodStatus(paymentMethodID, externalType, externalID, newStatus);
        }
        #endregion

        #region Payments
        public static int AddCreditCardPayment(CreditCardPaymentMethod cc, CreditCardPaymentResult result)
        {
            return CreditCardData.AddCreditCardPayment(cc, result);
        }

        public static CreditCardPayment GetCreditCardPaymentByID(int paymentID, string externalType, int externalID)
        {
            return CreditCardData.GetCreditCardPaymentByID(paymentID, externalType, externalID);
        }

        public static bool MarkCreditCardPaymentAsVoided(int paymentID, string externalType, int externalID, CreditCardPaymentResult result)
        {
            return CreditCardData.MarkCreditCardPaymentAsVoided(paymentID, externalType, externalID, result);
        }

        public static bool MarkCreditCardPaymentAsCaptured(int paymentID, string externalType, int externalID, CreditCardPaymentResult result)
        {
            return CreditCardData.MarkCreditCardPaymentAsCaptured(paymentID, externalType, externalID, result);
        }

        public static bool MarkCreditCardPaymentAsCaptureProblem(int paymentID, string externalType, int externalID, string problem)
        {
            return CreditCardData.MarkCreditCardPaymentAsCaptureProblem(paymentID, externalType, externalID, problem);
        }

        public static int GetVelocityLimitCode(string externalType, int externalID, string ccNumHash, string ip, string userAgent, string surferID)
        {
            return CreditCardData.GetVelocityLimitCode(externalType, externalID, ccNumHash, ip, userAgent, surferID);
        }
        #endregion
    }
}
