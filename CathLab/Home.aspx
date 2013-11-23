<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CathLab.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main">
        <div id="sidebar">
            <div class="sidebarbox">
                <asp:Panel runat="server" ID="pnlSide" Visible="false">
                <h2>Page Options</h2>
                <ul class="sidemenu">
                    <li><a href="/Inventory/Inventory.aspx">Inventory</a></li>
                    <li><a href="/Reports/Reports.aspx">Reports</a></li>
                </ul>
                    </asp:Panel>                
                <asp:Panel runat="server" ID="pnlLogin">                       
                    <asp:Login runat="server" ID="loginControl" OnLoggedIn="aspLogin_LoggedIn" OnLoggingIn="aspLogin_LoggingIn" Visible="false" 
                        BorderColor="Black" BorderWidth="1px" DestinationPageUrl="~/Inventory/Inventory.aspx" >        
                    </asp:Login>
                    <br />
                    <asp:Label runat="server" ID="lblLoginStatus" Text="Login Failed" ForeColor="Red" Visible="false"></asp:Label>
                </asp:Panel>
            </div>

            <div class="sidebarbox">
                <h2>Instruction box</h2>
                <p>This box shows the user how to navigate the current page</p>

            </div>
        </div>
    </div>

    <%--This section is the code for the slide show --%>
    <div class="rotatorBackground">

        <%-- ItemWidth and ItemHeight include 2x5(pixels) margin and 1x2(pixels) border --%>
        <telerik:RadRotator ID="RadRotator1" runat="server" Width="800px" Height="650px"
            CssClass="rotatorStyle" ItemHeight="650" ItemWidth="800" ScrollDuration="1200">

            <Items>
                <telerik:RadRotatorItem>
                    <ItemTemplate>
                        <asp:Image runat="server" ID="Image" ImageUrl="~/images/SJCH.jpg"
                            CssClass="RotatorItem" AlternateText="Customer Image"></asp:Image>
                    </ItemTemplate>
                </telerik:RadRotatorItem>
                <telerik:RadRotatorItem>
                    <ItemTemplate>
                        <asp:Image runat="server" ID="Image1" ImageUrl="~/images/CancerCen.jpg"
                            CssClass="RotatorItem" AlternateText="Customer Image"></asp:Image>
                    </ItemTemplate>
                </telerik:RadRotatorItem>
                <telerik:RadRotatorItem>
                    <ItemTemplate>
                        <asp:Image runat="server" ID="Image2" ImageUrl="~/images/CathLab.jpg"
                            CssClass="RotatorItem" AlternateText="Customer Image"></asp:Image>
                    </ItemTemplate>
                </telerik:RadRotatorItem>
                <telerik:RadRotatorItem>
                    <ItemTemplate>
                        <asp:Image runat="server" ID="Image3" ImageUrl="~/images/sjchLOGO.png"
                            CssClass="RotatorItem" AlternateText="Customer Image"></asp:Image>
                    </ItemTemplate>
                </telerik:RadRotatorItem>
                <telerik:RadRotatorItem>
                    <ItemTemplate>
                        <asp:Image runat="server" ID="Image4" ImageUrl="~/images/WELCOME_Banner.jpg"
                            CssClass="RotatorItem" AlternateText="Customer Image"></asp:Image>
                    </ItemTemplate>
                </telerik:RadRotatorItem>
                <telerik:RadRotatorItem>
                    <ItemTemplate>
                        <asp:Image runat="server" ID="Image5" ImageUrl="~/images/inventory.png"
                            CssClass="RotatorItem" AlternateText="Customer Image"></asp:Image>
                    </ItemTemplate>
                </telerik:RadRotatorItem>

            </Items>
        </telerik:RadRotator>
    </div>
</asp:Content>