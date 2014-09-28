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
        {
            if (Request.QueryString["ReportName"] != null)
            {
                if (Request.QueryString["ReportName"] == "Scanned")
                {
                    UriReportSource rs = new UriReportSource();
                    rs.Uri = "Reports\\getScanned.trdx";
                    ReportViewer1.ReportSource = rs;
                }
            }
        }
       
        protected void btnStents_Click(object sender, EventArgs e)
        {
            UriReportSource rs = new UriReportSource();
            rs.Uri = "Reports\\getStents.trdx";

            //rs.Parameters.Add(new Telerik.Reporting.Parameter("StartTime", rdpStartDate.SelectedDate.Value.ToShortDateString()));
            //rs.Parameters.Add(new Telerik.Reporting.Parameter("EndTime", rdpEndDate.SelectedDate.Value.ToShortDateString()));

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
            

            //string startDate = rdpStartDate.SelectedDate.Value.Date.ToShortDateString().Replace('/', '-');
            //string endDate = rdpEndDate.SelectedDate.Value.Date.ToShortDateString().Replace('/', '-');
            //DateTime start = rdpStartDate.SelectedDate.Value.Date;
            //DateTime end = rdpEndDate.SelectedDate.Value.Date;
            //rs.Parameters.Add(new Telerik.Reporting.Parameter("@StartTime", start));
            //rs.Parameters.Add(new Telerik.Reporting.Parameter("@EndTime", end));
            //rs.Parameters["StartTime"].Value = rdpStartDate.SelectedDate.Value.Date;
            //rs.Parameters["EndTime"].Value = rdpEndDate.SelectedDate.Value.Date;

            ReportViewer1.ReportSource = rs;            
        }

        protected void btnManuStock_Click(object sender, EventArgs e)
        {
            UriReportSource rs = new UriReportSource();
            rs.Uri = "Reports\\getManufacturer_STOCK.trdx";
            ReportViewer1.ReportSource = rs;
        }

        protected void btnPar_Click(object sender, EventArgs e)
        {
            UriReportSource rs = new UriReportSource();
            rs.Uri = "Reports\\getPar.trdx";
            ReportViewer1.ReportSource = rs;
        }

        protected void btnScanned_Click(object sender, EventArgs e)
        {
            UriReportSource rs = new UriReportSource();
            rs.Uri = "Reports\\getScanned.trdx";
            ReportViewer1.ReportSource = rs;
        }
    }
}