<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="CathLab.Inventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <telerik:RadAjaxPanel ID="ajaxpanel" runat="server">
        <telerik:RadAjaxLoadingPanel runat="server" ID="loadingPanel"></telerik:RadAjaxLoadingPanel>
        <table style="width: 100px">
            <tr>
                <td>
                    <telerik:RadListBox runat="server" ID="lbxProdType" Height="150" AutoPostBack="True">
                    </telerik:RadListBox>
                </td>
                <td>
                    <telerik:RadListBox runat="server" ID="lbxManufacturer" Height="150" AutoPostBack="True">
                    </telerik:RadListBox>
                </td>
                <td>
                    <telerik:RadListBox runat="server" ID="lbxLocation" Height="150" AutoPostBack="True">
                    </telerik:RadListBox>
                </td>
                <td>
                    <telerik:RadButton runat="server" ID="btnApply" Text="Apply Filters" OnClick="btnApply_Click"></telerik:RadButton>
                </td>
            </tr>
        </table>
        <telerik:RadGrid runat="server" ID="rgInventory" AutoGenerateColumns="true" Visible="true">
        </telerik:RadGrid>
    </telerik:RadAjaxPanel>
</asp:Content>
