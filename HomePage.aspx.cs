using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


public partial class HomePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string selectedCity = DropDownList1.SelectedValue;

        BindGridView(selectedCity);
    }
    private void BindGridView(string selectedCity = null)
    {
        string query = "SELECT * FROM login WHERE location = @SelectedCity";

        using (SqlConnection connec = new SqlConnection(System.Configuration.ConfigurationSettings.AppSettings["ConnectionString"].ToString()))
        {
            SqlCommand comma = new SqlCommand(query, connec);

            comma.Parameters.Add("@SelectedCity", SqlDbType.NVarChar).Value = selectedCity;

            connec.Open();
            SqlDataReader reader = comma.ExecuteReader();

            if (reader.HasRows)
            {
                DataTable dt = new DataTable();
                dt.Load(reader);

                // Add a new column to store the selected city
               /* dt.Columns.Add("SelectedCity", typeof(string));

                // Populate the new column with the selected city for each row
                foreach (DataRow row in dt.Rows)
                {
                    // Set the value of the "SelectedCity" column to the corresponding city from the database
                    row["SelectedCity"] = row["location"].ToString();                    
                }*/
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            reader.Close();
        }
    }
}

/*if (!IsPostBack)
       {
           string query = "SELECT * FROM login";

           using (SqlConnection connec = new SqlConnection(System.Configuration.ConfigurationSettings.AppSettings["ConnectionString"].ToString()))
           {
               SqlCommand com = new SqlCommand(query, connec);
               connec.Open();
               SqlDataReader reader = com.ExecuteReader();

               if (reader.HasRows)
               {
                   GridView1.DataSource = reader;
                   GridView1.DataBind();
               }
              // if (DropDownList1.SelectedValue == ) { }

               reader.Close();
           }
       }*/


/*DropDownList1.DataSource = reader;
DropDownList1.DataTextField = "location"; 
DropDownList1.DataValueField = "location"; 
DropDownList1.DataBind();
*/

/* if (!IsPostBack)
 {

  DataTable dt = new DataTable();
  dt.Columns.Add("ID", typeof(int));
  dt.Columns.Add("Name", typeof(string));
  dt.Columns.Add("Location", typeof(string));

  object[] row1 = { 1, "Asus", "Nagpur" };
 object[] row2 = { 2, "Dell", "Bangalore" };

   //  object[] sd = [{ 1, "Asus", "Nagpur" }; { 2, "Dell", "Bangalore" };{3,"Apple","Mumbai"}]
   // for(i=0;i<sd.Length;i++){dt.Rows.Add(sd[i])}

     dt.Rows.Add(row1);
     dt.Rows.Add(row2);

  GridView1.DataSource = dt;
  GridView1.DataBind();
}*/
