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
        SqlCommand cmd = new SqlCommand("INSERT INTO ITsamp_table ([Description of Software],[Existing Original Licences Qty], [Spare Licenses],[Remarks]) VALUES (@Value2, @Value3, @Value4, @Value5)", connec);
        cmd.Parameters.AddWithValue("@Value2", TextBox1.Text);
        cmd.Parameters.AddWithValue("@Value3", TextBox2.Text);
        cmd.Parameters.AddWithValue("@Value4", TextBox3.Text);
        cmd.Parameters.AddWithValue("@Value5", TextBox4.Text);
        cmd.ExecuteNonQuery();
        connec.Close();

        GridDat();
        Label6.Text = "Data Submitted Successfully!";
    }

    protected void GridDat()
    {
        string query = "Select [Description of Software],[Existing Original Licences Qty],[Spare Licenses],[Total Licenses Used],[Remarks] From ITsamp_table";
        SqlConnection connec = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"].ToString());
        SqlCommand com = new SqlCommand(query, connec);
        connec.Open();
        SqlDataReader reader = com.ExecuteReader();
        if (reader.HasRows)
        {
            GridView5.DataSource = reader;
            GridView5.DataBind();
        }
        reader.Close();
    }


    protected void GridView5_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string description = GridView5.DataKeys[e.RowIndex].Values["Description of Software"].ToString();

        SqlConnection connec = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
        connec.Open();
        SqlCommand cmd = new SqlCommand("DELETE FROM ITsamp_table WHERE [Description of Software] = '" + description + "'", connec);
        cmd.ExecuteNonQuery();
        connec.Close();

        GridDat();
    }
}
 


