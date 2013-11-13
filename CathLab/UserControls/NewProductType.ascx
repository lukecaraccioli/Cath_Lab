<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewProductType.ascx.cs" Inherits="CathLab.UserControls.NewProductType" %>


<h2>Insert Product Type</h2>
<telerik:RadTextBox runat="server" ID="tbType" Label="Type: "></telerik:RadTextBox> <br />
<telerik:RadButton runat="server" ID="btnSubmit" Text="Submit" OnClick="btnSubmit_Click"></telerik:RadButton>