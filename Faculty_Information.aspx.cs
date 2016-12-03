using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Faculty_Login_Info : System.Web.UI.Page
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
        //txtFacultyID.Text = "";
        txtFacultyFirstName.Text = "";
        txtFacultySurname.Text = "";
        ddlHODID.SelectedIndex = 0;
        ddlFacultyGender.SelectedIndex = 0;
        ddlSubjectID.SelectedIndex = 0;
        txtEmail.Text = "";
        txtPassword.Text = "";
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
            qry = "INSERT INTO Faculty_Information(Faculty_First_Name, Faculty_Surname, Faculty_Gender, HOD_ID, Email, Password, Subject_ID ) VALUES ('" + txtFacultyFirstName.Text + "', '" + txtFacultySurname.Text + "','" + ddlFacultyGender.SelectedValue + "','" + ddlHODID.SelectedValue + "','" + txtEmail.Text + "','" + txtPassword.Text + "','" + ddlSubjectID.SelectedValue + "' )";
            lblSave.Text = "Record saved";
        }
        else
        {
            qry = "UPDATE Faculty_Information SET Faculty_Surname='" + txtFacultySurname.Text + "',Faculty_Gender='" + ddlFacultyGender.SelectedValue + "',HOD_ID='" + ddlHODID.SelectedValue + "',Email='" + txtEmail.Text + "',Password='" + txtPassword.Text + "',Subject_ID='" + ddlSubjectID.SelectedValue + "' WHERE Faculty_First_Name='" + txtFacultyFirstName.Text + "'";
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
        qry = "SELECT Faculty_ID AS [Faculty ID], Faculty_First_Name AS [Faculty First Name], Faculty_Surname AS [Faculty Surname], Faculty_Gender AS [Faculty Gender], Email AS [Email], Subject_Name AS [Subject Name], HOD_First_Name AS [HOD First Name], HOD_Surname AS [HOD Surname],HOD_ID AS [HOD ID], Subject_ID FROM viewFaculty_Information WHERE Faculty_First_Name LIKE '" + txtSearchFacultyName.Text + "%'";
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
        txtSearchFacultyName.Text = "";
        FillGrid();
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        pnlForm.Visible = true;
        pnlGrid.Visible = false;
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        qry = "DELETE FROM Faculty_Information WHERE Faculty_ID='" + GridView1.SelectedRow.Cells[1].Text + "'";
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
        //txtFacultyID.Text = GridView1.SelectedRow.Cells[1].Text;
        txtFacultyFirstName.Text = GridView1.SelectedRow.Cells[2].Text;
        txtFacultySurname.Text = GridView1.SelectedRow.Cells[3].Text;
        ddlFacultyGender.SelectedValue  = GridView1.SelectedRow.Cells[4].Text;
        txtEmail.Text = GridView1.SelectedRow.Cells[5].Text;
        ddlHODID.SelectedValue = GridView1.SelectedRow.Cells[9].Text;
        ddlSubjectID.SelectedValue = GridView1.SelectedRow.Cells[10].Text;
        btnSubmit.Text = "Update";
        btnDelete.Visible = true  ;
    }
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[9].Visible = false;
        e.Row.Cells[10].Visible = false;
    }
    protected void btnPrint_Click(object sender, EventArgs e)
    {
        Session["print"] = "SELECT * FROM viewFaculty_Information WHERE Faculty_ID LIKE '" + txtSearchFacultyName.Text + "%'";
        Response.Redirect("crtViewFacultyInformation.aspx");
    }
}