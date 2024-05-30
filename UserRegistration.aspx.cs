using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class UserRegistration : System.Web.UI.Page
{   
   protected void Page_Load(object sender, EventArgs e)
    {
    }
   protected void AuthenticateUser(object sender, EventArgs e)
{ 
    try
    {
        string uname = txtUserName.Text;
        string pass = txtPassword.Text; 

        using (SqlConnection connec = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"].ToString()))
        {
            connec.Open();
            string qry = "SELECT * FROM login WHERE username='" + uname + "' AND password='" + pass + "'";
            SqlCommand cmd = new SqlCommand(qry, connec);
            SqlDataReader check = cmd.ExecuteReader();
            if (check.Read())
            {
                    Response.Redirect("HomePage.aspx");
                }
            else
            {
                Label3.Text = "UserName &/or Password is Incorrect.So,Ain't able to Redirect.Try again...!";
            }
        }
    }
    catch (Exception ex)
    {
        Response.Write(ex.Message);
    }
}
}


/*SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"].ToString());
     SqlDataAdapter sqa = new SqlDataAdapter("SELECT count(*) from login Where username = " + TextBox1.Text + " and password = " + TextBox2.Text,con);
     DataTabl*/



/*SqlCommand cmd;
SqlDataAdapter dap;
DataSet ds = new DataSet();

cmd = new SqlCommand("SELECT count(*) from login Where username = " + TextBox1.Text + " and password = " + TextBox2.Text, con);
dap = new SqlDataAdapter(cmd);
dap.Fill(ds);*/

    
    /*--------- using (SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"].ToString())) ;

 {   
     con.Open();
     string query = "SELECT count(*) from login Where username = @username and password = @password";
     SqlCommand sqlCmd = new SqlCommand(query, con);
     sqlCmd.Parameters.AddWithValue("@username", txtUserName.Text.Trim());
     sqlCmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim());
     int count = Convert.ToInt32(sqlCmd.ExecuteScalar());
     if(count == 1)
     {
         Session["username"] = txtUserName.Text.Trim();
         Response.Redirect("DatabaseConnection.aspx");
     }
 }

}*/
