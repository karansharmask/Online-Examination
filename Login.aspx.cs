using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;


public partial class Login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\ExamDB.mdf;Integrated Security=True;User Instance=True");
    string qry;

    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (ddlUserType.SelectedValue == "Student")
        {
            qry = "SELECT * FROM Student_Information WHERE Email='" + txtEmail.Text + "' AND Password = '" + txtPassword.Text + "'";
        }
        else if (ddlUserType.SelectedValue == "Faculty")
        {
            qry = "SELECT * FROM Faculty_Information WHERE Email='" + txtEmail.Text + "' AND Password = '" + txtPassword.Text + "'";
        }
        else if (ddlUserType.SelectedValue == "HOD")
        { 
            qry = "SELECT * FROM HOD_Information WHERE Email='" + txtEmail.Text + "' AND Password = '" + txtPassword.Text + "'";
        }
        else if (ddlUserType.SelectedValue == "Admin")
        {
            qry = "SELECT * FROM Admin_Information WHERE Email='" + txtEmail.Text + "' AND Password = '" + txtPassword.Text + "'";
        }
        con.Open ();
        SqlCommand cmd = new SqlCommand (qry, con);
        SqlDataReader dr = cmd.ExecuteReader ();

        if (dr.Read()==true)
        {
            Session["UserType"] = ddlUserType.SelectedValue;
            if (ddlUserType.SelectedValue == "Student")
            {
                Session["Student_ID"] = dr.GetValue(0).ToString();
                Session["EmailID"] = dr.GetValue(8).ToString();
                Session["Username"] = dr.GetValue(4).ToString() + " " + dr.GetValue(6).ToString();
            }
            else if (ddlUserType.SelectedValue == "Faculty")
            {
                Session["EmailID"] = dr.GetValue(5).ToString();
                Session["Username"] = dr.GetValue(1).ToString() + " " + dr.GetValue(2).ToString();
            }
            else if (ddlUserType.SelectedValue == "HOD")
            {
                Session["EmailID"] = dr.GetValue(5).ToString();
                Session["Username"] = dr.GetValue(2).ToString() + " " + dr.GetValue(3).ToString();
            }
            else if (ddlUserType.SelectedValue == "Admin")
            {
                Session["EmailID"] = dr.GetValue(4).ToString();
                Session["Username"] = dr.GetValue(1).ToString() + " " + dr.GetValue(2).ToString();
            }
            Response.Redirect("Welcome.aspx");
        }
        else
        {
            lblMsg.Text="Email ID,Password or UserType Incorrect.";
            lblMsg.ForeColor= System.Drawing.Color.Red;
        }
        dr.Close ();
        con.Close();

    }
}