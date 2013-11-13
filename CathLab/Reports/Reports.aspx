<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="CathLab.Reports" %>

<%@ Register Assembly="Telerik.ReportViewer.WebForms, Version=7.0.13.228, Culture=neutral, PublicKeyToken=a9d7983dfcc261be" Namespace="Telerik.ReportViewer.WebForms" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    <telerik:ReportViewer ID="ReportViewer1" runat="server" Width="856px">
       <urireportsource uri="Reports\Manufacturer_Stock.trdx"></urireportsource>
    </telerik:ReportViewer>
=======
=======
>>>>>>> f67038ea7ba5cb1b2e845ac1c5861ecea1584865
=======
>>>>>>> f67038ea7ba5cb1b2e845ac1c5861ecea1584865
    <telerik:RadAjaxPanel runat="server" ID="RadAJAXPanel">
        <telerik:RadButton runat="server" ID="btnManuStock" Text="Manufacturer Stock Report" OnClick="btnManuStock_Click"></telerik:RadButton>
        <telerik:RadButton runat="server" ID="btnTest" Text="Test Report" OnClick="btnTest_Click"></telerik:RadButton>
        <telerik:ReportViewer ID="ReportViewer1" runat="server" Width="900px" Height="700px"></telerik:ReportViewer>
    </telerik:RadAjaxPanel>
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> f67038ea7ba5cb1b2e845ac1c5861ecea1584865
=======
>>>>>>> f67038ea7ba5cb1b2e845ac1c5861ecea1584865
=======
>>>>>>> f67038ea7ba5cb1b2e845ac1c5861ecea1584865
=======
    <telerik:RadAjaxPanel runat="server" ID="RadAJAXPanel">
        <table>
            <tr>
                <td>
                    <telerik:RadButton runat="server" ID="btnManuStock" Text="Manufacturer Stock Report" OnClick="btnManuStock_Click"></telerik:RadButton> &nbsp;
                </td>
                <td>
                    <telerik:RadDatePicker runat="server" ID="rdpStartDate" DateInput-Label="Start Date"></telerik:RadDatePicker> <br />
                    <telerik:RadDatePicker runat="server" ID="rdpEndDate" DateInput-Label="End Date"></telerik:RadDatePicker> <br />
                    <telerik:RadButton runat="server" ID="btnTest" Text="Stent Report" OnClick="btnTest_Click"></telerik:RadButton>
                </td>
            </tr>
        </table>                
        <telerik:ReportViewer ID="ReportViewer1" runat="server" Width="900px" Height="700px"></telerik:ReportViewer>
    </telerik:RadAjaxPanel>
>>>>>>> ee656d7960392f60d3ef2a683c2934346b10cda9
</asp:Content>
