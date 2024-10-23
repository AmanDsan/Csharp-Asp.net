using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class New_overTest : System.Web.UI.Page
{
    SqlConnection connec = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (connec.State == ConnectionState.Closed)
                connec.Open();

            // string queryTeamLead = "Select Distinct teamlead,teamid FROM tantra.dbo.tb_EmployeeMaster";
            string queryTeamLead = "Select Distinct empname as teamlead,empid as teamid FROM tantra.dbo.tb_EmployeeMaster";
            SqlCommand cmdTL = new SqlCommand(queryTeamLead, connec);
            SqlDataReader drTeamLead = cmdTL.ExecuteReader();
            DropDownList1.DataSource = drTeamLead;
            DropDownList1.DataTextField = "teamlead";
            DropDownList1.DataValueField = "teamlead";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("-- Select --"));
            drTeamLead.Close();

            //  string queryProjectManager = "Select Distinct projmanager FROM tb_teammaster";
            string queryProjectManager = "Select Distinct designation as projmanager FROM tantra.dbo.tb_EmployeeMaster";
            SqlCommand cmdPM = new SqlCommand(queryProjectManager, connec);
            SqlDataReader drProjectManager = cmdPM.ExecuteReader();
            DropDownList2.DataSource = drProjectManager;
            DropDownList2.DataTextField = "projmanager";
            DropDownList2.DataBind();
            DropDownList2.Items.Insert(0, new ListItem("-- Select --"));
            drProjectManager.Close();

            //  string queryLocation = "Select Distinct location FROM tb_teammaster";
            string queryLocation = "Select Distinct location FROM tantra.dbo.tb_EmployeeMaster";
            SqlCommand cmdLC = new SqlCommand(queryLocation, connec);
            SqlDataReader drLocation = cmdLC.ExecuteReader();
            DropDownList3.DataSource = drLocation;
            DropDownList3.DataTextField = "location";
            DropDownList3.DataBind();
            DropDownList3.Items.Insert(0, new ListItem("-- Select --"));
            drLocation.Close();

            connec.Close();
        }
    }

    protected void DataSubmit(object sender, EventArgs e)
    {
        connec.Open();
        using (SqlCommand cmd = new SqlCommand("NewoverTest", connec))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@teamname", TextBox1.Text);
            cmd.Parameters.AddWithValue("@teamlead", DropDownList1.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@projmanager", DropDownList2.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@location", DropDownList3.SelectedItem.Text);
            cmd.ExecuteNonQuery();
        }
        GridDat();
    }

    protected void GridDat()
    {
        using (SqlConnection connec = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"].ToString()))
        {
            connec.Open();

            string query = "SELECT * FROM tb_teammaster"; 
            SqlCommand com = new SqlCommand(query, connec);
            SqlDataAdapter adapter = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
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

    /* protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string TeamData = GridView1.DataKeys[e.RowIndex].Values["teamid"].ToString();
            connec.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM tb_teammaster WHERE [teamid] = @teamid" + NewoverTest + "'", connec);
            cmd.ExecuteNonQuery();
            connec.Close();
            GridDat();
        }*/

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string teamData = GridView1.DataKeys[e.RowIndex].Value.ToString();

        using (SqlConnection connec = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"].ToString()))
        {
            connec.Open();
            using (SqlCommand cmd = new SqlCommand("DELETE FROM tb_teammaster WHERE [teamid] = @teamid", connec))
            {
                cmd.Parameters.AddWithValue("@teamid", teamData);
                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    GridDat();
                }
                else
                {
                    Response.Write("Deletion failed: No record found with teamid " + teamData);
                }
            }
        }
    }
}
