<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeBehind="Types.aspx.cs" Inherits="CathLab.Types" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <telerik:RadAjaxManager runat="server" ID="radAJAXManager">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="btnManufacturers">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="rgManufacturers" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="rgProdType" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="rgPartNumbers" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="btnProdTypes">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="rgManufacturers" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="rgProdType" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="rgPartNumbers" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="btnPartNums">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="rgManufacturers" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="rgProdType" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="rgPartNumbers" UpdatePanelCssClass=""></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <div style="height: 40px">
        <telerik:RadButton runat="server" ID="btnPartNums" OnClick="btnPartNums_Click" Text="Edit Part Numbers"></telerik:RadButton>
        &nbsp;
        <telerik:RadButton runat="server" ID="btnManufacturers" OnClick="btnManufacturers_Click" Text="Edit Manufacturers"></telerik:RadButton>
        &nbsp;
        <telerik:RadButton runat="server" ID="btnProdTypes" OnClick="btnProdTypes_Click" Text="Edit Product Types"></telerik:RadButton>
        &nbsp;
    </div>
    <telerik:RadGrid runat="server" ID="rgPartNumbers" AllowPaging="true" Width="500px" PageSize="20" OnNeedDataSource="rgPartNumbers_NeedDataSource"
        OnUpdateCommand="rgPartNumbers_UpdateCommand">
        <MasterTableView AutoGenerateColumns="False" DataKeyNames="PartNum">
            <Columns>
                <telerik:GridButtonColumn Text="Edit" CommandName="Edit" CommandArgument="PartNum" ButtonType="ImageButton"></telerik:GridButtonColumn>
                <telerik:GridBoundColumn DataField="PartNum" HeaderText="Part Number"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="NameSize" HeaderText="Name/Size"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Name" HeaderText="Manufacturer"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Type" HeaderText="Product Type"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Cost" HeaderText="Cost"></telerik:GridBoundColumn>
            </Columns>
            <EditFormSettings>
                <EditColumn ButtonType="ImageButton"></EditColumn>
            </EditFormSettings>
        </MasterTableView>
    </telerik:RadGrid>

    <telerik:RadGrid runat="server" ID="rgManufacturers" AllowPaging="true" Width="500px" PageSize="20" OnNeedDataSource="rgManufacturers_NeedDataSource"
        OnUpdateCommand="rgManufacturers_UpdateCommand" Visible="false">
        <MasterTableView AutoGenerateColumns="false" DataKeyNames="ID">
            <Columns>
                <telerik:GridButtonColumn Text="Edit" CommandName="Edit" CommandArgument="ID" ButtonType="ImageButton"></telerik:GridButtonColumn>
                <telerik:GridBoundColumn DataField="Name" HeaderText="Name"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Email" HeaderText="Email Address"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="PhoneNumber" HeaderText="Phone Number"></telerik:GridBoundColumn>
            </Columns>
            <EditFormSettings>
                <%--<EditColumn ButtonType="ImageButton"></EditColumn>--%>
            </EditFormSettings>
        </MasterTableView>
    </telerik:RadGrid>

    <telerik:RadGrid runat="server" ID="rgProdType" AllowPaging="true" Width="500px" PageSize="20" OnNeedDataSource="rgProdType_NeedDataSource"
        OnUpdateCommand="rgProdType_UpdateCommand" Visible="false">
        <MasterTableView AutoGenerateColumns="false" DataKeyNames="ID">
            <Columns>
                <telerik:GridButtonColumn Text="Edit" CommandName="Edit" CommandArgument="ID" ButtonType="ImageButton"></telerik:GridButtonColumn>
                <telerik:GridBoundColumn DataField="Type" HeaderText="Product Type"></telerik:GridBoundColumn>
            </Columns>
            <EditFormSettings>
                <EditColumn ButtonType="ImageButton"></EditColumn>
            </EditFormSettings>
        </MasterTableView>
    </telerik:RadGrid>

</asp:Content>