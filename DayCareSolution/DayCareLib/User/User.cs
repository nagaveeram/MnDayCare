using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DayCareLib.Common;
using System.Data;
using DayCareLib.User.DAL;
using System.Web.Security;

namespace DayCareLib.User
{
    public class User
    {
        public int UserID {get; set; }
        public string Email { get; set;}
        public Guid AspnetUserID {get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public Constants.Enumerators.AccessType AccessType { get; set; }
        public int Status { get; set; }

        public string FirstName {get; set; }
        public string LastName { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public string Phone { get; set; }
        public Constants.Enumerators.Gender Gender { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime DateModified { get; set; }

        public User()
        {
            AspnetUserID = new Guid();
            UserID = 0;
            Status = 0;
            Username = Email = FirstName = LastName = Phone = Password = "";
            Address1 = Address2 = City = State = Zip = "";
            Gender = Constants.Enumerators.Gender.Unknown;
            DateCreated = DateModified = Constants.Values.EmptyDate;
            AccessType = Constants.Enumerators.AccessType.Regular;
        }

        public static User ConvertToUser(DataRow dr)
        {
            User user = new User();            
            user.UserID = Helpers.ConvertToInt(dr, "UserID");
            user.AspnetUserID = Helpers.ConvertToGuid(dr, "AspnetUserID");
            user.Username = Helpers.ConvertToString(dr, "Username");
            user.Email = Helpers.ConvertToString(dr, "Email");
            user.Password = Helpers.ConvertToString(dr, "Password");
            user.Status = Helpers.ConvertToInt(dr, "Status");
            user.FirstName = Helpers.ConvertToString(dr, "FirstName");
            user.LastName = Helpers.ConvertToString(dr, "LastName");
            user.Address1 = Helpers.ConvertToString(dr, "Address1");
            user.Address2 = Helpers.ConvertToString(dr, "Address2");
            user.City = Helpers.ConvertToString(dr, "City");
            user.State = Helpers.ConvertToString(dr, "State");
            user.Zip = Helpers.ConvertToString(dr, "Zip");
            user.Phone = Helpers.ConvertToString(dr, "Phone");
            user.DateCreated = Helpers.ConvertToDateTime(dr, "DateCreated");
            user.DateModified = Helpers.ConvertToDateTime(dr, "DateModified");
            return user;
        }
    }

    public sealed class UserService
    {
        private UserService() {}

        public static User GetUserByAspnetUserID(Guid aspnetUserID)
        {
            return UserData.GetUserByAspnetUserID(aspnetUserID);
        }

        public static User GetUserByUserID(int userID)
        {
            return UserData.GetUser(userID, "", "");
        }

        public static User GetUserByUsername(string username)
        {
            return UserData.GetUser(0, username, "");
        }

        public static User GetUserByEmail(string email)
        {
            return UserData.GetUser(0, "", email);
        }

        public static string CreateUserAccount(MembershipProvider userMembershipProvider, User user)
        {
            string error = "";

            user.Email = user.Email.ToLower();

            User validateUser = UserService.GetUserByUsername(user.Username);
            if (validateUser.UserID > 0)
                return UserMessages.UsernameAlreadyUsed;

            
            validateUser = UserService.GetUserByEmail(user.Email);
            if (validateUser.UserID > 0)
                return UserMessages.EmailAlreadyUsed;

           
            MembershipCreateStatus status;          
            MembershipUser mu = userMembershipProvider.CreateUser(user.Email, user.Password, user.Email, null, null, true, null, out status);

            if (status != MembershipCreateStatus.Success)
                return UserMessages.ErrorCreatingAccount;

            user.AspnetUserID = (Guid)mu.ProviderUserKey;

            int userID = CreateUserAccount(user);

            if(userID == 0)
            {
                // Delete user account
                userMembershipProvider.DeleteUser(user.Email, true);
                return UserMessages.ErrorCreatingAccount;
            }

            user.UserID = userID;
            
            return error;
        }

        private static int CreateUserAccount(User user)
        {
            int userID = UserData.CreateUser(user.AspnetUserID, user.Username, user.AccessType.GetHashCode(), user.Status, user.FirstName, user.LastName, user.Address1, user.Address2, user.City, user.State, user.Zip, user.Phone);
            return userID;
        }
    }
}
