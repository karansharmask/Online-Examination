using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Register : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\ExamDB.mdf;Integrated Security=True;User Instance=True");
    String qry;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void AllClear()
    {
        ddlStudentDivision.SelectedIndex  = 0;
        txtEmail.Text = "";
        txtStudentFirstName.Text = "";
        ddlStudentGender.SelectedIndex  = 0;
        //txtStudentID.Text = "";
        txtStudentLastName.Text = "";
        txtStudentMiddleName.Text = "";
        txtPassword.Text = "";
        txtStudentEnrollNo.Text = "";
        
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        AllClear();
        lblSave.Text = "";
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        qry = "INSERT INTO Student_Information(Student_Enroll_No, Department_Code, Student_Division, Student_First_Name, Student_Middle_Name, Student_Last_Name, Student_Gender, Email, Password ) VALUES ('" + txtStudentEnrollNo.Text + "','" + ddlDepartmentCode.SelectedValue + "', '" + ddlStudentDivision.SelectedValue + "','" + txtStudentFirstName.Text + "','" + txtStudentMiddleName.Text + "','" + txtStudentLastName.Text + "','" + ddlStudentGender.SelectedValue  + "','" + txtEmail.Text + "','" + txtPassword.Text + "' )";
        conn.Open();
        SqlCommand cmd = new SqlCommand(qry, conn);
        SqlDataReader dr = cmd.ExecuteReader();

        conn.Close();
        AllClear();
        lblSave.Text = "Save Successfully.";
    }
}