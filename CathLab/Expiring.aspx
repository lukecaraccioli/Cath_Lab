<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeBehind="Expiring.aspx.cs" Inherits="CathLab.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <telerik:RadAjaxPanel runat="server" ID="RadAJAXPanel">
        <table>
            <tr>
                <td>
                    <telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="true" OnNeedDataSource="RadGrid1_NeedDataSource" AllowSorting="true"
                        Width="500px" Skin="WebBlue">
                    </telerik:RadGrid>
                </td >
                <td>View products expiring in: 
                <br />
                    <telerik:RadButton runat="server" ID="btn10" Text="10 Days" OnClick="btn10_Click"></telerik:RadButton>
                    <br />
                    <telerik:RadButton runat="server" ID="btn30" Text="30 Days" OnClick="btn30_Click"></telerik:RadButton>
                    <br />
                </td>
            </tr>
        </table>
        <asp:ScriptManager ID="scriptManager" runat="server"></asp:ScriptManager>
    </telerik:RadAjaxPanel>
</asp:Content>
