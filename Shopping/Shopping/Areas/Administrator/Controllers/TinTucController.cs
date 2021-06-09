using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Shopping.Models;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Net;

namespace Shopping.Areas.Administrator.Controllers
{
    public class TinTucController : Controller
    {
        QAShop1Entities1 db = new QAShop1Entities1();
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
        //[Authorize(Roles = "Manager")]
        public ActionResult Create()
        {
            var role = Session["roleid"];
            if (role.ToString() != "1")
            {
                return Content("Bạn ko có quyền đăng nhập ");
            }
            else
            {
                News con = new News();
                return View();
            }
        }

        // POST: Content/Create
       // [Authorize(Roles = "Manager")]
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
       //[Authorize(Roles = "Manager")]
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Content/Edit/5
        [HttpPost]
       // [Authorize(Roles = "Manager")]
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
        // [Authorize(Roles = "Manager")]
        public ActionResult Delete(int id)
        {
            var role = Session["roleid"];
            if (role.ToString() != "1")
            {
                return Content("Bạn ko có quyền đăng nhập ");
            }
            else
            {
                if (id == 0)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                News s = db.News.Find(id);
                if (s == null)
                {
                    return HttpNotFound();
                }
                return View(s);
            }
        }

        // POST: Administrator/ChatLieu/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            News s = db.News.Find(id);
            db.News.Remove(s);
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
