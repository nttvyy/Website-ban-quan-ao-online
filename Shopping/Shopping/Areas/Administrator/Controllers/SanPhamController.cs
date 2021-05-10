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
    public class SanPhamController : Controller
    {
        private QAShopEntities db = new QAShopEntities();

        // GET: Administrator/SanPham
        public ActionResult Index()
        {
            var sanPhams = db.Products.Include(s => s.Material1).Include(s => s.Size).Include(s => s.ProductCategory);
            return View(sanPhams.ToList());
        }

        // GET: Administrator/SanPham/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product sanPham = db.Products.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            return View(sanPham);
        }

        // GET: Administrator/SanPham/Create
        public ActionResult Create()
        {
            Product p = new Product();
            ViewBag.ID_Material = new SelectList(db.Material1, "ID_Material", "Name");
            ViewBag.IDSize = new SelectList(db.Sizes, "IDSize", "Name_Size");
            
            ViewBag.CategoryID = new SelectList(db.ProductCategories, "Id", "NameCategory");
            return View(p);
        }

        // POST: Administrator/SanPham/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Product sanPham)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    // TODO: Add insert logic here
                    if (sanPham.ImageUpload != null)
                    {
                        string file = Path.GetFileNameWithoutExtension(sanPham.ImageUpload.FileName);
                        string extension = Path.GetExtension(sanPham.ImageUpload.FileName);
                        file = file + extension;
                        sanPham.Image = "/Content/images/" + file;
                        //pro.MoreImages= "~/Contents/images/" + file;
                        sanPham.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/images/"), file));
                    }
                    db.Products.Add(sanPham);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                catch (Exception e)
                {
                    return View();
                }
            }

            ViewBag.ID_Material = new SelectList(db.Material1, "ID_Material", "Name", sanPham.ID_Material);
            //ViewBag.MaDoiTuong = new SelectList(db.DoiTuongs, "MaDoiTuong", "TenDoiTuong", sanPham.MaDoiTuong);
            ViewBag.IDSize = new SelectList(db.Sizes, "IDSize", "Name Size", sanPham.IDSize);
            // ViewBag.MaNhaSanXuat = new SelectList(db.NhaSanXuats, "MaNhaSanXuat", "TenNhaSanXuat", sanPham.MaNhaSanXuat);
            ViewBag.CategoryID = new SelectList(db.ProductCategories, "Id", "NameCategory", sanPham.CategoryID);
            return View(sanPham);
        }

        // GET: Administrator/SanPham/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product sanPham = db.Products.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            ViewBag.ID_Material = new SelectList(db.Material1, "ID_Material", "Name", sanPham.ID_Material);
            //ViewBag.MaDoiTuong = new SelectList(db.DoiTuongs, "MaDoiTuong", "TenDoiTuong", sanPham.MaDoiTuong);
            ViewBag.IDSize = new SelectList(db.Sizes, "IDSize", "Name Size", sanPham.IDSize);
           // ViewBag.MaNhaSanXuat = new SelectList(db.NhaSanXuats, "MaNhaSanXuat", "TenNhaSanXuat", sanPham.MaNhaSanXuat);
            ViewBag.CategoryID = new SelectList(db.ProductCategories, "Id", "NameCategory", sanPham.CategoryID);
            return View(sanPham);
        }

        // POST: Administrator/SanPham/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ProductID,ProductName,CategoryID,ID_Material,IDSize,TotalQuantity,Price,Description,CreatedDate,Image,CreatedBy")] Product sanPham)
        {
            if (ModelState.IsValid)
            {
                db.Entry(sanPham).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ID_Material = new SelectList(db.Material1, "ID_Material", "Name", sanPham.ID_Material);
            //ViewBag.MaDoiTuong = new SelectList(db.DoiTuongs, "MaDoiTuong", "TenDoiTuong", sanPham.MaDoiTuong);
            ViewBag.IDSize = new SelectList(db.Sizes, "IDSize", "Name Size", sanPham.IDSize);
            // ViewBag.MaNhaSanXuat = new SelectList(db.NhaSanXuats, "MaNhaSanXuat", "TenNhaSanXuat", sanPham.MaNhaSanXuat);
            ViewBag.CategoryID = new SelectList(db.ProductCategories, "Id", "NameCategory", sanPham.CategoryID);
            return View(sanPham);
        }

        // GET: Administrator/SanPham/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product sanPham = db.Products.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            return View(sanPham);
        }

        // POST: Administrator/SanPham/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Product sanPham = db.Products.Find(id);
            db.Products.Remove(sanPham);
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
