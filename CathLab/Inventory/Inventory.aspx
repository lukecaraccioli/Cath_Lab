<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="CathLab.Inventory" %>

<%@ Register TagPrefix="uc1" TagName="NewPartNumber" Src="~/UserControls/NewPartNumber.ascx"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <telerik:RadAjaxPanel ID="ajaxpanel" runat="server">
        <div id="main">
            <div id="sidebar">
                <div class="sidebarbox">
                    <h2>Page Options</h2>
                    <ul class="sidemenu">
                        <li><a href="/Inventory/Expiring.aspx">Expiring</a></li>
                         <li><a href="/Inventory/Types.aspx">Types</a></li>
                        <li><a href="/Reports/Reports.aspx">Reports</a></li>
                        <li><a href="/Home.aspx">Home</a></li>
                    </ul>
                </div>

                <div class="sidebarbox">
                    <h2>Instruction box</h2>
                    <ul>
                        <li>Select from the options to filter the product inventory or click New Product to add new inventory</li>
                    </ul>
                </div>
            </div>
        </div>

        <telerik:RadScriptBlock runat="server" ID="RadScriptBlock">
            <script type="text/javascript">
                // To show NewPart window
                function show() {
                    //id(reloading window) { Refesh UC?/ Clear UC }
                    var rw = $find("<%=rwNewEntry.ClientID %>");
                        rw.show();
                };
                // When closing the NewPart window. Clear the user control state?
                function close(sender, e) {
                    sender.dispose();
                };

                // Wait until show() to load UC?
            </script>
        </telerik:RadScriptBlock>
        
        <asp:Panel runat="server" ID="pnlInventory">
            <%--<div style="visibility: hidden">
                <telerik:RadButton runat="server" ID="btnHidden" OnClick="btnHidden_Click" EnableBrowserButtonStyle="true"></telerik:RadButton>
            </div>--%>
            <table>
                <tr>
                    <td>
                        <%-- Select multiple of each attribute in easch list box??? --%>
                        <asp:Label runat="server" ID="lblProdType" Text="Product Type:" AssociatedControlID="lbxProdType"></asp:Label><br />
                        <telerik:RadListBox runat="server" ID="lbxProdType" Height="150" AutoPostBack="True" OnTextChanged="lbxProdType_TextChanged">
                        </telerik:RadListBox>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblManufacturer" Text="Manufacturer:" AssociatedControlID="lbxManufacturer"></asp:Label><br />
                        <telerik:RadListBox runat="server" ID="lbxManufacturer" Height="150" AutoPostBack="True" OnTextChanged="lbxManufacturer_TextChanged">
                        </telerik:RadListBox>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblLocation" Text="Location:" AssociatedControlID="lbxLocation"></asp:Label><br />
                        <telerik:RadListBox runat="server" ID="lbxLocation" Height="150" AutoPostBack="True" OnTextChanged="lbxLocation_TextChanged">
                        </telerik:RadListBox>
                    </td>
                    <td>
                        <telerik:RadAjaxLoadingPanel runat="server" ID="loadingPanel" ></telerik:RadAjaxLoadingPanel>
                        <%--<telerik:RadButton runat="server" ID="btnApply" Text="Apply Filters" OnClick="btnApply_Click"></telerik:RadButton>--%>
                    </td>
                </tr>
                <tr>
                    <telerik:RadButton runat="server" ID="btnNewProduct" OnClientClicked="show" Text="New Product" AutoPostBack="false"></telerik:RadButton>   
                    <%--<telerik:RadButton runat="server" ID="btnNewProduct" Text="New Product" OnClick="btnNewProduct_Click1"></telerik:RadButton>--%>
                </tr>
            </table>
            <telerik:RadGrid runat="server" ID="rgInventory" Visible="true" AllowPaging="true" MasterTableView-PageSize="15" Width="750" Skin="Outlook" OnNeedDataSource="rgInventory_NeedDataSource" 
                AutoGenerateColumns="false" OnDetailTableDataBind="rgInventory_DetailTableDataBind">
                <AlternatingItemStyle BackColor="LightSteelBlue" />
                <AlternatingItemStyle BorderWidth="1px" />
                <ItemStyle BackColor="WhiteSmoke" />
                <ItemStyle BorderWidth="1px" />
                <MasterTableView DataKeyNames="PartNumber, LocationID">
                    <Columns>
                        <telerik:GridBoundColumn DataField="PartNumber" HeaderText="Part Number"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="NameSize" HeaderText="Name & Size"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ManufacturerName" HeaderText="Manufacturer"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Type" HeaderText="Product Type"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="LocationName" HeaderText="Location" ></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Count" HeaderText="Count"></telerik:GridBoundColumn>
                    </Columns>
                    <DetailTables>
                        <telerik:GridTableView runat="server">
                            <Columns>                                
                                <telerik:GridBoundColumn DataField="ExpirationDate" HeaderText="Expiration Date"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="LocationName" HeaderText="Location"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="LotNumber" HeaderText="Lot Number"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="SerialNumber" HeaderText="Serial Number"></telerik:GridBoundColumn>
                            </Columns>
                        </telerik:GridTableView>
                    </DetailTables>
                </MasterTableView>
            </telerik:RadGrid>

            <%--<telerik:RadGrid runat="server" ID="rgInventory" Visible="true" AllowPaging="true" Width="850" Skin="Outlook" OnNeedDataSource="rgInventory_NeedDataSource" AutoGenerateColumns="false">
                <AlternatingItemStyle BackColor="LightSteelBlue" />
                <AlternatingItemStyle BorderWidth="1px" />
                <ItemStyle BackColor="WhiteSmoke" />
                <ItemStyle BorderWidth="1px" />
                <MasterTableView>
                    <Columns>
                        <telerik:GridBoundColumn DataField="PartNumber" HeaderText="Part Number"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="NameSize" HeaderText="Name & Size"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="SerialNumber" HeaderText="Serial Number"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ExpirationDate" HeaderText="Expiration Date"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="LocationName" HeaderText="Location"></telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>--%>
        </asp:Panel>

        <asp:Panel runat="server" ID="pnlExpiring">
            <%-- Expiring grid here --%>
        </asp:Panel>

        <asp:Panel runat="server" ID="pnlScanned">
            <%-- Scanned, waiting for labels stuff here??? --%>
        </asp:Panel>

        <telerik:RadWindow runat="server" ID="rwNewEntry" Modal="true" Width="530px" Height="470px" Title="New Product Entry"
            BackColor="Violet" DestroyOnClose="true">
            <ContentTemplate>
                <%--<telerik:RadAjaxPanel runat="server" ID="rwAJAXPanel">--%>
                <%--<telerik:RadButton runat="server" ID="btnStartScan" Text="Start Scanning" OnClick="btnStartScan_Click"></telerik:RadButton>--%>
                <uc1:NewPartNumber runat="server" ID="uc1" ClientIDMode="AutoID" />
                <%--</telerik:RadAjaxPanel>--%>
            </ContentTemplate>
        </telerik:RadWindow>

    </telerik:RadAjaxPanel>
</asp:Content>
