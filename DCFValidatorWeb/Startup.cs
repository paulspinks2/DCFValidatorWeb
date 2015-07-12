using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DCFValidatorWeb.Startup))]
namespace DCFValidatorWeb
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
