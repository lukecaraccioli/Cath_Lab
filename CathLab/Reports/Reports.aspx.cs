using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik;
<<<<<<< HEAD
=======
using Telerik.ReportViewer;
>>>>>>> ee656d7960392f60d3ef2a683c2934346b10cda9
using Telerik.Reporting;

namespace CathLab
{
    public partial class Reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
<<<<<<< HEAD
            UriReportSource rs = new UriReportSource();
            rs.Uri = "Reports\\Manufacturer_Stock.trdx";
            ReportViewer1.ReportSource = rs;
=======
            //UriReportSource rs = new UriReportSource();
            //rs.Uri = "Reports\\Manufacturer_Stock.trdx";
            //ReportViewer1.ReportSource = rs;
>>>>>>> ee656d7960392f60d3ef2a683c2934346b10cda9
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
<<<<<<< HEAD
=======

            Telerik.Reporting.Parameter paramStartDate = new Telerik.Reporting.Parameter();
            paramStartDate.Name = "StartDate";
            paramStartDate.Value = rdpStartDate.SelectedDate;
            rs.Parameters.Add(paramStartDate);

            Telerik.Reporting.Parameter paramEndDate = new Telerik.Reporting.Parameter();
            paramEndDate.Name = "EndDate";
            paramEndDate.Value = rdpEndDate.SelectedDate;
            rs.Parameters.Add(paramEndDate);

>>>>>>> ee656d7960392f60d3ef2a683c2934346b10cda9
            ReportViewer1.ReportSource = rs;
        }
    }
}