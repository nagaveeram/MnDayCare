using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using DayCareLib.Common;

namespace DayCareLib.Payment
{
    public class CreditCardPaymentMethod : PaymentMethod
    {
        public Constants.Enumerators.CreditCardType CcType { get; set; }
        public string CcNumHash { get; set; }
        public string CcLast4 { get; set; }
        public DateTime CcExpDate { get; set; }
        public string CscMatch { get; set; }
        public string AvsMatch { get; set; }
        public string InternationalAvs { get; set; }
        public string LastApprovedTransactionID { get; set; }
        public DateTime LastApprovedTransactionDate { get; set; }
        public string IssuingBankInfo { get; set; }
       


        public new string DropDownDisplayName
        {
            get
            {
                string s = CcType.ToString() + " - XXXX" + CcLast4 + " - Exp " + CcExpDate.ToString("MM/yy");
                if (this.IsPrimary)
                    s += " [primary]";
                return s;
            }
        }

        public CreditCardPaymentMethod()
        {
            CcNumHash = CcLast4 = CscMatch = AvsMatch = InternationalAvs = LastApprovedTransactionID = IssuingBankInfo = "";
            CcExpDate = LastApprovedTransactionDate  = Constants.Values.EmptyDate;
        }

        #region ConvertToCreditCard
        public static CreditCardPaymentMethod ConvertToCreditCard(DataRow dr)
        {
            CreditCardPaymentMethod cc = new CreditCardPaymentMethod();

            cc.PaymentMethodID = Convert.ToInt32(dr["PaymentMethodID"]);
            cc.ExternalType = Convert.ToString(dr["ExternalType"]);
            cc.ExternalID = Convert.ToInt32(dr["ExternalID"]);
            cc.PaymentMethodType = (Constants.Enumerators.PaymentMethodType)Convert.ToInt32(dr["Type"]);
            cc.Status = (Constants.Enumerators.PaymentMethodStatus)Convert.ToInt32(dr["Status"]);
            cc.IsPrimary = Convert.ToBoolean(dr["IsPrimary"]);
            cc.IsBackup = Convert.ToBoolean(dr["IsBackup"]);
            cc.CcType = (Constants.Enumerators.CreditCardType)Convert.ToInt32(dr["CcType"]);
            cc.CcNumHash = dr["CcNumHash"].ToString();
            cc.CcLast4 = dr["CcLast4"].ToString();
            cc.CcExpDate = Convert.ToDateTime(dr["CcExpDate"]);
            cc.FirstName = dr["FirstName"].ToString();
            cc.LastName = dr["LastName"].ToString();
            cc.Company = dr["Company"].ToString();
            cc.Email = dr["Email"].ToString();
            cc.Address1 = dr["Address1"].ToString();
            cc.Address2 = dr["Address2"].ToString();
            cc.City = dr["City"].ToString();
            cc.State = dr["State"].ToString();
            cc.Province = dr["Province"].ToString();
            cc.Zip = dr["Zip"].ToString();
            cc.CountryID = Convert.ToInt32(dr["CountryID"]);
            cc.Country = dr["Country"].ToString();
            cc.Phone = dr["Phone"].ToString();
            cc.MobilePhone = dr["MobilePhone"].ToString();
            cc.CscMatch = dr["CscMatch"].ToString();
            cc.AvsMatch = dr["AvsMatch"].ToString();
            cc.InternationalAvs = dr["InternationalAvs"].ToString();
            cc.DateValidated = Convert.ToDateTime(dr["DateValidated"]);
            cc.DateSignatureReceived = Convert.ToDateTime(dr["DateSignatureReceived"]);
            cc.DateAdded = Convert.ToDateTime(dr["DateAdded"]);
            cc.DateModified = Convert.ToDateTime(dr["DateModified"]);
            cc.LastApprovedTransactionID = dr["LastApprovedTransactionID"].ToString();
            cc.LastApprovedTransactionDate = Convert.ToDateTime(dr["LastApprovedTransactionDate"]);
            cc.IssuingBankInfo = dr["IssuingBankInfo"].ToString();
            cc.IP = dr["IP"].ToString();
            cc.IPCountry = dr["IPCountry"].ToString();        

            return cc;
        }
        #endregion

        public CreditCardPaymentMethod(string externalType, int externalID, int ccType, string ccNumHash, string ccLast4, DateTime expDate,
                string firstName, string lastName, string company, string email, string address1, string address2,
                string city, string state, string province, string zip, int countryID, string phone, string mobilePhone,
                string ip)
        {
            CcType = (Constants.Enumerators.CreditCardType)ccType;
            CcExpDate = expDate;
            CcNumHash = ccNumHash;
            CcLast4 = ccLast4;

            this.ExternalType = externalType;
            this.ExternalID = externalID;
            this.FirstName = firstName;
            this.LastName = lastName;
            this.Company = company;
            this.Email = email;
            this.Address1 = address1;
            this.Address2 = address2;
            this.City = city;
            this.State = state;
            this.Province = province;
            this.Zip = zip;
            this.CountryID = countryID;
            this.Phone = phone;
            this.MobilePhone = mobilePhone;
            this.IP = ip;
        }
    }
}
