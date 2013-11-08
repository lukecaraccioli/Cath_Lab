<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeBehind="Expiring.aspx.cs" Inherits="CathLab.Expiring" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <telerik:RadAjaxPanel runat="server" ID="AJAXPanel">
        <div id="main">
            <div id="sidebar">
                <div class="sidebarbox">
                    <h2>Page Options</h2>
                    <ul class="sidemenu">
                        <li>
                            <telerik:RadButton runat="server" ID="btnToday" OnClick="btnToday_Click" Text="Today" Height="35px" Skin="WebBlue" CssClass="rbPrimaryButton"></telerik:RadButton>
                        </li>
                        <li>
                            <telerik:RadButton runat="server" ID="btn10" OnClick="btn10_Click" Text="10 Days" Height="35px" Skin="WebBlue" CssClass="rbSecondaryButton"></telerik:RadButton>
                        </li>
                        <li>
                            <telerik:RadButton runat="server" ID="btn30" OnClick="btn30_Click" Text="30 Days" Height="35px" Skin="WebBlue" CssClass="rbPrimaryButton"></telerik:RadButton>
                        </li>
                        <br />
                        <asp:Label runat="server" ID="lblDate" Text="From today until:"></asp:Label><br />
                        <telerik:RadDatePicker runat="server" ID="dpEnd" AutoPostBack="true" OnSelectedDateChanged="dpEnd_SelectedDateChanged"></telerik:RadDatePicker>
                    </ul>
                </div>

                <div class="sidebarbox">
                    <h2>Instruction box</h2>
                    <p>This will be an Instruction/explination box for the buttons located on the side of the rad grid</p>
                </div>
            </div>
        </div>
        <telerik:RadGrid runat="server" ID="RadGrid1" AllowPaging="true" PageSize="15" Width="800" Skin="Outlook"
            AllowSorting="true" AutoGenerateColumns="false" ExportSettings-FileName="ExpiringSpreadsheet">
            <AlternatingItemStyle BackColor="LightSteelBlue" />
            <AlternatingItemStyle BorderWidth="1px" />
            <ItemStyle BackColor="WhiteSmoke" />
            <ItemStyle BorderWidth="1px" />
            <MasterTableView>
                <Columns>
                    <telerik:GridBoundColumn DataField="ExpirationDate" HeaderText="Expiration Date"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="NameSize" HeaderText="Name/Size"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="LocationName" HeaderText="Location"></telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </telerik:RadAjaxPanel>

</asp:Content>