using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Shopping.Models;

namespace WebThoiTrangTreEm.Areas.Administrator.Controllers
{
    public class HomeController : Controller
    {
        QAShopEntities db = new QAShopEntities();
        // GET: Administrator/Home
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(string username, string password)
        {
            User user = db.Users.SingleOrDefault(x => x.UserName == username && x.Password == password && x.Role == 1);
            if(user != null)
            {
                Session["userid"] = user.UserID;
                Session["username"] = user.UserName;
                return RedirectToAction("Index");
            }
            ViewBag.error = "Sai tên đăng nhập hoặc mật khẩu!";
            return View();
        }
        public ActionResult LogOut()
        {
            Session.Abandon();
            return RedirectToAction("Index", "Home");
        }
        //Get Register
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]

        public ActionResult RegisterUser(User a)
        {
            if (ModelState.IsValid)
            {
                var check = db.Users.Where(s => s.UserID == a.UserID).FirstOrDefault();
                if (check == null)
                {
                    db.Configuration.ValidateOnSaveEnabled = false;
                    db.Users.Add(a);
                    db.SaveChanges();
                    return RedirectToAction("Login");
                }
                else
                {
                    ViewBag.ErrorReg = "This is ID exist";
                    return View();
                }
            }
            return View();
        }
    }
}