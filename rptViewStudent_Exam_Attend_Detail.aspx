<%@ Page Title="" Language="C#" MasterPageFile="~/Inner.master" AutoEventWireup="true" CodeFile="rptViewStudent_Exam_Attend_Detail.aspx.cs" Inherits="rptViewStudent_Exam_Attend_Detail" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" Height ="900px" InteractiveDeviceInfos="(Collection)" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="900px">
        <LocalReport ReportPath="rptViewStudent_Exam_Attend_Detail.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="SqlDataSource1" 
                    Name="dsViewStudent_Exam_Attend_Detail" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [viewStudent_Exam_Attend_Detail]">
    </asp:SqlDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        SelectMethod="GetData" 
        TypeName="dsViewStudent_Exam_Attend_DetailTableAdapters.viewStudent_Exam_Attend_DetailTableAdapter">
    </asp:ObjectDataSource>
</asp:Content>

