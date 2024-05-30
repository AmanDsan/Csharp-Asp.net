using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DataGrid : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
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
    }
}