using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DayCareLib.Common;
using System.Data;

namespace DayCareLib.Payment
{
    public class CreditCardPayment : Payment
    {
        public string VoidTransactionID { get; set; }
        public string CaptureTransactionID { get; set; }
        public DateTime CaptureTransactionDate { get; set; }

        public CreditCardPayment()
        {
            VoidTransactionID = CaptureTransactionID = "";
            CaptureTransactionDate = Constants.Values.EmptyDate;
        }

        public static CreditCardPayment ConvertToCreditCardPayment(DataRow dr)
        {
            CreditCardPayment payment = new CreditCardPayment();

            payment.PaymentID = Convert.ToInt32(dr["PaymentID"]);
            payment.ExternalType = Convert.ToString(dr["ExternalType"]);
            payment.ExternalID = Convert.ToInt32(dr["ExternalID"]);

            CreditCardPaymentMethod cc = new CreditCardPaymentMethod();

            cc.ExternalType = payment.ExternalType;
            cc.ExternalID = payment.ExternalID;

            cc.PaymentMethodID = Convert.ToInt32(dr["PaymentMethodID"]);
            try { cc.FirstName = dr["FirstName"].ToString(); }
            catch { }

            try { cc.LastName = dr["LastName"].ToString(); }
            catch { }

            try { cc.Company = dr["Company"].ToString(); }
            catch { }

            try { cc.Email = dr["Email"].ToString(); }
            catch { }

            try { cc.Address1 = dr["Address1"].ToString(); }
            catch { }

            try { cc.Address2 = dr["Address2"].ToString(); }
            catch { }

            try { cc.City = dr["City"].ToString(); }
            catch { }

            try { cc.State = dr["State"].ToString(); }
            catch { }

            try { cc.Province = dr["Province"].ToString(); }
            catch { }

            try { cc.Zip = dr["Zip"].ToString(); }
            catch { }

            try { cc.CountryID = Convert.ToInt32(dr["CountryID"]); }
            catch { }

            try { cc.Country = dr["Country"].ToString(); }
            catch { }

            try { cc.Phone = dr["Phone"].ToString(); }
            catch { }

            try { cc.MobilePhone = dr["MobilePhone"].ToString(); }
            catch { }

            payment.PaymentMethodUsed = cc;

            CreditCardPaymentResult ctr = new CreditCardPaymentResult();

            try { ctr.TransactionDate = Convert.ToDateTime(dr["TransactionDate"]); }
            catch { }
            try { ctr.PaymentType = Convert.ToInt32(dr["PaymentType"]); }
            catch { }

            try { ctr.TransactionType = dr["TransactionType"].ToString(); }
            catch { }

            try { ctr.Amount = Convert.ToDecimal(dr["Amount"]); }
            catch { }

            try { ctr.TransactionID = dr["TransactionID"].ToString(); }
            catch { }

            try { ctr.ResultFinal = (Constants.Enumerators.PaymentResultFinal)Enum.Parse(typeof(Constants.Enumerators.PaymentResultFinal), dr["ResultFinal"].ToString(), true); }
            catch { }

            try { ctr.SubscriptionID = Convert.ToInt32(dr["SubscriptionID"]); }
            catch { }

            try { ctr.Description = dr["Description"].ToString(); }
            catch { }

            try { ctr.CscMatch = dr["CscMatch"].ToString(); }
            catch { }

            try { ctr.AvsMatch = dr["AvsMatch"].ToString(); }
            catch { }

            try { ctr.InternationalAvs = dr["InternationalAvs"].ToString(); }
            catch { }

            try { ctr.IP = dr["IP"].ToString(); }
            catch { }

            try { ctr.IPCountry = dr["IPCountry"].ToString(); }
            catch { }

            try { payment.TransactionResult = ctr; }
            catch { }

            try { payment.CaptureTransactionID = dr["CaptureTransactionID"].ToString(); }
            catch { }

            try { payment.CaptureTransactionDate = Convert.ToDateTime(dr["CaptureTransactionDate"]); }
            catch { }

            return payment;
        }
    }
}
