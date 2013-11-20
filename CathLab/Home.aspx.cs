using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CathLab
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {            
            if ((int)Session["LoggedIn"] <= 0)
                loginControl.Visible = true;            
            else
                loginControl.Visible = false;
        }

        protected void Page_Load(object sender, EventArgs e)
        { }

        protected void aspLogin_LoggedIn(object sender, EventArgs e)
        {
            
        }

        protected void aspLogin_LoggingIn(object sender, LoginCancelEventArgs e)
        {            
            using(var context = new cathlabEntities())
            {
                Login login = (from log in context.Logins where log.UserName == loginControl.UserName && log.Password == loginControl.Password select log).FirstOrDefault();
                if (login != null)
                {
                    Session["LoggedIn"] = login.Id;
                    Response.Redirect("~/Inventory/Inventory.aspx");
                }
                else
                {
                    e.Cancel = true;
                    loginControl.FailureText = "Invalid Login";
                }
            }
        }
    }
}