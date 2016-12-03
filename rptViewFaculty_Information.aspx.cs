using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class rptViewFaculty_Information : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserType"].ToString() == "Faculty" || Session["UserType"].ToString() == "HOD" || Session["UserType"].ToString() == "Admin")
        {

        }
        else
        {
            Response.Redirect("Welcome.aspx");
        }
    }
}