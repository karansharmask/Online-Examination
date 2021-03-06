﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Inner.master" AutoEventWireup="true" CodeFile="GiveFeedback.aspx.cs" Inherits="GiveFeedback" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <h2>
            Give Feedback</h2>
        <br />
        <br />
        <asp:Panel ID="pnlForm" runat="server">
            <table>
                <tr>
                    <td>
                        Feedback ID:
                    </td>
                    <td>
                        <asp:TextBox ID="txtFeedbackID" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1" runat="server" ErrorMessage="Feedback ID Must required."
                            Text="*" ControlToValidate="txtFeedbackID"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        Feedback Date:
                    </td>
                    <td>
                        <asp:TextBox ID="txtFeedbackDate" runat="server"></asp:TextBox>
                        <cc1:CalendarExtender ID="txtFeedbackDate_CalendarExtender" runat="server" 
                            Format="dd-MMM-yyyy" TargetControlID="txtFeedbackDate">
                        </cc1:CalendarExtender>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator2" runat="server" ErrorMessage="Feedback Date Must required."
                            Text="*" ControlToValidate="txtFeedbackDate"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        Student ID:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlStudentID" runat="server" 
                            DataSourceID="SqlDataSource1" DataTextField="Student_ID" 
                            DataValueField="Student_ID" Width="150px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT [Student_ID] FROM [Student_Information]">
                        </asp:SqlDataSource>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator3" runat="server" ErrorMessage="Student ID Must required."
                            Text="*" ControlToValidate="ddlStudentID"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        Feedback Text:
                    </td>
                    <td>
                        <asp:TextBox ID="txtFeedbackText" runat="server" TextMode="MultiLine"></asp:TextBox><asp:RequiredFieldValidator
                            ID="RequiredFieldValidator4" runat="server" ErrorMessage="Feedback Text Must required."
                            Text="*" ControlToValidate="txtFeedbackText"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                            OnClick="btnSubmit_Click" style="height: 26px" />
                        <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" CausesValidation="False" />
                        <asp:Button ID="btnView" runat="server" Text="View" OnClick="btnView_Click" 
                            CausesValidation="False" style="height: 26px" />
                        <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" 
                            Text="Delete" Visible="False" />
                        <cc1:ConfirmButtonExtender ID="btnDelete_ConfirmButtonExtender" runat="server" 
                            ConfirmText="Sure Want to Delete ?" TargetControlID="btnDelete">
                        </cc1:ConfirmButtonExtender>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" Text="*" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblSave" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="pnlGrid" runat="server" Visible="False">
            Search by :
            <asp:TextBox ID="txtSearchFeedbackID" runat="server" ForeColor="Gray"></asp:TextBox>
            <cc1:TextBoxWatermarkExtender ID="txtSearchFeedbackID_TextBoxWatermarkExtender" 
                runat="server" TargetControlID="txtSearchFeedbackID" 
                WatermarkText="Feedback ID">
            </cc1:TextBoxWatermarkExtender>
            <br />
            <br />
            <asp:Button ID="btnSearch" runat="server" Text="Search" CausesValidation="False"
                OnClick="btnSearch_Click" />
            <asp:Button ID="btnViewAll" runat="server" Text="View All" CausesValidation="False"
                OnClick="btnViewAll_Click" />
            <asp:Button ID="btnBack" runat="server" Text="Back" CausesValidation="False" OnClick="btnBack_Click" />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" 
                OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" 
                BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField SelectText=" Edit " ShowSelectButton="True" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>
        </asp:Panel>
    </center>
</asp:Content>

