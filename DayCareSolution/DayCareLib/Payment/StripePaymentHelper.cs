using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CommonLib;

namespace DayCareLib.Payment
{
    public class StripePaymentHelper
    {
        private static string _payflowPartner = Util.GetAppSetting("Payflow.Partner");
        private static string _payflowMerchant = Util.GetAppSetting("Payflow.Merchant");
        private static string _payflowUser = Util.GetAppSetting("Payflow.User");
        private static string _payflowPassword = Util.GetAppSetting("Payflow.Password");

        private static string _payflowHost = Util.GetAppSetting("PAYFLOW_HOST", "");
        private static int _payflowPort = int.Parse(Util.GetAppSetting("PAYFLOW_PORT", "443"));
        private static int _payflowTimeout = int.Parse(Util.GetAppSetting("PAYFLOW_TIMEOUT", "45"));

        private static string _proxyHost = Util.GetAppSetting("ProxyHost", "");
        private static int _proxyPort = int.Parse(Util.GetAppSetting("ProxyPort", "0"));
        private static string _proxyLogon = Util.GetAppSetting("ProxyLogon", "");
        private static string _proxyPassword = Util.GetAppSetting("ProxyPassword", "");

        public static CreditCardPaymentResult DoAuthorization(string ccNum, string csc, CreditCardPaymentMethod cc, decimal amount, string description, string comment1, string comment2, string ip, string userAgent)
        {
            return DoAuthorization(ccNum, csc, cc, amount, description, comment1, comment2, ip, userAgent, null);
        }

        private static CreditCardPaymentResult DoAuthorization(string ccNum, string csc, CreditCardPaymentMethod cc, decimal amount, string description, string comment1, string comment2, string ip, string userAgent, BuyerAuthenticationResult buyerAuthResult)
        {
            CreditCardPaymentResult result = new CreditCardPaymentResult();

            result.TransactionDate = DateTime.UtcNow;
            result.TransactionType = "A";
            result.Amount = amount;
            result.PayflowRequestID = PayPal.Payments.Common.Utility.PayflowUtility.RequestId;
            result.IP = ip;

            // Create PayflowConnectionData object
            PayPal.Payments.DataObjects.PayflowConnectionData pfCnn = new PayPal.Payments.DataObjects.PayflowConnectionData(_payflowHost, _payflowPort, _payflowTimeout, _proxyHost, _proxyPort, _proxyLogon, _proxyPassword);

            // Prepare user credentials
            PayPal.Payments.DataObjects.UserInfo user = new PayPal.Payments.DataObjects.UserInfo(_payflowUser, _payflowMerchant, _payflowPartner, _payflowPassword);

            // Prepare invoice
            PayPal.Payments.DataObjects.Invoice invoice = new PayPal.Payments.DataObjects.Invoice();

            invoice.Amt = new PayPal.Payments.DataObjects.Currency((decimal)amount);
            invoice.Comment1 = comment1;
            invoice.Comment2 = comment2;
            invoice.Desc = description;

            invoice.CustomerInfo = new PayPal.Payments.DataObjects.CustomerInfo();
            invoice.CustomerInfo.CustId = cc.ExternalType + "-" + cc.ExternalID;
            invoice.CustomerInfo.CustIP = cc.IP;
            invoice.CustomerInfo.CustCode = cc.ExternalType + "-" + cc.ExternalID;

            invoice.BrowserInfo = new PayPal.Payments.DataObjects.BrowserInfo();
            invoice.BrowserInfo.BrowserUserAgent = userAgent;

            invoice.BillTo = new PayPal.Payments.DataObjects.BillTo();
            invoice.BillTo.FirstName = cc.FirstName;
            invoice.BillTo.LastName = cc.LastName;
            invoice.BillTo.Street = cc.Address1;
            invoice.BillTo.BillToStreet2 = cc.Address2;
            invoice.BillTo.City = cc.City;
            invoice.BillTo.State = cc.State;
            invoice.BillTo.Zip = cc.Zip;
            invoice.BillTo.BillToCountry = cc.CountryID.ToString();
            invoice.BillTo.Email = cc.Email;
            invoice.BillTo.BillToPhone2 = cc.MobilePhone;

            invoice.ShipTo = invoice.BillTo.Copy();

            // Prepare credit card information
            PayPal.Payments.DataObjects.CreditCard creditCard = new PayPal.Payments.DataObjects.CreditCard(ccNum, cc.CcExpDate.ToString("MMyy"));
            creditCard.Name = (invoice.BillTo.FirstName + " " + invoice.BillTo.LastName).Trim();
            creditCard.Cvv2 = csc;

            PayPal.Payments.DataObjects.CardTender cardTender = new PayPal.Payments.DataObjects.CardTender(creditCard);

            // Prepare authorization transaction
            PayPal.Payments.Transactions.AuthorizationTransaction authTran = new PayPal.Payments.Transactions.AuthorizationTransaction(user, pfCnn, invoice, cardTender, result.PayflowRequestID);

            // Assign BuyerAuthentication related information
            if (buyerAuthResult != null)
            {
                PayPal.Payments.DataObjects.BuyerAuthStatus status = new PayPal.Payments.DataObjects.BuyerAuthStatus();

                status.AuthenticationStatus = buyerAuthResult.AuthenticateStatus.Trim();
                status.CAVV = buyerAuthResult.CAVV;
                status.ECI = buyerAuthResult.ECI;
                status.XID = buyerAuthResult.XID;

                authTran.BuyerAuthStatus = status;
            }

            // Submit the transaction and receive the response from Payflow server
            PayPal.Payments.DataObjects.Response response = authTran.SubmitTransaction();

            // Assign response values to the result object
            if (response != null && response.TransactionResponse != null)
            {
                result.TransactionID = ReplaceNullWithEmptyString(response.TransactionResponse.Pnref);
                result.OriginalTransactionID = ReplaceNullWithEmptyString(response.TransactionResponse.OrigPnref);
                result.ResultCode = response.TransactionResponse.Result;
                result.ResponseMessage = ReplaceNullWithEmptyString(response.TransactionResponse.RespMsg);

                result.AuthorizationCode = ReplaceNullWithEmptyString(response.TransactionResponse.AuthCode);
                result.AvsMatch = ReplaceNullWithEmptyString(response.TransactionResponse.AVSAddr) + ReplaceNullWithEmptyString(response.TransactionResponse.AVSZip);
                result.CscMatch = ReplaceNullWithEmptyString(response.TransactionResponse.CVV2Match);
                result.InternationalAvs = ReplaceNullWithEmptyString(response.TransactionResponse.IAVS);
            }

            return result;
        }

