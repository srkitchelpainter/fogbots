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
       
      SqlConnection vid = new SqlConnection("Data Source=IN-CSCI-ASPNET;Initial Catalog=shkitche;Persist Security Info=True;User ID=shkitche;Password=s8414kit");
        {
                SqlCommand xp = new SqlCommand("Insert into Customers(FirstName, MiddleName, LastName, StreetAddress, City, State, ZIP, Email, Password, IsApproved) Values(@FirstName, @MiddleName, @LastName, @StreetAddress, @City, @State, @ZIP, @Email, @Password, @IsApproved)", vid);
                
                xp.Parameters.AddWithValue("@FirstName", fname.Text);
                xp.Parameters.AddWithValue("@MiddleName", mname.Text);
                xp.Parameters.AddWithValue("@LastName", lname.Text);
                xp.Parameters.AddWithValue("@StreetAddress", address.Text);
                xp.Parameters.AddWithValue("@City", address.Text);
                xp.Parameters.AddWithValue("@State", DropDownList1.SelectedValue);
                xp.Parameters.AddWithValue("@ZIP", ZIP.Text);
                xp.Parameters.AddWithValue("@Email", UserName.Text);
                xp.Parameters.AddWithValue("@Password", Password.Text);
                xp.Parameters.AddWithValue("@IsApproved", "0");

                vid.Open();
                xp.ExecuteNonQuery();
                vid.Close();
        
                }
                       

        if (IsPostBack)
        {
            fname.Text = "";
            mname.Text = "";
            lname.Text = "";
            address.Text = "";
            city.Text = "";
            ZIP.Text = "";
            UserName.Text = "";
            Password.Text = "";
        }
    }
}
