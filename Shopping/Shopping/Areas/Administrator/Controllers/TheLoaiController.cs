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
    public class TheLoaiController : Controller
    {
        private QAShopEntities db = new QAShopEntities();

        // GET: Administrator/TheLoai
        public ActionResult Index()
        {
            return View(db.ProductCategories.ToList());
        }

        // GET: Administrator/TheLoai/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductCategory theLoai = db.ProductCategories.Find(id);
            if (theLoai == null)
            {
                return HttpNotFound();
            }
            return View(theLoai);
        }

        // GET: Administrator/TheLoai/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Administrator/TheLoai/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,NameCategory")] ProductCategory theLoai)
        {
            if (ModelState.IsValid)
            {
                db.ProductCategories.Add(theLoai);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(theLoai);
        }

        // GET: Administrator/TheLoai/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductCategory theLoai = db.ProductCategories.Find(id);
            if (theLoai == null)
            {
                return HttpNotFound();
            }
            return View(theLoai);
        }

        // POST: Administrator/TheLoai/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,NameCategory")] ProductCategory theLoai)
        {
            if (ModelState.IsValid)
            {
                db.Entry(theLoai).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(theLoai);
        }

        // GET: Administrator/TheLoai/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductCategory theLoai = db.ProductCategories.Find(id);
            if (theLoai == null)
            {
                return HttpNotFound();
            }
            return View(theLoai);
        }

        // POST: Administrator/TheLoai/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            ProductCategory theLoai = db.ProductCategories.Find(id);
            db.ProductCategories.Remove(theLoai);
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
