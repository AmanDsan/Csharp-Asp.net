using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Test_01 : System.Web.UI.Page
{
    SqlConnection connec = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }

    protected void DataSubmit(object sender, EventArgs e)
    {
       // SqlConnection connec = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"].ToString());
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
       // SqlConnection connec = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"].ToString());
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

       // using (SqlConnection connec = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]))
        //{
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
        
       // }
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

         //SqlConnection connec = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
         connec.Open();
         SqlCommand cmd = new SqlCommand("DELETE FROM Test WHERE [Emp_ID] = '" + employeeID + "'", connec);
         cmd.ExecuteNonQuery();
         connec.Close();
         GridDat();
     }


    /* protected void lbtn_export_Click(object sender, EventArgs e)
      {
          try
          {
              Response.Clear();
              Response.AddHeader("Content-Disposition", "attachment;filename=OverAllTest.xls");
              Response.Charset = "";
              Response.ContentType = "application/vnd.ms-excel";

              StringWriter stringWrite = new StringWriter();
              HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);

              GridView1.AllowPaging = false;
              GridDat();

              GridView1.RenderControl(htmlWrite);
              GridView1.AllowPaging = true;

              Response.Write(stringWrite.ToString());
              Response.End();
          }
          catch (Exception ex)
          {
              Response.Write("Error exporting data: " + ex.Message);
          }
      }*/

    protected void lbtn_export_Click(object sender, EventArgs e)
     {
       try
        {
             // Clear any previous content from the response
             Response.Clear();

             // Set the content type and header for Excel
             Response.AddHeader("content-disposition", "attachment;filename=OverAllTest.xls");
             Response.ContentType = "application/vnd.xls";

             // Create a StringBuilder for capturing the HTML content
             StringBuilder sb = new StringBuilder();
             HtmlTextWriter htw = new HtmlTextWriter(new StringWriter(sb));

             GridDat();

             // Hide the GridView paging to avoid rendering it in Excel
             GridView1.AllowPaging = false;
             GridView1.DataBind();

             // Create a temporary GridView to hold the data for rendering
             GridView gvExport = new GridView();
             gvExport.DataSource = GridView1.DataSource;
             gvExport.AllowPaging = false;

             // Apply styles to the temporary GridView for better Excel formatting
             gvExport.HeaderStyle.ForeColor = Color.Black;
             gvExport.HeaderStyle.BackColor = Color.LightBlue;

             // Ensure the temporary GridView is bound and rendered
             gvExport.DataBind();
             gvExport.RenderControl(htw);

             // Write the rendered content to the response stream
             Response.Write(sb.ToString());
             Response.End();
        }
         catch (Exception ex)
         {
             Response.Write(ex.Message);
         }
     } 

}

