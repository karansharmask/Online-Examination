<%@ Page Title="" Language="C#" MasterPageFile="~/Inner.master" AutoEventWireup="true"
    CodeFile="Student_Information.aspx.cs" Inherits="Stud_Info" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <h2>
            Student Update Information</h2>
        <br />
        <br />
        <asp:Panel ID="pnlForm" runat="server" Visible="False">
            <table>
                <tr>
                    <td>
                        Student Enroll No:
                    </td>
                    <td>
                        <asp:TextBox ID="txtStudentEnrollNo" runat="server"></asp:TextBox><asp:RegularExpressionValidator
                            ID="RegularExpressionValidator2" runat="server" ErrorMessage="Characters are not allow."
                            ControlToValidate="txtStudentEnrollNo" ValidationExpression="[0-9]+$" Text="*"></asp:RegularExpressionValidator><asp:RequiredFieldValidator
                                ID="RequiredFieldValidator2" runat="server" ErrorMessage="Student Enroll No Must required."
                                Text="*" ControlToValidate="txtStudentEnrollNo"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        Department Name:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlDepartmentCode" runat="server" DataSourceID="SqlDataSource1"
                            DataTextField="Department_Name" DataValueField="Department_Code" Width="150px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            SelectCommand="SELECT [Department_Code], [Department_Name] FROM [Department_Information]">
                        </asp:SqlDataSource>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        Student Division:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlStudentDivision" runat="server" Width="150px">
                            <asp:ListItem>A</asp:ListItem>
                            <asp:ListItem>B</asp:ListItem>
                            <asp:ListItem>C</asp:ListItem>
                            <asp:ListItem>D</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Student Division Must required."
                            Text="*" ControlToValidate="ddlStudentDivision"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        Student First Name:
                    </td>
                    <td>
                        <asp:TextBox ID="txtStudentFirstName" runat="server"></asp:TextBox><asp:RegularExpressionValidator
                            ID="RegularExpressionValidator3" runat="server" ErrorMessage="Numbers are not allow."
                            ControlToValidate="txtStudentFirstName" ValidationExpression="[A-Za-z]+$" Text="*"></asp:RegularExpressionValidator><asp:RequiredFieldValidator
                                ID="RequiredFieldValidator5" runat="server" ErrorMessage="Student First Name Must required."
                                Text="*" ControlToValidate="txtStudentFirstName"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        Student Middle Name:
                    </td>
                    <td>
                        <asp:TextBox ID="txtStudentMiddleName" runat="server"></asp:TextBox><asp:RegularExpressionValidator
                            ID="RegularExpressionValidator4" runat="server" ErrorMessage="Numbers are not allow."
                            ControlToValidate="txtStudentMiddleName" ValidationExpression="[A-Za-z]+$" Text="*"></asp:RegularExpressionValidator><asp:RequiredFieldValidator
                                ID="RequiredFieldValidator6" runat="server" ErrorMessage="Student Middle Name Must required."
                                Text="*" ControlToValidate="txtStudentMiddleName"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        Student Last Name:
                    </td>
                    <td>
                        <asp:TextBox ID="txtStudentLastName" runat="server"></asp:TextBox><asp:RegularExpressionValidator
                            ID="RegularExpressionValidator5" runat="server" ErrorMessage="Numbers are not allow."
                            ControlToValidate="txtStudentLastName" ValidationExpression="[A-Za-z]+$" Text="*"></asp:RegularExpressionValidator><asp:RequiredFieldValidator
                                ID="RequiredFieldValidator7" runat="server" ErrorMessage="Student Last Name Must required."
                                Text="*" ControlToValidate="txtStudentLastName"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        Student Gender:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlStudentGender" runat="server" Width="150px">
                            <asp:ListItem>M</asp:ListItem>
                            <asp:ListItem>F</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Student Gender Must required."
                            Text="*" ControlToValidate="ddlStudentGender"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        Email:
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox><asp:RegularExpressionValidator
                            ID="RegularExpressionValidator6" runat="server" ErrorMessage="Symbols not allowed."
                            ControlToValidate="txtEmail" ValidationExpression="[A-Za-z0-9@._]+$" Text="*"></asp:RegularExpressionValidator><asp:RequiredFieldValidator
                                ID="RequiredFieldValidator9" runat="server" ErrorMessage="Email Must required."
                                Text="*" ControlToValidate="txtEmail"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        Password:
                    </td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator
                            ID="RequiredFieldValidator10" runat="server" ErrorMessage="Password Must required."
                            Text="*" ControlToValidate="txtPassword"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" CausesValidation="False" />
                        <asp:Button ID="btnView" runat="server" Text="View" OnClick="btnView_Click" CausesValidation="False" />
                        <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" Text="Delete"
                            Visible="False" />
                        <cc1:ConfirmButtonExtender ID="btnDelete_ConfirmButtonExtender" runat="server" ConfirmText="Sure Want to Delete ?"
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
        <asp:Panel ID="pnlGrid" runat="server" Visible="true">
            Search by :
            <asp:TextBox ID="txtSearchStudentName" runat="server" ForeColor="Gray" CausesValidation="True"
                ReadOnly="True"></asp:TextBox>
            <cc1:TextBoxWatermarkExtender ID="txtSearchStudentName_TextBoxWatermarkExtender"
                runat="server" TargetControlID="txtSearchStudentName" WatermarkText="Student Name">
            </cc1:TextBoxWatermarkExtender>
            <br />
            <br />
            <asp:Button ID="btnSearch" runat="server" Text="Search" CausesValidation="False"
                OnClick="btnSearch_Click" />
            <asp:Button ID="btnViewAll" runat="server" Text="View All" CausesValidation="False"
                OnClick="btnViewAll_Click" />
            <asp:Button ID="btnBack" runat="server" Text="Back" CausesValidation="False" OnClick="btnBack_Click" />
            <asp:Button ID="btnPrint" runat="server" OnClick="btnPrint_Click" Text="Print" CausesValidation="False" />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                CellPadding="4" ForeColor="Black" GridLines="Vertical" OnRowCreated="GridView1_RowCreated">
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
