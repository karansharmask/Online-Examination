<%@ Page Title="" Language="C#" MasterPageFile="~/Inner.master" AutoEventWireup="true"
    CodeFile="HOD_Information.aspx.cs" Inherits="HOD_Info" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <h2>
            HOD Information</h2>
        <br />
        <br />
        <asp:Panel ID="pnlForm" runat="server" Visible="False">
            <table>
                <tr>
                    <td>
                        HOD First Name:
                    </td>
                    <td>
                        <asp:TextBox ID="txtHODFirstName" runat="server"></asp:TextBox><asp:RegularExpressionValidator
                            ID="RegularExpressionValidator2" runat="server" ErrorMessage="Numbers are not allow."
                            ControlToValidate="txtHODFirstName" ValidationExpression="[A-Za-z]+$" Text="*"></asp:RegularExpressionValidator><asp:RequiredFieldValidator
                                ID="RequiredFieldValidator2" runat="server" ErrorMessage="HOD First Name Must required."
                                Text="*" ControlToValidate="txtHODFirstName"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        HOD Surname:
                    </td>
                    <td>
                        <asp:TextBox ID="txtHODSurname" runat="server"></asp:TextBox><asp:RegularExpressionValidator
                            ID="RegularExpressionValidator3" runat="server" ErrorMessage="Numbers are not allow."
                            ControlToValidate="txtHODSurname" ValidationExpression="[A-Za-z]+$" Text="*"></asp:RegularExpressionValidator><asp:RequiredFieldValidator
                                ID="RequiredFieldValidator3" runat="server" ErrorMessage="HOD Surname Must required."
                                Text="*" ControlToValidate="txtHODSurname"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        HOD Gender:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlHODGender" runat="server" Width="150px">
                            <asp:ListItem>M</asp:ListItem>
                            <asp:ListItem>F</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="HOD Gender Must required."
                            Text="*" ControlToValidate="ddlHODGender"></asp:RequiredFieldValidator><br />
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
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="DepartmentName Must required."
                            Text="*" ControlToValidate="ddlDepartmentCode"></asp:RequiredFieldValidator><br />
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
            <asp:TextBox ID="txtSearchHODName" runat="server" ForeColor="Gray"></asp:TextBox>
            <cc1:TextBoxWatermarkExtender ID="txtSearchHODName_TextBoxWatermarkExtender" runat="server"
                TargetControlID="txtSearchHODName" WatermarkText="HOD Name">
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
