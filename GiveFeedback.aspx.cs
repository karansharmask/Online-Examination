using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class GiveFeedback : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\ExamDB.mdf;Integrated Security=True;User Instance=True");
    String qry;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserType"].ToString() != "Student")
            {
                Response.Redirect("Welcome.aspx");
            }
        }
    }
    protected void AllClear()
    {
        txtFeedbackDate.Text = "";
        txtFeedbackID.Text = "";
        txtFeedbackText.Text = "";
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
            qry = "INSERT INTO Give_Feedback(Feedback_ID,Feedback_Date,Student_ID,Feedback_Text) values('" + txtFeedbackID.Text + "','" + txtFeedbackDate.Text + "','" + ddlStudentID.SelectedValue + "','" + txtFeedbackText.Text + "')";
            lblSave.Text = "Record saved";
        }
        else
        {
            qry = "UPDATE Give_Feedback SET Feedback_Date='" + txtFeedbackDate.Text + "', Student_ID='" + ddlStudentID.SelectedValue + "',Feedback_Text='" + txtFeedbackText .Text + "' WHERE Feedback_ID='" + txtFeedbackID.Text + "'";
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
        qry = "SELECT  Feedback_ID AS [Feedback ID], Feedback_Date AS [Feedback Date], Student_ID AS [Student ID], Email AS [Email], Feedback_Text AS [Feedback Text] FROM viewGive_Feedback WHERE Feedback_ID LIKE '" + txtSearchFeedbackID.Text + "%'";
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
        txtSearchFeedbackID.Text = "";
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
        qry = "DELETE FROM Give_Feedback WHERE Feedback_ID='" + GridView1.SelectedRow.Cells[1].Text + "'";
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
        txtFeedbackID.Text = GridView1.SelectedRow.Cells[1].Text;
        txtFeedbackDate.Text = GridView1.SelectedRow.Cells[2].Text;
        ddlStudentID.SelectedValue = GridView1.SelectedRow.Cells[3].Text;
        txtFeedbackText.Text = GridView1.SelectedRow.Cells[5].Text;
        btnSubmit.Text = "Update";
        btnDelete.Visible = true;
    }
}