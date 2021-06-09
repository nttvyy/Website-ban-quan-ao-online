using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Shopping.Models;

namespace Shopping.Areas.Administrator.Controllers
{
    public class HomeController : Controller
    {
        QAShopEntities2 db = new QAShopEntities2();
        // GET: Administrator/HomePage
        public ActionResult Index()
        {
            return View();
        }
        //[HttpGet]
        //public ActionResult Login()
        //{
        //    return View();
        //}

        //[HttpPost]
        //public ActionResult Login(string username, string password)
        //{
        //    User user = db.Users.SingleOrDefault(x => x.UserName == username && x.Password == password && (x.ID_Role == 2 || x.ID_Role == 1));
        //    // User user1 = db.Users.SingleOrDefault(x => x.UserName == username && x.Password == password && x.ID_Role == 1);
        //    if (user != null)
        //    {
        //        Session["roleid"] = user.ID_Role;
        //        Session["userid"] = user.UserID;
        //        Session["username"] = user.UserName;
        //        return RedirectToAction("Index");

        //    }

        //    ViewBag.error = "Sai tên đăng nhập hoặc mật khẩu!";
        //    return View();
        //}
        //public ActionResult Logout()
        //{
        //    Session.Abandon();
        //    return RedirectToAction("Index");
        //}
    }
}