<%@ Page Title="" Language="C#" MasterPageFile="~/Inner.master" AutoEventWireup="true" CodeFile="crtViewStudentInformation.aspx.cs" Inherits="crtViewStudentInformation" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Button ID="btnBack" runat="server" Text="Back" 
    onclick="btnBack_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblStudentName" runat="server" Text="Student Name" 
        Font-Bold="True" Font-Size="12pt"></asp:Label>
    <asp:DropDownList ID="ddlStudentName" runat="server" DataSourceID="SqlDataSource1" 
        DataTextField="Student_First_Name" DataValueField="Student_First_Name" 
        onselectedindexchanged="ddlStudentName_SelectedIndexChanged" Width="150px">
    </asp:DropDownList>
    <asp:Button ID="btnSearch" runat="server" onclick="btnSearch_Click" 
        Text="Search" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [Student_First_Name] FROM [Student_Information]">
    </asp:SqlDataSource>
    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" 
    AutoDataBind="True" GroupTreeImagesFolderUrl="" Height="1202px" 
    ReportSourceID="CrystalReportSource1" ToolbarImagesFolderUrl="" 
    ToolPanelWidth="200px" Width="1104px" oninit="CrystalReportViewer1_Init" />
<CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
    <Report FileName="crtViewStudentInformation.rpt">
    </Report>
</CR:CrystalReportSource>
</asp:Content>

