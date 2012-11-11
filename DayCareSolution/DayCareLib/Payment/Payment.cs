using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DayCareLib.Common;

namespace DayCareLib.Payment
{
    public class Payment
    {
        public int PaymentID { get; set; }
        public string ExternalType { get; set; }
        public int ExternalID { get; set; }
        public PaymentResult TransactionResult { get; set; }
        public PaymentMethod PaymentMethodUsed { get; set; }

        public Payment()
        {
            PaymentID = 0;
            ExternalType = "";
            ExternalID = 0;
        }
    }
}
