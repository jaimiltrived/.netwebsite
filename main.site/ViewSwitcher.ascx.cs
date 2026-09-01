using System;
using System.Web;
using System.Web.Routing;
using System.Web.UI;
using Microsoft.AspNet.FriendlyUrls.Resolvers;

namespace main.site
{
    public partial class ViewSwitcher : UserControl
    {
        protected string CurrentView { get; private set; }
        protected string AlternateView { get; private set; }
        protected string SwitchUrl { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            var isMobile = WebFormsFriendlyUrlResolver.IsMobileView(new HttpContextWrapper(Context));
            CurrentView = isMobile ? "Mobile" : "Desktop";
            AlternateView = isMobile ? "Desktop" : "Mobile";

            var switchViewRouteName = "AspNet.FriendlyUrls.SwitchView";
            var switchViewRoute = RouteTable.Routes[switchViewRouteName];
            if (switchViewRoute != null)
            {
                var view = isMobile ? "Desktop" : "Mobile";
                SwitchUrl = GetRouteUrl(switchViewRouteName, new { view = view, __FriendlyUrls_SwitchViews = true });
            }
        }
    }
}
