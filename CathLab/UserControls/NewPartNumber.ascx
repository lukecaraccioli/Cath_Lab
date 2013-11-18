<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewPartNumber.ascx.cs" Inherits="CathLab.UserControls.NewPartNumber" %>

<%--<%@ Register TagPrefix="uc2" TagName="NewManufacturer" Src="~/UserControls/NewManufacturer.ascx"%>
<%@ Register TagPrefix="uc2" TagName="NewProductType" Src="~/UserControls/NewProductType.ascx"%>--%>

<telerik:RadAjaxPanel runat="server" ID="RadAJAXPanel">

    <%-- To align New Part Number Labels and TB's. Not working right  --%>
    <style>
        .searchLabel
        {
            display: block
        }
        .textBoxes
        {
            display: block;
        }
    </style>

    <div>
        <div style="align-items:center; height:73px">
            <h1>New Product</h1> &nbsp;
            <telerik:RadButton runat="server" ID="btnRestart" Text="Restart" OnClick="btnRestart_Click"></telerik:RadButton>
        </div>
        <%-- Scanning Part Number into the textbox --%>
        <asp:Panel runat="server" ID="pnlScan">
            <div>
                <h3>Please scan the Part Number on the product packaging.</h3>
                <br />
                <telerik:RadTextBox runat="server" ID="tbPartNum" Label="New Part#:" AutoPostBack="true" OnTextChanged="tbPartNum_TextChanged" Font-Size="Medium"></telerik:RadTextBox>&nbsp;           
            <telerik:RadButton runat="server" ID="btnPopulate" Text="Submit" OnClick="tbPartNum_TextChanged"></telerik:RadButton> <br />
                <asp:Label runat="server" ID="lblError" Text="ERROR! Please enter PartNumber again." ForeColor="Red" Font-Size="Medium" Visible="false"></asp:Label>
                <br />
            </div>
        </asp:Panel>        

        <%-- Selecting from existing Manufacturer, ProductType, and Location --%>
        <asp:Panel runat="server" ID="pnlExisting" Visible="false">
            <asp:Table ID="Table1" runat="server">
                <asp:TableRow>    
                    <asp:TableCell BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
                        <div>
                            <asp:Label runat="server" ID="lblPNLabel" Text="PartNumber: " Font-Size="Medium" AssociatedControlID="tbEPartNum"></asp:Label>
                            <telerik:RadTextBox runat="server" ID="tbEPartNum" Font-Size="Medium" ReadOnly="true" BorderWidth="0px"></telerik:RadTextBox>
                        </div>
                        <asp:Label runat="server" ID="lblEManufacturer" Text="Manufacturer:" AssociatedControlID="tbEManufacturer"></asp:Label>
                        <telerik:RadTextBox runat="server" ID="tbEManufacturer" ReadOnly="true" BorderWidth="0px"></telerik:RadTextBox> <br />
                        <asp:Label runat="server" ID="lblEProdType" Text="Product Type:" AssociatedControlID="tbEProdType"></asp:Label>
                        <telerik:RadTextBox runat="server" ID="tbEProdType" ReadOnly="true" BorderWidth="0px"></telerik:RadTextBox> <br />
                        <asp:Label runat="server" ID="lblENameSize" Text="Name/Size: " AssociatedControlID="tbENameSize"></asp:Label>
                        <telerik:RadTextBox runat="server" ID="tbENameSize" ReadOnly="true" BorderWidth="0px"></telerik:RadTextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label runat="server" ID="lblLotNumber" Text="Lot Number: " AssociatedControlID="tbLotNumber"></asp:Label><br />
                        <telerik:RadTextBox runat="server" ID="tbLotNumber" InputType="Number" LabelWidth="70px"></telerik:RadTextBox>
                        <%--<telerik:RadTextBox runat="server" ID="tbLotNumber"></telerik:RadTextBox>--%> <br />                                      
                        <asp:Label runat="server" ID="lblExpirationDate" Text="Expiration Date: " AssociatedControlID="rdpExpiration"></asp:Label><br />
                        <telerik:RadDatePicker runat="server" ID="rdpExpiration" DateInput-LabelWidth="70px"></telerik:RadDatePicker> &nbsp;                                      
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" ID="Label1" Text="Location:"></asp:Label><br />
                        <telerik:RadListBox runat="server" ID="lbxELocation" Height="150" AutoPostBack="True" OnTextChanged="lbxELocation_TextChanged">
                        </telerik:RadListBox>
                        <br />
                        <telerik:RadButton runat="server" ID="btnInsertProduct" Text="Insert Product" OnClick="btnInsertProduct_Click"></telerik:RadButton> &nbsp;                                      
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </asp:Panel>

        <%-- For a brand new PartNumber --%>
        <asp:Panel runat="server" ID="pnlNewPart" Visible="false">
            <asp:Table runat="server">
                <asp:TableRow>
                    <asp:TableCell Text="Manufacturer">
                        <asp:Label runat="server" ID="lblManufacturer" Text="Manufacturer:" AssociatedControlID="lbxManufacturer"></asp:Label><br />
                        <telerik:RadListBox runat="server" ID="lbxManufacturer" Height="180" AutoPostBack="True" OnTextChanged="lbxManufacturer_TextChanged">
                        </telerik:RadListBox> &nbsp; 
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label runat="server" ID="lblProdType" Text="Product Type:" AssociatedControlID="lbxProdType"></asp:Label><br />
                        <telerik:RadListBox runat="server" ID="lbxProdType" Height="180" AutoPostBack="True" OnTextChanged="lbxProdType_TextChanged">
                        </telerik:RadListBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <div style="display:block; float: left; text-align: right;">
                            <asp:Label runat="server" ID="lblNNameSize" Text="Name/Size: " AssociatedControlID="tbNNameSize" CssClass="searchLabel"></asp:Label>
                            <asp:Label runat="server" ID="lblNCost" Text="Cost: " AssociatedControlID="" CssClass="searchLabel"></asp:Label>
                            <asp:Label runat="server" ID="lblNPar" Text="Par: " AssociatedControlID="tbNPar" CssClass="searchLabel"></asp:Label>
                        </div>
                        <div style="display:block; float: left; margin-left: 10px; text-align: left;">
                            <telerik:RadTextBox runat="server" ID="tbNNameSize" CssClass="textBoxes" ></telerik:RadTextBox><br />
                            <telerik:RadTextBox runat="server" ID="tbNCost" InputType="Number" CssClass="textBoxes" ></telerik:RadTextBox><br />
                            <telerik:RadNumericTextBox runat="server" ID="tbNPar" IncrementSettings-Step="1" IncrementSettings-InterceptArrowKeys="true" 
                                CssClass="textBoxes" ></telerik:RadNumericTextBox><br />
                        </div>
                        <div>
                            <telerik:RadButton runat="server" ID="btnPNSubmit" Text="Submit" OnClick="btnPNSubmit_Click"></telerik:RadButton>
                        </div>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </asp:Panel>

        <%-- Inserting New Manufacturer --%>
        <asp:Panel runat="server" ID="pnlNewManu" Visible="false">            
            <div>
                <%--<uc2:NewManufacturer runat="server" ID="ucNewManufacturer"></uc2:NewManufacturer>--%>
                <h2>Insert New Manufacturer</h2>
                <telerik:RadTextBox runat="server" ID="tbManufacturerName" Label="Name: " LabelWidth="80px"></telerik:RadTextBox> <br />
                <telerik:RadTextBox runat="server" ID="tbxPhoneNumber" Label="Phone Number: "></telerik:RadTextBox> <br />
                <telerik:RadTextBox runat="server" ID="tbxEmail" Label="Email:"></telerik:RadTextBox> <br />
                <telerik:RadTextBox runat="server" ID="tbxAddress" Label="Address"></telerik:RadTextBox> <br />
                <telerik:RadButton runat="server" ID="btnManSubmit" Text="Submit" OnClick="btnManSubmit_Click"></telerik:RadButton> &nbsp;
                <telerik:RadButton runat="server" ID="btnManCancel" Text="Cancel" OnClick="btnManCancel_Click"></telerik:RadButton>
            </div>
        </asp:Panel>

        <%-- Inserting New Product Type --%>
        <asp:Panel runat="server" ID="pnlNewProdType" Visible="false">            
            <div>
                <%--<uc2:NewProductType ID="NewProductType" runat="server"></uc2:NewProductType>--%>
                <h2>Insert Product Type</h2>
                <telerik:RadTextBox runat="server" ID="tbNProdType" Label="Type: "></telerik:RadTextBox> <br />
                <telerik:RadButton runat="server" ID="btnPTSubmit" Text="Submit" OnClick="btnPTSubmit_Click"></telerik:RadButton> &nbsp;
                <telerik:RadButton runat="server" ID="btnPTCancel" Text="Cancel" OnClick="btnPTCancel_Click"></telerik:RadButton>
            </div>
        </asp:Panel>

    </div>
</telerik:RadAjaxPanel>