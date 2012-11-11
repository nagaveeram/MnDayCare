using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DayCareLib.Common
{
    public sealed class Constants
    {
        private Constants() {}

        public sealed class Enumerators
        {
            private Enumerators() { }

            public enum Gender { Unknown = 0, Male = 1, Female = 2 }

            public enum LoginResult : int { UnknownError = -10, UsernameInvalid = -1, NotApproved = -2, LockedOut = -3, PasswordInvalid = -4, CaptchaInvalid = -5, Success = 1000 }
            public enum AccessType : int { Regular = 1, Admin = 2 }
            public enum DurationType { Days = 0, Months = 1, Years = 2, Seconds = 3, Minutes = 4 }

            public enum SubscriptionTypeStatus { Unknown = 0, Active = 1, Deleted = 2 }
            public enum SubscriptionStatus { Unknown = 0, Active = 1, Deleted = 2 }

            public enum PaymentResultFinal { Approved, Declined, AVSFailed, CSCFailed, CommError }
            public enum PaymentMethodType : int { CreditCard = 1 }
            public enum PaymentMethodStatus : int { Active = 0, AuthPending = 1, Deleted = 2, Declined = 3 }
            public enum PaymentType : int { Manual = 1, Automatic = 2, Verification = 3 }
            public enum TransactionType : int { Authorization = 1, Sale = 2 }
            public enum CreditCardType : int { Visa = 1, MasterCard = 2, Amex = 3 }
        }

        public sealed class StoredProcedures
        {   
            private StoredProcedures() { }

            public static string StatesGet = "States_Get";
            public static string UsersGetByAspnetUserID = "Users_GetByAspnetUserID";
            public static string UsersGet = "Users_Get";
            public static string UsersAdd = "Users_Add";
            public static string UserLogAdd = "UserLog_Add";
            public static string UserLogGet = "UserLog_Get";           
            public static string UserSubscriptionTypesGet = "UserSubscriptionTypes_Get";
            public static string UserSubscriptionTypesUpdateStatus = "UserSubscriptionTypes_UpdateStatus"; 
            public static string UserSubscriptionTypesAdd = "UserSubscriptionTypes_Add";
            public static string UserSubscriptionsGet = "UserSubscriptions_Get";
            public static string UserSubscriptionsAdd = "UserSubscriptions_Add";
            public static string PaymentMethodsGet = "PaymentMethods_Get";
            public static string PaymentMethodsAddCreditCard = "PaymentMethods_AddCreditCard";
            public static string PaymentMethodsUpdateCreditCard = "PaymentMethods_UpdateCreditCard";
            public static string PaymentMethodsMarkAsPrimaryOrBackup = "PaymentMethods_MarkAsPrimaryOrBackup";
            public static string PaymentMethodsUpdateCreditCardIssuingBankInfo = "PaymentMethods_UpdateCreditCardIssuingBankInfo";
            public static string PaymentsAddCreditCardPayment = "Payments_AddCreditCardPayment";
            public static string PaymentsGet = "Payments_Get";
            public static string PaymentsUpdateVoidTransactionID = "Payments_UpdateVoidTransactionID";
            public static string PaymentsUpdateCaptureTransactionID = "Payments_UpdateCaptureTransactionID";
            public static string PaymentsGetVelocityLimitCode = "Payments_GetVelocityLimitCode";
            public static string PaymentsAddMinFraudLog = "Payments_AddMinFraudLog";
            public static string PaymentsAddPayPalPayment = "Payments_AddPayPalPayment";
            public static string PaymentMethodsUpdateStatus = "PaymentMethods_UpdateStatus";
            public static string UserSubscriptionStatusGet = "UserSubscriptionStatus_Get";
            public static string UserSubscriptionsUpdateStatus = "UserSubscriptions_UpdateStatus";
            public static string DayCareRepositoryGetAll = "DayCareRepository_GetAll";
            public static string StripeUsersAdd = "StripeUsers_Add";
            public static string StripeUsersGet = "StripeUsers_Get";


            public static string ProvidersGetByAspnetUserID = "Providers_GetByAspnetUserID";
            public static string ProvidersGet = "Providers_Get";
            public static string ProvidersAdd = "Providers_Add";
            


        }

        public sealed class CustomerMessages
        {
            private CustomerMessages() { }
            public static string AccountLocked = "This account was locked due to repeated failed login attempts.&nbsp;Please contact <a href='#' mailto='support@mndaycare'>Customer Support</a>.";
            public static string CheckEmailForLoginInformation = "Please check your email for the login information (this may take a few minutes).";
            public static string InvalidLogin = "Username or password that you provided is invalid.";
            public static string SessionTimedOut = "Your session timed out, and for your protection, you were automatically logged out.";
            public static string AccountProblem = "There is a problem with your account.&nbsp;Please contact <a mailto='support@mndaycare.com'>Customer Support</a>";
            public static string LoggedOut = "You were logged out successfully.";
            public static string EmailChangeSuccess = "Your login email was changed successfully. Please try to re-login using your new email.";
            public static string PasswordResetSuccess = "Your password was reset successfully.";
            public static string UsernameAlreadyUsed = "The username that you entered is already taken.";
            public static string EmailAlreadyUsed = "The email that you entered is already used by another user.";

            public static string GetMessageByID(int msgID)
            {
                string message = "";

                switch (msgID)
                {
                    case 1:
                        message = InvalidLogin;
                        break;

                    case 2:
                        message = SessionTimedOut;
                        break;

                    default: break;
                }
                return message;
            }
        }

        public sealed class Values
        {
            private Values() { }

            public static DateTime EmptyDate = DateTime.Parse("1/1/1900");
        }

        #region ExternalTypes
        public class ExternalTypes
        {
            private ExternalTypes() { }

            public static string Users = "Users";
            public static string Subscriptions = "Subscriptions";
            public static string Payments = "Payments";
        }
        #endregion

        #region CookieKeys
        public class CookieKeys
        {
            private CookieKeys() { }
          
            public static string SurferID = "SurferID";            
        }
        #endregion

        #region AppSettingKeys

        public class AppSettingKeys
        {
            private AppSettingKeys() { }

            public static string BruteForceResistantHashSalt = "BruteForceResistantHashSalt";
            public static string BruteForceResistantHashIterations = "BruteForceResistantHashIterations";
            public static string GoogleMapsApiKey = "GoogleMapsApiKey";
            public static string StripeApiKey = "StripeApiKey";
        }

          #endregion
    }
}
