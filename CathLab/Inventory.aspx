<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="CathLab.Inventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="scriptManager" runat="server"></asp:ScriptManager>
    <table>
        <tr>
            <td>
                <telerik:RadListBox runat="server" ID="lbProdType" ></telerik:RadListBox>
            </td>
            <td>
                <telerik:RadButton runat="server" ID="btnApply" ></telerik:RadButton>
            </td>
        </tr>
        <tr>
            <td>
                <telerik:RadGrid runat="server" ID="rgInventory" AutoGenerateColumns="true">
                </telerik:RadGrid>
            </td>
        </tr>
    </table>
</asp:Content>
