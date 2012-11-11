using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DayCareLib.Common;

namespace DayCareLib.Payment
{
    public class PaymentResult
    {
        public int PaymentID { get; set; }
        public DateTime TransactionDate { get; set; }
        public int PaymentType { get; set; }
        public string TransactionType { get; set; }
        public decimal Amount { get; set; }
        public string TransactionID { get; set; }
        public Constants.Enumerators.PaymentResultFinal ResultFinal { get; set; }
        public int ResultCode { get; set; }
        public string ResponseMessage { get; set; }
        public string Description { get; set; }
        public int SubscriptionID { get; set; }
        public string Email { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Company { get; set; }
        public string Phone { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Province { get; set; }
        public string Zip { get; set; }
        public int CountryID { get; set; }
        public string CountryCode { get; set; }
        public string IP { get; set; }
        public string IPCountry { get; set; }

        public PaymentResult()
        {
            PaymentID = 0;
            PaymentType = ResultCode = SubscriptionID = 0;
            Amount = 0;
            ResultFinal = Constants.Enumerators.PaymentResultFinal.CommError;
            TransactionDate = DateTime.UtcNow;
            TransactionID = ResponseMessage = Description = "";
            TransactionID = TransactionType = Email = FirstName = LastName = Company = Phone = Address1 = Address2 = City = State = Province = Zip = CountryCode = ResponseMessage = Description = IP = IPCountry = "";
        }
    }
}
