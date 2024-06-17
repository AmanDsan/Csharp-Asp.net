using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Grid_Check : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GridDat();
    }

    protected void GridDat()
    {
        string query = "Select * From Grid_Check_Table";
        SqlConnection connec = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"].ToString());
        SqlCommand com = new SqlCommand(query, connec);
        connec.Open();
        SqlDataReader reader = com.ExecuteReader();
        if (reader.HasRows)
        {
            GridView1.DataSource = reader;
            GridView1.DataBind();
        }
        reader.Close();
    }

     protected void Click(object sender, EventArgs e)
     {
         SqlConnection connec = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"].ToString());
         foreach (GridViewRow gvrow in GridView1.Rows)
         {
             CheckBox checkbox = gvrow.FindControl("CheckBox1") as CheckBox;
             if (checkbox.Checked)
             {
                 Label lblName = gvrow.FindControl("Label1") as Label;
                 Label lblLocation = gvrow.FindControl("Label2") as Label;
                 Label lblPhoneNo = gvrow.FindControl("Label3") as Label;

                 SqlCommand cmd = new SqlCommand("INSERT INTO checkTest (name, location, phoneNo) VALUES (@Emp_Name, @Emp_Location, @Emp_PhoneNo)", connec);
                 cmd.Parameters.AddWithValue("@Emp_Name", lblName.Text);
                 cmd.Parameters.AddWithValue("@Emp_Location", lblLocation.Text);
                 cmd.Parameters.AddWithValue("@Emp_PhoneNo", lblPhoneNo.Text);
                 connec.Open();
                 int i = cmd.ExecuteNonQuery();
                 connec.Close();
                 GridDat();
             }
         }
     }



}
//Trying to insert data from Grid_Check_Table to checkTest
//Grid_Check_Table:-    Emp_Name, Emp_Location, Emp_PhoneNo    (These are column names of the specified table)
//checkTest :-          name, location, phoneNo                (These are column names of the specified table)
