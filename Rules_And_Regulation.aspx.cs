using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Rules_And_Regulation : System.Web.UI.Page
{
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
    protected void btnStartExam_Click(object sender, EventArgs e)
    {
        Response.Redirect("Exam_Form.aspx");
    }
}