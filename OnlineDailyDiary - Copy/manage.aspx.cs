using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class manage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("Default.aspx");


        }
      
    
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        Session["date"] = Calendar1.SelectedDate.ToShortDateString();
        Response.Redirect("manageTextbox.aspx");
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session.Contents.Remove("username");
        Response.Redirect("Default.aspx");
    }
}