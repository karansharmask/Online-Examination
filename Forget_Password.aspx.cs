using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Collections.Generic;
using System.Net;
using System.Net.Mail;

public partial class Forget_Password : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\ExamDB.mdf;Integrated Security=True;User Instance=True");
    string qry;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        AllClear();
    }
    protected void AllClear()
    {
        txtEmailID.Text = "";
        lblMessage.Text = "";
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        String Password = "";
        conn.Open();
        if (ddlUserType.SelectedValue == "Admin")
        {
            qry = "SELECT Password FROM Admin_Information WHERE Email = '" + txtEmailID.Text + "'";
        }
        else if (ddlUserType.SelectedValue == "HOD")
        {
            qry = "SELECT Password FROM HOD_Information WHERE Email = '" + txtEmailID.Text + "'";
        }
        else if (ddlUserType.SelectedValue == "Faculty")
        {
            qry = "SELECT Password FROM Faculty_Information WHERE Email = '" + txtEmailID.Text + "'";
        }
        else if (ddlUserType.SelectedValue == "Student")
        {
            qry = "SELECT Password FROM Student_Information WHERE Email = '" + txtEmailID.Text + "'";
        }
        SqlCommand SqlCmd = new SqlCommand(qry, conn);
        SqlDataReader SqlDr = SqlCmd.ExecuteReader();

        if (SqlDr.Read() == true)
        {
            Password = SqlDr.GetValue(0).ToString();

            //for sedning email code starts here
            NetworkCredential loginInfo = new NetworkCredential("siddharth31051994@gmail.com", "sidd1111");
            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("sidpatel48@gmail.com");
            msg.To.Add(new MailAddress(txtEmailID.Text));
            msg.Subject = "Inquiry about Forget Password";
            msg.Body = "Your password is <b>" + Password + "</b><br />Next time please login using this password.";
            msg.IsBodyHtml = true;
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = loginInfo;
            client.Send(msg);
            lblMessage.Text = "Your Password will be Send to your Email ID";
            //for sending email ends here
        }
        else
        {
            lblMessage.Text = "Please check User Name or Email ID.";
        }

        conn.Close();
    }
}