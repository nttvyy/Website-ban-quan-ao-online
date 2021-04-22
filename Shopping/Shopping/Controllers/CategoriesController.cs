using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Shopping.Models;

namespace Shopping.Controllers
{
    public class CategoriesController : Controller
    {
        QuanAoOnlineEntities db = new QuanAoOnlineEntities();
        // GET: Categories
        public ActionResult Index()
        {
            return View(db.ProductCategories.ToList());
        }

        // GET: Categories/Details/5
        public ActionResult Details(int id)
        {
            return View(db.ProductCategories.Where(s => s.ID == id).FirstOrDefault());
        }

        // GET: Categories/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Categories/Create
        [HttpPost]
        public ActionResult Create(ProductCategory cate)
        {
            try
            {
                // TODO: Add insert logic here
                db.ProductCategories.Add(cate);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return Content("Error");
            }
        }

        // GET: Categories/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Categories/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Categories/Delete/5
        public ActionResult Delete(int id)
        {
            return View(db.ProductCategories.Where(s => s.ID == id).FirstOrDefault());
        }

        // POST: Categories/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, ProductCategory cate)
        {
            try
            {
                // TODO: Add delete logic here
                cate = db.ProductCategories.Where(s => s.ID == id).FirstOrDefault();
                db.ProductCategories.Remove(cate);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return Content("Error");
            }
        }
    }
}
