using System;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace Shopping.Models
{
    public class UserRoleProvider : AuthorizeAttribute
    {
        private string[] UserProfilesRequired { get; set; }

        public UserRoleProvider(params object[] userProfilesRequired)
        {
            if (userProfilesRequired.Any(p => p.GetType().BaseType != typeof(Enum)))
                throw new ArgumentException("userProfilesRequired");

            this.UserProfilesRequired = userProfilesRequired.Select(p => Enum.GetName(p.GetType(), p)).ToArray();
        }

        public override void OnAuthorization(AuthorizationContext context)
        {
            bool authorized = false;

            foreach (var role in this.UserProfilesRequired)
                if (HttpContext.Current.User.IsInRole(role))
                {
                    authorized = true;
                    break;
                }

            if (!authorized)
            {
                var url = new UrlHelper(context.RequestContext);
                var logonUrl = url.Action("Http", "Error", new { Id = 401, Area = "" });
                context.Result = new RedirectResult(logonUrl);

                return;
            }
        }
    }
  }