        public static CreditCardPaymentResult DoSale(string ccNum, string csc, CreditCardPaymentMethod cc, decimal amount, string description, string comment1, string comment2, string ip, string userAgent)
        {
            return DoSale(ccNum, csc, cc, amount, description, comment1, comment2, ip, userAgent, null);
        }

        private static CreditCardPaymentResult DoSale(string ccNum, string csc, CreditCardPaymentMethod cc, decimal amount, string description, string comment1, string comment2, string ip, string userAgent, BuyerAuthenticationResult buyerAuthResult)
        {
            CreditCardPaymentResult result = new CreditCardPaymentResult();

            result.TransactionDate = DateTime.UtcNow;
            result.TransactionType = "S";
            result.Amount = amount;
            result.PayflowRequestID = PayPal.Payments.Common.Utility.PayflowUtility.RequestId;
            result.IP = ip;

            // Create PayflowConnectionData object
            PayPal.Payments.DataObjects.PayflowConnectionData pfCnn = new PayPal.Payments.DataObjects.PayflowConnectionData(_payflowHost, _payflowPort, _payflowTimeout, _proxyHost, _proxyPort, _proxyLogon, _proxyPassword);

            // Prepare user credentials
            PayPal.Payments.DataObjects.UserInfo user = new PayPal.Payments.DataObjects.UserInfo(_payflowUser, _payflowMerchant, _payflowPartner, _payflowPassword);

            // Prepare invoice
            PayPal.Payments.DataObjects.Invoice invoice = new PayPal.Payments.DataObjects.Invoice();

            invoice.Amt = new PayPal.Payments.DataObjects.Currency((decimal)amount);
            invoice.Comment1 = comment1;
            invoice.Comment2 = comment2;
            invoice.Desc = description;

            invoice.CustomerInfo = new PayPal.Payments.DataObjects.CustomerInfo();
            invoice.CustomerInfo.CustId = cc.ExternalType + "-" + cc.ExternalID;
            invoice.CustomerInfo.CustIP = cc.IP;
            invoice.CustomerInfo.CustCode = cc.ExternalType + "-" + cc.ExternalID;

            invoice.BrowserInfo = new PayPal.Payments.DataObjects.BrowserInfo();
            invoice.BrowserInfo.BrowserUserAgent = userAgent;

            invoice.BillTo = new PayPal.Payments.DataObjects.BillTo();
            invoice.BillTo.FirstName = cc.FirstName;
            invoice.BillTo.LastName = cc.LastName;
            invoice.BillTo.Street = cc.Address1;
            invoice.BillTo.BillToStreet2 = cc.Address2;
            invoice.BillTo.City = cc.City;
            invoice.BillTo.State = cc.State;
            invoice.BillTo.Zip = cc.Zip;
            invoice.BillTo.BillToCountry = cc.CountryID.ToString();
            invoice.BillTo.Email = cc.Email;
            invoice.BillTo.BillToPhone2 = cc.MobilePhone;

            invoice.ShipTo = invoice.BillTo.Copy();

            // Prepare credit card information
            PayPal.Payments.DataObjects.CreditCard creditCard = new PayPal.Payments.DataObjects.CreditCard(ccNum, cc.CcExpDate.ToString("MMyy"));
            creditCard.Name = (invoice.BillTo.FirstName + " " + invoice.BillTo.LastName).Trim();
            creditCard.Cvv2 = csc;

            PayPal.Payments.DataObjects.CardTender cardTender = new PayPal.Payments.DataObjects.CardTender(creditCard);

            // Prepare sale transaction
            PayPal.Payments.Transactions.SaleTransaction saleTran = new PayPal.Payments.Transactions.SaleTransaction(user, pfCnn, invoice, cardTender, result.PayflowRequestID);

            // Assign BuyerAuthentication related information
            if (buyerAuthResult != null)
            {
                PayPal.Payments.DataObjects.BuyerAuthStatus status = new PayPal.Payments.DataObjects.BuyerAuthStatus();

                status.AuthenticationStatus = buyerAuthResult.AuthenticateStatus.Trim();
                status.CAVV = buyerAuthResult.CAVV;
                status.ECI = buyerAuthResult.ECI;
                status.XID = buyerAuthResult.XID;

                saleTran.BuyerAuthStatus = status;
            }

            // Submit the transaction and receive the response from Payflow server
            PayPal.Payments.DataObjects.Response response = saleTran.SubmitTransaction();

            // Assign response values to the result object
            if (response != null && response.TransactionResponse != null)
            {
                result.TransactionID = ReplaceNullWithEmptyString(response.TransactionResponse.Pnref);
                result.OriginalTransactionID = ReplaceNullWithEmptyString(response.TransactionResponse.OrigPnref);
                result.ResultCode = response.TransactionResponse.Result;
                result.ResponseMessage = ReplaceNullWithEmptyString(response.TransactionResponse.RespMsg);

                result.AuthorizationCode = ReplaceNullWithEmptyString(response.TransactionResponse.AuthCode);
                result.AvsMatch = ReplaceNullWithEmptyString(response.TransactionResponse.AVSAddr) + ReplaceNullWithEmptyString(response.TransactionResponse.AVSZip);
                result.CscMatch = ReplaceNullWithEmptyString(response.TransactionResponse.CVV2Match);
                result.InternationalAvs = ReplaceNullWithEmptyString(response.TransactionResponse.IAVS);
            }

            return result;
        }

