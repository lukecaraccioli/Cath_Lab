using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CathLab
{
    public partial class master : System.Web.UI.MasterPage
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            if ((int)Session["LoggedIn"] <= 0)
            {
                mnuMenu.Visible = false;
                // NEED TO REDIRECT SOMEHOW........
                //string temp = Server.UrlEncode(Request.Url.ToString());
                ////Response.Redirect("~/Home.aspx?ReturnPath=" + temp);
                //Response.Redirect("/Home.aspx", false);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
    }
}