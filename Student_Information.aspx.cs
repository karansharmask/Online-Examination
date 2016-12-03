using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Stud_Info : System.Web.UI.Page
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
            else
            {
                txtSearchStudentName.Visible = false;
            }
        }
        if (!IsPostBack)
        {
            txtSearchStudentName.Text = Session["Username"].ToString();
        }
    }
    protected void AllClear()
    {
        ddlStudentDivision.SelectedIndex  = 0;
        txtStudentFirstName.Text = "";
        ddlStudentGender.SelectedIndex = 0;
        //txtStudentID.Text = "";
        txtStudentLastName.Text = "";
        txtStudentMiddleName.Text = "";
        txtStudentEnrollNo.Text = "";
        ddlDepartmentCode.SelectedIndex = 0;
        txtPassword.Text = "";
        txtEmail.Text = "";
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
            qry = "INSERT INTO Student_Information(Student_Enroll_No, Department_Code, Student_Division, Student_First_Name, Student_Middle_Name, Student_Last_Name, Student_Gender, Email, Password ) VALUES ('" + txtStudentEnrollNo.Text + "','" + ddlDepartmentCode.SelectedValue + "', '" + ddlStudentDivision.SelectedValue + "','" + txtStudentFirstName.Text + "','" + txtStudentMiddleName.Text + "','" + txtStudentLastName.Text + "','" + ddlStudentGender .SelectedValue  + "','" + txtEmail.Text + "','" + txtPassword.Text + "' )";
            lblSave.Text = "Record saved";
        }
        else
        {
            qry = "UPDATE Student_Information SET Department_Code='" + ddlDepartmentCode.SelectedValue + "',Student_Division='" + ddlStudentDivision.SelectedValue + "',Student_First_Name='" + txtStudentFirstName.Text + "',Student_Middle_Name='" + txtStudentMiddleName.Text + "',Student_Last_Name='" + txtStudentLastName.Text + "',Student_Gender='" + ddlStudentGender.SelectedValue + "',Email='" + txtEmail.Text + "',Password='" + txtPassword.Text + "' WHERE Student_Enroll_No='" + txtStudentEnrollNo.Text + "'";
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
        if (Session["UserType"].ToString() != "Student")
        {
            qry = "SELECT  Student_ID AS [Student ID], Student_Enroll_No AS [Student Enroll No], Department_Name AS [Department Name], Student_Division AS [Student Division], Student_First_Name AS [Student First Name], Student_Middle_Name AS [Student Middle Name], Student_Last_Name AS [Student Last Name], Student_Gender AS [Student Gender], Email AS [Email], Department_Code FROM viewStudent_Information WHERE Student_First_Name LIKE '" + txtSearchStudentName.Text + "%'";
        }
        else
        {
            qry = "SELECT  Student_ID AS [Student ID], Student_Enroll_No AS [Student Enroll No], Department_Name AS [Department Name], Student_Division AS [Student Division], Student_First_Name AS [Student First Name], Student_Middle_Name AS [Student Middle Name], Student_Last_Name AS [Student Last Name], Student_Gender AS [Student Gender], Email AS [Email], Department_Code FROM viewStudent_Information WHERE Student_First_Name + ' ' + Student_Last_Name LIKE '" + Session["Username"].ToString() + "%'";
        }
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
        if (Session["UserType"] == "Student")
        {
            btnViewAll.Visible = false;
        }
        else
        {
            btnViewAll.Visible = true;
            txtSearchStudentName.Text = "";
            FillGrid();
        }
        
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        pnlForm.Visible = false;
        pnlGrid.Visible = false;
        Response.Redirect("Welcome.aspx");
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        qry = "DELETE FROM Student_Information WHERE Student_ID='" + GridView1.SelectedRow.Cells[1].Text + "'";
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
        //txtStudentID.Text = GridView1.SelectedRow.Cells[1].Text;
        txtStudentEnrollNo.Text = GridView1.SelectedRow.Cells[2].Text;
        //ddlDepartmentCode.SelectedValue = GridView1.SelectedRow.Cells[3].Text;
        ddlStudentDivision.SelectedValue = GridView1.SelectedRow.Cells[4].Text;
        txtStudentFirstName.Text = GridView1.SelectedRow.Cells[5].Text;
        txtStudentMiddleName.Text = GridView1.SelectedRow.Cells[6].Text;
        txtStudentLastName.Text = GridView1.SelectedRow.Cells[7].Text;
        ddlStudentGender .SelectedValue  = GridView1.SelectedRow.Cells[8].Text;
        txtEmail.Text = GridView1.SelectedRow.Cells[9].Text;
        ddlDepartmentCode.SelectedValue = GridView1.SelectedRow.Cells[10].Text;
        btnSubmit.Text = "Update";
        btnDelete.Visible = true;
    }
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[10].Visible = false;
    }
    protected void btnPrint_Click(object sender, EventArgs e)
    {
        Session["Print"] = "SELECT * FROM viewStudent_Information WHERE Student_First_Name LIKE '" + txtSearchStudentName.Text + "%'";
        Response.Redirect("crtViewStudentInformation.aspx");
    }
}