<%@ Page Title="" Language="C#" MasterPageFile="~/Login_Master.master" AutoEventWireup="true"
    CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <h2>
            Student Registration</h2>
        <br />
        <br />
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
                        ID="RegularExpressionValidator3" runat="server" ErrorMessage="Symbols or Numbers are not allow."
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
                        ID="RegularExpressionValidator4" runat="server" ErrorMessage="Symbols or Numbers are not allow."
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
                        ID="RegularExpressionValidator5" runat="server" ErrorMessage="Symbols or Numbers are not allow."
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
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Symbols not allowed."
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
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                </td>
                <td>
                    <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" CausesValidation="False" />
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
    </center>
</asp:Content>
