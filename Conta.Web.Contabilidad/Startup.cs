using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Conta.Web.Contabilidad.Startup))]
namespace Conta.Web.Contabilidad
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
