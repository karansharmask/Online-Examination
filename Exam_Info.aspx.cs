using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Exam_Info : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\ExamDB.mdf;Integrated Security=True;User Instance=True");
    String qry;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserType"].ToString() == "Student")
            {
                Response.Redirect("Welcome.aspx");
            }
        }
    }
    protected void AllClear()
    {
        //txtExamID.Text = "";
        txtExamDate.Text = "";
        txtExamTime.Text = "";
        txtExamTitle.Text = "";
        txtNoOfQuestion.Text = "";
        txtTimeDuration.Text = "";
        txtMarksPerQuestion.Text = "";
        txtTotalMarks.Text = "";
        ddlDepartmentCode.SelectedIndex = 0;
        ddlFacultyID.SelectedIndex = 0;
        ddlHODID.SelectedIndex = 0;
        ddlSubjectID.SelectedIndex = 0;
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
            qry = "INSERT INTO Exam_Information(Department_Code, HOD_ID, Faculty_ID, Subject_ID, Exam_Title, Exam_Date, Exam_Time, Time_Duration, No_Of_Que, Marks_Per_Question, Total_Marks ) VALUES ('" + ddlDepartmentCode.SelectedValue + "','" + ddlHODID.SelectedValue + "','" + ddlFacultyID.SelectedValue + "','" + ddlSubjectID.SelectedValue + "', '" + txtExamTitle.Text + "' , '" + txtExamDate.Text + "' , '" + txtExamTime.Text + "' , '" + txtTimeDuration.Text + "', '" + txtNoOfQuestion.Text + "','" + txtMarksPerQuestion.Text + "', '" + txtTotalMarks.Text + "' )";
            lblSave.Text = "Record saved";
        }
        else
        {
            qry = "UPDATE Exam_Information SET Department_Code='" + ddlDepartmentCode.SelectedValue + "',HOD_ID='" + ddlHODID.SelectedValue + "',Faculty_ID='" + ddlFacultyID.SelectedValue + "',Subject_ID='" + ddlSubjectID.SelectedValue + "',Exam_Title='" + txtExamTitle.Text + "',Exam_Date='" + txtExamDate.Text + "',Exam_Time='" + txtExamTime.Text + "',Time_Duration='" + txtTimeDuration.Text + "',No_Of_Que='" + txtNoOfQuestion.Text + "',Marks_Per_Question='" + txtMarksPerQuestion.Text + "',Total_Marks='" + txtTotalMarks.Text + "' WHERE Exam_Title='" + txtExamTitle.Text + "'";
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
        qry = "SELECT  Exam_ID AS [Exam ID], Department_Name AS [Department Name], HOD_First_Name AS [HOD First Name], HOD_Surname AS [HOD Surname], Faculty_First_Name AS [Faculty First Name], Faculty_Surname AS [Faculty Surname], Subject_Name AS [Subject Name], Exam_Title As [Exam Title], Exam_Date AS [Exam Date], Exam_Time AS [Exam Time], Time_Duration AS [Time Duration], No_Of_Que AS [No Of Que],Marks_Per_Question AS [Marks Per Question], Total_Marks AS [Total Marks], Department_Code[Department Code], HOD_ID, Faculty_ID, Subject_ID FROM viewExam_Information WHERE Exam_Title LIKE '" + txtSearchExamTitle.Text + "%'";
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
        qry = "DELETE FROM Exam_Information WHERE Exam_ID='" + GridView1.SelectedRow.Cells[1].Text + "'";
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
        //txtExamID.Text = GridView1.SelectedRow.Cells[1].Text;
        txtExamTitle.Text = GridView1.SelectedRow.Cells[8].Text;
        txtExamDate.Text = GridView1.SelectedRow.Cells[9].Text;
        txtExamTime.Text = GridView1.SelectedRow.Cells[10].Text;
        txtTimeDuration.Text = GridView1.SelectedRow.Cells[11].Text;
        txtNoOfQuestion.Text = GridView1.SelectedRow.Cells[12].Text;
        txtMarksPerQuestion.Text = GridView1.SelectedRow.Cells[13].Text;
        txtTotalMarks.Text = GridView1.SelectedRow.Cells[14].Text;
        ddlDepartmentCode.SelectedValue = GridView1.SelectedRow.Cells[15].Text;
        ddlHODID.SelectedValue = GridView1.SelectedRow.Cells[16].Text;
        ddlFacultyID.SelectedValue = GridView1.SelectedRow.Cells[17].Text;
        ddlSubjectID.SelectedValue = GridView1.SelectedRow.Cells[18].Text;
        btnSubmit.Text = "Update";
        btnDelete.Visible = true;
    }
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[3].Visible = true;
        e.Row.Cells[15].Visible = false;
        e.Row.Cells[16].Visible = false;
        e.Row.Cells[17].Visible = false;
        e.Row.Cells[18].Visible = false;
    }
    protected void btnPrint_Click(object sender, EventArgs e)
    {
        Session["print"] = "SELECT * FROM viewExam_Information WHERE Faculty_First_Name LIKE '" + txtSearchExamTitle.Text + "%'";
        Response.Redirect("crtViewExamInformation.aspx");
    }
}