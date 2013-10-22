<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewPartNumber.ascx.cs" Inherits="CathLab.UserControls.NewPartNumber" %>

<asp:Label runat="server" ID="lbl" Text="New Pert Number"></asp:Label> &nbsp;
<telerik:RadTextBox runat="server" ID="tbPartNumber"></telerik:RadTextBox>

<telerik:RadListBox runat="server" ID="lbxManufacturer"></telerik:RadListBox>
<telerik:RadListBox runat="server" ID="lbxProductType"></telerik:RadListBox>