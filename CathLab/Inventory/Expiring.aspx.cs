using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CathLab
{
    public partial class Expiring : System.Web.UI.Page
    {
        public static int days;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                days = 1;
            }
        }

        protected void RadGrid1_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            DateTime upper = DateTime.Today.AddDays(days).AddHours(23).AddMinutes(59);
            using (var context = new cathlabEntities())
            {
                var temp = (from prod in context.Products
                            where prod.ExpirationDate >= DateTime.Today && prod.ExpirationDate <= upper
                            select new { prod.ExpirationDate, prod.Location.LocationName, prod.PartNumber1.NameSize }).AsEnumerable()
                            .Select(a => new { ExpirationDate = a.ExpirationDate.Value.ToLongDateString(), a.NameSize, a.LocationName });
                RadGrid1.DataSource = temp.ToList();
            }
        }

        protected void GetExpiredRange()
        {
            DateTime upper = DateTime.Today.AddDays(days).AddHours(23).AddMinutes(59);
            using (var context = new cathlabEntities())
            {
                var temp = (from prod in context.Products
                            where prod.ExpirationDate >= DateTime.Today && prod.ExpirationDate <= upper
                            select new { prod.ExpirationDate.Value, prod.ExpirationDate.Value.Month, prod.ExpirationDate.Value.Day, prod.PartNumber1.NameSize, prod.Location.LocationName })
                            .OrderBy(a => a.Month).ThenBy(a => a.Day);
                RadGrid1.MasterTableView.DataSource = temp.ToList();
                RadGrid1.MasterTableView.DataBind();
            }
        }

        protected void btnToday_Click(object sender, EventArgs e)
        {
            days = 0;
            RadGrid1.MasterTableView.Rebind();
        }

        protected void btn10_Click(object sender, EventArgs e)
        {
            days = 10;
            RadGrid1.MasterTableView.Rebind();
        }

        protected void btn30_Click(object sender, EventArgs e)
        {
            days = 30;
            RadGrid1.MasterTableView.Rebind();
        }

        protected void dpEnd_SelectedDateChanged(object sender, Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs e)
        {
            days = dpEnd.SelectedDate.Value.Subtract(DateTime.Now).Days + 1;
            RadGrid1.MasterTableView.Rebind();
        }
    }
}