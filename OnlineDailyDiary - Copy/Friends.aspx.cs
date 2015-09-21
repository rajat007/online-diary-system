using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Collections.Specialized;
using System.Windows.Forms;




public partial class Friends : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database1ConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("Default.aspx");


        }


    }

    
    protected void Button1_Click(object sender, EventArgs e)
    {
        // code that checks wether the value exist in database or not
        conn.Open();
        SqlCommand cmd = new SqlCommand("select Username from Signup where Username=@name", conn);
        SqlParameter x = new SqlParameter();
        x.ParameterName = "@name";
        x.Value = TextBox1.Text;
        cmd.Parameters.Add(x);

        SqlDataReader da = cmd.ExecuteReader();
        da.Read();



        if (da.HasRows)
        {
            string sr = da[0].ToString();
            Label1.Text = "username exist";
            da.Close();


        }

        else
        {

            Label1.Text = "username doesnot exist";

            da.Close();
        }

        conn.Close();


    }
    protected void Button2_Click(object sender, EventArgs e)
    {
       // string sd;
        conn.Open();
        SqlCommand cmd = new SqlCommand("select Username from Signup where Username=@name", conn);
        SqlParameter xm = new SqlParameter();
        xm.ParameterName = "@name";
        xm.Value = TextBox1.Text;
        cmd.Parameters.Add(xm);
        SqlDataReader p = cmd.ExecuteReader();
        p.Read();
        if (p.HasRows)
        {
            string sr = p[0].ToString();
            p.Close();
            conn.Close();


            
            conn.Open();
            SqlCommand cm = new SqlCommand("insert into Friends values('" + (string)Session["username"] + "','" + sr + "')", conn);
            cm.ExecuteNonQuery();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "scriptkey", "<script>alert('FRIEND ADDED');</script>");
            conn.Close();
        }
        else
        {

            Label1.Text = "username doesnot exist";

        }


    }
    protected void ButtonMoodal_Click(object sender, EventArgs e)
    {
        
       
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        foreach (TableCell myCell in e.Row.Cells)
        {
            myCell.Style.Add("word-break", "break-all");
            myCell.Width = 400;
        }
    }

    protected void ButtonMessage_Click(object sender, EventArgs e)
    {
        if (GridView1.Visible == true)
        {
            GridView1.Visible = false;
        }
        else 
        {

            GridView1.Visible = true;
        
        }
    }
    protected void ButtonFriend_Click(object sender, EventArgs e)
    {
        if (GridView2.Visible == true)
        {
            GridView2.Visible = false;
        }
        else
        {

            GridView2.Visible = true;

        }

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Session.Contents.Remove("username");
        Response.Redirect("Default.aspx");
    }
}