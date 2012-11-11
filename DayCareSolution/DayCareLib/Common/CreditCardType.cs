using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DayCareLib.Common
{
    public sealed class CreditCardTypes
    {
        public static Dictionary<int, string> GetCreditCardTypes()
        {
            Dictionary<int, string> ccTypes = new Dictionary<int, string>();
            ccTypes.Add(1, "Visa");
            ccTypes.Add(2, "MasterCard");
            ccTypes.Add(3, "Amex");
            return ccTypes;
        }

        public static string GetCreditCardTypeString(Constants.Enumerators.CreditCardType cType)
        {
            string cTypeStr = "";
            if (cType == Constants.Enumerators.CreditCardType.Amex)
                cTypeStr = "Amex";
            else if (cType == Constants.Enumerators.CreditCardType.MasterCard)
                cTypeStr = "MasterCard";
            else if (cType == Constants.Enumerators.CreditCardType.Visa)
                cTypeStr = "Visa";

            return cTypeStr;
        }
    }
}
