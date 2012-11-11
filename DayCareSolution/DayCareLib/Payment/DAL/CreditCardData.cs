using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using CommonLib;
using DayCareLib.Common;

namespace DayCareLib.Payment.DAL
{
    public sealed class CreditCardData
    {
        #region Get Credit Cards
        public static List<CreditCardPaymentMethod> GetCreditCards(string externalType, int externalID)
        {
            return GetCreditCards(externalType, externalID, false);
        }

        public static List<CreditCardPaymentMethod> GetCreditCards(string externalType, int externalID, bool includeInactive)
        {
            List<CreditCardPaymentMethod> ccList = new List<CreditCardPaymentMethod>();

            DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.PaymentMethodsGet,
                CommonData.SqlParam("@ExternalType", SqlDbType.VarChar, 100, externalType),
                CommonData.SqlParam("@ExternalID", SqlDbType.Int, 4, externalID),
                CommonData.SqlParam("@Type", SqlDbType.TinyInt, 1, (int)Constants.Enumerators.PaymentMethodType.CreditCard),
                CommonData.SqlParam("@IncludeInactive", SqlDbType.Bit, 1, (includeInactive ? 1 : 0)));

            if (ds != null && ds.Tables["Data"] != null)
            {
                DataTable dt = ds.Tables["Data"];

                foreach (DataRow dr in dt.Rows)
                {
                    CreditCardPaymentMethod cc = CreditCardPaymentMethod.ConvertToCreditCard(dr);
                    ccList.Add(cc);
                }
            }

            return ccList;
        }

        public static CreditCardPaymentMethod GetCreditCardByID(int ccID, string externalType, int externalID)
        {
            CreditCardPaymentMethod cc = new CreditCardPaymentMethod();

            DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.PaymentMethodsGet,
                 CommonData.SqlParam("@ExternalType", SqlDbType.VarChar, 100, externalType),
                CommonData.SqlParam("@ExternalID", SqlDbType.Int, 4, externalID),
                CommonData.SqlParam("@Type", SqlDbType.TinyInt, 1, (int)Constants.Enumerators.PaymentMethodType.CreditCard),
                CommonData.SqlParam("@UserPaymentMethodID", SqlDbType.Int, 4, ccID),
                CommonData.SqlParam("@IncludeInactive", SqlDbType.Bit, 1, 1));

            if (ds != null && ds.Tables["Data"] != null && ds.Tables["Data"].Rows.Count == 1)
                cc = CreditCardPaymentMethod.ConvertToCreditCard(ds.Tables["Data"].Rows[0]);

