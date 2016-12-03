<%@ Page Title="" Language="C#" MasterPageFile="~/Inner.master" AutoEventWireup="true"
    CodeFile="Answer_Sheets.aspx.cs" Inherits="Answer_Sheets" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <h2>
            Answer Sheets</h2>
        <br />
        <br />
        <asp:Panel ID="pnlForm" runat="server">
            <table>
                <tr>
                    <td>
                        Answer ID:
                    </td>
                    <td>
                        <asp:TextBox ID="txtAnswerID" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1" runat="server" ErrorMessage="Answer ID Must required."
                            Text="*" ControlToValidate="txtAnswerID"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        SEA ID:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlSEAID" runat="server" DataSourceID="SqlDataSource2" 
                            DataTextField="SEA_ID" DataValueField="SEA_ID">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT [SEA_ID] FROM [Student_Exam_Attend_Detail]">
                        </asp:SqlDataSource>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="SEA ID Must required."
                            Text="*" ControlToValidate="ddlSEAID"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        QSI ID:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlQSIID" runat="server" DataSourceID="SqlDataSource1" 
                            DataTextField="QSI_ID" DataValueField="QSI_ID">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT [QSI_ID] FROM [Question_Set_Information]">
                        </asp:SqlDataSource>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="QSI ID Must required."
                            Text="*" ControlToValidate="ddlQSIID"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        Answer Given:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlAnswerGiven" runat="server">
                            <asp:ListItem>A</asp:ListItem>
                            <asp:ListItem>B</asp:ListItem>
                            <asp:ListItem>C</asp:ListItem>
                            <asp:ListItem>D</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator4" runat="server" ErrorMessage="Answer Given Must required."
                            Text="*" ControlToValidate="ddlAnswerGiven"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td>
                        Que Marks Obtained:
                    </td>
                    <td>
                        <asp:TextBox ID="txtQueMarksObtained" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                            ID="RequiredFieldValidator5" runat="server" ErrorMessage="Question Marks Obtained Must required."
                            Text="*" ControlToValidate="txtQueMarksObtained"></asp:RequiredFieldValidator><br />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" CausesValidation="False" />
                        <asp:Button ID="btnView" runat="server" Text="View" OnClick="btnView_Click" CausesValidation="False" />
                        <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" 
                            Text="Delete" Visible="False" />
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
            <asp:TextBox ID="txtSearchAnswerID" runat="server" ForeColor="Gray"></asp:TextBox>
            <cc1:TextBoxWatermarkExtender ID="txtSearchAnswerID_TextBoxWatermarkExtender" 
                runat="server" TargetControlID="txtSearchAnswerID" WatermarkText="Answer ID">
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
