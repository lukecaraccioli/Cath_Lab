using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik;
using Telerik.ReportViewer;
using Telerik.Reporting;

namespace CathLab
{
    public partial class Reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { }

       

        protected void btnTest_Click(object sender, EventArgs e)
        {
            //UriReportSource rs = new UriReportSource();
            //rs.Uri = "Reports\\TestReport.trdx";

            //Telerik.Reporting.Parameter paramStartDate = new Telerik.Reporting.Parameter();
            //paramStartDate.Name = "@StartDate";
            //paramStartDate.Value = rdpStartDate.SelectedDate;
            //rs.Parameters.Add(paramStartDate);

            //Telerik.Reporting.Parameter paramEndDate = new Telerik.Reporting.Parameter();
            //paramEndDate.Name = "@EndDate";
            //paramEndDate.Value = rdpEndDate.SelectedDate;
            //rs.Parameters.Add(paramEndDate);

            //ReportViewer1.ReportSource = rs;
        }

        protected void btnManuStock_Click(object sender, EventArgs e)
        {
            UriReportSource rs = new UriReportSource();
            rs.Uri = "Reports\\Manufacturer_Stock.trdx";
            ReportViewer1.ReportSource = rs;
        }

        protected void btnStents_Click(object sender, EventArgs e)
        {
            UriReportSource rs = new UriReportSource();
            rs.Uri = "Reports\\getStents.trdx";

            rs.Parameters.Add(new Telerik.Reporting.Parameter("StartTime", rdpStartDate.SelectedDate.Value.ToShortDateString()));
            rs.Parameters.Add(new Telerik.Reporting.Parameter("EndTime", rdpEndDate.SelectedDate.Value.ToShortDateString()));

            //Telerik.Reporting.Parameter paramStartDate = new Telerik.Reporting.Parameter();
            //paramStartDate.Name = "StartTime";
            ////paramStartDate.Value = rdpStartDate.SelectedDate.Value;
            //rs.Parameters.Add(paramStartDate);

            //Telerik.Reporting.Parameter paramEndDate = new Telerik.Reporting.Parameter();
            //paramEndDate.Name = "EndTime";
            ////paramEndDate.Value = rdpEndDate.SelectedDate.Value;
            //rs.Parameters.Add(paramEndDate);

            //rs.Parameters["StartTime"].Value = rdpStartDate.SelectedDate.Value;
            //rs.Parameters["EndTime"].Value = rdpEndDate.SelectedDate.Value;

            int count = rs.Parameters.Count;            
            ReportViewer1.ReportSource = rs;
        }

        protected void btnStentsCost_Click(object sender, EventArgs e)
        {
            UriReportSource rs = new UriReportSource();
            rs.Uri = "Reports\\getStentsCost.trdx";
            ReportViewer1.ReportSource = rs;
        }
        protected void btnPar_Click(object sender, EventArgs e)
        {
            UriReportSource rs = new UriReportSource();
            rs.Uri = "Reports\\getPar.trdx";
            ReportViewer1.ReportSource = rs;
        }
    }
}