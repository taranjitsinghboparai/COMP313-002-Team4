using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected UserLogin log;
    protected int userid;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Userid"] != null)
        {
            Response.Redirect("~/Home.aspx");
        }
        else
        {
            lbl_wrong_password.Text = "";  
        }

       // System.Diagnostics.Debug.WriteLine("In");

        log = new UserLogin();

    }


 
    protected void btn_Login_Click(object sender, EventArgs e)
    {
        System.Diagnostics.Debug.WriteLine("In");
        userid = log.GetUserID(txt_Email.Text, txt_pass.Text);
        if (userid == 0)
        {
            lbl_wrong_password.Text = "Either Username of password is wrong";
        }
        else
        {
            Session.Add("userid", userid);
         /*   if (Session["url"] != null)
            {
                Response.Redirect(Session["url"] + ".aspx");
            }
            else
            {*/
                Response.Redirect((String)Session["url"]);
            //}
        }

    }

    protected void btn_register_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }

}