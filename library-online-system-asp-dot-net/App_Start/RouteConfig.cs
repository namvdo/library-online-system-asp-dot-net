using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace library_online_system_asp_dot_net
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new {controller = "Home", action = "Index", id = UrlParameter.Optional}
            );

            routes.MapRoute(
                name: "Test",
                url:"{controller}/{action}"
            );

            routes.MapRoute(
                name: "Search",
                url:"{controller}/{action}/{keyword}",
                defaults: new {controller = "Home", action = "SearchResult", keyword = ""}
                );
            
        }

        
    }
}