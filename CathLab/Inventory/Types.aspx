<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeBehind="Types.aspx.cs" Inherits="CathLab.Types" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <telerik:RadAjaxPanel runat="server" ID="RadAJAXPanel">
        <div style="height: 40px">
            <telerik:RadButton runat="server" ID="btnPartNums" OnClick="btnPartNums_Click" Text="Edit Part Numbers"></telerik:RadButton>
            &nbsp;
        <telerik:RadButton runat="server" ID="btnManufacturers" OnClick="btnManufacturers_Click" Text="Edit Manufacturers"></telerik:RadButton>
            &nbsp;
        <telerik:RadButton runat="server" ID="btnProdTypes" OnClick="btnProdTypes_Click" Text="Edit Product Types"></telerik:RadButton>
            &nbsp;
        </div>

        <div id="#tabs">
            <div id="PartNumbers">
                <telerik:RadGrid runat="server" ID="rgPartNumbers" AllowPaging="true" Width="670px" PageSize="20" OnNeedDataSource="rgPartNumbers_NeedDataSource" AllowAutomaticInserts="true"
                    OnUpdateCommand="rgPartNumbers_UpdateCommand" OnEditCommand="rgPartNumbers_EditCommand" OnInsertCommand="rgPartNumbers_InsertCommand" OnDeleteCommand="rgPartNumbers_DeleteCommand">
                    <PagerStyle Mode="NextPrevAndNumeric" />
                    <MasterTableView AutoGenerateColumns="False" DataKeyNames="PartNum">
                        <Columns>
                            <telerik:GridButtonColumn Text="Edit" CommandName="Edit" CommandArgument="PartNum" ButtonType="ImageButton"></telerik:GridButtonColumn>
                            <telerik:GridBoundColumn DataField="PartNum" HeaderText="Part Number"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="NameSize" HeaderText="Name/Size"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Name" HeaderText="Manufacturer"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Type" HeaderText="Product Type"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Cost" HeaderText="Cost"></telerik:GridBoundColumn>
                            <telerik:GridButtonColumn Text="Delete" CommandName="Delete" CommandArgument="PartNum" ButtonType="ImageButton" ConfirmDialogType="RadWindow"
                                ConfirmText="Permanently delete Part Number?">
                            </telerik:GridButtonColumn>
                        </Columns>
                        <EditFormSettings>
                            <FormTemplate>
                            </FormTemplate>
                            <EditColumn ButtonType="ImageButton"></EditColumn>
                        </EditFormSettings>
                    </MasterTableView>
                </telerik:RadGrid>
            </div>

            <div id="Manufacturers">
                <telerik:RadGrid runat="server" ID="rgManufacturers" AllowPaging="true" Width="500px" PageSize="20" OnNeedDataSource="rgManufacturers_NeedDataSource"
                    OnUpdateCommand="rgManufacturers_UpdateCommand" Visible="false" OnDeleteCommand="rgManufacturers_DeleteCommand">
                    <MasterTableView AutoGenerateColumns="false" DataKeyNames="ID">
                        <Columns>
                            <telerik:GridButtonColumn Text="Edit" CommandName="Edit" CommandArgument="ID" ButtonType="ImageButton"></telerik:GridButtonColumn>
                            <telerik:GridBoundColumn DataField="Name" HeaderText="Name"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Email" HeaderText="Email Address"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PhoneNumber" HeaderText="Phone Number"></telerik:GridBoundColumn>
                            <telerik:GridButtonColumn Text="Delete" CommandName="Delete" ButtonType="ImageButton" ConfirmDialogType="RadWindow"
                                ConfirmText="Permanently delete Manufacturer?">
                            </telerik:GridButtonColumn>
                        </Columns>
                        <EditFormSettings>
                            <EditColumn ButtonType="ImageButton"></EditColumn>
                        </EditFormSettings>
                    </MasterTableView>
                </telerik:RadGrid>
            </div>
        </div>

        <div id="ProdType">
            <telerik:RadGrid runat="server" ID="rgProdType" AllowPaging="true" Width="500px" PageSize="20" OnNeedDataSource="rgProdType_NeedDataSource"
                OnUpdateCommand="rgProdType_UpdateCommand" Visible="false" OnDeleteCommand="rgProdType_DeleteCommand">
                <MasterTableView AutoGenerateColumns="false" DataKeyNames="ID">
                    <Columns>
                        <telerik:GridButtonColumn Text="Edit" CommandName="Edit" CommandArgument="ID" ButtonType="ImageButton"></telerik:GridButtonColumn>
                        <telerik:GridBoundColumn DataField="Type" HeaderText="Product Type"></telerik:GridBoundColumn>
                        <telerik:GridButtonColumn Text="Delete" CommandName="Delete" CommandArgument="ID" ButtonType="ImageButton" ConfirmDialogType="RadWindow"
                            ConfirmText="Permanently delete Product Type?">
                        </telerik:GridButtonColumn>
                    </Columns>
                    <EditFormSettings>
                        <EditColumn ButtonType="ImageButton"></EditColumn>
                    </EditFormSettings>
                </MasterTableView>
            </telerik:RadGrid>
        </div>

        <telerik:RadNotification runat="server" ID="RadNotification" AutoCloseDelay="2500" Height="300px" Width="400px" Title="ERROR!">
            <ContentTemplate>
                <asp:Label runat="server" ID="rnLabel"></asp:Label>
            </ContentTemplate>
        </telerik:RadNotification>

        <telerik:RadWindow runat="server" ID="twAlert">
        </telerik:RadWindow>

        <telerik:RadWindow runat="server" ID="windowNotification" Title="WARNING">
            <ContentTemplate>
                <asp:Label runat="server" ID="rwLabel"></asp:Label>
            </ContentTemplate>
        </telerik:RadWindow>

    </telerik:RadAjaxPanel>
</asp:Content>