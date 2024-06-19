using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Test_01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void DataSubmit(object sender, EventArgs e)
    {
        SqlConnection connec = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"].ToString());
        connec.Open();
        using (SqlCommand cmd = new SqlCommand("InsertTestData", connec))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@val1", TextBox1.Text);
            cmd.Parameters.AddWithValue("@val2", TextBox2.Text);
            cmd.Parameters.AddWithValue("@val3", DropDownList1.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@val4", TextBox3.Text);
            cmd.Parameters.AddWithValue("@val5", TextBox7.Text);
            cmd.Parameters.AddWithValue("@val6", DropDownList3.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@val7", DropDownList8.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@val8", DropDownList2.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@val9", TextBox5.Text);
            cmd.Parameters.AddWithValue("@val10", DropDownList5.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@val11", DropDownList6.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@val12", DropDownList7.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@val13", DropDownList9.SelectedItem.Text);

            cmd.ExecuteNonQuery();
        }
        GridDat();
    }


    protected void GridDat()
    {
        string query = "Select * From Test";
        SqlConnection connec = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"].ToString());
        SqlCommand com = new SqlCommand(query, connec);
        SqlDataAdapter adapter = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        adapter.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        GridDat();
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        GridDat();
    }
    protected void Gridpaging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataSource = ViewState["Paging"];
        GridView1.DataBind();

        GridDat();
    }

    protected void SearchBox(object sender, EventArgs e)
    {
        string searchKeyword = TextBox6.Text.Trim();
        string query = "SELECT * FROM Test WHERE Emp_Name LIKE @searchKeyword";

        using (SqlConnection connec = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]))
        {
            using (SqlCommand cmd = new SqlCommand(query, connec))
            {
                cmd.Parameters.AddWithValue("@searchKeyword", "%" + searchKeyword + "%");

                connec.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
    }

    protected void ResetClick(object sender, EventArgs e)
    {
        TextBox1.Text = string.Empty;
        TextBox2.Text = string.Empty;
        TextBox3.Text = string.Empty;
        TextBox7.Text = string.Empty;
        TextBox4.Text = string.Empty;
        TextBox5.Text = string.Empty;
        TextBox6.Text = string.Empty;

        DropDownList1.SelectedIndex = 0;
        DropDownList2.SelectedIndex = 0;
        DropDownList3.SelectedIndex = 0;
        DropDownList4.SelectedIndex = 0;
        DropDownList5.SelectedIndex = 0;
        DropDownList6.SelectedIndex = 0;
        DropDownList7.SelectedIndex = 0;
        DropDownList8.SelectedIndex = 0;
        DropDownList9.SelectedIndex = 0;
    }


    protected string TransformEmpID(object empID)
    {
        if (empID != null)
        {
            string originalID = empID.ToString();
            if (originalID.StartsWith("ES"))
            {
                return originalID;
            }
            else
            {
                return "ES" + originalID.PadLeft(4, '0');
            }
        }
        return string.Empty;
    }


     protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
     {
         string employeeID = GridView1.DataKeys[e.RowIndex].Values["Emp_ID"].ToString();

         SqlConnection connec = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
         connec.Open();
         SqlCommand cmd = new SqlCommand("DELETE FROM Test WHERE [Emp_ID] = '" + employeeID + "'", connec);
         cmd.ExecuteNonQuery();
         connec.Close();
         GridDat();
     }
}