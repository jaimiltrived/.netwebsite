using System;
using System.Web.UI;

namespace main.site
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string email = txtEmail.Text.Trim().ToLower();
                string pass = txtPassword.Text;

                if (email == "admin@svpms.demo" && pass == "admin123")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "authAdmin", "localStorage.setItem('svpms_logged_in','true');localStorage.setItem('svpms_role','admin');localStorage.setItem('svpms_name','Rajesh Sharma');localStorage.setItem('svpms_email','admin@svpms.demo');window.location.href='admin/dashboard.aspx';", true);
                }
                else if (email == "reception@svpms.demo" && pass == "reception123")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "authRec", "localStorage.setItem('svpms_logged_in','true');localStorage.setItem('svpms_role','receptionist');localStorage.setItem('svpms_name','Pooja Patel');localStorage.setItem('svpms_email','reception@svpms.demo');window.location.href='receptionist/dashboard.aspx';", true);
                }
                else if (email == "security@svpms.demo" && pass == "security123")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "authSec", "localStorage.setItem('svpms_logged_in','true');localStorage.setItem('svpms_role','security');localStorage.setItem('svpms_name','Vikram Singh');localStorage.setItem('svpms_email','security@svpms.demo');window.location.href='security/dashboard.aspx';", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "loginErr", "if(typeof showWarningToast==='function'){showWarningToast('Invalid email address or password.');}else{alert('Invalid credentials');}", true);
                }
            }
        }
    }
}
