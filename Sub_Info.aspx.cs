using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Sub_Info : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\ExamDB.mdf;Integrated Security=True;User Instance=True");
    String qry;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserType"].ToString() == "Student" || Session["UserType"].ToString() == "HOD")
            {
                Response.Redirect("Welcome.aspx");
            }

        }
    }
    protected void AllClear()
    {
        txtSubjectID.Text="";
        txtSubjectName.Text = "";
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
            qry = "INSERT INTO Subject_Information(Subject_ID, Subject_Name) VALUES ('" + txtSubjectID.Text + "', '" + txtSubjectName.Text + "')";
            lblSave.Text = "Record saved";
        }
        else
        {
            qry = "UPDATE Subject_Information SET Subject_Name='" + txtSubjectName .Text + "' WHERE Subject_ID='" + txtSubjectID.Text + "'";
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
        qry = "SELECT  Subject_ID AS [Subject ID], Subject_Name AS [Subject Name] FROM Subject_Information WHERE Subject_Name LIKE '" + txtSearchSubjectName .Text + "%'";
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
        txtSearchSubjectName.Text = "";
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
        qry = "DELETE FROM Subject_Information WHERE Subject_ID='" + GridView1.SelectedRow.Cells[1].Text + "'";
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
        txtSubjectID.Text = GridView1.SelectedRow.Cells[1].Text;
        txtSubjectName.Text = GridView1.SelectedRow.Cells[2].Text;
        btnSubmit.Text = "Update";
        btnDelete.Visible = true;
    }
}