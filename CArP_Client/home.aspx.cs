using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace carpClient
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                user.InnerText = "Welcome  " + Session["user"].ToString() + " !";
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void hid_Click(object sender, EventArgs e)
        {
            Session["user"] = null;
        }
    }
}