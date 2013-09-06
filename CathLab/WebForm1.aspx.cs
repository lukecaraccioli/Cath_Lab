using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CathLab
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RadGrid1_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            using (var context = new cathlabEntities())
            {
                var temp = (from prod in context.Products
                            where prod.ExpirationDate == DateTime.Today
                            select new { prod.ExpirationDate, prod.Location.LocationName , prod.PartNumber1.NameSize});
                RadGrid1.DataSource = temp.ToList();
            } 
        }
    }
}