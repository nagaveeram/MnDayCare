using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DayCareLib.Payment
{
    public class CreditCardPaymentResult : PaymentResult
    {
        public string OriginalTransactionID { get; set; }
        public string AuthorizationCode { get; set; }
        public string CscMatch { get; set; }
        public string AvsMatch { get; set; }
        public string InternationalAvs { get; set; }
        public string PayflowRequestID { get; set; }

        public CreditCardPaymentResult()
        {
            TransactionDate = DateTime.UtcNow;
            PaymentType = SubscriptionID = 0;
            OriginalTransactionID = AuthorizationCode = CscMatch = AvsMatch = InternationalAvs = PayflowRequestID = "";
        }
    }
}
