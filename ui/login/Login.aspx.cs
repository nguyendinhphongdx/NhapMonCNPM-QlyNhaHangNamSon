using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace main
{
    public partial class Login : System.Web.UI.Page
    {
        private model.Login mLogin;
        protected void Page_Load(object sender, EventArgs e)
        {
            mLogin = model.Login.GetInstant;
            fGetView();
        }

        private void fGetView()
        {
            mLogin.email = login_email.Value;
            mLogin.password = login_passowrd.Value;
        }

        private void login(object sender, EventArgs e)
        {
            if (checkUI(mLogin.email, mLogin.password))
            {

            }
        }
        private Boolean checkUI(String email, String password)
        {
           if(checkEmail(email) && checkPassword(password)){
                return true;
            }
            return false;
        }

        private Boolean checkEmail(String email)
        {
            return false;
        }
        private Boolean checkPassword(String password)
        {
            return false;
        }
    }
}