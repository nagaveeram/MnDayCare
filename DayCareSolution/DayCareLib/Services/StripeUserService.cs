using DayCareLib.Data;
using DayCareLib.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DayCareLib.Services
{
    public class StripeUserService
    {
        public static int AddStripeUser(StripeUser stripeUser)
        {
            return StripeUserData.AddStripeUser(stripeUser.UserID, stripeUser.StripeCustomerID, stripeUser.Description, stripeUser.LiveMode);
        }

        public static List<StripeUser> GetStripeUsers(int userID = 0, string stripeCustomerID = "")
        {
            return StripeUserData.GetStripeUsers(userID, stripeCustomerID);
        }
    }
}
