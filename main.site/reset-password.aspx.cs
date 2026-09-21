using System;
using System.Web.UI;

namespace main.site
{
    public partial class ResetPassword : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // In production, update the user password in database/store
                string newPassword = txtNewPassword.Text.Trim();
                // Redirect user to login page after successful reset
                Response.Redirect("~/login.aspx");
            }
        }
    }
}