            return cc;
        }

        public static CreditCardPaymentMethod GetCreditCardByCcNumHash(string externalType, int externalID, string ccNumHash)
        {
            List<CreditCardPaymentMethod> ccList = GetCreditCards(externalType, externalID, true);
            CreditCardPaymentMethod cc = new CreditCardPaymentMethod();
            if (ccList != null && ccList.Count > 0)
            {
                cc = ccList.Where(c => (c.CcNumHash == ccNumHash)).FirstOrDefault();
                if (cc == null)
                    cc = new CreditCardPaymentMethod();
            }
            return cc;
        }

        public static CreditCardPaymentMethod GetPrimaryCreditCard(string externalType, int externalID)
        {
            CreditCardPaymentMethod cc = new CreditCardPaymentMethod();

            DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.PaymentMethodsGet,
                CommonData.SqlParam("@ExternalType", SqlDbType.VarChar, 100, externalType),
                CommonData.SqlParam("@ExternalID", SqlDbType.Int, 4, externalID),
                CommonData.SqlParam("@Type", SqlDbType.TinyInt, 1, (int)Constants.Enumerators.PaymentMethodType.CreditCard),
                CommonData.SqlParam("@IsPrimary", SqlDbType.Bit, 1, 1),
                CommonData.SqlParam("@IncludeInactive", SqlDbType.Bit, 1, 0));

            if (ds != null && ds.Tables["Data"] != null && ds.Tables["Data"].Rows.Count == 1)
                cc = CreditCardPaymentMethod.ConvertToCreditCard(ds.Tables["Data"].Rows[0]);

            return cc;
        }
        #endregion

        #region Add Credit Card
        public static int AddCreditCard(CreditCardPaymentMethod cc)
        {
            int ccID = 0;

            DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.PaymentMethodsAddCreditCard,
                 CommonData.SqlParam("@ExternalType", SqlDbType.VarChar, 100, cc.ExternalType),
                 CommonData.SqlParam("@ExternalID", SqlDbType.Int, 4, cc.ExternalID),
                 CommonData.SqlParam("@CcType", SqlDbType.TinyInt, 1, cc.CcType),
                 CommonData.SqlParam("@CcNumHash", SqlDbType.VarChar, 100, cc.CcNumHash),
                 CommonData.SqlParam("@CcLast4", SqlDbType.Char, 4, cc.CcLast4),
                 CommonData.SqlParam("@CcExpDate", SqlDbType.SmallDateTime, 4, cc.CcExpDate),
                 CommonData.SqlParam("@FirstName", SqlDbType.NVarChar, 100, cc.FirstName),
                 CommonData.SqlParam("@LastName", SqlDbType.NVarChar, 100, cc.LastName),
                 CommonData.SqlParam("@Company", SqlDbType.NVarChar, 100, cc.Company),
                 CommonData.SqlParam("@Email", SqlDbType.NVarChar, 100, cc.Email),
                 CommonData.SqlParam("@Address1", SqlDbType.NVarChar, 100, cc.Address1),
                 CommonData.SqlParam("@Address2", SqlDbType.NVarChar, 100, cc.Address2),
                 CommonData.SqlParam("@City", SqlDbType.NVarChar, 100, cc.City),
                 CommonData.SqlParam("@State", SqlDbType.Char, 2, cc.State),
                 CommonData.SqlParam("@Province", SqlDbType.NVarChar, 100, cc.Province),
                 CommonData.SqlParam("@Zip", SqlDbType.VarChar, 10, cc.Zip),
                 CommonData.SqlParam("@CountryID", SqlDbType.SmallInt, 2, cc.CountryID),
                 CommonData.SqlParam("@Phone", SqlDbType.VarChar, 50, cc.Phone),
                 CommonData.SqlParam("@MobilePhone", SqlDbType.VarChar, 50, cc.MobilePhone),
                 CommonData.SqlParam("@Ip", SqlDbType.VarChar, 15, cc.IP),
                 CommonData.SqlParam("@PaymentMethodID", ParameterDirection.Output, SqlDbType.Int, 4, 0));

            if (ds != null && ds.Tables["Parameters"] != null)
            {
                DataRow[] dr = ds.Tables["Parameters"].Select("Name='@paymentMethodID'");
                if (dr.Length > 0)
                    ccID = int.Parse(dr[0]["Value"].ToString());
            }

            return ccID;
        }
        #endregion

        #region Update Credit Card
        public static bool MarkAsPrimary(int paymentMethodID, string externalType, int externalID)
        {
            bool success = false;

            DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.PaymentMethodsMarkAsPrimaryOrBackup,
                CommonData.SqlParam("@ExternalType", SqlDbType.VarChar, 100, externalType),
                CommonData.SqlParam("@ExternalID", SqlDbType.Int, 4, externalID),
                CommonData.SqlParam("@PaymentMethodID", SqlDbType.Int, 4, paymentMethodID),
                CommonData.SqlParam("@MarkAs", SqlDbType.VarChar, 10, "primary"),
                CommonData.SqlParam("@ResultCode", ParameterDirection.Output, SqlDbType.Int, 4, 0));

            if (ds != null && ds.Tables["Parameters"] != null)
            {
                DataRow[] dr = ds.Tables["Parameters"].Select("Name='@ResultCode'");
                if (dr.Length > 0)
                    success = (Convert.ToInt32(dr[0]["Value"]) == 0);
            }

            return success;
        }

        public static bool MarkAsBackup(int paymentMethodID, string externalType, int externalID)
        {
            bool success = false;

            DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.PaymentMethodsMarkAsPrimaryOrBackup,
                CommonData.SqlParam("@ExternalType", SqlDbType.VarChar, 100, externalType),
                CommonData.SqlParam("@ExternalID", SqlDbType.Int, 4, externalID),
                CommonData.SqlParam("@PaymentMethodID", SqlDbType.Int, 4, paymentMethodID),
                CommonData.SqlParam("@MarkAs", SqlDbType.VarChar, 10, "backup"),
                CommonData.SqlParam("@ResultCode", ParameterDirection.Output, SqlDbType.Int, 4, 0));

            if (ds != null && ds.Tables["Parameters"] != null)
            {
                DataRow[] dr = ds.Tables["Parameters"].Select("Name='@ResultCode'");
                if (dr.Length > 0)
                    success = (Convert.ToInt32(dr[0]["Value"]) == 0);
            }

            return success;
        }

        public static bool UpdateCreditCard(CreditCardPaymentMethod cc)
        {
            CreditCardPaymentMethod oldCc = GetCreditCardByID(cc.PaymentMethodID, cc.ExternalType, cc.ExternalID);

            bool success = false;

            DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.PaymentMethodsUpdateCreditCard,
                CommonData.SqlParam("@ExternalType", SqlDbType.VarChar, 100, cc.ExternalType),
                CommonData.SqlParam("@ExternalID", SqlDbType.Int, 4, cc.ExternalID),
                CommonData.SqlParam("@PaymentMethodID", SqlDbType.Int, 4, cc.PaymentMethodID),
                CommonData.SqlParam("@FirstName", SqlDbType.NVarChar, 100, cc.FirstName),
                CommonData.SqlParam("@LastName", SqlDbType.NVarChar, 100, cc.LastName),
                CommonData.SqlParam("@Company", SqlDbType.NVarChar, 100, cc.Company),
                CommonData.SqlParam("@Email", SqlDbType.NVarChar, 100, cc.Email),
                CommonData.SqlParam("@Address1", SqlDbType.NVarChar, 100, cc.Address1),
                CommonData.SqlParam("@Address2", SqlDbType.NVarChar, 100, cc.Address2),
                CommonData.SqlParam("@City", SqlDbType.NVarChar, 100, cc.City),
                CommonData.SqlParam("@State", SqlDbType.Char, 2, cc.State),
                CommonData.SqlParam("@Province", SqlDbType.NVarChar, 100, cc.Province),
                CommonData.SqlParam("@Zip", SqlDbType.NVarChar, 10, cc.Zip),
                CommonData.SqlParam("@CountryID", SqlDbType.Int, 100, cc.CountryID),
                CommonData.SqlParam("@Phone", SqlDbType.VarChar, 50, cc.Phone),
                CommonData.SqlParam("@MobilePhone", SqlDbType.VarChar, 50, cc.MobilePhone),
                CommonData.SqlParam("@CcExpDate", SqlDbType.DateTime, 8, cc.CcExpDate),
                CommonData.SqlParam("@Ip", SqlDbType.VarChar, 15, cc.IP),
                CommonData.SqlParam("@ResultCode", ParameterDirection.Output, SqlDbType.Int, 4, 0));

            if (ds != null && ds.Tables["Parameters"] != null)
            {
                DataRow[] dr = ds.Tables["Parameters"].Select("Name='@ResultCode'");
                if (dr.Length > 0)
                    success = (Convert.ToInt32(dr[0]["Value"]) == 0);
            }

            return success;
        }

        public static bool UpdateCreditCardIssuingBankInfo(CreditCardPaymentMethod cc, string issuingBankInfo)
        {
            bool success = false;

            CreditCardPaymentMethod oldCc = GetCreditCardByID(cc.PaymentMethodID, cc.ExternalType, cc.ExternalID);

            if (string.Compare(oldCc.IssuingBankInfo, issuingBankInfo, true) != 0)
            {
                DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.PaymentMethodsUpdateCreditCardIssuingBankInfo,
                    CommonData.SqlParam("@ExternalType", SqlDbType.VarChar, 100, cc.ExternalType),
                    CommonData.SqlParam("@ExternalID", SqlDbType.Int, 4, cc.ExternalID),
                    CommonData.SqlParam("@PaymentMethodID", SqlDbType.Int, 4, cc.PaymentMethodID),
                    CommonData.SqlParam("@IssuingBankInfo", SqlDbType.VarChar, 255, issuingBankInfo),
                    CommonData.SqlParam("@ResultCode", ParameterDirection.Output, SqlDbType.Int, 4, 0));

                if (ds != null && ds.Tables["Parameters"] != null)
                {
                    DataRow[] dr = ds.Tables["Parameters"].Select("Name='@ResultCode'");
                    if (dr.Length > 0)
                        success = (Convert.ToInt32(dr[0]["Value"]) == 0);
                }
            }

            return success;
        }

        public static bool UpdatePaymentMethodStatus(int paymentMethodID, string externalType, int externalID, Constants.Enumerators.PaymentMethodStatus newStatus)
        {
            bool success = false;

            DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.PaymentMethodsUpdateStatus,
                CommonData.SqlParam("@PaymentMethodID", SqlDbType.Int, 4, paymentMethodID),
                CommonData.SqlParam("@ExternalType", SqlDbType.VarChar, 100, externalType),
                CommonData.SqlParam("@ExternalID", SqlDbType.Int, 4, externalID),
                CommonData.SqlParam("@NewStatus", SqlDbType.Int, 4, (int)newStatus),
                CommonData.SqlParam("@ResultCode", ParameterDirection.Output, SqlDbType.Int, 4, 0));

            if (ds != null && ds.Tables["Parameters"] != null)
            {
                DataRow[] dr = ds.Tables["Parameters"].Select("Name='@ResultCode'");
                if (dr.Length > 0)
                    success = (Convert.ToInt32(dr[0]["Value"]) == 0);
            }

            return success;
        }
        #endregion

        #region Payments
        public static int AddCreditCardPayment(CreditCardPaymentMethod cc, CreditCardPaymentResult result)
        {
            int paymentID = 0;
            string resultFinal = "";

            DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.PaymentsAddCreditCardPayment,
                CommonData.SqlParam("@ExternalType", SqlDbType.VarChar, 100, cc.ExternalType),
                CommonData.SqlParam("@ExternalID", SqlDbType.Int, 4, cc.ExternalID),
                CommonData.SqlParam("@PaymentMethodID", SqlDbType.Int, 4, cc.PaymentMethodID),
                CommonData.SqlParam("@SubscriptionID", SqlDbType.Int, 4, result.SubscriptionID),
                CommonData.SqlParam("@TransactionDate", SqlDbType.DateTime, 8, DateTime.UtcNow),
                CommonData.SqlParam("@PaymentType", SqlDbType.TinyInt, 1, result.PaymentType),
                CommonData.SqlParam("@TransactionType", SqlDbType.Char, 1, result.TransactionType),
                CommonData.SqlParam("@Amount", SqlDbType.Money, 1, result.Amount),
                CommonData.SqlParam("@TransactionID", SqlDbType.VarChar, 50, result.TransactionID),
                CommonData.SqlParam("@OriginalTransactionID", SqlDbType.VarChar, 50, result.OriginalTransactionID),
                CommonData.SqlParam("@Description", SqlDbType.VarChar, 255, result.Description),
                CommonData.SqlParam("@ResultCode", SqlDbType.Int, 4, result.ResultCode),
                CommonData.SqlParam("@ResponseMessage", SqlDbType.VarChar, 255, result.ResponseMessage),
                CommonData.SqlParam("@AuthorizationCode", SqlDbType.VarChar, 10, result.AuthorizationCode),
                CommonData.SqlParam("@CscMatch", SqlDbType.VarChar, 10, result.CscMatch),
                CommonData.SqlParam("@AvsMatch", SqlDbType.VarChar, 10, result.AvsMatch),
                CommonData.SqlParam("@InternationalAvs", SqlDbType.Char, 1, result.InternationalAvs),
                CommonData.SqlParam("@Ip", SqlDbType.VarChar, 15, result.IP),
                CommonData.SqlParam("@PayflowRequestID", SqlDbType.VarChar, 50, result.PayflowRequestID),
                CommonData.SqlParam("@PaymentID", ParameterDirection.Output, SqlDbType.Int, 4, 0),
                CommonData.SqlParam("@ResultFinal", ParameterDirection.Output, SqlDbType.VarChar, 50, ""));

            if (ds != null && ds.Tables["Parameters"] != null)
            {
                DataRow[] dr = ds.Tables["Parameters"].Select("Name='@PaymentID'");
                if (dr.Length > 0)
                    paymentID = int.Parse(dr[0]["Value"].ToString());

                dr = ds.Tables["Parameters"].Select("Name='@resultFinal'");
                if (dr.Length > 0)
                    resultFinal = dr[0]["Value"].ToString();
            }

            return paymentID;
        }

        public static CreditCardPayment GetCreditCardPaymentByID(int paymentID, string externalType, int externalID)
        {
            CreditCardPayment payment = new CreditCardPayment();

            DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.PaymentsGet,
                CommonData.SqlParam("@ExternalType", SqlDbType.VarChar, 100, externalType),
                CommonData.SqlParam("@ExternalID", SqlDbType.Int, 4, externalID),
                CommonData.SqlParam("@PaymentID", SqlDbType.Int, 4, paymentID));

            if (ds != null && ds.Tables["Data"] != null && ds.Tables["Data"].Rows.Count > 0)
            {
                DataRow dr = ds.Tables["Data"].Rows[0];
                payment = CreditCardPayment.ConvertToCreditCardPayment(dr);
            }

            return payment;
        }

        public static DataTable GetPaymentsDataTable(string externalType, int externalID)
        {
            DataTable dt = null;

            DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.PaymentsGet,
               CommonData.SqlParam("@ExternalType", SqlDbType.VarChar, 100, externalType),
               CommonData.SqlParam("@ExternalID", SqlDbType.Int, 4, externalID),
               CommonData.SqlParam("@PaymentID", SqlDbType.Int, 4, 0));

            if (ds != null && ds.Tables["Data"] != null)
                dt = ds.Tables["Data"];

            return dt;
        }

        public static bool MarkCreditCardPaymentAsVoided(int paymentID, string externalType, int externalID, CreditCardPaymentResult result)
        {
            bool success = false;

            DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.PaymentsUpdateVoidTransactionID,
                CommonData.SqlParam("@ExternalType", SqlDbType.VarChar, 100, externalType),
                CommonData.SqlParam("@ExternalID", SqlDbType.Int, 4, externalID),
                CommonData.SqlParam("@PaymentID", SqlDbType.Int, 4, paymentID),
                CommonData.SqlParam("@VoidTransactionID", SqlDbType.VarChar, 50, result.TransactionID),
                CommonData.SqlParam("@ResultCode", ParameterDirection.Output, SqlDbType.Int, 4, 0));

            if (ds != null && ds.Tables["Parameters"] != null)
            {
                DataRow[] dr = ds.Tables["Parameters"].Select("Name='@ResultCode'");
                if (dr.Length > 0)
                    success = (Convert.ToInt32(dr[0]["Value"]) == 0);
            }

            return success;
        }

        public static bool MarkCreditCardPaymentAsCaptured(int paymentID, string externalType, int externalID, CreditCardPaymentResult result)
        {
            bool success = false;

            DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.PaymentsUpdateCaptureTransactionID,
                CommonData.SqlParam("@ExternalType", SqlDbType.VarChar, 100, externalType),
                CommonData.SqlParam("@ExternalID", SqlDbType.Int, 4, externalID),
                CommonData.SqlParam("@PaymentID", SqlDbType.Int, 4, paymentID),
                CommonData.SqlParam("@CaptureTransactionID", SqlDbType.VarChar, 50, result.TransactionID),
                CommonData.SqlParam("@CaptureTransactionDate", SqlDbType.DateTime, 8, result.TransactionDate),
                CommonData.SqlParam("@ResultCode", ParameterDirection.Output, SqlDbType.Int, 4, 0));

            if (ds != null && ds.Tables["Parameters"] != null)
            {
                DataRow[] dr = ds.Tables["Parameters"].Select("Name='@ResultCode'");
                if (dr.Length > 0)
                    success = (Convert.ToInt32(dr[0]["Value"]) == 0);
            }

            return success;
        }

        public static bool MarkCreditCardPaymentAsCaptureProblem(int paymentID, string externalType, int externalID, string problem)
        {
            bool success = false;

            DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.PaymentsUpdateCaptureTransactionID,
                CommonData.SqlParam("@ExternalType", SqlDbType.VarChar, 100, externalType),
                CommonData.SqlParam("@ExternalID", SqlDbType.Int, 4, externalID),
                CommonData.SqlParam("@PaymentID", SqlDbType.Int, 4, paymentID),
                CommonData.SqlParam("@CaptureTransactionID", SqlDbType.VarChar, 50, problem),
                CommonData.SqlParam("@CaptureTransactionDate", SqlDbType.DateTime, 8, DateTime.UtcNow),
                CommonData.SqlParam("@ResultCode", ParameterDirection.Output, SqlDbType.Int, 4, 0));

            if (ds != null && ds.Tables["Parameters"] != null)
            {
                DataRow[] dr = ds.Tables["Parameters"].Select("Name='@ResultCode'");
                if (dr.Length > 0)
                    success = (Convert.ToInt32(dr[0]["Value"]) == 0);
            }

            return success;
        }

        public static int GetVelocityLimitCode(string externalType, int externalID, string ccNumHash, string ip, string userAgent, string surferID)
        {
            int limitCode = 999;

            DataSet ds = CommonData.ExecuteStoredProcedure(Constants.StoredProcedures.PaymentsGetVelocityLimitCode,
                CommonData.SqlParam("@ExternalType", SqlDbType.VarChar, 100, externalType),
                CommonData.SqlParam("@ExternalID", SqlDbType.Int, 4, externalID),
                CommonData.SqlParam("@CcNumHash", SqlDbType.VarChar, 100, ccNumHash),
                CommonData.SqlParam("@Ip", SqlDbType.VarChar, 15, ip),
                CommonData.SqlParam("@UserAgent", SqlDbType.VarChar, 255, userAgent),
                CommonData.SqlParam("@SurferID", SqlDbType.VarChar, 50, surferID),
                CommonData.SqlParam("@LimitCode", ParameterDirection.Output, SqlDbType.Int, 4, 0));

            if (ds != null && ds.Tables["Parameters"] != null)
            {
                DataRow[] dr = ds.Tables["Parameters"].Select("Name='@LimitCode'");
                if (dr.Length > 0)
                    limitCode = int.Parse(dr[0]["Value"].ToString());
            }

            return limitCode;
        }
        #endregion
    }
}
