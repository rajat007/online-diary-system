using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;

public partial class manageTextbox : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database1ConnectionString"].ConnectionString);
    string us, db;
    
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["username"] == null)
        {
            Response.Redirect("Default.aspx");


        }
      

    
        
        
        //  editor1.config.toolbar = "Basic";
       // editor1.config.forcePasteAsPlainText = false;



        string sr,sr1;
        sr = editor1.Text;
        sr1 = Server.HtmlEncode(sr);
        sr1 = Regex.Replace(sr1, @"<[^>]+>|&nbsp;", "").Trim();

        // code to display what is already in diary
        if (Session["username"] == null)
        {
            Response.Redirect("Default.aspx");


        }

        
        if (!IsPostBack)
        {

            conn.Open();
            us = (string)Session["username"];
            db = (string)Session["date"];
            SqlCommand CMD = new SqlCommand("select diary from Record where Username='" + us + "'and Date ='" + db + "'", conn);
            SqlDataReader da = CMD.ExecuteReader();
            if (da.Read())
            {
               editor1.Text= da["Diary"].ToString();
                
            }
            else
            {

                editor1.Text = "";
            }
            da.Close();
        }

        conn.Close();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string sr, sr1;
        sr = editor1.Text;
        sr1 = Server.HtmlEncode(sr);
        sr1 = Regex.Replace(sr1, @"<[^>]+>|&nbsp;", "").Trim();

        conn.Open();
        us = (string)Session["username"];
        db = (string)Session["date"];
        SqlCommand CMD = new SqlCommand("select diary from Record where Username='" + us + "'and Date ='" + db + "'", conn);
        SqlDataReader da = CMD.ExecuteReader();
        if (da.Read())
        {
            conn.Close();
            conn.Open();
            SqlCommand Cm = new SqlCommand("update Record set diary='" + sr1+ "'where Username='" + us + "'and Date ='" + db + "'", conn);
            Cm.ExecuteNonQuery();
            conn.Close();
           
        }
        else
        {
          
            try
            {
                conn.Close();
                conn.Open();
                SqlCommand cmd = new SqlCommand("insert into Record Values('" + us + "','" + db + "','" + sr1 + "')", conn);
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            catch (Exception ex)
            {
                Label1.Text = ex.Message;
            }
     




        }
    }
    protected void diary_TextChanged(object sender, EventArgs e)
    {
        /* conn.Open();
        us = Session["username"].ToString();
        db = Session["date"].ToString();
        SqlCommand CMD = new SqlCommand("select diary from Record where Username='" + us + "'and Date ='" + db + "'", conn);
        SqlDataReader da = CMD.ExecuteReader();
        if (da.Read())
        {
            Label1.Text = diary.Text;
            conn.Close();
            conn.Open();
            SqlCommand Cm = new SqlCommand("update Record set diary='" + diary.Text + "'where Username='" + us + "'and Date ='" + db + "'", conn);
            Cm.ExecuteNonQuery();
            conn.Close();
        }*/

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string sr, sr1;
        sr = editor1.Text;
        sr1 = Server.HtmlDecode(sr);
      //  sr1 = sr1.Replace("<p>", "").Replace("</p>", "").Replace("<big>", "").Replace("<code>","").Replace("<kbd>","").Replace("<span>","").Replace("","");
        
      sr1=  Regex.Replace(sr1, @"<[^>]+>|&nbsp;", "").Trim();

        


       if(sr1!="")
       {

        conn.Open();
        SqlCommand cmd = new SqlCommand("insert into share values('"+Session["username"].ToString()+"','"+TextBox1.Text+"','"+Session["date"].ToString()+"','"+sr1+"')",conn);
        cmd.ExecuteNonQuery();
        conn.Close();
        Label1.Text = "send to friend";
       }

       else
       {
           Label1.Text = "enter the friendz name";


       }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session.Contents.Remove("username");
        Response.Redirect("Default.aspx");

    } 
}