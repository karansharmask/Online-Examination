<%@ Page Title="" Language="C#" MasterPageFile="~/Login_Master.master" AutoEventWireup="true"
    CodeFile="Login.aspx.cs" Inherits="Login" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="Online_Examination_content_wrapper">
        <div id="Online_Examination_sidebar">
            <table>
                <tr>
                    <td>
                        <img src="images/Login.jpg" alt="image" />
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    EmailID:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Symbols not allowed."
                                        ControlToValidate="txtEmail" ValidationExpression="[A-Za-z0-9@._]+$" Text="*"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username must be entered."
                                        Text="*" ControlToValidate="txtEmail"></asp:RequiredFieldValidator><br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Password:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password must be entered."
                                        Text="*" ControlToValidate="txtPassword"></asp:RequiredFieldValidator><br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    UserType:
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlUserType" runat="server" Width="150px">
                                        <asp:ListItem>Admin</asp:ListItem>
                                        <asp:ListItem>HOD</asp:ListItem>
                                        <asp:ListItem>Faculty</asp:ListItem>
                                        <asp:ListItem>Student</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
                                </td>
                                <td>
                                    <a href="Forget_Password.aspx">Forget Password </a>?
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <!-- end of content -->
        <div class="cleaner">
        </div>
    </div>
</asp:Content>
