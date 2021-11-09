using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace main.model
{
    public class Login
    {
        private static Login instant = null;
        public String email;
        public String password;

        private Login()
        {
            email = "";
            password = "";
        }
        public static Login GetInstant
        {
            get
            {
                if (instant == null)
                {
                    instant = new Login();
                }
                return instant;
            }
        }
    }
}