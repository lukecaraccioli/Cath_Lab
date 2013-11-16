<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewPartNumber.ascx.cs" Inherits="CathLab.UserControls.NewPartNumber" %>

<%@ Register TagPrefix="uc2" TagName="NewManufacturer" Src="~/UserControls/NewManufacturer.ascx"%>
<%@ Register TagPrefix="uc2" TagName="NewProductType" Src="~/UserControls/NewProductType.ascx"%>


<telerik:RadAjaxPanel runat="server" ID="RadAJAXPanel">
    <div>
        <h1>New Product</h1>
        <div>
            Please scan the Part Number on the product packaging.       
            <br />
            <telerik:RadTextBox runat="server" ID="txtPartNum" Label="New Part#:" AutoPostBack="true" OnTextChanged="txtPartNum_TextChanged"></telerik:RadTextBox> &nbsp;           
            <telerik:RadButton runat="server" ID="btnClear" Text="Clear" OnClick="btnClear_Click"></telerik:RadButton>
            <br />
        </div>


        <%-- For a brand new PartNumber --%>
        <asp:Panel runat="server" ID="pnlNewPart" Visible="false">
            <asp:Table runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label runat="server" ID="lblManufacturer" Text="Manufacturer:"></asp:Label><br />
                        <telerik:RadListBox runat="server" ID="lbxManufacturer" Height="150" AutoPostBack="True" OnTextChanged="lbxManufacturer_TextChanged">
                        </telerik:RadListBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" ID="lblProdType" Text="Product Type:"></asp:Label><br />
                        <telerik:RadListBox runat="server" ID="lbxProdType" Height="150" AutoPostBack="True" OnTextChanged="lbxProdType_TextChanged">
                        </telerik:RadListBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" ID="lblLocation" Text="Location:"></asp:Label><br />
                        <telerik:RadListBox runat="server" ID="lbxLocation" Height="150" AutoPostBack="True" OnTextChanged="lbxLocation_TextChanged">
                        </telerik:RadListBox>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </asp:Panel>


        <%-- Selecting from existing Manufacturer, ProductType, and Location --%>
        <asp:Panel runat="server" ID="pnlLotExpLoc" Visible="false">
            <asp:Table ID="Table1" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label runat="server" ID="lblLotNumber" Text="Lot Number"></asp:Label><br />
                        <telerik:RadTextBox runat="server" ID="txtLotNumber"></telerik:RadTextBox> &nbsp;                                      
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" ID="lblExpirationDate" Text="Expiration Date"></asp:Label><br />
                        <telerik:RadDatePicker runat="server" ID="rdpExpiration"></telerik:RadDatePicker> &nbsp;                                      
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" ID="Label1" Text="Location:"></asp:Label><br />
                        <telerik:RadListBox runat="server" ID="lbxLoc" Height="150" AutoPostBack="True" OnTextChanged="lbxLocation_TextChanged">
                        </telerik:RadListBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <telerik:RadButton runat="server" ID="btnInsertProduct" Text="Insert Product"></telerik:RadButton> &nbsp;                                      
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </asp:Panel>


        <asp:Panel runat="server" ID="pnlNewManu" Visible="false">
            <%-- Inserting New Manufacturer --%>
            <div>
                <%--<uc2:NewManufacturer runat="server" ID="ucNewManufacturer"></uc2:NewManufacturer>--%>
                <h2>Insert New Manufacturer</h2>
                <telerik:RadTextBox runat="server" ID="tbManufacturerName" Label="Name: "></telerik:RadTextBox> <br />
                <telerik:RadTextBox runat="server" ID="tbxPhoneNumber" Label="Phone Number: "></telerik:RadTextBox> <br />
                <telerik:RadTextBox runat="server" ID="tbxEmail" Label="Email:"></telerik:RadTextBox> <br />
                <telerik:RadTextBox runat="server" ID="tbxAddress" Label="Address"></telerik:RadTextBox> <br />
                <telerik:RadButton runat="server" ID="btnSubmit" Text="Submit" OnClick="btnSubmit_Click"></telerik:RadButton> &nbsp;
                <telerik:RadButton runat="server" ID="btnCancel1" Text="Cancel" OnClick="btnCancel1_Click"></telerik:RadButton>
            </div>
        </asp:Panel>


        <asp:Panel runat="server" ID="pnlNewProdType" Visible="false">
            <%-- Inserting New Product Type --%>
            <div>
                <%--<uc2:NewProductType ID="NewProductType" runat="server"></uc2:NewProductType>--%>
                <h2>Insert Product Type</h2>
                <telerik:RadTextBox runat="server" ID="tbType" Label="Type: "></telerik:RadTextBox> <br />
                <telerik:RadButton runat="server" ID="btnSubmitPT" Text="Submit" OnClick="btnSubmitPT_Click"></telerik:RadButton> &nbsp;
                <telerik:RadButton runat="server" ID="btnCancel2" Text="Cancel" OnClick="btnCancel1_Click"></telerik:RadButton>
            </div>
        </asp:Panel>

        <%--<telerik:RadTextBox runat="server" ID="tbPartNumber" Label="New Part Number:" LabelWidth="15px"></telerik:RadTextBox>
<telerik:RadListBox runat="server" ID="lbxManufacturer"></telerik:RadListBox>
<telerik:RadListBox runat="server" ID="lbxProductType"></telerik:RadListBox>--%>

    </div>
</telerik:RadAjaxPanel>