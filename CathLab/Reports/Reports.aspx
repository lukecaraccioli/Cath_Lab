<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="CathLab.Reports" %>

<%@ Register Assembly="Telerik.ReportViewer.WebForms, Version=7.0.13.228, Culture=neutral, PublicKeyToken=a9d7983dfcc261be" Namespace="Telerik.ReportViewer.WebForms" TagPrefix="telerik" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <rsweb:ReportViewer ID="ReportViewer2" runat="server" Width="622px">
</rsweb:ReportViewer>
<telerik:ReportViewer ID="ReportViewer1" runat="server" Resources-MissingReportSource="~/TestReport.trdx" Height="317px" Width="1269px">
<Resources MissingReportSource="~/TestReport.trdx"></Resources>

<urireportsource uri="D:\development\Cath Lab\Cath_Lab\CathLab\Reports\TestReport.trdx"></urireportsource>
</telerik:ReportViewer>
    
</asp:Content>
