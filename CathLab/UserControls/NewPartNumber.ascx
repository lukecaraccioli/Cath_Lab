<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewPartNumber.ascx.cs" Inherits="CathLab.UserControls.NewPartNumber" %>


<asp:Panel runat="server" ID="pnlNewPart">
    <asp:Table runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <telerik:RadTextBox runat="server" ID="txt" Label="New Part#:"></telerik:RadTextBox>
                <br />
                <asp:Label runat="server" ID="lblLocation" Text="Location:"></asp:Label><br />
                <telerik:RadListBox runat="server" ID="lbxLocation" Height="150" AutoPostBack="True" OnTextChanged="lbxLocation_TextChanged">
                </telerik:RadListBox>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Panel>

<asp:Panel runat="server" ID="pnlNewManu" Visible="false">

</asp:Panel>

<asp:Panel runat="server" ID="pnlNewProdType" Visible="false">

</asp:Panel>

<%--<telerik:RadTextBox runat="server" ID="tbPartNumber" Label="New Part Number:" LabelWidth="15px"></telerik:RadTextBox>

<telerik:RadListBox runat="server" ID="lbxManufacturer"></telerik:RadListBox>
<telerik:RadListBox runat="server" ID="lbxProductType"></telerik:RadListBox>--%>