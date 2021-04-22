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
        QuanAoOnlineEntities db = new QuanAoOnlineEntities();
       

        // GET: Login
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]

        public ActionResult Login(User1 a)
        {
            var check = db.User1.Where(s => s.ID == a.ID && s.Password == a.Password && s.Email==a.Email).FirstOrDefault();
            if (check == null)
            {
                ViewBag.ErrorInfo = "Sai info";
                return View("Index");
            }
            else
            {
                db.Configuration.ValidateOnSaveEnabled = false;
                Session["ID"] = a.ID;
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
                var dao = new User1();
                var check = db.User1.Where(s => s.ID == dao.ID).FirstOrDefault();
                if (check == null)
                {
                    db.Configuration.ValidateOnSaveEnabled = false;
                    ViewBag.Success = "Đăng ký thành công";
                    return RedirectToAction("Index");
                    if (!string.IsNullOrEmpty(re.ProvinceID))
                    {
                        dao.ProvinceID = int.Parse(re.ProvinceID);
                    }
                    if (!string.IsNullOrEmpty(re.DistrictID))
                    {
                        dao.DistrictID = int.Parse(re.DistrictID);
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
        public long Insert(User1 entity)
        {
            db.User1.Add(entity);
            db.SaveChanges();
            return entity.ID;
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