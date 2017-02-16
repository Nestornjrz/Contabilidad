using System;
using System.Web.Mvc;
using System.Web.Routing;

namespace Conta.Web.Contabilidad
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                 name: "Default",
                 url: "{controller}/{action}/{id}",
                 defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                 // Set a constraint to only use this for routes identified as server-side routes
                 constraints: new
                 {
                     serverRoute = new ServerRouteConstraint(url =>
                     {
                         return !url.PathAndQuery.StartsWith("/app",
                             StringComparison.InvariantCultureIgnoreCase);
                     })
                 }
             );

            routes.MapRoute(
                name: "spa-fallback",
                url: "{*url}",
                defaults: new { controller = "Home", action = "Index" }
            );
        }
    }
}
