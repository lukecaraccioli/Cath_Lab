<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="CathLab.Reports" %>

<%@ Register Assembly="Telerik.ReportViewer.WebForms, Version=7.0.13.228, Culture=neutral, PublicKeyToken=a9d7983dfcc261be" Namespace="Telerik.ReportViewer.WebForms" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <telerik:ReportViewer ID="ReportViewer1" runat="server" Resources-MissingReportSource="~/TestReport.trdx" Height="317px" Width="706px">
<Resources MissingReportSource="~/TestReport.trdx"></Resources>

<urireportsource uri="D:\development\Cath Lab\Cath_Lab\CathLab\Reports\TestReport.trdx"></urireportsource>
</telerik:ReportViewer>
    
</asp:Content>
