using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;


public partial class Account_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ////display registration success message if data updates to SQL
        if (Page.IsPostBack == true)
        {
            Label1.Text = ("Registration has been submitted successfully.");
        }

    }

    protected void CreateUser_Click(object sender, EventArgs e)  //sends registration data to SQL Server
    {

        SqlConnection vid = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=" ";Integrated Security=True");
        {
            SqlCommand xp = new SqlCommand("Insert into Users(email, password, isApproved) Values(@email, @password, @isApproved)", vid);

            xp.Parameters.AddWithValue("@email", email.Text);
            xp.Parameters.AddWithValue("@password", password.Text);
            xp.Parameters.AddWithValue("@isApproved", "1");

            vid.Open();
            xp.ExecuteNonQuery();
            vid.Close();

        }


        if (IsPostBack)
        {
            email.Text = "";
            password.Text = "";
        }
    }
}
