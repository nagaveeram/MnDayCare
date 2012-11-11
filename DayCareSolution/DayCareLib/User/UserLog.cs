using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DayCareLib.Common;
using System.Data;
using DayCareLib.User.DAL;

namespace DayCareLib.User
{
    public class UserLog
    {
         public int UserLogID { get; set; }
        public DateTime Date { get; set; }
        public Guid AspnetUserID { get; set; }
        public int UserID { get; set; }        
        public string Action { get; set; }
        public string IP { get; set; }
        public string UserAgent { get; set; }
        public string SurferID { get; set; }

        public UserLog()
        {
            UserLogID = UserID = 0;
            AspnetUserID = Guid.Empty;
            Date = Constants.Values.EmptyDate;
            Action = IP = UserAgent = SurferID = "";
        }

        #region ConvertToUserLogItem
        public static UserLog ConvertToUserLogItem(DataRow dr)
        {
            UserLog uli = new UserLog();

            try { uli.UserLogID = Convert.ToInt32(dr["UserLogID"].ToString()); }
            catch { }

            try { uli.AspnetUserID = new Guid(dr["AspnetUserID"].ToString()); }
            catch { }

            try { uli.Date = Convert.ToDateTime(dr["Date"].ToString()); }
            catch { }

            try { uli.UserID = Convert.ToInt32(dr["UserID"].ToString()); }
            catch { }
            
            try { uli.Action = Convert.ToString(dr["Action"].ToString()); }
            catch { }

            try { uli.IP = Convert.ToString(dr["IP"].ToString()); }
            catch { }

            try { uli.UserAgent = Convert.ToString(dr["UserAgent"].ToString()); }
            catch { }

            try { uli.SurferID = Convert.ToString(dr["SurferID"].ToString()); }
            catch { }
            
            return uli;
        }
        #endregion
    }

    public sealed class UserLogService
    {
        private UserLogService() { }

        public static List<UserLog> GetByAspnetUserID(DateTime dateFrom, DateTime dateTo, Guid aspnetUserID)
        {
            return UserLogData.GetByAspnetUserID(dateFrom, dateTo, aspnetUserID);
        }

        public static int AddUserLog(Guid aspnetUserID, int userID, string action, string ip, string userAgent, string surferID)
        {
            return UserLogData.AddUserLog(aspnetUserID, userID, action, ip, userAgent, surferID);
        }

        public static List<UserLog> GetByUserID(DateTime dateFrom, DateTime dateTo, int userID)
        {
            return UserLogData.GetByUserID(dateFrom, dateTo, userID);
        }
    }
}
