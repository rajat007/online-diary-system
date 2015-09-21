using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;
using System.Text.RegularExpressions;

public partial class Default : System.Web.UI.Page
{
   // string cn = ConfigurationManager.ConnectionStrings["Database1ConnectionString"].ConnectionString;
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database1ConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] != null)
        {
            Response.Redirect("Default.aspx");


        }
        

    }
    protected void Button1_Click(object sender, EventArgs e)
    {


      // code for random number generation
        Random f = new Random();
        int code;
        code=f.Next(1000,9999);
        


            
            // code for sending the data to the signup table
                conn.Open();
                SqlCommand cmd = new SqlCommand("insert into Signup (Name,Username,Password,Emailid,id) Values(@name,@uname,@password,@email)", conn);
                SqlParameter x = new SqlParameter();
                x.ParameterName = "@name";
                x.Value = txtName.Text;
                cmd.Parameters.Add(x);
                SqlParameter y = new SqlParameter();
                y.ParameterName = "@uname";
                y.Value = txtUsername.Text;
                cmd.Parameters.Add(y);
                SqlParameter z = new SqlParameter();
                z.ParameterName = "@password";
                z.Value = txtPassword.Text;
                cmd.Parameters.Add(z);
                SqlParameter a = new SqlParameter();
                a.ParameterName = "@email";
                a.Value = txtEmail.Text;
                cmd.Parameters.Add(a);
                   cmd.ExecuteNonQuery();
                   conn.Close();
       // retriving the particular id assign to person for email verification           
        
        conn.Open();
                   SqlCommand x1 = new SqlCommand("Select id from Signup where Username=@uname",conn );
                       SqlParameter c =new SqlParameter();
        c.ParameterName="@uname";
        c.Value=txtUsername.Text;
        cmd.Parameters.Add(c);

                   SqlDataReader dx = x1.ExecuteReader();
                   dx.Read();
                   int r = Convert.ToInt32(dx[0].ToString());
                   dx.Close();
                   conn.Close();
                   conn.Open();
                SqlCommand cmd1 = new SqlCommand("insert into Login (Username,Password,id) values('" + txtUsername.Text + "','" + txtPassword.Text + "',"+r+")", conn);
                cmd1.ExecuteNonQuery();
                conn.Close();
               /* conn.Open();
                cmd=new SqlCommand("Select id from login where username='"+txtUsername.Text+"'",conn);
                SqlDataReader da=cmd.ExecuteReader();
                da.Read();
                Session["id"] =(int) da[0];
                conn.Close();*/

                Session["id"] = r;

                // code for sending the mail
                MAIL(txtEmail.Text, code);
              /*  
                MailMessage mail = new MailMessage();
                mail.To.Add(txtEmail.Text);

                mail.From = new MailAddress("rajatsingh.speed13@gmail.com");
                mail.Subject = "Password";

                string Body = "your dairy for you code is"+ code;
                mail.Body = Body;

                mail.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Credentials = new System.Net.NetworkCredential
                     ("");

                smtp.EnableSsl = true;
                smtp.Send(mail);
                */
      //inserting verification code in the table
        conn.Open();
        int id;
        id=(Int32)Session["id"];
        cmd = new SqlCommand("insert into verify Values("+r+"," + code + ")" ,conn);
      ///  n.Connection = conn;
        cmd.ExecuteNonQuery();

        conn.Close();
                Response.Redirect("confirm.aspx");

            
           
        }
    
    protected void txtUsername_TextChanged(object sender, EventArgs e)
    {
        conn.Open();
        SqlCommand cmd = new SqlCommand("Select Username from Signup where Username='" + txtUsername.Text + "'", conn);
        SqlDataReader da = cmd.ExecuteReader();
        da.Read();
        if (da.HasRows)
        {

            Label1.Text ="Username Not Available";
            Label1.ForeColor = System.Drawing.Color.Red;

        }
        else
        {
            Label1.Text = "Username  Available";
            Label1.ForeColor = System.Drawing.Color.Green;
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
       

        if (username.Text == "" && TextBox1.Text == "" )
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "scriptkey", "<script>alert('Fields cannot be empty');</script>");


        }
        else
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("Select bit from Login where Username=@name and Password=@password", conn);
            SqlParameter c = new SqlParameter();
            c.ParameterName = "@name";
            c.Value = username.Text;
            cmd.Parameters.Add(c);
            SqlParameter m = new SqlParameter();
            m.ParameterName = "@password";
            m.Value = TextBox1.Text;
            cmd.Parameters.Add(m);


            SqlDataReader da = cmd.ExecuteReader();
            da.Read();
            if (da.HasRows)
            {
                int count = Convert.ToInt32(da[0].ToString());
                if (count != 0)
                {
                    Session["username"] = username.Text;

                    Response.Redirect("home.aspx");



                }


                else
                {
                    Response.Redirect("confirm.aspx");
                }


            }

            else
            {

                Page.ClientScript.RegisterStartupScript(this.GetType(), "scriptkey", "<script>alert('Wrong password');</script>");
            }
        }
    }
    public void MAIL(string XMT, Int32 CODE)
    {

        MailMessage mail = new MailMessage();
        mail.To.Add(XMT);

        mail.From = new MailAddress("mailfromdiary4u@gmail.com");
        mail.Subject = "Password";

        string Body = "your dairy for you code is" + CODE;
        mail.Body = Body;

        mail.IsBodyHtml = true;
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Credentials = new System.Net.NetworkCredential
             ("mailfromdairy4u@gmail.com", "diaryforyou");

        smtp.EnableSsl = true;
        smtp.Send(mail);
    
    
    
    
    }
}
