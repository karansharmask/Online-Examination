using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Inner : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack == false)
        {
            if (Session["Username"].ToString() == "")
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                lblWelcome.Text = "Welcome," +" "+ Session["Username"].ToString();
                lblWelcome.Text = lblWelcome.Text + "<br />" + "Usertype: " + Session["UserType"].ToString(); 
            }
            if (Session["UserType"].ToString() == "Admin")
            {
                mnuAdmin.Visible = true;
            }
            else if (Session["UserType"].ToString() == "HOD")
            {
                mnuHOD.Visible = true;
            }
            else if (Session["UserType"].ToString() == "Faculty")
            {
                mnuFaculty.Visible = true;
            }
            else if (Session["UserType"].ToString() == "Student")
            {
                mnuStudent.Visible = true;
            }
        }
    }
}
