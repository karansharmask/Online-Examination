using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class rptViewGive_Feedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserType"].ToString() == "Admin" || Session["UserType"].ToString() == "HOD" || Session["UserType"].ToString() == "Faculty" || Session["UserType"].ToString() == "Student")
        {

        }
        else
        {
            Response.Redirect("Welcome.aspx");
        }
    }
}