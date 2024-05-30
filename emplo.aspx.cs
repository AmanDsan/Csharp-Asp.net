using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class emplo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }


    protected void DataSubmit(object sender, EventArgs e)
    {
        SqlConnection connec = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"].ToString());
        connec.Open();
        SqlCommand cmd = new SqlCommand("insert into Emp_table values('"+ TextBox1.Text+"','"+ TextBox2.Text+ "','" + DropDownList1.SelectedItem.Text + "','" +
                              DropDownList2.SelectedItem.Text + "')", connec);
        cmd.ExecuteNonQuery();
        connec.Close();

        GridDat();
    }



   protected void GridDat()
    {
    
          string query = "Select * From Emp_table"; 
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


  
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        GridDat();
    }


    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
{
    SqlConnection connec = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"].ToString());
        
    Label id = GridView1.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
    TextBox name = GridView1.Rows[e.RowIndex].FindControl("txt_Name") as TextBox;
    TextBox location = GridView1.Rows[e.RowIndex].FindControl("txt_Location") as TextBox;
    TextBox designation = GridView1.Rows[e.RowIndex].FindControl("txt_Designation") as TextBox;

//-------------------------------------------------------------------------------------------------------------------

        /*  connec.Open();
         string updateQuery = "UPDATE Emp_table SET [Emp Name] = @Name, Location = @Location, Designation = @Designation WHERE [Emp Id] = @EmployeeID";
         using(SqlCommand cmd = new SqlCommand(updateQuery, connec))
      {
          cmd.Parameters.AddWithValue("@Name", name.Text);
          cmd.Parameters.AddWithValue("@Location", location.Text); 
          cmd.Parameters.AddWithValue("@Designation", designation.Text); 
          cmd.Parameters.AddWithValue("@EmployeeID", id.Text);


          cmd.ExecuteNonQuery();
      }*/
//--------------------------------------------------------------------------------------------------------------------
        connec.Open();
        SqlCommand cmd = new SqlCommand("UPDATE Emp_table SET [Emp Name] = '" + name.Text + "', Location = '" + location.Text + "', Designation = '" + designation.Text
             + "' WHERE [Emp Id] = " + Convert.ToInt32(id.Text), connec);
        cmd.ExecuteNonQuery();

//--------------------------------------------------------------------------------------------------------------------
        connec.Close();
        GridView1.EditIndex = -1;
        GridDat();
}


    protected void GridView1_RowCancelingEdit(object sender,GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        GridDat();
    }



    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int employeeID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

//-------------------------------------------------------------------------------------------

        /*SqlConnection connec = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connec.Open();
        SqlCommand cmd = new SqlCommand("DELETE FROM Emp_table WHERE [Emp Id] = @EmployeeID", connec);
        cmd.Parameters.AddWithValue("@EmployeeID", employeeID);
        cmd.ExecuteNonQuery();
        GridDat();
        */

//-------------------------------------------------------------------------------------------

        SqlConnection connec = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connec.Open();
        SqlCommand cmd = new SqlCommand("DELETE FROM Emp_table WHERE [Emp Id] = '" + employeeID + "'", connec);
        cmd.ExecuteNonQuery();
        GridDat();
    }
}

/* protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
   {
       GridView1.EditIndex = e.NewEditIndex;
       GridDat(); // Rebind GridView to show edit mode
   }

   protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
   {
       GridViewRow row = GridView1.Rows[e.RowIndex];
       int employeeID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
       string newName = ((TextBox)row.FindControl("TextBox_EditName")).Text;
       string newLocation = ((DropDownList)row.FindControl("DropDownList_EditLocation")).SelectedItem.Text;
       string newDesignation = ((DropDownList)row.FindControl("DropDownList_EditDesignation")).SelectedItem.Text;

       using (SqlConnection connec = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]))
       {
           string updateQuery = "UPDATE Emp_table SET Emp Name = @Emp Name, Location = @Location, Designation = @Designation WHERE Emp Id = @Emp Id";
           using (SqlCommand cmd = new SqlCommand(updateQuery, connec))
           {
               cmd.Parameters.AddWithValue("@Emp Name", newName);
               cmd.Parameters.AddWithValue("@Location", newLocation);
               cmd.Parameters.AddWithValue("@Designation", newDesignation);
               cmd.Parameters.AddWithValue("@Emp Id", employeeID);

               connec.Open();
               cmd.ExecuteNonQuery();
           }
       }

       GridView1.EditIndex = -1;
       GridDat(); // Rebind GridView after updating
   }

   protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
   {
       GridView1.EditIndex = -1;
       GridDat(); // Rebind GridView to cancel editing
   }

   protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
   {
       int employeeID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

       using (SqlConnection connec = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]))
       {
           string deleteQuery = "DELETE FROM Emp_table WHERE Emp Id = @Emp Id";
           using (SqlCommand cmd = new SqlCommand(deleteQuery, connec))
           {
               cmd.Parameters.AddWithValue("@Emp Id", employeeID);

               connec.Open();
               cmd.ExecuteNonQuery();
           }
       }

       GridDat();
   }

   */
