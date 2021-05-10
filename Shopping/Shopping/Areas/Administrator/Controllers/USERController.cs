using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Shopping.Models;
using System.IO;

namespace Shopping.Areas.Administrator.Controllers
{
    public class USERController : Controller
    {
        private QAShopEntities db = new QAShopEntities();

        // GET: Administrator/USER
        public ActionResult Index()
        {
            return View(db.Users.ToList());
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
        public ActionResult Create()
        {
            return View();
        }

        // POST: Administrator/USER/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "UserID,UserName,Password,Email,PhoneNumber,Address,Province,District,Role")] User uSER)
        {
            if (ModelState.IsValid)
            {
                db.Users.Add(uSER);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(uSER);
        }

        // GET: Administrator/USER/Edit/5
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
        public ActionResult Edit([Bind(Include = "UserID,UserName,Password,Email,PhoneNumber,Address,Province,District,Role")] User uSER)
        {
            if (ModelState.IsValid)
            {
                db.Entry(uSER).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(uSER);
        }

        // GET: Administrator/USER/Delete/5
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
