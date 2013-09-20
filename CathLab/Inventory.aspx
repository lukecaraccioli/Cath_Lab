<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="CathLab.Inventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="scriptManager" runat="server"></asp:ScriptManager>
    <telerik:RadAjaxPanel ID="ajaxpanel" runat="server">
        <table style="width:100px">
            <tr>
                <td>
                    <telerik:RadListBox runat="server" ID="lbxProdType" Height="180" DataValueField="Int" AutoPostBack="True"></telerik:RadListBox>
                </td>
                <td>
                    <telerik:RadListBox runat="server" ID="lbxManufacturer" Height="180" AutoPostBack="True"></telerik:RadListBox>
                </td>
                <td>
                    <telerik:RadButton runat="server" ID="btnApply" Text="Apply Filters" OnClick="btnApply_Click"></telerik:RadButton>
                </td>
            </tr>
            <tr>
                <td>
                    <telerik:RadGrid runat="server" ID="rgInventory" AutoGenerateColumns="true" OnNeedDataSource="rgInventory_NeedDataSource">
                    </telerik:RadGrid>
                </td>
            </tr>
        </table>
    </telerik:RadAjaxPanel>
</asp:Content>
