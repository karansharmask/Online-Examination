using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;


public partial class HOD_Info : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\ExamDB.mdf;Integrated Security=True;User Instance=True");
    String qry;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserType"].ToString() == "Student" || Session["UserType"].ToString() == "Faculty")
            {
                Response.Redirect("Welcome.aspx");
            }
        }
    }
    protected void AllClear()
    {
        ddlHODGender.SelectedIndex = 0;
        ddlDepartmentCode.SelectedIndex = 0;
        txtEmail.Text = "";
        //txtHODID.Text = "";
        txtHODFirstName.Text = "";
        txtHODSurname.Text = "";
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
            qry = "INSERT INTO HOD_Information(HOD_First_Name, HOD_Surname, HOD_Gender,Department_Code, Email, Password) VALUES ('" + txtHODFirstName.Text + "', '" + txtHODSurname.Text + "','" + ddlHODGender.SelectedValue + "','" + ddlDepartmentCode.SelectedValue + "','" + txtEmail.Text + "','" + txtPassword.Text + "')";
            lblSave.Text = "Record saved";
        }
        else
        {
            qry = "UPDATE HOD_Information SET HOD_First_Name='" + txtHODFirstName.Text + "',HOD_Surname='" + txtHODSurname.Text + "',HOD_Gender='" + ddlHODGender.SelectedValue + "',Department_Code='" + ddlDepartmentCode.SelectedValue + "',Password='" + txtPassword.Text + "' WHERE Email='" + txtEmail.Text + "'";
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
        qry = "SELECT  HOD_ID AS [HOD ID],Department_Name AS [Department Name], HOD_First_Name AS [HOD First Name], HOD_Surname AS [HOD Surname], HOD_Gender AS [HOD Gender], Email AS [Email], Department_Code FROM viewHOD_Information WHERE HOD_First_Name LIKE '" + txtSearchHODName.Text + "%'";
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
        txtSearchHODName.Text = "";
        FillGrid();
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        pnlForm.Visible = true;
        pnlGrid.Visible = false;
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        qry = "DELETE FROM HOD_Information WHERE HOD_ID='" + GridView1.SelectedRow.Cells[1].Text + "'";
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
        txtHODFirstName.Text = GridView1.SelectedRow.Cells[3].Text;
        txtHODSurname.Text = GridView1.SelectedRow.Cells[4].Text;
        ddlHODGender.SelectedValue = GridView1.SelectedRow.Cells[5].Text;
        txtEmail.Text = GridView1.SelectedRow.Cells[6].Text;
        ddlDepartmentCode.SelectedValue = GridView1.SelectedRow.Cells[7].Text;
        btnSubmit.Text = "Update";
        btnDelete.Visible = true;
    }
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[7].Visible = false;
    }
    protected void btnPrint_Click(object sender, EventArgs e)
    {
        Session["Print"] = "SELECT * FROM viewHOD_Information WHERE HOD_First_Name LIKE '" + txtSearchHODName.Text + "%'";
        Response.Redirect("crtViewHODInformation.aspx");
    }
}