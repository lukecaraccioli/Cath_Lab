<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeBehind="Types.aspx.cs" Inherits="CathLab.Types" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height:40px">
        <telerik:RadButton runat="server" ID="btnManufacturers" OnClick="btnManufacturers_Click" Text="Edit Manufacturers"></telerik:RadButton>&nbsp;
        <telerik:RadButton runat="server" ID="btnProdTypes" OnClick="btnProdTypes_Click" Text="Edit Product Types"></telerik:RadButton>&nbsp;
        <telerik:RadButton runat="server" ID="btnPartNums" OnClick="btnPartNums_Click" Text="Edit Part Numbers"></telerik:RadButton>&nbsp;
    </div>
    <telerik:RadAjaxPanel runat="server" ID="RadAJAXPanel">
        <asp:Panel runat="server" ID="pnlManufacturers">
            <telerik:RadGrid runat="server" ID="rgManufacturers" AllowPaging="true" Width="500px" PageSize="20" OnNeedDataSource="rgManufacturers_NeedDataSource">
                <MasterTableView AutoGenerateColumns="true">
                    <Columns>
                        <telerik:GridButtonColumn Text="Edit" CommandName="Edit" CommandArgument="ID" ButtonType="ImageButton"></telerik:GridButtonColumn>
                    </Columns>
                    <EditFormSettings>
                        <EditColumn ButtonType="ImageButton"></EditColumn>
                    </EditFormSettings>
                </MasterTableView>
            </telerik:RadGrid>
        </asp:Panel>
        <asp:Panel runat="server" ID="pnlProdType" Visible="false">
            <telerik:RadGrid runat="server" ID="rgProdType" AllowPaging="true" Width="500px" PageSize="20" OnNeedDataSource="rgProdType_NeedDataSource">
                <MasterTableView AutoGenerateColumns="true">
                    <Columns>
                        <telerik:GridButtonColumn Text="Edit" CommandName="Edit" CommandArgument="ID" ButtonType="ImageButton"></telerik:GridButtonColumn>
                    </Columns>
                    <%--<EditFormSettings>
                        <EditColumn ButtonType="ImageButton"></EditColumn>
                    </EditFormSettings>--%>
                </MasterTableView>
            </telerik:RadGrid>
        </asp:Panel>
        <asp:Panel runat="server" ID="pnlPartNumbers" Visible="false">
            <telerik:RadGrid runat="server" ID="rgPartNumbers" AllowPaging="true" Width="500px" PageSize="20" OnNeedDataSource="rgPartNumbers_NeedDataSource">
                <MasterTableView AutoGenerateColumns="true">
                    <Columns>
                        <telerik:GridButtonColumn Text="Edit" CommandName="Edit" CommandArgument="ID" ButtonType="ImageButton"></telerik:GridButtonColumn>
                    </Columns>
                    <%--<EditFormSettings>
                        <EditColumn ButtonType="ImageButton"></EditColumn>
                    </EditFormSettings>--%>
                </MasterTableView>
            </telerik:RadGrid>
        </asp:Panel>
    </telerik:RadAjaxPanel>
</asp:Content>