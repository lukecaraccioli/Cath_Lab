﻿<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="CathLab.Reports" %>

<%@ Register Assembly="Telerik.ReportViewer.WebForms, Version=7.0.13.228, Culture=neutral, PublicKeyToken=a9d7983dfcc261be" Namespace="Telerik.ReportViewer.WebForms" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  
    <telerik:RadAjaxPanel runat="server" ID="RadAJAXPanel">
          <h3>Select a date range for the Stents Cost ot Stent usage reports</h3>
        <table>
            <tr>
             
                <td>
                    
                    <telerik:RadDatePicker runat="server" ID="rdpStartDate" DateInput-Label="Start Date"></telerik:RadDatePicker> <br />
                    <telerik:RadDatePicker runat="server" ID="rdpEndDate" DateInput-Label="End Date"></telerik:RadDatePicker> <br />                  
                </td>
                <td>
                    <telerik:RadButton runat="server" ID="btnStents" Text="Stents" OnClick="btnStents_Click"></telerik:RadButton>&nbsp;
                </td>
                <td>
                    <telerik:RadButton runat="server" ID="btnStentsCost" Text="Stents Cost" OnClick="btnStentsCost_Click"></telerik:RadButton>&nbsp;
                </td>
                 <td>
                    <telerik:RadButton runat="server" ID="btnManuStock" Text="Manufacturer Stock Report" OnClick="btnManuStock_Click"></telerik:RadButton> &nbsp;
                </td>
                 <td>
                    <telerik:RadButton runat="server" ID="btnPar" Text="Re-Order Report" OnClick="btnPar_Click"></telerik:RadButton>&nbsp;
                </td>
                <td>
                    <telerik:RadButton runat="server" ID="btnScanned" Text="Products Scanned" OnClick="btnScanned_Click"></telerik:RadButton>&nbsp;
                </td>
            </tr>
        </table>                
        <telerik:ReportViewer ID="ReportViewer1" runat="server" Width="900px" Height="700px" ParametersAreaVisible="true" ShowParametersButton="true"></telerik:ReportViewer>
    </telerik:RadAjaxPanel>

</asp:Content>
