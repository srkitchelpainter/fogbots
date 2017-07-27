using System;
using System.Data.SqlClient;

/// <summary>
/// Log in functions for user login 
/// </summary>
/// 


public partial class Account_Login : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null)
        {
            Response.Redirect("Account.aspx");
        }
    }

    protected void LogIn(object sender, EventArgs e)
    {
        SqlConnection vid = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=Fogbots;Integrated Security=True");
        vid.Open();
        string checkuser = "Select count(*) from Users where email='" + UserName.Text + "'";
        SqlCommand com = new SqlCommand(checkuser, vid);
        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
        vid.Close();
        if (temp == 1)
        {
            vid.Open();
            string checkpassword = "Select password from Users where email='" + UserName.Text + "'";
            SqlCommand passcom = new SqlCommand(checkpassword, vid);
            string password = passcom.ExecuteScalar().ToString();
            if (password == Password.Text)
            {
                {
                    SqlCommand isapproved = new SqlCommand("Update Users set isApproved = '" + "1" + "' where email = '" + UserName.Text + "'", vid);
                    isapproved.Parameters.AddWithValue("@isApproved", "1");
                    isapproved.ExecuteNonQuery();
                    Session["UserName"] = UserName.Text;
                    Response.Redirect("Account.aspx");
                    vid.Close();
                }


            }

            else
            {
                loginError.Text = ("Password is incorrect");
            }
        }
        else
        {
            loginError.Text = ("User name is incorrect.");
        }
    }
}



