<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeBehind="ProductEntry.aspx.cs" Inherits="CathLab.ProductEntry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <telerik:RadAjaxPanel runat="server" ID="RadAJAXPanel">
        <table>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="lblPartNum" Text="Part Numbers: "></asp:Label><br />
                        <telerik:RadTextBox runat="server" ID="txtPartNum"></telerik:RadTextBox>&nbsp;<br />
                        <telerik:RadButton runat="server" ID="btnAutopopulate" Text="AutoPopulate" OnClick="btnAutopopulate_Click"></telerik:RadButton>&nbsp
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblManu" Text="Manufacturer: "></asp:Label><br />
                        <telerik:RadTextBox runat="server" ID="txtManufacturer" ReadOnly="true"></telerik:RadTextBox>&nbsp;
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblNameSize" Text="Name/Size:"></asp:Label><br />
                        <telerik:RadTextBox runat="server" ID="txtNameSize" ReadOnly="true"></telerik:RadTextBox>&nbsp;
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblType" Text="Product Type:"></asp:Label><br />
                        <telerik:RadTextBox runat="server" ID="txtProdType" ReadOnly="true"></telerik:RadTextBox>&nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="lblLotNumber" Text="Lot Number"></asp:Label><br />
                        <telerik:RadTextBox runat="server" ID="txtLotNumber"></telerik:RadTextBox>&nbsp;
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblExpirationDate" Text="Expiration Date"></asp:Label><br />
                        <telerik:RadDatePicker runat="server" ID="rdpExpiration"></telerik:RadDatePicker>&nbsp;
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblLoc" Text ="Location: "></asp:Label><br />
                        <telerik:RadListBox runat="server" ID="lbxLoc" AutoPostBack="true"></telerik:RadListBox>
                    </td>
                    <td>
                        <telerik:RadButton runat="server" ID="btnInsertProduct" Text="Insert Product" OnClick="btnInsertProduct_Click"></telerik:RadButton>&nbsp;
                    </td>
                </tr>
            </table>

        <telerik:RadWindow runat="server" ID="rwNewEntry" Modal="true" >            
        </telerik:RadWindow>
    </telerik:RadAjaxPanel>
</asp:Content>
