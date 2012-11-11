using System;
using System.Collections.Generic;
using System.Text;
using DayCareLib.Common;

namespace DayCareLib.Payment
{
    public abstract class PaymentMethod
    {
        public int PaymentMethodID { get; set; }
        public string ExternalType { get; set; }
        public int ExternalID { get; set; }
        public Constants.Enumerators.PaymentMethodType PaymentMethodType { get; set; }
        public Constants.Enumerators.PaymentMethodStatus Status { get; set; }
        public bool IsPrimary { get; set; }
        public bool IsBackup { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Company { get; set; }
        public string Email { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Province { get; set; }
        public string Zip { get; set; }
        public int CountryID { get; set; }
        public string Country { get; set; }
        public string Phone { get; set; }
        public string MobilePhone { get; set; }
        public DateTime DateValidated { get; set; }
        public DateTime DateSignatureReceived { get; set; }
        public DateTime DateAdded { get; set; }
        public DateTime DateModified { get; set; }
        public string IP { get; set; }
        public string IPCountry { get; set; }

        public string DropDownDisplayName
        {
            get { return PaymentMethodID.ToString(); }
        }

        public PaymentMethod()
        {
            PaymentMethodType = Constants.Enumerators.PaymentMethodType.CreditCard;
            ExternalType = FirstName = LastName = Company = Email = Address1 = Address2 = City = State = Zip = Phone = MobilePhone = IP = IPCountry = "";
            PaymentMethodID = ExternalID = CountryID = 0;
            DateValidated = DateSignatureReceived = DateAdded = DateModified = Constants.Values.EmptyDate;
        }
    }
}
