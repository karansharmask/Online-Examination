using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Answer_Sheets : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\ExamDB.mdf;Integrated Security=True;User Instance=True");
    String qry;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserType"].ToString() != "Faculty")
            {
                Response.Redirect("Welcome.aspx");
            }
        }
    }
    protected void AllClear()
    {
        txtAnswerID.Text = "";
        ddlAnswerGiven.SelectedIndex = 0;
        txtQueMarksObtained.Text = "";
        txtSearchAnswerID.Text  = "";
        ddlQSIID.SelectedIndex = 0;
        ddlSEAID.SelectedIndex = 0;
        lblSave.Text = "";
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
            qry = "INSERT INTO Answer_Sheets(Answer_ID, SEA_ID, QSI_ID, Ans_Given, Que_Marks_Obtained) values('" + txtAnswerID.Text + "','" + ddlSEAID.SelectedValue + "','" + ddlQSIID.SelectedValue + "','" + ddlAnswerGiven.SelectedValue + "','" + txtQueMarksObtained.Text + "')";
            lblSave.Text = "Record saved";
        }
        else
        {
            qry = "UPDATE Answer_Sheets SET SEA_ID='" + ddlSEAID.SelectedValue + "' , QSI_ID='" + ddlQSIID.SelectedValue + "',Ans_Given='" + ddlAnswerGiven.SelectedValue + "',Que_Marks_Obtained='" + txtQueMarksObtained.Text + "' WHERE Answer_ID='" + txtAnswerID.Text + "'";
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
        qry = "SELECT  Answer_ID AS [Answer ID], SEA_ID AS [SEA ID], QSI_ID AS [QSI ID], Ans_Given AS [Ans Given], Que_Marks_Obtained AS [Que Marks Obtained] FROM Answer_Sheets WHERE Answer_ID LIKE '" + txtSearchAnswerID .Text + "%'";
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
        txtSearchAnswerID.Text = "";
        FillGrid();
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        pnlForm.Visible = true;
        pnlGrid.Visible = false;
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        qry = "DELETE FROM Answer_Sheets WHERE Answer_ID='" + GridView1.SelectedRow.Cells[1].Text + "'";
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
        txtAnswerID.Text = GridView1.SelectedRow.Cells[1].Text;
        ddlSEAID.SelectedValue = GridView1.SelectedRow.Cells[2].Text;
        //ddlQSIID.SelectedValue = GridView1.SelectedRow.Cells[3].Text;
        ddlAnswerGiven.SelectedValue = GridView1.SelectedRow.Cells[4].Text;
        txtQueMarksObtained.Text = GridView1.SelectedRow.Cells[5].Text;
        btnSubmit.Text = "Update";
        btnDelete.Visible = true;
    }
}