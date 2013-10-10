<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="CathLab.Inventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <telerik:RadAjaxPanel ID="ajaxpanel" runat="server">
        <telerik:RadAjaxLoadingPanel runat="server" ID="loadingPanel"></telerik:RadAjaxLoadingPanel>
        <%--<div style="height:30px">
             <telerik:RadButton runat="server" ID="btnView" OnClick="btnView_Click" Text="View Products"></telerik:RadButton> &nbsp;
             <telerik:RadButton runat="server" ID="btnEntry" OnClick="btnEntry_Click" Text="Product Entry"></telerik:RadButton>
        </div>--%>
        <asp:Panel runat="server" ID="pnlView">
            <table style="width: 100px">
                <tr>
                    <td>
                        <asp:Label runat="server" ID="lblProdType" Text="Product Type:"></asp:Label><br />
                        <telerik:RadListBox runat="server" ID="lbxProdType" Height="150" AutoPostBack="True" OnTextChanged="lbxProdType_TextChanged">
                        </telerik:RadListBox>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblManufacturer" Text="Manufacturer:"></asp:Label><br />
                        <telerik:RadListBox runat="server" ID="lbxManufacturer" Height="150" AutoPostBack="True" OnTextChanged="lbxManufacturer_TextChanged">
                        </telerik:RadListBox>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblLocation" Text="Location:"></asp:Label><br />
                        <telerik:RadListBox runat="server" ID="lbxLocation" Height="150" AutoPostBack="True" OnTextChanged="lbxLocation_TextChanged">
                        </telerik:RadListBox>
                    </td>
                    <td>
                        <telerik:RadButton runat="server" ID="btnApply" Text="Apply Filters" OnClick="btnApply_Click"></telerik:RadButton>
                    </td>
                </tr>
            </table>
            <telerik:RadGrid runat="server" ID="rgInventory" Visible="true" AllowPaging="true" Skin="Outlook" OnNeedDataSource="rgInventory_NeedDataSource" AutoGenerateColumns="false">
                 <AlternatingItemStyle BackColor="LightSteelBlue" />
                <AlternatingItemStyle BorderWidth="1px" />
                <ItemStyle BackColor="WhiteSmoke" />
                <ItemStyle BorderWidth="1px" />
                <MasterTableView>
                    <Columns>
                        <telerik:GridBoundColumn DataField="ID" HeaderText="CathLab ID"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="PartNumber" HeaderText="Part Number"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="NameSize" HeaderText="Name & Size"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SerialNumber" HeaderText="Serial Number"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ExpirationDate" HeaderText="Expiration Date"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Location" HeaderText="Location"></telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </asp:Panel>
    </telerik:RadAjaxPanel>
</asp:Content>
