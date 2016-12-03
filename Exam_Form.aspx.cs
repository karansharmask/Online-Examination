using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Exam_Form : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\ExamDB.mdf;Integrated Security=True;User Instance=True");
    String qry;
    int i;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Student_ID"].ToString() == "")
            {
                Response.Redirect("login.aspx");
            }
            lblDateTime.Text = DateTime.Now.ToString("dd-MMM-yyyy");

            qry = "SELECT * FROM Exam_Information";  //where condition is due for open exams
            conn.Open();

            SqlCommand cmd = new SqlCommand(qry, conn);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read() == true)
            {
                lblID.Text = dr.GetValue(0).ToString();
                lblExamTitle.Text = dr.GetValue(5).ToString();
                lblTime.Text = dr.GetValue(8).ToString();
                lblHiddenMarks.Text = dr.GetValue(10).ToString();
            }
            dr.Close();
            conn.Close();

           
            qry = "INSERT INTO Student_Exam_Attend_Detail (SEA_Date, Student_ID, Exam_ID, Total_Marks_Obtained) VALUES ('" + lblDateTime.Text + "','" + Session["Student_ID"].ToString() + "','" + lblID.Text + "','0')";
            conn.Open();

            cmd.CommandText = qry;
            cmd.ExecuteNonQuery();

            conn.Close();

            lblQueSRNo.Text = "1";
            GetNextQue(Convert.ToInt32(lblQueSRNo.Text) - 1);

            btnPrev.Visible = false;
        }
    }
    protected void GetNextQue(int i)
    {
        rbtnOp1.Checked = false;
        rbtnOp2.Checked = false;
        rbtnOp3.Checked = false;
        rbtnOp4.Checked = false;

        i++;
        lblQueSRNo.Text = i.ToString();
        qry = "SELECT * FROM Question_Set_Information WHERE Que_SR_No='" + i.ToString() + "'";
        conn.Open();

        SqlCommand cmd = new SqlCommand(qry, conn);
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.Read() == true)
        {
            lblQuestion.Text = dr.GetValue(3).ToString();
            rbtnOp1.Text = dr.GetValue(4).ToString();
            rbtnOp2.Text = dr.GetValue(5).ToString();
            rbtnOp3.Text = dr.GetValue(6).ToString();
            rbtnOp4.Text = dr.GetValue(7).ToString();
            lblHidden.Text = dr.GetValue(8).ToString();
            lblQuestion.Visible = true;
            rbtnOp1.Visible = true;
            rbtnOp2.Visible = true;
            rbtnOp3.Visible = true;
            rbtnOp4.Visible = true;
            lblA.Visible = true;
            lblB.Visible = true;
            lblC.Visible = true;
            lblD.Visible = true;
            btnNext.Visible = true;
            btnPrev.Visible = true;
            btnSubmit.Visible = true;
        }
        else
        {
            lblQuestion.Visible = false;
            rbtnOp1.Visible = false;
            rbtnOp2.Visible = false;
            rbtnOp3.Visible = false;
            rbtnOp4.Visible = false;
            lblA.Visible = false;
            lblB.Visible = false;
            lblC.Visible = false;
            lblD.Visible = false;
            btnNext.Visible = false;
            btnPrev.Visible = false;
            btnSubmit.Visible = false;
            lblQueSRNo.Text = "Exam Completed, All The Best For Result.";
        }
        dr.Close();
        conn.Close();
    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        lblAnsSubmitted.Text = "";
        i = Convert.ToInt32(lblQueSRNo.Text);
        GetNextQue(i);
        if (i > 0)
        {
            btnPrev.Visible = true;
        }
        else
        {
            btnPrev.Visible = false;
        }
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        int t = Convert.ToInt32(lblTime.Text);
        lblTime.Text = Convert.ToString(t - 1);
    }
    protected void btnPrev_Click(object sender, EventArgs e)
    {
        lblAnsSubmitted.Text = "";
        i = Convert.ToInt32(lblQueSRNo.Text);
        i = i - 1 - 1;
        GetNextQue(i);
        if (i > 0)
        {
            btnPrev.Visible = true;
        }
        else
        {
            btnPrev.Visible = false;
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int sea_id=0;
        qry = "SELECT MAX(SEA_ID) FROM Student_Exam_Attend_Detail";
        conn.Open();

        SqlCommand cmd = new SqlCommand(qry, conn);
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.Read())
        {
            sea_id = int.Parse(dr.GetValue(0).ToString());
        }
        dr.Close();
        conn.Close();

        string lastans = "A";
        if (rbtnOp2.Checked == true) lastans = "B";
        if (rbtnOp3.Checked == true) lastans = "C";
        if (rbtnOp4.Checked == true) lastans = "D";

        int lastmark = 0;
        if (lastans == lblHidden.Text) lastmark = Convert.ToInt32(lblHiddenMarks.Text);

        qry = "SELECT * FROM Answer_Sheets WHERE SEA_ID='" + sea_id + "' AND QSI_ID='" + int.Parse(lblQueSRNo.Text) + "'";
        conn.Open();
        cmd.CommandText = qry;
        SqlDataReader dr2 = cmd.ExecuteReader();
        if (dr2.Read())
        {
            lblAnsSubmitted.Text = "Answer Already submitted";
        }
        else
        {
            dr2.Close();
            qry = "INSERT INTO Answer_Sheets (SEA_ID, QSI_ID, Ans_Given, Que_Marks_Obtained) VALUES ('" + sea_id + "','" + int.Parse(lblQueSRNo.Text) + "','" + lastans + "','" + lastmark.ToString() + "')";

            cmd.CommandText = qry;
            cmd.ExecuteNonQuery();


            int totmarks = 0;
            qry = "SELECT SUM(Que_Marks_Obtained) FROM Answer_Sheets WHERE SEA_ID='" + sea_id + "'";
            cmd.CommandText = qry;
            SqlDataReader dr3 = cmd.ExecuteReader();
            if (dr3.Read())
            {
                totmarks = int.Parse(dr3.GetValue(0).ToString());
            }
            dr3.Close();

            qry = "UPDATE Student_Exam_Attend_Detail SET Total_Marks_Obtained='" + totmarks + "' WHERE SEA_ID='" + sea_id + "'";

            cmd.CommandText = qry;
            cmd.ExecuteNonQuery();

            lblAnsSubmitted.Text = "Answer Submitted";
        }
        conn.Close();
    }
}