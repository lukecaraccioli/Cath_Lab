﻿<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="CathLab.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="scriptManager" runat ="server"></asp:ScriptManager>
        <telerik:RadGrid ID ="RadGrid1" runat="server" AutoGenerateColumns="true" OnNeedDataSource="RadGrid1_NeedDataSource">

        </telerik:RadGrid>
</asp:Content>
