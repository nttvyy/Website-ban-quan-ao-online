using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Shopping.Models;

namespace Shopping.Areas.Administrator.Controllers
{
    public class ChatLieuController : Controller
    {
        private QAShopEntities db = new QAShopEntities();

        // GET: Administrator/ChatLieu
        public ActionResult Index()
        {
            return View(db.Material1.ToList());
        }

        // GET: Administrator/ChatLieu/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Material1 m = db.Material1.Find(id);
            if (m == null)
            {
                return HttpNotFound();
            }
            return View(m);
        }

        // GET: Administrator/ChatLieu/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Administrator/ChatLieu/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID_Material,Name")] Material1 s)
        {
            if (ModelState.IsValid)
            {
                db.Material1.Add(s);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(s);
        }

        // GET: Administrator/ChatLieu/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Material1 s = db.Material1.Find(id);
            if (s == null)
            {
                return HttpNotFound();
            }
            return View(s);
        }

        // POST: Administrator/ChatLieu/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID_Material,Name")] Material1 s)
        {
            if (ModelState.IsValid)
            {
                db.Entry(s).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(s);
        }

        // GET: Administrator/ChatLieu/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Material1 s = db.Material1.Find(id);
            if (s == null)
            {
                return HttpNotFound();
            }
            return View(s);
        }

        // POST: Administrator/ChatLieu/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Material1 s = db.Material1.Find(id);
            db.Material1.Remove(s);
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
