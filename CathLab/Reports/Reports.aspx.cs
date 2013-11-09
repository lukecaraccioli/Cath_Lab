using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.ReportViewer;
using Telerik;
using Telerik.Reporting;

namespace CathLab
{
    public partial class Reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UriReportSource rs = new UriReportSource();
            rs.Uri = "Reports\\Manufacturer_Stock.trdx";
            ReportViewer1.ReportSource = rs;
        }

        protected void btnManuStock_Click(object sender, EventArgs e)
        {
            UriReportSource rs = new UriReportSource();
            rs.Uri = "Reports\\Manufacturer_Stock.trdx";
            ReportViewer1.ReportSource = rs;
        }

        protected void btnTest_Click(object sender, EventArgs e)
        {
            UriReportSource rs = new UriReportSource();
            rs.Uri = "Reports\\TestReport.trdx";
            ReportViewer1.ReportSource = rs;
        }
    }
}