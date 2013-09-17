<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeBehind="Expiring.aspx.cs" Inherits="CathLab.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <telerik:RadAjaxPanel runat="server" ID="RadAJAXPanel">
    <asp:ScriptManager ID="scriptManager" runat ="server"></asp:ScriptManager>
        View products expiring in:  
        <telerik:RadButton runat="server" ID="btn10" Text="10 Days" OnClick="btn10_Click"></telerik:RadButton>
        <telerik:RadButton runat="server" ID="btn30" Text="30 Days" OnClick="btn30_Click"></telerik:RadButton> <br />
        <telerik:RadGrid ID ="RadGrid1" runat="server" AutoGenerateColumns="true" OnNeedDataSource="RadGrid1_NeedDataSource" AllowSorting="true" 
            Width="500px" Skin="WebBlue">
        </telerik:RadGrid>
        </telerik:RadAjaxPanel>
</asp:Content>
