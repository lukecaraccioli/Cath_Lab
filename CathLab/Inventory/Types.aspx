<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeBehind="Types.aspx.cs" Inherits="CathLab.Types" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content">
            <telerik:RadScriptBlock runat="server" ID="RadScriptBlock">
                <%-- JQuery scripts --%>
                <link rel="stylesheet" href="../Stylesheets/Tabs.css"/>
                <link rel="stylesheet" href="../Stylesheets/jquery-ui.css" />
                <script src="../Scripts/jquery-1.9.1.js"></script>
                <script src="../Scripts/jquery-ui.js"></script>                

                <script type="text/javascript">
                    $(function () {
                        $("#tabs").tabs();
                    });
                </script>
            </telerik:RadScriptBlock>

            <div id="tabs">
                <ul>
                    <li><a href="#tabPartNumbers">Part Numbers</a> </li>
                    <li><a href="#tabManufacturers">Manufacturers</a></li>
                    <li><a href="#tabProdType">Product Type</a></li>
                </ul>

                <div id="tabPartNumbers">
                    <telerik:RadAjaxPanel runat="server" ID="pnlAJAXPartNums">
                    <span>
                    <asp:label runat="server" ID="lblPNSearch" Text="Part Number Search: " AssociatedControlID="tbPNSearch"></asp:label>
                    <telerik:RadTextBox runat="server" ID="tbPNSearch" OnTextChanged="tbPNSearch_TextChanged" />
                        </span>                    
                        <telerik:RadGrid runat="server" ID="rgPartNumbers" AllowPaging="true" Width="670px" PageSize="20" OnNeedDataSource="rgPartNumbers_NeedDataSource"
                            OnUpdateCommand="rgPartNumbers_UpdateCommand" OnDeleteCommand="rgPartNumbers_DeleteCommand">
                            <PagerStyle Mode="NextPrevAndNumeric" />
                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="PartNum" EditMode="EditForms">
                                <%--<EditFormSettings InsertCaption="Insert PN" PopUpSettings-Modal="true" EditFormType="Template" --%>
                                <Columns>
                                    <telerik:GridButtonColumn Text="Edit" CommandName="Edit" CommandArgument="PartNum" ButtonType="ImageButton"></telerik:GridButtonColumn>
                                    <telerik:GridBoundColumn DataField="PartNum" HeaderText="Part Number"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="NameSize" HeaderText="Name/Size"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Name" HeaderText="Manufacturer"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Type" HeaderText="Product Type"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Cost" HeaderText="Cost"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Par" HeaderText="Par"></telerik:GridBoundColumn>
                                    <telerik:GridButtonColumn Text="Delete" CommandName="Delete" CommandArgument="PartNum" ButtonType="ImageButton" ConfirmDialogType="RadWindow"
                                        ConfirmText="Permanently delete Part Number?">
                                    </telerik:GridButtonColumn>
                                </Columns>
                                <EditFormSettings EditFormType="Template">
                                    <FormTemplate>
                                        <telerik:RadTextBox runat="server" ID="tbPartNum" Text='<%# DataBinder.Eval(Container, "DataItem.PartNum") %>'></telerik:RadTextBox>
                                        <telerik:RadTextBox runat="server" ID="tbNameSize" Text='<%# DataBinder.Eval(Container, "DataItem.NameSize") %>'></telerik:RadTextBox>
                                        <telerik:RadListBox runat="server" ID="lbxManufacturer" ></telerik:RadListBox>
                                        <telerik:RadListBox runat="server" ID="lbxProductType" ></telerik:RadListBox>
                                        <telerik:RadTextBox runat="server" ID="tbCost" Text='<%# DataBinder.Eval(Container, "DataItem.Cost") %>'></telerik:RadTextBox>
                                        <telerik:RadTextBox runat="server" ID="tbPar" Text='<%# DataBinder.Eval(Container, "DataItem.Par") %>'></telerik:RadTextBox>
                                        <telerik:RadButton runat="server" ID="btnSavePartNum" Text='<%# Container is GridEditFormItem ? "Insert" : "Update" %>' 
                                            CausesValidation="true" CommandName="Update"></telerik:RadButton>
                                        <telerik:RadButton runat="server" ID="btnCancelPartNum" Text="Cancel" CausesValidation="false" CommandName="Cancel"></telerik:RadButton>
                                    </FormTemplate>
                                    <EditColumn ButtonType="ImageButton"></EditColumn>
                                </EditFormSettings>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </telerik:RadAjaxPanel>
                </div>

                <div id="tabManufacturers">
                    <telerik:RadAjaxPanel runat="server" ID="pnlAJAXManufacturers">
                        <telerik:RadGrid runat="server" ID="rgManufacturers" AllowPaging="true" Width="500px" PageSize="20" OnNeedDataSource="rgManufacturers_NeedDataSource"
                            OnUpdateCommand="rgManufacturers_UpdateCommand" OnDeleteCommand="rgManufacturers_DeleteCommand">
                            <MasterTableView AutoGenerateColumns="false" DataKeyNames="ID" EditMode="EditForms">
                                <Columns>
                                    <telerik:GridButtonColumn Text="Edit" CommandName="Edit" CommandArgument="ID" ButtonType="ImageButton"></telerik:GridButtonColumn>
                                    <telerik:GridBoundColumn DataField="Name" HeaderText="Name"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="Email" HeaderText="Email Address"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="PhoneNumber" HeaderText="Phone Number"></telerik:GridBoundColumn>
                                    <telerik:GridButtonColumn Text="Delete" CommandName="Delete" ButtonType="ImageButton" ConfirmDialogType="RadWindow"
                                        ConfirmText="Permanently delete Manufacturer?">
                                    </telerik:GridButtonColumn>
                                </Columns>
                                <EditFormSettings EditFormType="Template">
                                    <FormTemplate></FormTemplate>
                                    <EditColumn ButtonType="ImageButton"></EditColumn>
                                </EditFormSettings>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </telerik:RadAjaxPanel>
                </div>

                <div id="tabProdType">
                    <telerik:RadAjaxPanel runat="server" ID="pnlAJAXProdType">
                        <telerik:RadGrid runat="server" ID="rgProdType" AllowPaging="true" Width="500px" PageSize="20" OnNeedDataSource="rgProdType_NeedDataSource"
                            OnUpdateCommand="rgProdType_UpdateCommand" OnDeleteCommand="rgProdType_DeleteCommand">
                            <MasterTableView AutoGenerateColumns="false" DataKeyNames="ID" EditMode="EditForms">
                                <Columns>
                                    <telerik:GridButtonColumn Text="Edit" CommandName="Edit" CommandArgument="ID" ButtonType="ImageButton"></telerik:GridButtonColumn>
                                    <telerik:GridBoundColumn DataField="Type" HeaderText="Product Type"></telerik:GridBoundColumn>
                                    <telerik:GridButtonColumn Text="Delete" CommandName="Delete" CommandArgument="ID" ButtonType="ImageButton" ConfirmDialogType="RadWindow"
                                        ConfirmText="Permanently delete Product Type?">
                                    </telerik:GridButtonColumn>
                                </Columns>
                                <EditFormSettings EditFormType="Template" >
                                    <FormTemplate>
                                        <telerik:RadTextBox runat="server" ID="tbType" Label="Type: " Text='<%# DataBinder.Eval(Container, "DataItem.Type") %>'></telerik:RadTextBox> 
                                        &nbsp;
                                        <telerik:RadButton runat="server" ID="btnSaveTypes" Text='<%# Container is GridEditFormItem ? "Insert" : "Update" %>' 
                                            CausesValidation="true" CommandName="Update"></telerik:RadButton> 
                                        <%-- '<%# Container is GridEditFormItem ? "PerformInsert" : "Update" %>' --%>
                                        &nbsp;
                                        <telerik:RadButton runat="server" ID="btnCancelTypes" Text="Cancel" CausesValidation="false" CommandName="Cancel"></telerik:RadButton>
                                    </FormTemplate>
                                    <EditColumn ButtonType="ImageButton"></EditColumn>
                                </EditFormSettings>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </telerik:RadAjaxPanel>
                </div>
            </div>

        <telerik:RadWindowManager runat="server" ID="rwManager"></telerik:RadWindowManager>

            <telerik:RadNotification runat="server" ID="RadNotification" AutoCloseDelay="2500" Height="300px" Width="400px" Title="ERROR!">
                <ContentTemplate>
                    <asp:Label runat="server" ID="rnLabel"></asp:Label>
                </ContentTemplate>
            </telerik:RadNotification>


            <telerik:RadWindow runat="server" ID="windowNotification" Title="WARNING">
                <ContentTemplate>
                    <asp:Label runat="server" ID="rwLabel"></asp:Label>
                </ContentTemplate>
            </telerik:RadWindow>

      <%--  </telerik:RadAjaxPanel>--%>
    </div>
</asp:Content>