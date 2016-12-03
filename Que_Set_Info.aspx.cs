using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Que_Set_Info : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\ExamDB.mdf;Integrated Security=True;User Instance=True");
    String qry;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserType"].ToString() != "Faculty")
            {
                Response.Redirect("Welcome.aspx");
            }
        }
    }
    protected void AllClear()
    {
        txtAnsA.Text = "";
        txtAnsB.Text = "";
        txtAnsC.Text = "";
        txtAnsD.Text = "";
        ddlExamID.SelectedIndex  = 0;
        txtQSIID.Text = "";
        txtQuestion.Text = "";
        txtQuestionSRNo.Text = "";
        ddlTrueAnswer.SelectedIndex  = 0;
        btnSubmit.Text = "Submit";
        btnDelete.Visible = false;
        
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        AllClear();
        lblSave.Text = "";
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (btnSubmit.Text == "Submit")
        {
            qry = "INSERT INTO Question_Set_Information(QSI_ID, Exam_ID, Que_SR_No, Question, Ans_A, Ans_B, Ans_C, Ans_D, True_Ans) VALUES ('"+ txtQSIID.Text +"','" + ddlExamID.SelectedValue + "', '" + txtQuestionSRNo.Text + "','" + txtQuestion.Text + "','" + txtAnsA.Text + "','" + txtAnsB.Text + "','" + txtAnsC.Text + "','" + txtAnsD.Text + "','" + ddlTrueAnswer.SelectedValue  + "')";
            lblSave.Text = "Record saved";
        }
        else
        {
            qry = "UPDATE Question_Set_Information SET QSI_ID='"+ txtQSIID.Text +"',Exam_ID='" + ddlExamID.SelectedValue + "',Question='" + txtQuestion.Text + "',Ans_A='" + txtAnsA.Text + "',Ans_B='" + txtAnsB.Text + "',Ans_C='" + txtAnsC.Text + "',Ans_D='" + txtAnsD.Text + "',True_Ans='" + ddlTrueAnswer.SelectedValue + "' WHERE Que_SR_No='" + txtQuestionSRNo.Text + "'";
            lblSave.Text = "Record updated";
        }
        conn.Open();
        SqlCommand cmd = new SqlCommand(qry, conn);
        cmd.ExecuteNonQuery();
        conn.Close();
        AllClear();
    }
    protected void FillGrid()
    {
        qry = "SELECT  QSI_ID AS [QSI ID], Exam_Title AS [Exam Title],Exam_Date AS [Exam Date], Que_SR_No AS [Que SR No], Question AS [Question], Ans_A AS [Ans A], Ans_B AS [Ans B], Ans_C AS [Ans C], Ans_D AS [Ans D], True_Ans AS [True Ans] FROM viewQuestion_Set_Information WHERE Exam_Title LIKE '" + txtSearchExamTitle.Text + "%'";
        conn.Open();
        SqlCommand cmd = new SqlCommand(qry, conn);
        SqlDataReader dr = cmd.ExecuteReader();

        GridView1.DataSource = dr;
        GridView1.DataBind();

        dr.Close();
        conn.Close();
    }
    protected void btnView_Click(object sender, EventArgs e)
    {
        pnlForm.Visible = false;
        pnlGrid.Visible = true;
        FillGrid();
        lblSave.Text = "";
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        FillGrid();
    }
    protected void btnViewAll_Click(object sender, EventArgs e)
    {
        txtSearchExamTitle.Text = "";
        FillGrid();
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        pnlForm.Visible = true;
        pnlGrid.Visible = false;
        btnDelete.Visible = false;

    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        qry = "DELETE FROM Question_Set_Information WHERE QSI_ID='" + GridView1.SelectedRow.Cells[1].Text + "'";
        conn.Open();
        SqlCommand cmd = new SqlCommand(qry, conn);
        cmd.ExecuteNonQuery();
        conn.Close();
        AllClear();
        lblSave.Text = "Record deleted";
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        pnlForm.Visible = true;
        pnlGrid.Visible = false;
        txtQSIID.Text = GridView1.SelectedRow.Cells[1].Text;
        //ddlExamID.Text = GridView1.SelectedRow.Cells[2].Text;
        txtQuestionSRNo.Text = GridView1.SelectedRow.Cells[4].Text;
        txtQuestion.Text = GridView1.SelectedRow.Cells[5].Text;
        txtAnsA.Text = GridView1.SelectedRow.Cells[6].Text;
        txtAnsB.Text = GridView1.SelectedRow.Cells[7].Text;
        txtAnsC.Text = GridView1.SelectedRow.Cells[8].Text;
        txtAnsD.Text = GridView1.SelectedRow.Cells[9].Text;
        ddlTrueAnswer.SelectedValue = GridView1.SelectedRow.Cells[10].Text;
        btnSubmit.Text = "Update";
        btnDelete.Visible = true;
    }
}