<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeBehind="Expiring.aspx.cs" Inherits="CathLab.Expiring" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <telerik:RadAjaxPanel runat="server" ID="AJAXPanel">
        <telerik:RadGrid runat="server" ID="RadGrid1" OnNeedDataSource="RadGrid1_NeedDataSource" AllowPaging="true" PageSize="15" Width="550"
            AllowSorting="true">
        </telerik:RadGrid>
        <telerik:RadButton runat="server" ID="btnToday" Text="Today"></telerik:RadButton>
        <telerik:RadButton runat="server" ID="btn10" OnClick="btn10_Click" Text="10 Days"></telerik:RadButton>
        <telerik:RadButton runat="server" ID="btn30" OnClick="btn30_Click" Text="30 Days"></telerik:RadButton>
    </telerik:RadAjaxPanel>
</asp:Content>