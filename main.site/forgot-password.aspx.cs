using System;
using System.Web.UI;

namespace main.site
{
    public partial class ForgotPassword : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSendReset_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string email = txtForgotEmail.Text.Trim();
                ClientScript.RegisterStartupScript(this.GetType(), "forgotSuccess", "Swal.fire({title: 'Reset Link Sent!', text: 'We have sent a verification link to " + email + ".', icon: 'success', confirmButtonColor: '#2563EB', confirmButtonText: 'Proceed to Reset'}).then(() => { window.location.href = 'reset-password.aspx'; });", true);
            }
        }
    }
}
