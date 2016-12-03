<%@ Page Title="" Language="C#" MasterPageFile="~/Inner.master" AutoEventWireup="true"
    CodeFile="Faculty_Information.aspx.cs" Inherits="Faculty_Login_Info" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <h2>
            Faculty Information</h2>
        <br />
        <br />
        <asp:Panel ID="pnlForm" runat="server">
            <table>
                <tr>
                    <td>
                        Faculty First Name:
                    </td>
                    <td>
                        <asp:TextBox ID="txtFacultyFirstName" runat="server"></asp:TextBox><asp:RegularExpressionValidator
                            ID="RegularExpressionValidator2" runat="server" ErrorMessage="Numbers are not allow."
                            ControlToValidate="txtFacultyFirstName" ValidationExpression="[A-Za-z]+$" Text="*"></asp:RegularExpressionValidator><asp:RequiredFieldValidator
                                ID="RequiredFieldValidator2" runat="server" ErrorMessage="Faculty First Name Must required."
                                Text="*" ControlToValidate="txtFacultyFirstName"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        Faculty Surname:
                    </td>
                    <td>
                        <asp:TextBox ID="txtFacultySurname" runat="server"></asp:TextBox><asp:RegularExpressionValidator
                            ID="RegularExpressionValidator3" runat="server" ErrorMessage="Numbers are not allow."
                            ControlToValidate="txtFacultySurname" ValidationExpression="[A-Za-z]+$" Text="*"></asp:RegularExpressionValidator><asp:RequiredFieldValidator
                                ID="RequiredFieldValidator3" runat="server" ErrorMessage="Faculty Surname Must required."
                                Text="*" ControlToValidate="txtFacultySurname"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        Faculty Gender:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlFacultyGender" runat="server" Width="150px">
                            <asp:ListItem>M</asp:ListItem>
                            <asp:ListItem>F</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Faculty Gender Must required."
                            Text="*" ControlToValidate="ddlFacultyGender"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        HOD ID:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlHODID" runat="server" DataSourceID="SqlDataSource1" DataTextField="HOD_ID"
                            DataValueField="HOD_ID" Width="150px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            SelectCommand="SELECT * FROM [HOD_Information]"></asp:SqlDataSource>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="HOD ID Must required."
                            Text="*" ControlToValidate="ddlHODID"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        Email:
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Symbols not allowed."
                            ControlToValidate="txtEmail" ValidationExpression="[A-Za-z0-9@._]+$" Text="*"></asp:RegularExpressionValidator><asp:RequiredFieldValidator
                                ID="RequiredFieldValidator6" runat="server" ErrorMessage="Email Must required."
                                Text="*" ControlToValidate="txtEmail"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        Password:
                    </td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator
                            ID="RequiredFieldValidator7" runat="server" ErrorMessage="Password Must required."
                            Text="*" ControlToValidate="txtPassword"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        Subject Name:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlSubjectID" runat="server" DataSourceID="SqlDataSource2"
                            DataTextField="Subject_Name" DataValueField="Subject_ID" Width="150px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            SelectCommand="SELECT [Subject_ID], [Subject_Name] FROM [Subject_Information]">
                        </asp:SqlDataSource>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Subject ID Must required."
                            Text="*" ControlToValidate="ddlSubjectID"></asp:RequiredFieldValidator><br />
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
        <asp:Panel ID="pnlGrid" runat="server" Visible="False">
            Search by :
            <asp:TextBox ID="txtSearchFacultyName" runat="server" ForeColor="Gray"></asp:TextBox>
            <cc1:TextBoxWatermarkExtender ID="txtSearchFacultyName_TextBoxWatermarkExtender"
                runat="server" TargetControlID="txtSearchFacultyName" WatermarkText="Faculty Name">
            </cc1:TextBoxWatermarkExtender>
            <br />
            <br />
            <asp:Button ID="btnSearch" runat="server" Text="Search" CausesValidation="False"
                OnClick="btnSearch_Click" />
            <asp:Button ID="btnViewAll" runat="server" Text="View All" CausesValidation="False"
                OnClick="btnViewAll_Click" />
            <asp:Button ID="btnBack" runat="server" Text="Back" CausesValidation="False" OnClick="btnBack_Click" />
            <asp:Button ID="btnPrint" runat="server" CausesValidation="False" OnClick="btnPrint_Click"
                Text="Print" />
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
