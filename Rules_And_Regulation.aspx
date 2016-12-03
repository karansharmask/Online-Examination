<%@ Page Title="" Language="C#" MasterPageFile="~/Inner.master" AutoEventWireup="true"
    CodeFile="Rules_And_Regulation.aspx.cs" Inherits="Rules_And_Regulation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <h2>Rules And Regulation</h2>
    </center>
    <br />
    <br />
    <table>
        <tr>
            <td>
                1.
            </td>
            <td>
                Each question contain 2 Marks.
            </td>
        </tr>
        <tr>
            <td>
                2.
            </td>
            <td>
                There is no negative marking system, if you click on wrong answer then it will consider
                zero marks.<br />
            </td>
        </tr>
        <tr>
            <td>
                3.
            </td>
            <td>
                If you select any one option and click on "Submit Answer" button then answer will
                be submited,
                and after that you can not change the answer so be careful when click on submit
                button,<br />
                So you can choose any one option before click on Submit Answer.<br />
            </td>
        </tr>
        <tr>
            <td>
                4.
            </td>
            <td>
                Whenever you click on start exam button your timer will be start. And it will display
                remaining minutes.
            </td>
        </tr>
        <tr>
            <td>
                5.
            </td>
            <td>
                Whenever your time of examination will finished automatically you are out from the exam form.
            </td>
        </tr>
        <tr>
            <td>
                6.
            </td>
            <td>
                During examination you can not close the system otherwise you have not permission to restart the system.
            </td>
        </tr>
        <tr>
            <td>
                7.
            </td>
            <td>
                There is Feedback form in the system so if you have any problem using this system then you can give feedback by using this form.
            </td>
        </tr>
        <tr>
            <td>
                8.
            </td>
            <td>
                Result declaration will be display on Announcments board of the system.
            </td>
        </tr>
    </table>
    <center><b>ALL THE BEST.</b><br />
        <asp:Button ID="btnStartExam" runat="server" Text="Start Exam" 
            onclick="btnStartExam_Click" />
    </center>
</asp:Content>
