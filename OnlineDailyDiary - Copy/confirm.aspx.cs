using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class confirm : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database1ConnectionString"].ConnectionString);

protected void Page_Load(object sender, EventArgs e)
{
}

    protected void Button1_Click(object sender, EventArgs e)
    {
        conn.Open();
        int x;
        x=(int)Session["id"];
        SqlCommand cmd = new SqlCommand("Select code from verify where id="+x+"",conn);
        int m = Convert.ToInt32(TextBox1.Text);
        SqlDataReader da = cmd.ExecuteReader();
        da.Read();
        int y =(int)da[0];
        conn.Close();
        
        if (m == y)
        {
            conn.Open();
            da.Close();
            cmd = new SqlCommand("select username from Login where id=" + x + "", conn);
            da = cmd.ExecuteReader();
            da.Read();
            Session.Contents.Remove("id");
            Session["username"] = da[0].ToString();
            conn.Close();
            da.Close();
            conn.Open();
            cmd = new SqlCommand("update Login set bit=1 where username='"+Session["username"].ToString()+"'",conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("home.aspx");
           

        }
        else
        { Response.Redirect("Default.aspx");
        
        }

    }
    }

