using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace main
{
    public class Global : System.Web.HttpApplication
    {
        public object BundleTable { get; private set; }

        protected void Application_Start(object sender, EventArgs e)
        {
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Application.Lock();
            Session["login"] = false;
            Session["user"] = "";
            Session["type"] = "";
            Session["mess"] = "";
            Session["sessId"] = Session.SessionID;
            Session.Timeout = 100;
            Application.UnLock();
        }
        
    }
}