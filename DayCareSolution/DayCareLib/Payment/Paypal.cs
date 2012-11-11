using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

using CommonLib;
using DayCareLib.Common;
using DayCareLib.Payment.DAL;

namespace DayCareLib.Payment
{
    public sealed class PayPals
    {
        public static int AddPayPalPayment(string externalType, int externalID, PayPalPaymentResult result)
        {
            return PayPalData.AddPayPalPayment(externalType, externalID, result);
        }
    }
}
