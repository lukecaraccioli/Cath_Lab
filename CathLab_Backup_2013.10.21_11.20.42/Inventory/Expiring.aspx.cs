﻿using System;
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

        }

        protected void RadGrid1_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            using (var context = new cathlabEntities())
            {
                var temp = (from prod in context.Products
                            where prod.ExpirationDate == DateTime.Today
                            select new { prod.ExpirationDate, prod.Location.LocationName, prod.PartNumber1.NameSize }).AsEnumerable()
                            .Select(a => new { ExpirationDate = a.ExpirationDate.Value.ToLongDateString(), a.NameSize, a.LocationName });
                RadGrid1.DataSource = temp.ToList();
            }
        }

        protected void btnToday_Click(object sender, EventArgs e)
        {
            GetExpiredRange(0);
        }

        protected void btn10_Click(object sender, EventArgs e)
        {
            this.GetExpiredRange(10);
        }

        protected void btn30_Click(object sender, EventArgs e)
        {
            this.GetExpiredRange(30);
        }

        protected void GetExpiredRange(int days)
        {
            DateTime upper = DateTime.Today.AddDays(days).AddHours(23).AddMinutes(59);
            using (var context = new cathlabEntities())
            {
                var temp = (from prod in context.Products
                            where prod.ExpirationDate >= DateTime.Today && prod.ExpirationDate <= upper
                            select new { prod.ExpirationDate, prod.PartNumber1.NameSize, prod.Location.LocationName }).AsEnumerable();
                RadGrid1.DataSource = temp.ToList();
                RadGrid1.DataBind();
            }
        }
    }
}