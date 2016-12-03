<%@ Page Title="" Language="C#" MasterPageFile="~/Login_Master.master" AutoEventWireup="true"
    CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="Online_Examination_content_wrapper">
        <div id="Online_Examination_sidebar">
            <div class="sidebar_box">
                <marquee>
            <h2>Announcements</h2></marquee>
                <div class="news_box">
                    <span>
                        Exam Date
                    </span>
                    <p class="post_info">
                        Posted by Admin on <span>Saptember 15, 2014</span></p>
                </div>
                <div class="news_box">
                    <span>
                        Exam Schedual
                    </span>
                    <p class="post_info">
                        Posted by Admin on <span>Saptember 22, 2014</span></p>
                </div>
                <div class="news_box">
                    <span>
                        Exam Result
                    </span>
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
                <img src="images/About.jpg" alt="image" />
                <br />
                <br />
                <p>
                    In this system, four different kinds of Users that we use, first is Admin, second is HOD, third is Faculty and the last fourth one is Student.<br /><br />
        
        Admin is nothing but the administator of this system. It will be only see all the reports and update the Department and Subject related information in this system.<br /><br />

		HOD defines the faculty to create an exam papers and take the information about the questions and set the time duration of exam. Decide the date of exam and inform to the faculties.<br /><br />
		
		After decide the date of exam now faculty contain some task for the examination like create an exam papers as per format. Then also provide the marks of each examination. Faculties also decide the section of questions in the paper and it will put same number of questions in each section in the examination. Faculty decides that when the results will declare. So these all are the main things that can be done by the HOD and Faculty in this system.<br /><br />
	
		Now the last main component is Student. First of all student need to read the rule and regulation of examination before the exam starts. After the rule and regulation students ready for the exam. If the exam will start then timer will automatically start on display. Student need to save the answer after select the answer, question by question. Student can also change the answer after select once. End of the examination student will logout from the this system and the result date will be display on the screen.<br /><br />
		
		On the result date at particular time result will be send to the student and the faculty at a same time via Email and the merit list also generate and the copy of merit list will be send to the faculty and HOD. So these all are the components and the things that are in this system.<br /><br />

        Thank You !

                </p>
                <div class="cleaner_h20">
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
