using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Shopping.Models;
using System.IO;
using System.Data;
using System.Data.SqlClient;

namespace Shopping.Areas.Administrator.Controllers
{
    public class TinTucController : Controller
    {
        QAShopEntities db = new QAShopEntities();
        // GET: Content
        public ActionResult Index()
        {
            return View(db.News.ToList());
        }

        // GET: Content/Details/5
        public ActionResult Details(int id)
        {
            return View(db.News.Where(s => s.NewID == id).FirstOrDefault());
        }
        public ActionResult SelectCate()
        {
            ProductCategory cate = new ProductCategory();
            //cate.ListCate = db.ProductCategories.ToList<ProductCategory>();
            return PartialView(cate);
        }

        // GET: Content/Create
        public ActionResult Create()
        {
            News con = new News();
            return View();
        }

        // POST: Content/Create
        [HttpPost]
        public ActionResult Create(News con)
        {
            try
            {
                // TODO: Add insert logic here
                if (con.ImageUpload != null)
                {
                    string file = Path.GetFileNameWithoutExtension(con.ImageUpload.FileName);
                    string extension = Path.GetExtension(con.ImageUpload.FileName);
                    file = file + extension;
                    con.Image = "/Content/images/" + file;
                    //pro.MoreImages= "~/Contents/images/" + file;
                    con.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/images/"), file));
                }
                db.News.Add(con);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception e)
            {
                return View();
            }

        }

        // GET: Content/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Content/Edit/5
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

        // GET: Content/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Content/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
