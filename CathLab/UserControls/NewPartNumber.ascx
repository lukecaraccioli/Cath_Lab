<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewPartNumber.ascx.cs" Inherits="CathLab.UserControls.NewPartNumber" %>

<%--<%@ Register TagPrefix="uc2" TagName="NewManufacturer" Src="~/UserControls/NewManufacturer.ascx"%>
<%@ Register TagPrefix="uc2" TagName="NewProductType" Src="~/UserControls/NewProductType.ascx"%>--%>

<telerik:RadAjaxPanel runat="server" ID="RadAJAXPanel">
    <%-- 
        TODO:
        Replace asp:tables with html tables if not modifying. HTML table can still have row runat=server
        Instead of panels for each view in window, use individual usercontrols? or entire thing in table, hide/show
        
    --%>
    <%-- To align New Part Number Labels and TB's. Not working right  --%>
    <style>
        .searchLabel {
            display: block;
        }
        .textBoxes {
            display: block;
        }
    </style>

    <div style="margin-left: 15px; margin-top: 6px">
        <div style="align-items: center; height: 43px;">
            <h1>New Product</h1>                        
        </div>

        <%-- Scanning Part Number into the textbox --%>
        <asp:Panel runat="server" ID="pnlScan">
            <div>
                <h3>Please scan the Part Number on the product packaging.</h3>
                <br />
                <telerik:RadTextBox runat="server" ID="tbPartNum" Label="New Part#:" AutoPostBack="true" OnTextChanged="tbPartNum_TextChanged" Font-Size="Medium"></telerik:RadTextBox>&nbsp;           
            <telerik:RadButton runat="server" ID="btnPopulate" Text="Submit" OnClick="tbPartNum_TextChanged"></telerik:RadButton> &nbsp;
                <telerik:RadButton runat="server" ID="btnFinished" Text="Done" OnClick="btnFinished_Click" />
                <br />
                <asp:Label runat="server" ID="lblStatus" Font-Size="Medium" Visible="false"></asp:Label>
                <br />
            </div>
        </asp:Panel>

        <%-- New Product --%>
        <asp:Panel runat="server" ID="pnlNewProduct" Visible="false">
            <asp:Table ID="Table1" runat="server">
                <asp:TableRow>
                    <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                        <div>
                            <asp:Label runat="server" ID="lblPNLabel" Text="PartNumber: " Font-Size="Medium" AssociatedControlID="tbEPartNum"></asp:Label>
                            <telerik:RadTextBox runat="server" ID="tbEPartNum" Font-Size="Medium" ReadOnly="true" BorderWidth="0px"></telerik:RadTextBox>
                        </div>
                        <asp:Label runat="server" ID="lblEManufacturer" Text="Manufacturer:" AssociatedControlID="tbEManufacturer"></asp:Label>
                        <telerik:RadTextBox runat="server" ID="tbEManufacturer" ReadOnly="true" BorderWidth="0px"></telerik:RadTextBox>
                        <br />
                        <asp:Label runat="server" ID="lblEProdType" Text="Product Type:" AssociatedControlID="tbEProdType"></asp:Label>
                        <telerik:RadTextBox runat="server" ID="tbEProdType" ReadOnly="true" BorderWidth="0px"></telerik:RadTextBox>
                        <br />
                        <asp:Label runat="server" ID="lblENameSize" Text="Name/Size: " AssociatedControlID="tbENameSize"></asp:Label>
                        <telerik:RadTextBox runat="server" ID="tbENameSize" ReadOnly="true" BorderWidth="0px"></telerik:RadTextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label runat="server" ID="lblLotNumber" Text="Lot Number: " AssociatedControlID="tbLotNumber"></asp:Label>
                        <br />
                        <telerik:RadTextBox runat="server" ID="tbLotNumber" InputType="Number"></telerik:RadTextBox>
                        <br />
                        <asp:Label runat="server" ID="lblExpirationDate" Text="Expiration Date: " AssociatedControlID="rdpExpiration"></asp:Label>
                        <br />
                        <telerik:RadDatePicker runat="server" ID="rdpExpiration" DateInput-LabelWidth="70px"></telerik:RadDatePicker>
                        <br />
                        <asp:Label runat="server" ID="lblSerial" Text="Serial Number: " AssociatedControlID="tbSerial"></asp:Label>
                        <br />
                        <telerik:RadTextBox runat="server" ID="tbSerial"></telerik:RadTextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" ID="Label1" Text="Location:"></asp:Label><br />
                        <telerik:RadListBox runat="server" ID="lbxELocation" Height="150" AutoPostBack="True"></telerik:RadListBox>
                        <br />
                        <telerik:RadButton runat="server" ID="btnInsertProduct" Text="Insert Product" OnClick="btnInsertProduct_Click"></telerik:RadButton>
                        &nbsp;                                      
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </asp:Panel>

        <%-- Inserting New PartNumber --%>
        <asp:Panel runat="server" ID="pnlNewPartNumber" Visible="false">
            <div>
                <h2>Insert a new Part Number</h2>
                <asp:Table runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label runat="server" ID="lblManufacturer" Text="Manufacturer:" AssociatedControlID="lbxManufacturer"></asp:Label>
                            <br />
                            <telerik:RadListBox runat="server" ID="lbxManufacturer" Height="180" AutoPostBack="True" OnTextChanged="lbxManufacturer_TextChanged">
                            </telerik:RadListBox>
                            &nbsp;
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label runat="server" ID="lblProdType" Text="ProductType:" AssociatedControlID="lbxProdType"></asp:Label><br />
                            <telerik:RadListBox runat="server" ID="lbxProdType" Height="180" AutoPostBack="True" OnTextChanged="lbxProdType_TextChanged">
                            </telerik:RadListBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <%--<asp:TableRow>
                        <asp:TableCell>--%>

                    <%--</asp:TableCell>
                    </asp:TableRow>--%>
                </asp:Table>
                <div style="display: block; float: left; text-align: right;">
                    <asp:Label runat="server" ID="lblNNameSize" Text="Name/Size: " AssociatedControlID="tbNNameSize" CssClass="searchLabel" Font-Size="Medium"></asp:Label>
                    <asp:Label runat="server" ID="lblNCost" Text="Cost: " AssociatedControlID="" CssClass="searchLabel" Font-Size="Medium"></asp:Label>
                    <asp:Label runat="server" ID="lblNPar" Text="Par: " AssociatedControlID="tbNPar" CssClass="searchLabel" Font-Size="Medium"></asp:Label>
                </div>
                <div style="display: block; float: left; margin-left: 10px; text-align: left;">
                    <telerik:RadTextBox runat="server" ID="tbNNameSize" CssClass="textBoxes"></telerik:RadTextBox><br />
                    <telerik:RadTextBox runat="server" ID="tbNCost" InputType="Number" CssClass="textBoxes"></telerik:RadTextBox><br />
                    <telerik:RadNumericTextBox runat="server" ID="tbNPar" IncrementSettings-Step="1" IncrementSettings-InterceptArrowKeys="true"
                        CssClass="textBoxes">
                    </telerik:RadNumericTextBox><br />
                </div>
                <div>
                    <telerik:RadButton runat="server" ID="btnPNSubmit" Text="Submit" OnClick="btnPNSubmit_Click"></telerik:RadButton>
                    <asp:Label runat="server" ID="lblMissing" Text="ERROR! Missing required fields." ForeColor="Red" Visible="false" />
                </div>
            </div>
        </asp:Panel>

        <%-- Inserting New Manufacturer --%>
        <asp:Panel runat="server" ID="pnlNewManufacturer" Visible="false">
            <div>
                <%--<uc2:NewManufacturer runat="server" ID="ucNewManufacturer"></uc2:NewManufacturer>--%>
                <h2>Insert a New Manufacturer</h2>
                <div>
                    <telerik:RadTextBox runat="server" ID="tbManufacturerName" Label="Name: " LabelWidth="87px"></telerik:RadTextBox>
                    <br />
                    <telerik:RadTextBox runat="server" ID="tbxPhoneNumber" Label="Phone Number: " LabelWidth="87px"></telerik:RadTextBox>
                    <br />
                    <telerik:RadTextBox runat="server" ID="tbxEmail" Label="Email:" LabelWidth="87px"></telerik:RadTextBox>
                    <br />
                    <telerik:RadTextBox runat="server" ID="tbxAddress" Label="Address" LabelWidth="87px"></telerik:RadTextBox>
                    <br />
                    <telerik:RadButton runat="server" ID="btnManSubmit" Text="Submit" OnClick="btnManSubmit_Click"></telerik:RadButton>
                    &nbsp;
                <telerik:RadButton runat="server" ID="btnManCancel" Text="Cancel" OnClick="btnManCancel_Click"></telerik:RadButton>
                </div>
            </div>
        </asp:Panel>

        <%-- Inserting New Product Type --%>
        <asp:Panel runat="server" ID="pnlNewProdType" Visible="false">
            <div>
                <%--<uc2:NewProductType ID="NewProductType" runat="server"></uc2:NewProductType>--%>
                <h2>Insert a New Product Type</h2>
                <div>
                    <telerik:RadTextBox runat="server" ID="tbNProdType" Label="Type: "></telerik:RadTextBox>
                    <br />
                    <telerik:RadButton runat="server" ID="btnPTSubmit" Text="Submit" OnClick="btnPTSubmit_Click"></telerik:RadButton>
                    &nbsp;
                <telerik:RadButton runat="server" ID="btnPTCancel" Text="Cancel" OnClick="btnPTCancel_Click"></telerik:RadButton>
                </div>
            </div>
        </asp:Panel>

        <div style="padding-top:18px;">
            <telerik:RadButton runat="server" ID="btnRestart" Text="Restart" OnClick="btnRestart_Click"></telerik:RadButton>
        </div>
    </div>
</telerik:RadAjaxPanel>