using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DayCareLib.Payment
{
    public class PayPalPaymentResult : PaymentResult
    {
        public string PayerID { get; set; }
        public string PayerStatus { get; set; }
        public string AddressStatus { get; set; }
        public string PaymentStatus { get; set; }
        public string Ack { get; set; }
        public string Token { get; set; }
        public string Custom { get; set; }

        public PayPalPaymentResult()
        {
            TransactionDate = DateTime.UtcNow;
            TransactionID = PayerID = Email = FirstName = LastName = Company = Phone = Address1 = Address2 = City = State = Province = Zip = CountryCode = PayerStatus = AddressStatus = PaymentStatus = ResponseMessage = Token = Description = Custom = "";
        }
    }
}
