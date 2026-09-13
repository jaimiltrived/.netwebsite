using System;
using System.Web.UI;

namespace main.site
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlContactSuccess.Visible = false;
            }
        }

        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // In a production app, persist the contact message or send notification email
                pnlContactSuccess.Visible = true;
                txtContactName.Text = string.Empty;
                txtContactEmail.Text = string.Empty;
                txtContactOrg.Text = string.Empty;
                txtContactMsg.Text = string.Empty;
            }
        }
    }
}
