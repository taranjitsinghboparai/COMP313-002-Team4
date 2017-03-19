using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    RegisterUser rg;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] != null)
        {
            Response.Redirect("Home.aspx");
        }

        if(IsPostBack)
            lbl_message.Text = "";
        
        rg = new RegisterUser();

    }
    protected void btn_register_Click(object sender, EventArgs e)
    {
       bool isRegistered =  rg.AddUser(txt_firstName.Text, txt_Email.Text, txt_pass.Text);
        if(isRegistered){
            Session.Add("userid", rg.GetID());
            Response.Redirect("~/Home.aspx");
        }
        else{
            lbl_message.Text = "User Seems to be Registered";
        }
    }
}