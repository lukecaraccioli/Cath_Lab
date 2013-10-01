<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeBehind="Expiring.aspx.cs" Inherits="CathLab.Expiring" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <telerik:RadAjaxPanel runat="server" ID="AJAXPanel">
       
        <div id="main">
                <div id="sidebar">
                    <div class="sidebarbox">
                        <h2>Page Options</h2>
                        <ul class="sidemenu">
                            <li><telerik:RadButton runat="server" ID="btnToday" Text="Today" Height="35px"></telerik:RadButton></li>
                            <li><telerik:RadButton runat="server" ID="btn10" OnClick="btn10_Click" Text="10 Days" Height="35px"></telerik:RadButton></li>
                            <li><telerik:RadButton runat="server" ID="btn30" OnClick="btn30_Click" Text="30 Days" Height="35px"></telerik:RadButton></li>
                            <li><a href="/Home.aspx">Home</a></li>
                        </ul>
                    </div>

                    <div class="sidebarbox">
                        <h2>Instruction box</h2>
                        <p>This will be an Instruction/explination box for the buttons located on the side of the rad grid</p>
                        <ul>
                            <%--<li><a href="http://andreasviklund.com/templates/">More free templates</a></li>
					<li><a href="http://andreasviklund.com/tag/tutorials/">Template tutorials</a></li>--%>
                        </ul>
                    </div>
                </div>
            </div>
         <telerik:RadGrid runat="server" ID="RadGrid1" OnNeedDataSource="RadGrid1_NeedDataSource" AllowPaging="true" PageSize="15" Width="900" AllowSorting="true">
        </telerik:RadGrid>
       
        
    </telerik:RadAjaxPanel>
</asp:Content>