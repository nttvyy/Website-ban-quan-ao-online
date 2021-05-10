using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Xml.Linq;
using Shopping.Models;

namespace Shopping.Controllers
{
    public class LoginController : Controller
    {
        QAShopEntities db = new QAShopEntities();
       

        // GET: Login
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]

        public ActionResult Login(User a)
        {
            var check = db.Users.Where(s => s.UserID == a.UserID && s.Password == a.Password && s.Email==a.Email).FirstOrDefault();
            if (check == null)
            {
                ViewBag.ErrorInfo = "Sai info";
                return View("Index");
            }
            else
            {
                db.Configuration.ValidateOnSaveEnabled = false;
                Session["UserID"] = a.UserID;
                Session["Password"] = a.Password;
                return RedirectToAction("Index", "Product");
            }
        }
        public ActionResult LogOut()
        {
            Session.Abandon();
            return RedirectToAction("Index", "Login");
        }
        //Get Register
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult RegisterUser(RegisterModel re)
        {
            if (ModelState.IsValid)
            {
                var dao = new User();
                var check = db.Users.Where(s => s.UserID == dao.UserID).FirstOrDefault();
                if (check == null)
                {
                    db.Configuration.ValidateOnSaveEnabled = false;
                    ViewBag.Success = "Đăng ký thành công";
                    return RedirectToAction("Index");
                    if (!string.IsNullOrEmpty(re.ProvinceID))
                    {
                        dao.Province = int.Parse(re.ProvinceID);
                    }
                    if (!string.IsNullOrEmpty(re.DistrictID))
                    {
                        dao.District = int.Parse(re.DistrictID);
                    }
                    var result = Insert(dao);
                    if (result > 0)
                    {
                        ViewBag.Success = "Đăng ký thành công";
                        re = new RegisterModel();
                    }
                    else
                    {
                        ModelState.AddModelError("", "Đăng ký không thành công.");
                    }
                }
                else
                {
                    ViewBag.ErrorReg = "This is ID exist";
                    return View();
                }
            }
            return View();
        }
        public long Insert(User entity)
        {
            db.Users.Add(entity);
            db.SaveChanges();
            return entity.UserID;
        }
        public JsonResult LoadProvince()
        {
            var xmlDoc = XDocument.Load(Server.MapPath(@"~/Content/data/Provinces_Data.xml"));

            var xElements = xmlDoc.Element("Root").Elements("Item").Where(x => x.Attribute("type").Value == "province");
            var list = new List<ProvinceModel>();
            ProvinceModel province = null;
            foreach (var item in xElements)
            {
                province = new ProvinceModel();
                province.ID = int.Parse(item.Attribute("id").Value);
                province.Name = item.Attribute("value").Value;
                list.Add(province);

            }
            return Json(new
            {
                data = list,
                status = true
            });
        }
        public JsonResult LoadDistrict(int provinceID)
        {
            var xmlDoc = XDocument.Load(Server.MapPath(@"~/Content/data/Provinces_Data.xml"));

            var xElement = xmlDoc.Element("Root").Elements("Item")
                .Single(x => x.Attribute("type").Value == "province" && int.Parse(x.Attribute("id").Value) == provinceID);

            var list = new List<DistrictModel>();
            DistrictModel district = null;
            foreach (var item in xElement.Elements("Item").Where(x => x.Attribute("type").Value == "district"))
            {
                district = new DistrictModel();
                district.ID = int.Parse(item.Attribute("id").Value);
                district.Name = item.Attribute("value").Value;
                district.ProvinceID = int.Parse(xElement.Attribute("id").Value);
                list.Add(district);

            }
            return Json(new
            {
                data = list,
                status = true
            });
        }
    }
}