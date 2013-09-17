using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CathLab
{
    public partial class Inventory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (var context = new cathlabEntities())
            {
                var temp = (from prodtype in context.ProductTypes
                            select prodtype).ToList();
                lbProdType.DataSource = temp;
                lbProdType.DataValueField = "ID";
                lbProdType.DataTextField = "Type";
                lbProdType.DataBind();
            }
        }        
    }
}