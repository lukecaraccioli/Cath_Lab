using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CathLab.UserControls
{
    public partial class NewProductType : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            using (var context = new cathlabEntities())
            {
                ProductType pt = new ProductType();
                pt.Type = tbType.Text;
                context.ProductTypes.Add(pt);
                context.SaveChanges();
            }
        }
    }
}