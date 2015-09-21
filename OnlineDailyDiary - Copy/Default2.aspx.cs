using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        lblResult.Visible = true;
        if (Page.IsValid)
        {
            lblResult.Text = "You Got It!";
            
         //   lblResult.ForeColor = "green";
        }
        else
        {
            lblResult.Text = "Incorrect";
        }
    }
}