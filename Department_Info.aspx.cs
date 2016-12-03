using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;


public partial class Department_Info : System.Web.UI.Page
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
        txtDepartmentCode.Text = "";
        txtDepartmentName.Text = "";
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
            qry = "INSERT INTO Department_Information(Department_Code,Department_Name) values('" + txtDepartmentCode .Text + "','" + txtDepartmentName .Text + "')";
            lblSave.Text = "Record saved";
        }
        else
        {
            qry = "UPDATE Department_Information SET Department_Name='" + txtDepartmentName.Text + "' WHERE Department_Code='" + txtDepartmentCode.Text + "'";
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
        qry = "SELECT  Department_Code AS [Department Code], Department_Name AS [Department Name] FROM Department_Information WHERE Department_Name LIKE '" + txtSearchDepartmentName.Text + "%'";
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
        txtSearchDepartmentName.Text = "";
        FillGrid();
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        pnlForm.Visible = true;
        pnlGrid.Visible = false;
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        qry = "DELETE FROM Department_Information WHERE Department_Code='" + GridView1.SelectedRow.Cells[1].Text + "'";
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
        txtDepartmentCode.Text = GridView1.SelectedRow.Cells[1].Text;
        txtDepartmentName.Text = GridView1.SelectedRow.Cells[2].Text;
        btnSubmit.Text = "Update";
        btnDelete.Visible = true;

    }

}