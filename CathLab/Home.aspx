<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CathLab.Home" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="main">
                <div id="sidebar">
                    <div class="sidebarbox">
                        <h2>Page Options</h2>
                        <ul class="sidemenu">
                            <li><a href="/Reports/Reports.aspx">Reports</a></li>
                            <li><a href="/Inventory/Expiring.aspx">Expiring</a></li>
                            <li><a href="/Inventory/Inventory.aspx">Inventory</a></li>
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

</asp:Content>