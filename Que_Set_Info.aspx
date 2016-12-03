<%@ Page Title="" Language="C#" MasterPageFile="~/Inner.master" AutoEventWireup="true"
    CodeFile="Que_Set_Info.aspx.cs" Inherits="Que_Set_Info" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <h2>
            Question Set Information</h2>
        <br />
        <br />
        <asp:Panel ID="pnlForm" runat="server">
            <table>
                <tr>
                    <td>
                        QSI ID:
                    </td>
                    <td>
                        <asp:TextBox ID="txtQSIID" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1" runat="server" ErrorMessage="QSI ID Must required."
                            Text="*" ControlToValidate="txtQSIID"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        Exam Title:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlExamID" runat="server" DataSourceID="SqlDataSource1" DataTextField="Exam_Title"
                            DataValueField="Exam_ID" Width="150px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            SelectCommand="SELECT [Exam_ID], [Exam_Title] FROM [Exam_Information]"></asp:SqlDataSource>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Exam ID Must required."
                            Text="*" ControlToValidate="ddlExamID"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        Question SR No:
                    </td>
                    <td>
                        <asp:TextBox ID="txtQuestionSRNo" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                            ID="RequiredFieldValidator3" runat="server" ErrorMessage="Question SR No. Must required."
                            Text="*" ControlToValidate="txtQuestionSRNo"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        Question:
                    </td>
                    <td>
                        <asp:TextBox ID="txtQuestion" runat="server" TextMode="MultiLine"></asp:TextBox><asp:RequiredFieldValidator
                            ID="RequiredFieldValidator4" runat="server" ErrorMessage="Question Must required."
                            Text="*" ControlToValidate="txtQuestion"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        Ans-A:
                    </td>
                    <td>
                        <asp:TextBox ID="txtAnsA" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                            ID="RequiredFieldValidator5" runat="server" ErrorMessage="Ans-A Must required."
                            Text="*" ControlToValidate="txtAnsA"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        Ans-B:
                    </td>
                    <td>
                        <asp:TextBox ID="txtAnsB" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                            ID="RequiredFieldValidator6" runat="server" ErrorMessage="Ans-B Must required."
                            Text="*" ControlToValidate="txtAnsB"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        Ans-C:
                    </td>
                    <td>
                        <asp:TextBox ID="txtAnsC" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                            ID="RequiredFieldValidator7" runat="server" ErrorMessage="Ans-C Must required."
                            Text="*" ControlToValidate="txtAnsC"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        Ans-D:
                    </td>
                    <td>
                        <asp:TextBox ID="txtAnsD" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                            ID="RequiredFieldValidator8" runat="server" ErrorMessage="Ans-D Must required."
                            Text="*" ControlToValidate="txtAnsD"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        True Answer:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlTrueAnswer" runat="server" Width="150px">
                            <asp:ListItem>A</asp:ListItem>
                            <asp:ListItem>B</asp:ListItem>
                            <asp:ListItem>C</asp:ListItem>
                            <asp:ListItem>D</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="True Answer must be required."
                            Text="*" ControlToValidate="ddlTrueAnswer"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" CausesValidation="False"
                            Width="50px" />
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
            <asp:TextBox ID="txtSearchExamTitle" runat="server" ForeColor="Gray"></asp:TextBox>
            <cc1:TextBoxWatermarkExtender ID="txtSearchExamTitle_TextBoxWatermarkExtender" runat="server"
                TargetControlID="txtSearchExamTitle" WatermarkText="Exam Title">
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
            <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px"
                CellPadding="4" ForeColor="Black" GridLines="Vertical">
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
