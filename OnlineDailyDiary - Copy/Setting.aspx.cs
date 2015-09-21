using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;


public partial class Setting : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database1ConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("Default.aspx");


        }
   


       
    }
    protected void Upload(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/images/") + fileName);
            Response.Redirect(Request.Url.AbsoluteUri);
            Image1.ImageUrl=("~/images/")+fileName;
            conn.Open();
            SqlCommand cmd = new SqlCommand("Insert into Signup (images) values(@Imagepath)", conn);
            cmd.Parameters.AddWithValue("@ImagePath", "images/" + fileName);
            cmd.ExecuteNonQuery();
            //Close dbconnection
            conn.Close();

        }

        

    }
   
    protected void Button1_Click(object sender, EventArgs e)
    {
        conn.Open();
        SqlCommand cmd = new SqlCommand("update Signup passwprd='"+txtPassword.Text+"'where usename='"+Session["username"].ToString()+"'");
        cmd.ExecuteNonQuery();
        conn.Close();
        SqlCommand cmd1= new SqlCommand("update Signup passwprd='"+txtPassword.Text+"'where usename='"+Session["username"].ToString()+"'");
        cmd1.ExecuteNonQuery();
        conn.Close();


    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Session.Contents.Remove("username");
        Response.Redirect("Default.aspx");
    }
}