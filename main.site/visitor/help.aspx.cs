using System;
using System.Web.UI;

namespace main.site
{
    public partial class VisitorHelp : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnlHelpSuccess.Visible = false;
            }
        }

        protected void btnSendHelp_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                pnlHelpSuccess.Visible = true;
                txtHelpName.Text = string.Empty;
                txtHelpMsg.Text = string.Empty;
            }
        }
    }
}