        public static CreditCardPaymentResult DoSaleByReference(CreditCardPaymentMethod cc, decimal amount, string description, string comment1, string comment2, string ip, string userAgent)
        {
            CreditCardPaymentResult result = new CreditCardPaymentResult();

            result.TransactionDate = DateTime.UtcNow;
            result.TransactionType = "S";
            result.Amount = amount;
            result.PayflowRequestID = PayPal.Payments.Common.Utility.PayflowUtility.RequestId;
            result.IP = ip;

            // Create PayflowConnectionData object
            PayPal.Payments.DataObjects.PayflowConnectionData pfCnn = new PayPal.Payments.DataObjects.PayflowConnectionData(_payflowHost, _payflowPort, _payflowTimeout, _proxyHost, _proxyPort, _proxyLogon, _proxyPassword);

            // Prepare user credentials
            PayPal.Payments.DataObjects.UserInfo user = new PayPal.Payments.DataObjects.UserInfo(_payflowUser, _payflowMerchant, _payflowPartner, _payflowPassword);

            // Prepare invoice
            PayPal.Payments.DataObjects.Invoice invoice = new PayPal.Payments.DataObjects.Invoice();

            invoice.Amt = new PayPal.Payments.DataObjects.Currency((decimal)amount);
            invoice.Comment1 = comment1;
            invoice.Comment2 = comment2;
            invoice.Desc = description;

            invoice.CustomerInfo = new PayPal.Payments.DataObjects.CustomerInfo();
            invoice.CustomerInfo.CustId = cc.ExternalType + "-" + cc.ExternalID;
            invoice.CustomerInfo.CustIP = cc.IP;
            invoice.CustomerInfo.CustCode = cc.ExternalType + "-" + cc.ExternalID;

            invoice.BrowserInfo = new PayPal.Payments.DataObjects.BrowserInfo();
            invoice.BrowserInfo.BrowserUserAgent = userAgent;

            invoice.BillTo = new PayPal.Payments.DataObjects.BillTo();
            invoice.BillTo.FirstName = cc.FirstName;
            invoice.BillTo.LastName = cc.LastName;
            invoice.BillTo.Street = cc.Address1;
            invoice.BillTo.BillToStreet2 = cc.Address2;
            invoice.BillTo.City = cc.City;
            invoice.BillTo.State = cc.State;
            invoice.BillTo.Zip = cc.Zip;
            invoice.BillTo.BillToCountry = cc.CountryID.ToString();
            invoice.BillTo.Email = cc.Email;
            invoice.BillTo.BillToPhone2 = cc.MobilePhone;

            invoice.ShipTo = invoice.BillTo.Copy();

            // Prepare credit card information
            PayPal.Payments.DataObjects.CreditCard creditCard = new PayPal.Payments.DataObjects.CreditCard("", cc.CcExpDate.ToString("MMyy"));
            creditCard.Name = (invoice.BillTo.FirstName + " " + invoice.BillTo.LastName).Trim();

            PayPal.Payments.DataObjects.CardTender cardTender = new PayPal.Payments.DataObjects.CardTender(creditCard);

            // Prepare reference transaction
            PayPal.Payments.Transactions.ReferenceTransaction refTran = new PayPal.Payments.Transactions.ReferenceTransaction("S", cc.LastApprovedTransactionID, user, pfCnn, invoice, cardTender, result.PayflowRequestID);

            // Submit the transaction and receive the response from Payflow server
            PayPal.Payments.DataObjects.Response response = refTran.SubmitTransaction();

            // Assign response values to the result object
            if (response != null && response.TransactionResponse != null)
            {
                result.TransactionID = ReplaceNullWithEmptyString(response.TransactionResponse.Pnref);
                result.OriginalTransactionID = ReplaceNullWithEmptyString(response.TransactionResponse.OrigPnref);
                result.ResultCode = response.TransactionResponse.Result;
                result.ResponseMessage = ReplaceNullWithEmptyString(response.TransactionResponse.RespMsg);

                result.AuthorizationCode = ReplaceNullWithEmptyString(response.TransactionResponse.AuthCode);
                result.AvsMatch = ReplaceNullWithEmptyString(response.TransactionResponse.AVSAddr) + ReplaceNullWithEmptyString(response.TransactionResponse.AVSZip);
                result.CscMatch = ReplaceNullWithEmptyString(response.TransactionResponse.CVV2Match);
                result.InternationalAvs = ReplaceNullWithEmptyString(response.TransactionResponse.IAVS);
            }

            return result;
        }

