<%@ Page Title="" Language="C#" MasterPageFile="~/Login_Master.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="Online_Examination_content_wrapper">
        <div id="Online_Examination_sidebar">
            <div class="sidebar_box">
                <marquee>
            <h2>Announcements</h2></marquee>
                <br />
                <br />
                <div class="news_box">
                    <span>Exam Date </span>
                    <p class="post_info">
                        Posted by Admin on <span>Saptember 15, 2014</span></p>
                </div>
                <div class="news_box">
                    <span>Exam Schedule </span>
                    <p class="post_info">
                        Posted by Admin on <span>Saptember 22, 2014</span></p>
                </div>
                <div class="news_box">
                    <span>Exam Result </span>
                    <p class="post_info">
                        Posted by Admin on <span>December 30, 2014</span></p>
                </div>
            </div>
            <div class="sidebar_box_bottom">
            </div>
        </div>
        <!-- end of sidebar -->
        <div id="Online_Examination_content">
            <div class="content_box">
                <h2>
                    Welcome to Online Examination</h2>
                <br />
                <br />
                <p>
                    Online Examination is the designed for educational institutes like schools, collages,
                    and private institutes to conduct logical tests for their students on a regular
                    basis. Online Examination is the best way of exam then the Current examination system.
                    Online Examination is very easy to take and no need to paper work on both side teacher
                    and student. Online Examination is the time saving method. So compare to current
                    system of examination, Online Examination is easier and more advanced technique.
                    Online Examination is secure system and easy to implement. It is reliable and accurate.
                </p>
                <div class="cleaner_h20">
                </div>
                <div class="image_fl">
                    <img src="images/Online_Examination_images01.jpg" alt="image" />
                </div>
                <div class="section_w250 float_r">
                    <ul class="list_01">
                        <li>In comparison to the present system the Online system will be less time consuming
                            and more efficient. </li>
                        <li>Analysis will be very easy in proposed system as it is automatic.</li>
                        <li>The Online system is very secure as no chances of leakage of question paper as it
                            is dependent on the administrator only.</li>
                        <li>The Result of the student can be sending via Email to the student and the teacher
                            automatically after the complete the exam.</li>
                        <li>The merit list or you can say rank list of student will be send to the teachers
                            and HOD through the Email in proposed system.</li>
                    </ul>
                </div>
                <div class="cleaner">
                </div>
            </div>
            <div class="content_box_bottom">
            </div>
        </div>
        <!-- end of content -->
        <div class="cleaner">
        </div>
    </div>
</asp:Content>
