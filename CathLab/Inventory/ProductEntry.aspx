<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeBehind="ProductEntry.aspx.cs" Inherits="CathLab.ProductEntry" %>

<%@ Register TagPrefix="uc1" TagName="NewPartNumber" Src="~/UserControls/NewPartNumber.ascx"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <telerik:RadAjaxPanel runat="server" ID="RadAJAXPanel">
        <telerik:RadScriptBlock runat="server" ID="RadScriptBlock">
            <script type="text/javascript">
                function show() {
                    var txtPartNum = $find("<%=txtPartNum.Text %>")
                    var wnd = $find("<%=rwNewEntry.ClientID %>");
                    //var wnd = $find("<%=rwNewEntry.ClientID %>");
                    wnd.setUrl("NewPartNumber.ascx?partNum=" + txtPartNum);
                    wnd.show();
                        //.radopen("NewPartNumber.ascx?partNum=" + txtPartNum) //.show();
                }
            </script>
        </telerik:RadScriptBlock>

        <telerik:RadButton runat="server" Text="Test RadWindow" ID="btnTest" OnClientClicked="show" AutoPostBack="false"></telerik:RadButton>
        <asp:Table runat="server">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" ID="lblPartNum" Text="Part Numbers: "></asp:Label><br />
                    <telerik:RadTextBox runat="server" ID="txtPartNum"></telerik:RadTextBox>&nbsp;<br />
                    <telerik:RadButton runat="server" ID="btnAutopopulate" Text="AutoPopulate" OnClick="btnAutopopulate_Click"></telerik:RadButton>
                    &nbsp                   
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label runat="server" ID="lblManu" Text="Manufacturer: "></asp:Label><br />
                    <telerik:RadTextBox runat="server" ID="txtManufacturer" ReadOnly="true"></telerik:RadTextBox>&nbsp;                   
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label runat="server" ID="lblNameSize" Text="Name/Size:"></asp:Label><br />
                    <telerik:RadTextBox runat="server" ID="txtNameSize" ReadOnly="true"></telerik:RadTextBox>&nbsp;                   
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label runat="server" ID="lblType" Text="Product Type:"></asp:Label><br />
                    <telerik:RadTextBox runat="server" ID="txtProdType" ReadOnly="true"></telerik:RadTextBox>&nbsp;                   
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" ID="lblLotNumber" Text="Lot Number"></asp:Label><br />
                    <telerik:RadTextBox runat="server" ID="txtLotNumber"></telerik:RadTextBox>&nbsp;                   
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label runat="server" ID="lblExpirationDate" Text="Expiration Date"></asp:Label><br />
                    <telerik:RadDatePicker runat="server" ID="rdpExpiration"></telerik:RadDatePicker>
                    &nbsp;                   
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label runat="server" ID="lblLoc" Text="Location: "></asp:Label><br />
                    <telerik:RadListBox runat="server" ID="lbxLoc" AutoPostBack="true"></telerik:RadListBox>
                </asp:TableCell>
                <asp:TableCell>
                    <telerik:RadButton runat="server" ID="btnInsertProduct" Text="Insert Product" OnClick="btnInsertProduct_Click"></telerik:RadButton>
                    &nbsp;                   
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>

        <telerik:RadWindow runat="server" ID="rwNewEntry" Modal="true" OnLoad="rwNewEntry_Load" Width="530px" Height="470px" Title="New Product Entry">
            <Localization Close="" />
            <ContentTemplate>
                <telerik:RadAjaxPanel runat="server" ID="rwAJAXPanel">
                    <uc1:NewPartNumber runat="server" ID="uc1" />                    
                </telerik:RadAjaxPanel>
            </ContentTemplate>
        </telerik:RadWindow>

    </telerik:RadAjaxPanel>
</asp:Content>
