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
            string queryTeamLead = "Select Distinct empname as teamlead,empid as teamid FROM tantra.dbo.tb_EmployeeMaster where designation like 'Team%'";
            SqlCommand cmdTL = new SqlCommand(queryTeamLead, connec);
            SqlDataReader drTeamLead = cmdTL.ExecuteReader();
            DropDownList1.DataSource = drTeamLead;
            DropDownList1.DataTextField = "teamlead";
            DropDownList1.DataValueField = "teamid";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("-- Select --"));
            drTeamLead.Close();


            //  string queryProjectManager = "Select Distinct projmanager FROM tb_teammaster";
            string queryProjectManager = "Select Distinct empname as projmanager,empid as teamid FROM tantra.dbo.tb_EmployeeMaster where designation like '%Project%'";
            SqlCommand cmdPM = new SqlCommand(queryProjectManager, connec);
            SqlDataReader drProjectManager = cmdPM.ExecuteReader();
            DropDownList2.DataSource = drProjectManager;
            DropDownList2.DataTextField = "projmanager";
            DropDownList2.DataValueField = "teamid";
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

        //adding message if teamname only already exists

       /* string checkQuery = "SELECT COUNT(*) FROM tb_teammaster WHERE teamname = @teamname";
        using (SqlCommand checkCmd = new SqlCommand(checkQuery, connec))
        {
            checkCmd.Parameters.AddWithValue("@teamname", TextBox1.Text.Trim());
            int exists = (int)checkCmd.ExecuteScalar();

            if (exists > 0)
            {
                lblMessage.Text = "Team name already exists!";
                connec.Close();
                return; 
            }
        }*/

            //adding message if a row if that combination already exists
                string checkQuery = @"
                SELECT COUNT(*) 
                FROM tb_teammaster 
                WHERE teamname = @teamname 
                  AND teamlead = @teamlead 
                  AND projmanager = @projmanager
                  AND location = @location";

                using (SqlCommand checkCmd = new SqlCommand(checkQuery, connec))
                {
                    checkCmd.Parameters.AddWithValue("@teamname", TextBox1.Text.Trim());
                    checkCmd.Parameters.AddWithValue("@teamlead", DropDownList1.SelectedItem.Value);
                    checkCmd.Parameters.AddWithValue("@projmanager", DropDownList2.SelectedItem.Value);
                    checkCmd.Parameters.AddWithValue("@location", DropDownList3.SelectedItem.Value);

                    int exists = (int)checkCmd.ExecuteScalar();

                    if (exists > 0)
                    {
                        lblMessage.Text = "The team with the specified details already exists!";
                        connec.Close();
                        return; 
                    }
                }
                

        //saving data which recieved from textbox and dropdown
        using (SqlCommand cmd = new SqlCommand("NewoverTest", connec))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@teamname", TextBox1.Text);
            cmd.Parameters.AddWithValue("@teamlead", DropDownList1.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@projmanager", DropDownList2.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@location", DropDownList3.SelectedItem.Text);
            cmd.ExecuteNonQuery();
        }
        // Clear any previous messages
        lblMessage.Text = "";

        GridDat();
        connec.Close();
    }

    protected void GridDat()
    {
        try
        {
            using (SqlConnection connec = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]))
            {
                connec.Open();

                string query = @"
           SELECT 
                tm.teamid,tm.teamname,
                em1.empname AS teamlead, 
                em2.empname AS projmanager ,
                tm.teamlogo,tm.dollarval,tm.status,tm.location,tm.temp1,tm.temp2,tm.temp2,tm.temp3,tm.temp4,tm.temp5,tm.temp6,tm.temp7,tm.temp8,tm.temp9,tm.temp10
            FROM 
                [Employee data].[dbo].[tb_teammaster] tm  
            LEFT JOIN 
                [tantra].[dbo].[tb_EmployeeMaster] em1 ON tm.teamlead = em1.empid  
            LEFT JOIN 
                [tantra].[dbo].[tb_EmployeeMaster] em2 ON tm.projmanager = em2.empid;";

                SqlCommand com = new SqlCommand(query, connec);
                SqlDataAdapter adapter = new SqlDataAdapter(com);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
                else
                {
                    Response.Write("No data found.");
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("Error: " + ex.Message);
        }

        /* using (SqlConnection connec = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"].ToString()))
         {
             connec.Open();

             //string query = "SELECT tm.*,em1.empname AS teamlead, em2.empname AS projmanager FROM tb_teammaster tm  LEFT JOIN tantra.dbo.tb_EmployeeMaster em1 ON tm.teamlead = em1.empid  LEFT JOIN tantra.dbo.tb_EmployeeMaster em2 ON tm.projmanager = em2.empid";
             string query = "SELECT * FROM tb_teammaster";
             // Select  b.empname  from [Employee data].[dbo].[tb_teammaster] a left join [tantra].[dbo].[tb_EmployeeMaster] b on a.teamlead = b.empid ;   -- teamlead
             //  Select  b.empname  from [Employee data].[dbo].[tb_teammaster] a left join [tantra].[dbo].[tb_EmployeeMaster] b on a.projmanager = b.empid ;  -- projmanager
             SqlCommand com = new SqlCommand(query, connec);
             SqlDataAdapter adapter = new SqlDataAdapter(com);
             DataTable dt = new DataTable();
             adapter.Fill(dt);

             GridView1.DataSource = dt;
             GridView1.DataBind();
         }*/
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
