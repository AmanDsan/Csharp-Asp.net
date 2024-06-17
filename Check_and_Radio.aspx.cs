using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Check_and_Radio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CoursesChoosed(object sender, EventArgs e)
    {
        var message = "";
        if (CheckBox2.Checked)
        {
            message = CheckBox2.Text + " ";
        }
        if (CheckBox3.Checked)
        {
            message += CheckBox3.Text + " ";
        }
        if (CheckBox4.Checked)
        {
            message += CheckBox4.Text + " ";
        }
        if (CheckBox5.Checked)
        {
            message += CheckBox5.Text + " ";
        }
        if (CheckBox6.Checked)
        {
            message += CheckBox6.Text + " ";
        }
        Label1.Text = message;
    }


    protected void RadClick(object sender, EventArgs e)
    {
        genderId.Text = "";
        if (RadioButton1.Checked)
        {
            genderId.Text = "Your gender is " + RadioButton1.Text;
        }
        else genderId.Text = "Your gender is " + RadioButton2.Text;

    }




    protected void FruitsLiked(object sender, EventArgs e)
    {
        var message = "";
        if (CheckBox10.Checked)
        {
            message = "Savoury";
        }
        if (CheckBox7.Checked)
        {
            message = "Sweet";
        }
        if (CheckBox9.Checked)
        {
            message = "Sweet & Sour";
        }
        if (CheckBox8.Checked)
        {
            message = "Sweet with Carbs";
        }
        Label2.Text = message;
    }

}  

