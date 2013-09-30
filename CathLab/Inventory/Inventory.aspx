<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="CathLab.Inventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <telerik:RadAjaxPanel ID="ajaxpanel" runat="server">
        <telerik:RadAjaxLoadingPanel runat="server" ID="loadingPanel"></telerik:RadAjaxLoadingPanel>
        <table style="width: 100px">
            <tr>
                <td>
                    <asp:Label runat="server" ID="lblProdType" Text="Product Type:"></asp:Label><br />
                    <telerik:RadListBox runat="server" ID="lbxProdType" Height="150" AutoPostBack="True" OnTextChanged="lbxProdType_TextChanged">
                    </telerik:RadListBox>
                </td>
                <td>
                    <asp:Label runat="server" ID="lblManufacturer" Text="Manufacturer:"></asp:Label><br />
                    <telerik:RadListBox runat="server" ID="lbxManufacturer" Height="150" AutoPostBack="True" OnTextChanged="lbxManufacturer_TextChanged">
                    </telerik:RadListBox>
                </td>
                <td>
                    <asp:Label runat="server" ID="lblLocation" Text="Location:"></asp:Label><br />
                    <telerik:RadListBox runat="server" ID="lbxLocation" Height="150" AutoPostBack="True" OnTextChanged="lbxLocation_TextChanged">
                    </telerik:RadListBox>
                </td>
                <td>
                    <telerik:RadButton runat="server" ID="btnApply" Text="Apply Filters" OnClick="btnApply_Click"></telerik:RadButton>
                </td>
            </tr>
        </table>
        <telerik:RadGrid runat="server" ID="rgInventory" AutoGenerateColumns="true" Visible="true" AllowPaging="true" OnNeedDataSource="rgInventory_NeedDataSource">
        </telerik:RadGrid>
    </telerik:RadAjaxPanel>
</asp:Content>
