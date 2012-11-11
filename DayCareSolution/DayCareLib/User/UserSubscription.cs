using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DayCareLib.Common;
using System.Data;
using DayCareLib.User.DAL;
using DayCareLib.Payment;
using DayCareLib.Common.Logging;

namespace DayCareLib.User
{
    public class UserSubscription
    {
        public int SubscriptionID { get; set; }
        public int UserID { get; set; }
        public int SubscriptionTypeID { get; set; }
        public int Quantity { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public int Status { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime DateCancelled { get; set; }
        public DateTime DateModified { get; set; }
    

        public UserSubscription()
        {
            SubscriptionID = UserID = SubscriptionTypeID = Status =  Quantity = 0;
            StartDate = EndDate = DateCreated = DateCancelled = DateModified = Constants.Values.EmptyDate;
        }

        public static UserSubscription ConvertToUserSubscription(DataRow dr)
        {
            UserSubscription userSub = new UserSubscription();

            userSub.SubscriptionID = Helpers.ConvertToInt(dr, "SubscriptionID");
            userSub.UserID = Helpers.ConvertToInt(dr, "UserID");
            userSub.Status = Helpers.ConvertToInt(dr, "Status");
            userSub.Quantity = Helpers.ConvertToInt(dr, "Quantity");
            userSub.SubscriptionTypeID = Helpers.ConvertToInt(dr, "SubscriptionTypeID");

            userSub.StartDate = Helpers.ConvertToDateTime(dr, "StartDate");
            userSub.EndDate = Helpers.ConvertToDateTime(dr, "EndDate");
            userSub.DateCreated = Helpers.ConvertToDateTime(dr, "DateCreated");
            userSub.DateCancelled = Helpers.ConvertToDateTime(dr, "DateCancelled");
            userSub.DateModified = Helpers.ConvertToDateTime(dr, "DateModified");

            return userSub;
        }
    }


    public class UserSubscriptionRequest
    {
        public int UserID { get; set; }

        public int UserSubscriptionTypeID { get; set; }

        public Constants.Enumerators.TransactionType TransactionType { get; set; }
        public Constants.Enumerators.PaymentType PaymentType { get; set; }

        public UserSubscriptionRequest(int userID, int userSubscriptionTypeID, Constants.Enumerators.TransactionType transactionType, Constants.Enumerators.PaymentType paymentType, string ip, string userAgent, string surferID)
        {
            this.UserID = userID;
            this.UserSubscriptionTypeID = userSubscriptionTypeID;
            this.TransactionType = transactionType;
            this.PaymentType = paymentType;
            this.IP = ip;
            this.UserAgent = userAgent;
            this.SurferID = surferID;
        }

        public string IP { get; set; }
        public string UserAgent { get; set; }
        public string SurferID { get; set; }

        /* Credit Card Specific Fields */       
        public int PaymentMethodID { get; set; }
        public int CcType { get; set; }
        public string CcNum { get; set; }
        public DateTime ExpDate { get; set; }
        public string Csc { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public int CountryID { get; set; }
        public string Phone { get; set; }
        public string MobilePhone { get; set; }

        public bool SetCreditCard(int paymentMethodID)
        {
            CreditCardPaymentMethod cpm = CreditCardService.GetCreditCardByID(paymentMethodID, Constants.ExternalTypes.Users, UserID);
            if (cpm.PaymentMethodID == 0 || cpm.PaymentMethodID == 0)
                return false;

            PaymentMethodID = cpm.PaymentMethodID;
            CcType = cpm.CcType.GetHashCode();
            CcNum = cpm.CcNumHash;
            ExpDate = cpm.CcExpDate;
            FirstName = cpm.FirstName;
            LastName = cpm.LastName;
            Email = cpm.Email;
            Phone = cpm.Phone;
            Address1 = cpm.Address1;
            Address2 = cpm.Address2;
            City = cpm.City;
            State = cpm.State;
            Zip = cpm.Zip;
            CountryID = cpm.CountryID;

            return true;
        }


        public void SetCreditCard(int paymentMethodID,
               int ccType, string ccNum, DateTime expDate, string csc,
               string firstName, string lastName, string email,
               string address1, string address2, string city, string state, string zip, int countryID,
               string phone, string mobilePhone)
        {
            PaymentMethodID = paymentMethodID;
            CcType = ccType;
            CcNum = ccNum;
            ExpDate = expDate;
            Csc = csc;
            FirstName = firstName;
            LastName = lastName;
            Email = email;
            Address1 = address1;
            Address2 = address2;
            City = city;
            State = state;
            Zip = zip;
            CountryID = countryID;
            Phone = phone;
            MobilePhone = mobilePhone;
        }
    }

    public class UserSubscriptionResult
    {
        public int UserSubscriptionID { get; set; }

        public int PaymentID { get; set; }
        
        public List<string> ErrorMessages { get; set; }

        public UserSubscriptionResult()
        {
            UserSubscriptionID = 0;
            ErrorMessages = new List<string>();
        }
    }

    public sealed class UserSubscriptionService
    {
        private UserSubscriptionService() {}

        public static UserSubscriptionResult ProcessUserSubscriptionRequest(UserSubscriptionRequest req)
        {
            UserSubscriptionResult result = new UserSubscriptionResult();
            List<UserSubscription> subscriptions = GetUserSubscriptions(req.UserID);

            if (subscriptions.Count > 0)
            {
                result.ErrorMessages.Add(UserMessages.AlreadyHaveActiveSubscription);
                return result;
            }

            UserSubscriptionType subscriptionType = GetUserSubscriptionType(req.UserSubscriptionTypeID);

            if (subscriptionType.SubscriptionTypeID == 0)
            {
                result.ErrorMessages.Add(UserMessages.ErrorProcessingRequest);
                return result;
            }

            List<UserSubscription> existingSubscriptions = GetUserSubscriptions(req.UserID);
            if (existingSubscriptions.Count > 0)
            {
                result.ErrorMessages.Add(UserMessages.AlreadyHaveActiveSubscription);
                return result;
            }

            DateTime dateStart = DateTime.UtcNow.Date;
            DateTime dateEnd = subscriptionType.GetDateEnd(dateStart);

            int subscriptionID = AddUserSubscription(req.UserID, req.UserSubscriptionTypeID, dateStart, dateEnd, 0);

            if (subscriptionID == 0)
            {
                result.ErrorMessages.Add(UserMessages.ErrorProcessingRequest);
                return result;
            }


            PayflowPaymentService ccs = new PayflowPaymentService();
            int paymentID = 0;

            CreditCardPaymentResult creditCardTransactionResult = new CreditCardPaymentResult();
            if (req.PaymentMethodID == 0)
                paymentID = ccs.ProcessPaymentUsingActualCcNum(Constants.ExternalTypes.Users, req.UserID, subscriptionID, req.TransactionType, req.PaymentType, req.CcType, req.CcNum, req.ExpDate, req.Csc, subscriptionType.Amount, subscriptionType.Description, req.FirstName, req.LastName, "", req.Email, req.Address1, req.Address2, req.City, req.State, "", req.Zip, req.CountryID, req.Phone, req.MobilePhone, req.IP, req.UserAgent, req.SurferID, ref creditCardTransactionResult);
            else
            {

            }
            if (paymentID == 0)
            {
                AddSubscriptionError(req, subscriptionType);
                result.ErrorMessages.Add(UserMessages.ErrorProcessingRequest);
                return result;
            }

            CreditCardPayment payment = CreditCardService.GetCreditCardPaymentByID(paymentID, Constants.ExternalTypes.Users, req.UserID);

            if (payment.PaymentID == 0)
            {
                AddSubscriptionError(req, subscriptionType);
                result.ErrorMessages.Add(UserMessages.ErrorProcessingRequest);
                return result;
            }

            // Hard Decline
            if (payment.TransactionResult.ResultFinal == Constants.Enumerators.PaymentResultFinal.AVSFailed ||
                payment.TransactionResult.ResultFinal == Constants.Enumerators.PaymentResultFinal.CSCFailed ||
                payment.TransactionResult.ResultFinal == Constants.Enumerators.PaymentResultFinal.Declined)
            {
                result.ErrorMessages.Add(UserMessages.TransactionDeclined);
                return result;
            }
            else if (payment.TransactionResult.ResultFinal == Constants.Enumerators.PaymentResultFinal.CommError)
            {
                result.ErrorMessages.Add(UserMessages.ErrorProcessingRequest);
                return result;
            }

            result.PaymentID = paymentID;

            // Create Transaction Register "Debit" with Order Total Price
            
            // Update user subscription status
            UpdateUserSubscriptionStatus(subscriptionID, req.UserID, Constants.Enumerators.SubscriptionStatus.Active);

            return result;

        }

        public static bool UpdateUserSubscriptionStatus(int subscriptionID, int userID, Constants.Enumerators.SubscriptionStatus status)
        {
            return UserSubscriptionData.UpdateUserSubscriptionStatus(subscriptionID, userID, status.GetHashCode());
        }

        private static void AddSubscriptionError(UserSubscriptionRequest req, UserSubscriptionType subscriptionType)
        {   
            string ccLast4 = "";
            try { ccLast4 = new string('x', req.CcNum.Length - 4) + req.CcNum.Substring(req.CcNum.Length - 4); }
            catch { ccLast4 = ""; }

            string error = string.Format(@"Error in subscription: {0} \r\n 
                                                            Name:{1}\r\n 
                                                            Email: {2}\r\n 
                                                            Payment Type: {2} \r\n
                                                            CcLast4: {3} \r\n",
                                                subscriptionType.Description + "(" + subscriptionType.SubscriptionTypeID + ")",
                                                req.FirstName + " " + req.LastName,
                                                req.Email,
                                                req.PaymentType.ToString(),
                                                ccLast4);
            LoggingFactory.GetLogger().LogError(error, null);
        }

        public static List<UserSubscriptionType> GetUserSubscriptionTypes()
        {
            return UserSubscriptionData.GetUserSubscriptionTypes();
        }

        public static UserSubscriptionType GetUserSubscriptionType(int subscriptionTypeID)
        {
            List<UserSubscriptionType> subscriptionTypes = GetUserSubscriptionTypes();
            UserSubscriptionType subType = subscriptionTypes.FirstOrDefault(s => s.SubscriptionTypeID == subscriptionTypeID) ?? new UserSubscriptionType();
            return subType;
        }

        public static int AddUserSubscriptionType(decimal amount, Constants.Enumerators.DurationType durationType, double durationTime, int totalCycles, string name, string description, int status = 1, int rank = 0)
        {   
            return UserSubscriptionData.AddUserSubscriptionType(amount, durationType.GetHashCode(), durationTime, totalCycles, name, description, status, rank);
        }

        public static bool DeleteUserSubscriptionType(int subscriptionTypeID)
        {
            return UserSubscriptionData.UpdateUserSubscriptionTypeStatus(subscriptionTypeID, Constants.Enumerators.SubscriptionTypeStatus.Deleted.GetHashCode());
        }

        public static bool UpdateUserSubscriptionTypeStatus(int subscriptionTypeID, int status)
        {
            return UserSubscriptionData.UpdateUserSubscriptionTypeStatus(subscriptionTypeID, status);
        }

        public static List<UserSubscription> GetUserSubscriptions(int userID = 0, DateTime? dateStart = null, DateTime? dateEnd = null, int status = 1)
        {
            return UserSubscriptionData.GetUserSubscriptions(userID, dateStart, dateEnd, status);  
        }

        public static DateTime GetUserSubscriptionExpiryDate(int userID)
        {
            return UserSubscriptionData.GetUserSubscriptionExpiryDate(userID);
        }

        public static int AddUserSubscription(int userID, int subscriptionTypeID, DateTime dateStart, DateTime dateEnd, int status = 1)
        {
            return UserSubscriptionData.AddUserSubscription(userID, subscriptionTypeID, dateStart, dateEnd, status);
        }
    }
}
