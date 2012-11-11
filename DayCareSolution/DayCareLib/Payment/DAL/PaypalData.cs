using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using CommonLib;
using DayCareLib.Common;

namespace DayCareLib.Payment.DAL
{
    public sealed class PayPalData
    {
        #region Payments
        public static int AddPayPalPayment(string externalType, int externalID, PayPalPaymentResult result)
        {
            int paymentID = 0;
            string resultFinal = "";

            DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.PaymentsAddPayPalPayment,
                CommonData.SqlParam("@externalType", SqlDbType.VarChar, 100, externalType),
                CommonData.SqlParam("@externalID", SqlDbType.Int, 4, externalID),
                CommonData.SqlParam("@subscriptionID", SqlDbType.Int, 4, result.SubscriptionID),
                CommonData.SqlParam("@amount", SqlDbType.Money, 1, result.Amount),
                CommonData.SqlParam("@transactionDate", SqlDbType.DateTime, 8, result.TransactionDate),
                CommonData.SqlParam("@paymentType", SqlDbType.TinyInt, 1, result.PaymentType),
                CommonData.SqlParam("@transactionID", SqlDbType.VarChar, 50, result.TransactionID),
                CommonData.SqlParam("@paypalPayerID", SqlDbType.VarChar, 50, Util.Left(result.PayerID, 50)),
                CommonData.SqlParam("@payPalEmail", SqlDbType.VarChar, 100, Util.Left(result.Email, 100)),
                CommonData.SqlParam("@payPalFirstName", SqlDbType.VarChar, 100, Util.Left(result.FirstName, 100)),
                CommonData.SqlParam("@payPalLastName", SqlDbType.VarChar, 100, Util.Left(result.LastName, 100)),
                CommonData.SqlParam("@payPalCompany", SqlDbType.VarChar, 100, Util.Left(result.Company, 100)),
                CommonData.SqlParam("@payPalPhone", SqlDbType.VarChar, 50, Util.Left(result.Phone, 50)),
                CommonData.SqlParam("@payPalAddress1", SqlDbType.VarChar, 100, Util.Left(result.Address1, 100)),
                CommonData.SqlParam("@payPalAddress2", SqlDbType.VarChar, 100, Util.Left(result.Address2, 100)),
                CommonData.SqlParam("@payPalCity", SqlDbType.VarChar, 100, Util.Left(result.City, 100)),
                CommonData.SqlParam("@payPalStateOrProvince", SqlDbType.VarChar, 100, Util.Left(result.State, 100)),
                CommonData.SqlParam("@payPalZip", SqlDbType.VarChar, 10, Util.Left(result.Zip, 10)),
                CommonData.SqlParam("@payPalCountryCode", SqlDbType.Char, 2, Util.Left(result.CountryCode, 2)),
                CommonData.SqlParam("@payPalPayerStatus", SqlDbType.VarChar, 10, Util.Left(result.PayerStatus, 10)),
                CommonData.SqlParam("@payPalAddressStatus", SqlDbType.VarChar, 10, Util.Left(result.AddressStatus, 10)),
                CommonData.SqlParam("@payPalPaymentStatus", SqlDbType.VarChar, 10, Util.Left(result.PaymentStatus, 10)),
                CommonData.SqlParam("@payPalResponseMessage", SqlDbType.VarChar, 255, Util.Left(result.ResponseMessage, 255)),
                CommonData.SqlParam("@description", SqlDbType.VarChar, 255, Util.Left(result.Description, 255)),
                CommonData.SqlParam("@ip", SqlDbType.VarChar, 15, result.IP),
                CommonData.SqlParam("@payPalToken", SqlDbType.VarChar, 50, Util.Left(result.Token, 50)),
                CommonData.SqlParam("@paymentID", ParameterDirection.Output, SqlDbType.Int, 4, 0),
                CommonData.SqlParam("@resultFinal", ParameterDirection.Output, SqlDbType.VarChar, 50, ""));

            if (ds != null && ds.Tables["Parameters"] != null)
            {
                DataRow[] dr = ds.Tables["Parameters"].Select("Name='@paymentID'");
                if (dr.Length > 0)
                    paymentID = int.Parse(dr[0]["Value"].ToString());

                dr = ds.Tables["Parameters"].Select("Name='@resultFinal'");
                if (dr.Length > 0)
                    resultFinal = dr[0]["Value"].ToString();
            }

            return paymentID;
        }
        #endregion
    }
}
