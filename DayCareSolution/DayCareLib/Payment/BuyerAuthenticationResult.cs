using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DayCareLib.Payment
{
    /// <summary>
    /// Learn more about BuyerAuthentication https://www.paypalobjects.com/en_US/vhelp/paypalmanager_help/buyer_authentication_setup.htm
    /// </summary>
    public class BuyerAuthenticationResult
    {
        public int BuyerAuthID { get; set; }
        public int PaymentMethodID { get; set; }
        public string TransactionID { get; set; }
        public DateTime LookupDate { get; set; }
        public DateTime AuthenticateDate { get; set; }
        public string LookupStatus { get; set; }
        public string AuthenticateStatus { get; set; }
        public string SignatureVerificationStatus { get; set; }
        public string CAVV { get; set; }
        public string ECI { get; set; }
        public string PaReq { get; set; }
        public string XID { get; set; }
        public string AcsUrl { get; set; }
        public string LookupErrorNo { get; set; }
        public string LookupErrorDesc { get; set; }
        public string AuthenticateErrorNo { get; set; }
        public string AuthenticateErrorDesc { get; set; }

        public BuyerAuthenticationResult()
        {
            BuyerAuthID = PaymentMethodID = 0;
            LookupDate = AuthenticateDate = DateTime.UtcNow;
            LookupStatus = AuthenticateStatus = AuthenticateStatus = SignatureVerificationStatus = CAVV = ECI = PaReq = XID = AcsUrl = LookupErrorNo = LookupErrorDesc = AuthenticateErrorNo = AuthenticateErrorDesc = "";
        }

        public BuyerAuthenticationResult(int buyerAuthID, int paymentMethodID, string transactionID, DateTime lookupDate,
            DateTime authenticateDate, string lookupStatus, string authenticateStatus, string signatureVerificationStatus,
            string cavv, string eci, string paReq, string xid, string acsUrl, string lookupErrorNo, string lookupErrorDesc,
            string authenticateErrorNo, string authenticateErrorDesc)
        {
            BuyerAuthID = buyerAuthID;
            PaymentMethodID = paymentMethodID;
            TransactionID = transactionID;
            LookupDate = lookupDate;
            AuthenticateDate = authenticateDate;
            LookupStatus = lookupStatus;
            AuthenticateStatus = authenticateStatus;
            SignatureVerificationStatus = signatureVerificationStatus;
            CAVV = cavv;
            ECI = eci;
            XID = xid;
            AcsUrl = acsUrl;
            PaReq = paReq;
            LookupErrorNo = lookupErrorNo;
            LookupErrorDesc = lookupErrorDesc;
            AuthenticateErrorNo = authenticateErrorNo;
            AuthenticateErrorDesc = authenticateErrorDesc;
        }
    }
}
