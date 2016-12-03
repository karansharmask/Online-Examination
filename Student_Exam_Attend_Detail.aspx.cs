using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Student_Exam_Attend_Detail : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\ExamDB.mdf;Integrated Security=True;User Instance=True");
    String qry;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserType"].ToString() != "Admin")
            {
                Response.Redirect("Welcome.aspx");
            }
        }
    }
    protected void AllClear()
    {
        txtSEADATE.Text = "";
        txtSEAID.Text = "";
        txtTotalMarksObtained.Text = "";
        ddlExamID.SelectedIndex = 0;
        ddlStudentID.SelectedIndex = 0;
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
            qry = "INSERT INTO Student_Exam_Attend_Detail(SEA_ID, SEA_Date, Student_ID, Exam_ID, Total_Marks_Obtained) VALUES ('" + txtSEAID .Text + "','" + txtSEADATE .Text + "','" + ddlStudentID .SelectedValue  + "','" + ddlExamID.SelectedValue   + "','" + txtTotalMarksObtained.Text + "')";
            lblSave.Text = "Record saved";
        }
        else
        {
            qry = "UPDATE Student_Exam_Attend_Detail SET SEA_Date='" + txtSEADATE .Text  + "' , Student_ID='" + ddlStudentID.SelectedValue  + "',Exam_ID='" + ddlExamID.SelectedValue   + "',Total_Marks_Obtained='" + txtTotalMarksObtained.Text + "' WHERE SEA_ID='" + txtSEAID.Text + "'";
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
        qry = "SELECT  SEA_ID AS [SEA ID], SEA_Date AS [SEA Date], Student_First_Name AS [Student First Name],Student_Middle_Name AS [Student Middle Name],Student_Last_Name AS [Student Last Name], Exam_Title AS [Exam Title], Exam_Date[Exam Date], Total_Marks_Obtained AS [Total Marks Obtained], Student_ID, Exam_ID FROM viewStudent_Exam_Attend_Detail WHERE Student_First_Name LIKE '" + txtSearchStudentFirstName.Text + "%'";
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
        txtSearchStudentFirstName.Text = "";
        FillGrid();
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        pnlForm.Visible = true;
        pnlGrid.Visible = false;
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        qry = "DELETE FROM Student_Exam_Attend_Detail WHERE SEA_ID='" + GridView1.SelectedRow.Cells[1].Text + "'";
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
        txtSEAID.Text = GridView1.SelectedRow.Cells[1].Text;
        txtSEADATE.Text = GridView1.SelectedRow.Cells[2].Text;
        txtTotalMarksObtained.Text = GridView1.SelectedRow.Cells[8].Text;
        ddlStudentID.SelectedValue = GridView1.SelectedRow.Cells[9].Text;
        ddlExamID.SelectedValue = GridView1.SelectedRow.Cells[10].Text;      
        btnSubmit.Text = "Update";
        btnDelete.Visible = true;
    }
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[9].Visible = false;
        e.Row.Cells[10].Visible = false;
    }
}