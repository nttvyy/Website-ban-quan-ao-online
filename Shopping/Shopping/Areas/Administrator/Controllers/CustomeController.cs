using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Web;
using System.Web.Mvc;
using Shopping.Models;
namespace Shopping.Areas.Administrator.Controllers
{
    public class CustomeController : Controller
    {

        private QAShop1Entities1 db = new QAShop1Entities1();

        // GET: Administrator/TheLoai
        public ActionResult Index()
        {

            return View(db.Users.ToList().Where(m => m.ID_Role == 3));

        }

        // GET: Administrator/TheLoai/Details/5
        public ActionResult Details(int id)
        {
            if (id == 0)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User ui = db.Users.Find(id);
            if (ui == null)
            {
                return HttpNotFound();
            }
            return View(ui);
        }

        // GET: Administrator/TheLoai/Create
        //[Authorize(Roles = "Manager")]
        public ActionResult Create()
        {
            User u = new User();
            ViewBag.ID_Role = new SelectList(db.Users, "ID_Role", "RoleName");
            return View(u);
        }

        // POST: Administrator/USER/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        //[Authorize(Roles = "Manager")]
        public ActionResult Create(User u)
        {

            if (ModelState.IsValid)
            {
                try
                {
                    u.Password = GetMD5(u.Password);
                    u.Password = "123456";
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
        //[Authorize(Roles = "Manager")]
        public ActionResult Edit(int? id)
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

        // POST: Administrator/USER/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        //[Authorize(Roles = "Manager")]
        public ActionResult Edit([Bind(Include = "UserID,UserName,Email,PhoneNumber,Address,ID_Role")] User uSER)
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
       // [Authorize(Roles = "Manager")]
        public ActionResult Delete(int? id)
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

        // POST: Administrator/USER/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        //[Authorize(Roles = "Manager")]
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
    }
}