        public static CreditCardPaymentResult DoVoid(string originalTransactionID, string externalType, int externalID, string description, string comment1, string comment2, string ip, string userAgent)
        {
            CreditCardPaymentResult result = new CreditCardPaymentResult();

            result.TransactionDate = DateTime.UtcNow;
            result.TransactionType = "V";
            result.PayflowRequestID = PayPal.Payments.Common.Utility.PayflowUtility.RequestId;
            result.IP = ip;

            // Create PayflowConnectionData object
            PayPal.Payments.DataObjects.PayflowConnectionData pfCnn = new PayPal.Payments.DataObjects.PayflowConnectionData(_payflowHost, _payflowPort, _payflowTimeout, _proxyHost, _proxyPort, _proxyLogon, _proxyPassword);

            // Prepare user credentials
            PayPal.Payments.DataObjects.UserInfo user = new PayPal.Payments.DataObjects.UserInfo(_payflowUser, _payflowMerchant, _payflowPartner, _payflowPassword);

            // Prepare invoice
            PayPal.Payments.DataObjects.Invoice invoice = new PayPal.Payments.DataObjects.Invoice();

            invoice.Comment1 = comment1;
            invoice.Comment2 = comment2;
            invoice.Desc = description;

            invoice.CustomerInfo = new PayPal.Payments.DataObjects.CustomerInfo();
            invoice.CustomerInfo.CustId = externalType + "-" + externalID;
            invoice.CustomerInfo.CustIP = ip;
            invoice.CustomerInfo.CustCode = externalType + "-" + externalID;

            invoice.BrowserInfo = new PayPal.Payments.DataObjects.BrowserInfo();
            invoice.BrowserInfo.BrowserUserAgent = userAgent;

            invoice.BillTo = new PayPal.Payments.DataObjects.BillTo();

            // Prepare void transaction
            PayPal.Payments.Transactions.VoidTransaction voidTran = new PayPal.Payments.Transactions.VoidTransaction(originalTransactionID, user, pfCnn, invoice, result.PayflowRequestID);

            // Submit the transaction and receive the response from Payflow server
            PayPal.Payments.DataObjects.Response response = voidTran.SubmitTransaction();

            // Assign response values to the result object
            if (response != null && response.TransactionResponse != null)
            {
                result.TransactionID = ReplaceNullWithEmptyString(response.TransactionResponse.Pnref);

                result.OriginalTransactionID = ReplaceNullWithEmptyString(response.TransactionResponse.OrigPnref);
                if (result.OriginalTransactionID == "")
                    result.OriginalTransactionID = originalTransactionID;

                result.ResultCode = response.TransactionResponse.Result;
                result.ResponseMessage = ReplaceNullWithEmptyString(response.TransactionResponse.RespMsg);

                result.AuthorizationCode = ReplaceNullWithEmptyString(response.TransactionResponse.AuthCode);
                result.AvsMatch = ReplaceNullWithEmptyString(response.TransactionResponse.AVSAddr) + ReplaceNullWithEmptyString(response.TransactionResponse.AVSZip);
                result.CscMatch = ReplaceNullWithEmptyString(response.TransactionResponse.CVV2Match);
                result.InternationalAvs = ReplaceNullWithEmptyString(response.TransactionResponse.IAVS);
            }

            return result;
        }

