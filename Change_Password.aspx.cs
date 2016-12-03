using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Change_Password : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\ExamDB.mdf;Integrated Security=True;User Instance=True");
    string qry;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtEmailID.Text = Session["EmailID"].ToString();
        }
    }
    protected void AllClear()
    {
        txtEmailID.Text = "";
        txtOldPassword.Text = "";
        txtNewPassword.Text = "";
        txtConfirmPassword.Text = "";
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        AllClear();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
            if (Session["UserType"].ToString() == "Admin")
            {
                qry = "SELECT * FROM Admin_Information WHERE Email='" + txtEmailID.Text + "' AND Password='" + txtOldPassword.Text + "'";
            }
            else if(Session ["UserType"].ToString ()=="HOD")
            {
                qry = "SELECT * FROM HOD_Information WHERE Email='" + txtEmailID.Text + "' AND Password='" + txtOldPassword.Text + "'";
            }
            else if (Session["UserType"].ToString() == "Faculty")
            {
                qry = "SELECT * FROM Faculty_Information WHERE Email='" + txtEmailID.Text + "' AND Password='" + txtOldPassword.Text + "'";
            }
            else if (Session["UserType"].ToString() == "Student")
            {
                qry = "SELECT * FROM Student_Information WHERE Email='" + txtEmailID.Text + "' AND Password='" + txtOldPassword.Text + "'";
            }
            conn.Open();

            SqlCommand sqlcmd = new SqlCommand(qry, conn);
            SqlDataReader dr = sqlcmd.ExecuteReader();
            if (dr.Read() == true)
            {
                dr.Close();
                if (Session["UserType"].ToString() == "Admin")
                {
                    qry = "UPDATE Admin_Information SET Password='" + txtNewPassword.Text + "' WHERE Email='" + txtEmailID.Text + "'";
                }
                else if (Session["UserType"].ToString() == "HOD")
                {
                    qry = "UPDATE HOD_Information SET Password='" + txtNewPassword.Text + "' WHERE Email='" + txtEmailID.Text + "'";
                }
                else if (Session["UserType"].ToString() == "Faculty")
                {
                    qry = "UPDATE Faculty_Information SET Password='" + txtNewPassword.Text + "' WHERE Email='" + txtEmailID.Text + "'";
                }
                else if (Session["UserType"].ToString() == "Student")
                {
                    qry = "UPDATE Student_Information SET Password='" + txtNewPassword.Text + "' WHERE Email='" + txtEmailID.Text + "'";
                }
                SqlCommand sqlcmd1 = new SqlCommand(qry, conn);
                sqlcmd1.ExecuteNonQuery();
                lblMessage.Text = "Password Successfully Changed";
            }
            else
            {
                lblMessage.Text = "Invalid Old Password Entered";
            }
            conn.Close();
    }
}

        