using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;


public partial class Admin_Information : System.Web.UI.Page
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
        txtAdminName .Text="";
        txtAdminSurname .Text="";
        txtEmail .Text="";
        txtPassword.Text = "";
        ddlAdminGender .SelectedIndex =0;
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
            qry = "INSERT INTO Admin_Information(Admin_Name, Admin_Surname, Admin_Gender, Email, Password) VALUES ('" + txtAdminName.Text + "', '" + txtAdminSurname.Text + "','" + ddlAdminGender.SelectedValue + "','" + txtEmail.Text + "','" + txtPassword.Text + "')";
            lblSave.Text = "Record saved";
        }
        else
        {
            qry = "UPDATE Admin_Information SET Admin_Name='" + txtAdminName.Text + "',Admin_Surname='" + txtAdminSurname.Text + "',Admin_Gender='" + ddlAdminGender.SelectedValue + "',Password='" + txtPassword.Text + "' WHERE Email='" + txtEmail.Text + "'";
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
        qry = "SELECT  Admin_ID AS [Admin ID],Admin_Name AS [Admin Name], Admin_Surname AS [Admin Surname], Admin_Gender AS [Admin Gender], Email AS [Email] FROM Admin_Information WHERE Admin_Name LIKE '" + txtSearchAdminName.Text + "%'";
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
        txtSearchAdminName.Text = "";
        FillGrid();
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        pnlForm.Visible = true;
        pnlGrid.Visible = false;
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        qry = "DELETE FROM Admin_Information WHERE Admin_ID='" + GridView1.SelectedRow.Cells[1].Text + "'";
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
        txtAdminName.Text = GridView1.SelectedRow.Cells[2].Text;
        txtAdminSurname.Text = GridView1.SelectedRow.Cells[3].Text;
        ddlAdminGender.SelectedValue = GridView1.SelectedRow.Cells[4].Text;
        txtEmail.Text = GridView1.SelectedRow.Cells[5].Text;
        //txtPassword.Text = GridView1.SelectedRow.Cells[6].Text;
        btnSubmit.Text = "Update";
        btnDelete.Visible = true;
    }
}