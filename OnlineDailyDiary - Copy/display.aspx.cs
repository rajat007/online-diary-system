using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class display : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database1ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string str="";
        conn.Open();
        string xy="harsh";
        SqlCommand xmc = new SqlCommand("select message from share where username='"+xy+"'",conn);
        SqlDataReader da = xmc.ExecuteReader();
        if(da.HasRows)
        {
        while(da.Read())
        {
       
        str+="<tr><td>"+da[0].ToString()+"</td></tr>";
        }

            table_panel.Controls.Add(new LiteralControl(str));
        
        }

    }
}