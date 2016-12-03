<%@ Page Title="" Language="C#" MasterPageFile="~/Inner.master" AutoEventWireup="true"
    CodeFile="Exam_Info.aspx.cs" Inherits="Exam_Info" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <h2>
            Exam Information</h2>
        <br />
        <br />
        <asp:Panel ID="pnlForm" runat="server">
        <table>
            <tr>
                <td>
                    Department Name:
                </td>
                <td>
                    <asp:DropDownList ID="ddlDepartmentCode" runat="server" 
                        DataSourceID="SqlDataSource1" DataTextField="Department_Name" 
                        DataValueField="Department_Code" Width="150px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT [Department_Code], [Department_Name] FROM [Department_Information]">
                    </asp:SqlDataSource>
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator2" runat="server" ErrorMessage="Department Name required."
                        Text="*" ControlToValidate="ddlDepartmentCode"></asp:RequiredFieldValidator><br />
                </td>
            </tr>
            <tr>
                <td>
                    HOD ID:
                </td>
                <td>
                    <asp:DropDownList ID="ddlHODID" runat="server" DataSourceID="SqlDataSource2" 
                        DataTextField="HOD_ID" DataValueField="HOD_ID" Width="150px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT * FROM [HOD_Information]"></asp:SqlDataSource>
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator3" runat="server" ErrorMessage="HOD ID required."
                        Text="*" ControlToValidate="ddlHODID"></asp:RequiredFieldValidator><br />
                </td>
            </tr>
            <tr>
                <td>
                    Faculty ID:
                </td>
                <td>
                    <asp:DropDownList ID="ddlFacultyID" runat="server" 
                        DataSourceID="SqlDataSource3" DataTextField="Faculty_ID" 
                        DataValueField="Faculty_ID" Width="150px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT * FROM [Faculty_Information]"></asp:SqlDataSource>
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator4" runat="server" ErrorMessage="Faculty ID required."
                        Text="*" ControlToValidate="ddlFacultyID"></asp:RequiredFieldValidator><br />
                </td>
            </tr>
            <tr>
                <td>
                    Subject Name:
                </td>
                <td>
                    <asp:DropDownList ID="ddlSubjectID" runat="server" 
                        DataSourceID="SqlDataSource4" DataTextField="Subject_Name" 
                        DataValueField="Subject_ID" Width="150px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT [Subject_ID], [Subject_Name] FROM [Subject_Information]">
                    </asp:SqlDataSource>
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator5" runat="server" ErrorMessage="Subject Name required."
                        Text="*" ControlToValidate="ddlSubjectID"></asp:RequiredFieldValidator><br />
                </td>
            </tr>
            <tr>
                <td>
                    Exam Title:
                </td>
                <td>
                    <asp:TextBox ID="txtExamTitle" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator6" runat="server" ErrorMessage="Exam Title Must required."
                        Text="*" ControlToValidate="txtExamTitle"></asp:RequiredFieldValidator><br />
                </td>
            </tr>
            <tr>
                <td>
                    Exam Date:
                </td>
                <td>
                    <asp:TextBox ID="txtExamDate" runat="server"></asp:TextBox>
                    <cc1:CalendarExtender ID="txtExamDate_CalendarExtender" runat="server" 
                        Format="dd-MMM-yyyy" TargetControlID="txtExamDate">
                    </cc1:CalendarExtender>
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator7" runat="server" ErrorMessage="Exam Date Must required."
                        Text="*" ControlToValidate="txtExamDate"></asp:RequiredFieldValidator><br />
                </td>
            </tr>
            <tr>
                <td>
                    Exam Time:
                </td>
                <td>
                    <asp:TextBox ID="txtExamTime" runat="server" TextMode="Time"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator8" runat="server" ErrorMessage="Exam Time Must required."
                        Text="*" ControlToValidate="txtExamTime"></asp:RequiredFieldValidator><br />
                </td>
            </tr>
            <tr>
                <td>
                    Time Duration:
                </td>
                <td>
                    <asp:TextBox ID="txtTimeDuration" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator9" runat="server" ErrorMessage="Time Duration Must required."
                        Text="*" ControlToValidate="txtTimeDuration"></asp:RequiredFieldValidator><br />
                </td>
            </tr>
            <tr>
                <td>
                    No of Question:
                </td>
                <td>
                    <asp:TextBox ID="txtNoOfQuestion" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator10" runat="server" ErrorMessage="No of Question Must required."
                        Text="*" ControlToValidate="txtNoOfQuestion"></asp:RequiredFieldValidator><br />
                </td>
            </tr>
            <tr>
                <td>
                    Marks Per Question:
                </td>
                <td>
                    <asp:TextBox ID="txtMarksPerQuestion" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator11" runat="server" ErrorMessage="Marks Per Question Must required."
                        Text="*" ControlToValidate="txtMarksPerQuestion"></asp:RequiredFieldValidator><br />
                </td>
            </tr>
            <tr>
                <td>
                    Total Marks:
                </td>
                <td>
                    <asp:TextBox ID="txtTotalMarks" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator12" runat="server" ErrorMessage="Total Marks Must required."
                        Text="*" ControlToValidate="txtTotalMarks"></asp:RequiredFieldValidator><br />
                </td>
            </tr>
            <tr>
                    <td colspan="2">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" CausesValidation="False" />
                        <asp:Button ID="btnView" runat="server" Text="View" OnClick="btnView_Click" CausesValidation="False" />
                        <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" 
                            Text="Delete" Visible="False" />
                        <cc1:ConfirmButtonExtender ID="btnDelete_ConfirmButtonExtender" runat="server" 
                            TargetControlID="btnDelete">
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
            <asp:TextBox ID="txtSearchExamTitle" runat="server" style="height: 22px" 
                ForeColor="Gray"></asp:TextBox>
            <cc1:TextBoxWatermarkExtender ID="txtSearchExamTitle_TextBoxWatermarkExtender" 
                runat="server" TargetControlID="txtSearchExamTitle" 
                WatermarkText="Exam Title">
            </cc1:TextBoxWatermarkExtender>
            <br />
            <br />
            <asp:Button ID="btnSearch" runat="server" Text="Search" CausesValidation="False"
                OnClick="btnSearch_Click" />
            <asp:Button ID="btnViewAll" runat="server" Text="View All" CausesValidation="False"
                OnClick="btnViewAll_Click" />
            <asp:Button ID="btnBack" runat="server" Text="Back" CausesValidation="False" OnClick="btnBack_Click" />
            <asp:Button ID="btnPrint" runat="server" onclick="btnPrint_Click" 
                Text="Print" />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" 
                OnSelectedIndexChanged="GridView1_SelectedIndexChanged" 
                onrowcreated="GridView1_RowCreated" BackColor="White" 
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
