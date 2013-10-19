<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeBehind="Par.aspx.cs" Inherits="CathLab.Par" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <telerik:RadGrid runat="server" ID="rdPar">
        <MasterTableView>
            <Columns>
                <%-- Product Type --%>
            </Columns>
            <DetailTables>
                <telerik:GridTableView>
                    <Columns>
                        <%-- Location --%>
                    </Columns>
                    <DetailTables>
                        <telerik:GridTableView>
                            <Columns>
                                <%-- Part Number - NameSize --%>
                            </Columns>
                        </telerik:GridTableView>
                    </DetailTables>
                </telerik:GridTableView>
            </DetailTables>
        </MasterTableView>
    </telerik:RadGrid>
</asp:Content>
