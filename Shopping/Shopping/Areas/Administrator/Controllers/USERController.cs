using System;
using System.Collections.Generic;
using System.Data;
using System.Xml.Linq;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Security.Cryptography;
using System.Web.Mvc;
using Shopping.Models;
using System.IO;

namespace Shopping.Areas.Administrator.Controllers
{
    public class USERController : Controller
    {
        private QAShop1Entities1 db = new QAShop1Entities1();

        // GET: Administrator/USER

        public ActionResult Index()
        {
            //var us = db.Users.Where(m => m.ID_Role == 1 && m.ID_Role == 2).SingleOrDefaultAsync(); ;
            return View(db.Users.ToList().Where(m => m.ID_Role ==2) );
        }

        // GET: Administrator/USER/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User uSER = db.Users.Find(id);
            if (uSER == null)
            {
                return HttpNotFound();
            }
            return View(uSER);
        }

        // GET: Administrator/USER/Create
        //[UserRoleProvider(Roles="Manager")]
        public ActionResult Create()
        {
            //User a = new User();
            var role = Session["roleid"];
            if (role.ToString() != "1")
            {
                return Content("Bạn ko có quyền đăng nhập ");
            }
            else
            {
                User u = new User();
                ViewBag.ID_Role = new SelectList(db.Users, "ID_Role", "RoleName");
                return View(u);
            }
        }

        // POST: Administrator/USER/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        //[UserRoleProvider(Roles = "Manager")]
        public ActionResult Create(User u)
        {

            if (ModelState.IsValid)
            {
                try
                {
                    u.Password = GetMD5(u.Password);
                    db.Configuration.ValidateOnSaveEnabled = false;
                    db.Users.Add(u);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                catch (Exception e)
                {
                    return View();
                }

            }
            ViewBag.ID_Role = new SelectList(db.Users, "ID_Role", "RoleName", u.ID_Role);
            return View(u);
        }
        //create a string MD5
        public static string GetMD5(string str)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] fromData = System.Text.Encoding.ASCII.GetBytes(str);
            byte[] targetData = md5.ComputeHash(fromData);
            string byte2String = null;

            for (int i = 0; i < targetData.Length; i++)
            {
                byte2String += targetData[i].ToString("x2");

            }
            return byte2String;
        }

        // GET: Administrator/USER/Edit/5
       // [Authorize(Roles = "Manager")]
        public ActionResult Edit(int? id)
        {
            var role = Session["roleid"];
            if (role.ToString() != "1")
            {
                return Content("Bạn ko có quyền đăng nhập ");
            }
            else
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                User uSER = db.Users.Find(id);
                if (uSER == null)
                {
                    return HttpNotFound();
                }
                return View(uSER);
            }
        }

        // POST: Administrator/USER/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
       // [Authorize(Roles = "Manager")]
        public ActionResult Edit([Bind(Include = "UserID,UserName,Password,Email,PhoneNumber,Address,ID_Role")] User uSER)
        {
            if (ModelState.IsValid)
            {
                db.Entry(uSER).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ID_Role = new SelectList(db.Users, "ID_Role", "RoleName", uSER.ID_Role);
            return View(uSER);
        }

        // GET: Administrator/USER/Delete/5
      //  [Authorize(Roles = "Manager")]
        public ActionResult Delete(int? id)
        {
            var role = Session["roleid"];
            if (role.ToString() != "1")
            {
                return Content("Bạn ko có quyền đăng nhập ");
            }
            else
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                User uSER = db.Users.Find(id);
                if (uSER == null)
                {
                    return HttpNotFound();
                }
                return View(uSER);
            }
        }

        // POST: Administrator/USER/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
       // [Authorize(Roles = "Manager")]
        public ActionResult DeleteConfirmed(int id)
        {
            User uSER = db.Users.Find(id);
            db.Users.Remove(uSER);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        public JsonResult LoadProvince()
        {
            var xmlDoc = XDocument.Load(Server.MapPath(@"/Content/data/Provinces_Data.xml"));

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
            var xmlDoc = XDocument.Load(Server.MapPath(@"/Content/data/Provinces_Data.xml"));

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
