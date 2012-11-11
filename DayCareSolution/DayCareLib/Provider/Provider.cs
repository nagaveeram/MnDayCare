using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DayCareLib.Common;
using System.Data;
using DayCareLib.Provider.DAL;
using System.Web.Security;

namespace DayCareLib.Provider
{
    public class Provider
    {
        public int ProviderID { get; set; }
        public Guid AspnetUserID { get; set; }
        public string Username { get; set; }
        public string LicenseNumber { get; set; }               
        public Constants.Enumerators.AccessType AccessType { get; set; }
        public int Status { get; set; }

        public DateTime DateCreated { get; set; }
        public DateTime DateModified { get; set; }

        public Provider()
        {
            //AspnetUserID = new Guid();
            ProviderID = Status = 0;
            Username = "";
            LicenseNumber =  "";
            DateCreated = DateModified = Constants.Values.EmptyDate;
            AccessType = Constants.Enumerators.AccessType.Regular;
        }

        public static Provider ConvertToProvider(DataRow dr)
        {
            Provider provider= new Provider();
            provider.ProviderID = Helpers.ConvertToInt(dr, "ProviderID");
            provider.AspnetUserID = Helpers.ConvertToGuid(dr, "AspnetUserID");
            provider.Username = Helpers.ConvertToString(dr, "Username");
            provider.LicenseNumber = Helpers.ConvertToString(dr, "LicenseNumber");
            
            provider.Status = Helpers.ConvertToInt(dr, "Status");
            provider.DateCreated = Helpers.ConvertToDateTime(dr, "DateCreated");
            provider.DateModified = Helpers.ConvertToDateTime(dr, "DateModified");
            return provider;
        }
    }

    public sealed class ProviderService
    {
        private ProviderService() { }

        public static Provider GetProviderByAspnetUserID(Guid aspnetUserID)
        {
            return ProviderData.GetProviderByAspnetUserID(aspnetUserID);
        }
        public static Provider GetProvider(int providerID, string username, string email)
        {
            return ProviderData.GetProvider(providerID,username,email);
        }

        //public static User GetUserByUserID(int userID)
        //{
        //    return UserData.GetUser(userID, "", "");
        //}

        //public static User GetUserByUsername(string username)
        //{
        //    return UserData.GetUser(0, username, "");
        //}

        //public static User GetUserByEmail(string email)
        //{
        //    return UserData.GetUser(0, "", email);
        //}

        
        public static string CreateProviderAccount(Provider provider)
        {
            string error = "";

            provider.Username = provider.Username.ToLower();

            Provider validateProvider = ProviderService.GetProvider(provider.ProviderID, provider.Username, "");
            if (validateProvider.ProviderID > 0)
                return ProviderMessages.UsernameAlreadyUsed;
            
            //public static int CreateProvider(Guid aspnetUserID, string username, string licenseNumber, int accessType, int status)
            int providerID = ProviderData.CreateProvider(provider.AspnetUserID, provider.Username, provider.LicenseNumber, Convert.ToInt32(provider.AccessType), provider.Status);
            if (providerID == 0)
            {
                // Delete user account
                return ProviderMessages.ErrorCreatingAccount;
            }

            provider.ProviderID = providerID;

            return error;
        }

    }
}