        public static CreditCardPaymentResult DoCapture(string authTransactionID)
        {
            CreditCardPaymentResult result = new CreditCardPaymentResult();

            result.TransactionDate = DateTime.UtcNow;
            result.TransactionType = "D";
            result.PayflowRequestID = PayPal.Payments.Common.Utility.PayflowUtility.RequestId;

            // Create PayflowConnectionData object
            PayPal.Payments.DataObjects.PayflowConnectionData pfCnn = new PayPal.Payments.DataObjects.PayflowConnectionData(_payflowHost, _payflowPort, _payflowTimeout, _proxyHost, _proxyPort, _proxyLogon, _proxyPassword);

            // Prepare user credentials
            PayPal.Payments.DataObjects.UserInfo user = new PayPal.Payments.DataObjects.UserInfo(_payflowUser, _payflowMerchant, _payflowPartner, _payflowPassword);

            // Prepare delayed capture transaction
            PayPal.Payments.Transactions.CaptureTransaction captureTran = new PayPal.Payments.Transactions.CaptureTransaction(authTransactionID, user, pfCnn, result.PayflowRequestID);

            // Submit the transaction and receive the response from Payflow server
            PayPal.Payments.DataObjects.Response response = captureTran.SubmitTransaction();

            // Assign response values to the result object
            if (response != null && response.TransactionResponse != null)
            {
                result.TransactionID = ReplaceNullWithEmptyString(response.TransactionResponse.Pnref);

                result.OriginalTransactionID = ReplaceNullWithEmptyString(response.TransactionResponse.OrigPnref);
                if (result.OriginalTransactionID == "")
                    result.OriginalTransactionID = authTransactionID;

                result.ResultCode = response.TransactionResponse.Result;
                result.ResponseMessage = ReplaceNullWithEmptyString(response.TransactionResponse.RespMsg);

                result.AuthorizationCode = ReplaceNullWithEmptyString(response.TransactionResponse.AuthCode);
                result.AvsMatch = ReplaceNullWithEmptyString(response.TransactionResponse.AVSAddr) + ReplaceNullWithEmptyString(response.TransactionResponse.AVSZip);
                result.CscMatch = ReplaceNullWithEmptyString(response.TransactionResponse.CVV2Match);
                result.InternationalAvs = ReplaceNullWithEmptyString(response.TransactionResponse.IAVS);
            }

            return result;
        }

        public static bool IsHardDecline(int rc)
        {
            // Payflow Pro Developer's Guide page 59
            if (rc == 12 || rc == 13 || rc == 19 || rc == 23 || rc == 24 || rc == 25 || rc == 50 || rc == 51 || rc == 111 || rc == 112 || rc == 120 || rc == 125 || rc == 126 || rc == 127 || rc == 128 || rc == 132)
                return true;
            else
                return false;
        }

        private static string ReplaceNullWithEmptyString(string s)
        {
            if (s == null)
                return "";
            else
                return s;
        }
    }
}
