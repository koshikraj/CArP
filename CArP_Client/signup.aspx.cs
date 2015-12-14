using System;
using System.Runtime.Serialization;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using carpClient.carpRef;
namespace carpClient
{
    public partial class signup : System.Web.UI.Page
    {
        private static string imgS;
        protected void Page_Load(object sender, EventArgs e)
        {
            Service1 ser = new Service1();
            imgS = ser.Getcarp();
            contentContainer.Style.Add(" background-image", "url('" + imgS + ".jpg')");


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Service1 x = new Service1();
            disp.Text = x.storePassword(loginText.Value, Request.Form["Hidden"], imgS);
            Response.Redirect("login.aspx");

        }
    }
}