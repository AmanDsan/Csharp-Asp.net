using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BoundMethod : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void ShowData(object sender, EventArgs e)
    {

        SqlConnection connec = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"].ToString());
        connec.Open();
        SqlCommand cmd = new SqlCommand("INSERT INTO GridBound_table ([ID],[Name], [City],[Salary]) VALUES (@Value1, @Value2, @Value3, @Value4)", connec);
        cmd.Parameters.AddWithValue("@Value1", TextBox1.Text);
        cmd.Parameters.AddWithValue("@Value2", TextBox2.Text);
        cmd.Parameters.AddWithValue("@Value3", DropDownList1.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@Value4", TextBox4.Text);

       
        cmd.ExecuteNonQuery();
        connec.Close();

        GridDat();
    }

   /* protected void GridDat()
    {
        string query = "Select * From GridBound_table";
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

    }*/


    protected void GridDat()
    {
        string query = "Select * From GridBound_table";
        SqlConnection connec = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"].ToString());
        SqlCommand com = new SqlCommand(query, connec);
        SqlDataAdapter adapter = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        adapter.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
        ViewState["dirState"] = dt;
        ViewState["sortdr"] = "Asc";
    }

    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataTable sortdat = (DataTable)ViewState["dirState"];
        if (sortdat.Rows.Count > 0)
        {
            if (Convert.ToString(ViewState["sortdr"]) == "Asc")
            {
                sortdat.DefaultView.Sort = e.SortExpression + " Desc";
                ViewState["sortdr"] = "Desc";
            }
            else
            {
                sortdat.DefaultView.Sort = e.SortExpression + " Asc";
                ViewState["sortdr"] = "Asc";
            }
            GridView1.DataSource = sortdat;
            GridView1.DataBind();
        }

    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    { 
       
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
           
            if (Convert.ToInt32(e.Row.Cells[3].Text) < 1000)
            {
                e.Row.BackColor = Color.LavenderBlush;
            }
        }
    }

    protected void Gridpaging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataSource = ViewState["Paging"];
        GridView1.DataBind();

        GridDat();
    }

    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.CssClass = "sty_yokai";
        }
    }

    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        
    }

}