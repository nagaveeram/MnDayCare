using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DayCareLib.Common;

namespace DayCareLib.Provider
{
    class ProviderMessages
    {   
        public static string AccountLocked = "This account was locked due to repeated failed login attempts. " + ContactSupport;        
        public static string InvalidLogin = "Username or password that you provided is invalid.";
        public static string SessionTimedOut = "Your session timed out, and for your protection, you were automatically logged out.";
        public static string ContactSupport = "Please contact <a mailto='support@mndaycare.com'>Customer Support</a>";
        public static string AccountProblem = "There is a problem with your account. " + ContactSupport;
        public static string LoggedOut = "You were logged out successfully.";
        public static string AccountLockedOut = "This account was locked due to repeated failed login attempts. " + ContactSupport;
        public static string EmailChangeSuccess = "Your login email was changed successfully. Please try to re-login using your new email.";
        public static string PasswordResetSuccess = "Your password was reset successfully.";
        public static string EmailAlreadyUsed = "Email you entered is already taken by another user. Please enter another email.";
        public static string UsernameAlreadyUsed = "Username you have entered already exists. Please try a different username.";
        public static string InvalidSecurityCode = "Please enter correct security code.";
        public static string ErrorCreatingAccount = "There is a problem creating your account.&nbsp;Please try again or contact <a href='#' mailto='support@mndaycare.com'>customer support</a> if problem perists.";
        public static string AccountNoAccess = "This account cannot be accessed. " + ContactSupport;
        public static string CheckEmailForLoginInformation = "Please check your email for the login information (this may take a few minutes).";
        public static string GraphicCodeInvalid = "Invalid graphic security code.";
        public static string AlreadyHaveActiveSubscription = "You already have an active subscription.";
        public static string ErrorProcessingRequest = "There was an error processing your request. " + ContactSupport;        
        public static string TransactionDeclined = @"<b>Your transaction has been declined.</b>
                                                          <ul class=""regular"">
                                                    <li>Please verify the credit card number, the expiration date, the name on the card, the card security code, and the billing address.</li>
                                                    <li>You may also try using a different credit card or contact Customer Support if the problem persists.</li>
                                                    </ul>";

        public new static string GetMessageByID(int msgID)
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

                case 3:
                    message = ContactSupport;
                    break;

                case 4:
                    message = AccountNoAccess;
                    break;

                case 5:
                    message = AccountProblem;
                    break;

                case 6:
                    message = AccountLocked;
                    break;

                case 7:
                    message = CheckEmailForLoginInformation;
                    break;

                case 8:
                    message = GraphicCodeInvalid;
                    break;

                case 9:
                    message = LoggedOut;
                    break;

                case 10:
                    message = EmailChangeSuccess;
                    break;

                case 11:
                    message = PasswordResetSuccess;
                    break;

                default: break;
            }
            return message;
        }
    }
}
