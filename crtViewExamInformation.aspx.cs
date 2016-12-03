using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

using CrystalDecisions;
using CrystalDecisions.Reporting;
using CrystalDecisions.CrystalReports.Engine;

public partial class crtViewExamInformation : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\ExamDB.mdf;Integrated Security=True;User Instance=True");
    String qry;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ReportDocument customRpt = new ReportDocument();
            String reportPath = Server.MapPath("crtViewExamInformation.rpt");
            customRpt.Load(reportPath);

            SqlDataAdapter SqlDA = new SqlDataAdapter(Session["Print"].ToString(), conn);

            DataSet ds = new DataSet();
            SqlDA.Fill(ds, "viewExam_Information");

            DataTable dt = new DataTable();
            customRpt.SetDataSource(ds.Tables[0]);

            CrystalReportViewer1.ReportSource = customRpt;
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Welcome.aspx");
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        ReportDocument customRpt = new ReportDocument();
        String reportPath = Server.MapPath("crtViewExamInformation.rpt");
        customRpt.Load(reportPath);

        SqlDataAdapter SqlDA = new SqlDataAdapter("SELECT * FROM viewExam_Information WHERE Faculty_First_Name LIKE '" + ddlFacultyFirstName.SelectedValue + "%'", conn);

        DataSet ds = new DataSet();
        SqlDA.Fill(ds, "viewExam_Information");

        DataTable dt = new DataTable();
        customRpt.SetDataSource(ds.Tables[0]);

        CrystalReportViewer1.ReportSource = customRpt;
    }
    protected void ddlFacultyFirstName_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void CrystalReportViewer1_Init(object sender, EventArgs e)
    {

    }
}