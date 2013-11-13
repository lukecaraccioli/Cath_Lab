<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewManufacturer.ascx.cs" Inherits="CathLab.UserControls.NewManufacturer" %>

<h2>Insert New Manufacturer</h2>
<telerik:RadTextBox runat="server" ID="tbManufacturerName" Label="Name: "></telerik:RadTextBox> <br />
<telerik:RadTextBox runat="server" ID="tbxPhoneNumber" Label="Phone Number: "></telerik:RadTextBox> <br />
<telerik:RadTextBox runat="server" ID="tbxEmail" Label ="Email:" ></telerik:RadTextBox> <br />
<telerik:RadTextBox runat="server" ID="tbxAddress" Label ="Address" ></telerik:RadTextBox> <br />
<telerik:RadButton runat="server" ID="btnSubmit" Text="Submit" OnClick="btnSubmit_Click"></telerik:RadButton>