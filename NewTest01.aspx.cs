using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewTest01 : System.Web.UI.Page
{
    SqlConnection connec = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (connec.State == ConnectionState.Closed)
                connec.Open();

            string queryTeamLead = "Select Distinct teamlead FROM tb_teammaster";
            SqlCommand cmdTL = new SqlCommand(queryTeamLead, connec);
            SqlDataReader drTeamLead = cmdTL.ExecuteReader();
            DropDownList1.DataSource = drTeamLead;
            //DropDownList1.DataTextField = "teamlead";
            DropDownList1.DataValueField = "teamlead";
            DropDownList1.DataBind();
            drTeamLead.Close();

            string queryProjectManager = "Select Distinct projmanager FROM tb_teammaster";
            SqlCommand cmdPM = new SqlCommand(queryProjectManager, connec);
            SqlDataReader drProjectManager = cmdPM.ExecuteReader();
            DropDownList2.DataSource = drProjectManager;
            //DropDownList2.DataTextField = "projmanager";
            DropDownList2.DataValueField = "projmanager";
            DropDownList2.DataBind();
            drProjectManager.Close();

            connec.Close();
        }
    }

    protected void DataSubmit(object sender, EventArgs e)
    {
        connec.Open();
        using (SqlCommand cmd = new SqlCommand("TeamData", connec))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@val1", TextBox1.Text);   
            cmd.Parameters.AddWithValue("@val2", DropDownList1.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@val3", DropDownList2.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@val4", TextBox4.Text);
            cmd.ExecuteNonQuery();
        }
        GridDat();
    }


    protected void GridDat()
    {
        string query = "Select * From tb_teammaster";
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

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string TeamData = GridView1.DataKeys[e.RowIndex].Values["teamname"].ToString();
        connec.Open();
        SqlCommand cmd = new SqlCommand("DELETE FROM tb_teammaster WHERE [teamname] = '" + TeamData + "'", connec);
        cmd.ExecuteNonQuery();
        connec.Close();
        GridDat();
    }
}
