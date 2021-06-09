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
    public class OderDetailController : Controller
    {
        QAShop1Entities1 db = new QAShop1Entities1();
        // GET: Administrator/OderDetail
        public ActionResult Index(OrderDetail ct)
        {

            var chiTietDatHang = db.OrderDetails.Include(d => d.Order).Include(d=>d.Product);
            return View(chiTietDatHang.ToList());
        }

        // GET: Administrator/ChiTietDatHang/Details/5
        public ActionResult Details(int id)
        {
            if (id == 0)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OrderDetail chiTietDatHang = db.OrderDetails.Find(id);
            if (chiTietDatHang == null)
            {
                return HttpNotFound();
            }
            return View(chiTietDatHang);
        }

        //GET: Administrator/ChiTietDatHang/Create
        public ActionResult Create()
        {
            OrderDetail o = new OrderDetail();
            ViewBag.OrderID = new SelectList(db.Orders, "OrderID", "OrderID");
            ViewBag.ProductID = new SelectList(db.Products, "ProductID", "ProductName");
            return View(o);
        }

        // POST: Administrator/ChiTietDatHang/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID_OrderDetail,ProductID,OrderID,Quantity,Price,Discount,TotalPrice")] OrderDetail chiTietDatHang)
        {
            if (ModelState.IsValid)
            {
                db.OrderDetails.Add(chiTietDatHang);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.OrderID = new SelectList(db.Orders, "OrderID", "OrderID", chiTietDatHang.OrderID);
            ViewBag.ProductID = new SelectList(db.Products, "ProductID", "ProductName", chiTietDatHang.ProductID);
            return View(chiTietDatHang);
        }

        //// GET: Administrator/ChiTietDatHang/Edit/5
        //public ActionResult Edit(string id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    ChiTietDatHang chiTietDatHang = db.ChiTietDatHangs.Find(id);
        //    if (chiTietDatHang == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    ViewBag.SoHoaDon = new SelectList(db.DatHangs, "SoHoaDon", "MaKhachHang", chiTietDatHang.SoHoaDon);
        //    ViewBag.MaSanPham = new SelectList(db.SanPhams, "MaSanPham", "TenSanPham", chiTietDatHang.MaSanPham);
        //    return View(chiTietDatHang);
        //}

        //// POST: Administrator/ChiTietDatHang/Edit/5
        //// To protect from overposting attacks, enable the specific properties you want to bind to, for 
        //// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Edit([Bind(Include = "ID,MaSanPham,SoHoaDon,SoLuong,DonGia,ThanhTien")] ChiTietDatHang chiTietDatHang)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Entry(chiTietDatHang).State = EntityState.Modified;
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }
        //    ViewBag.SoHoaDon = new SelectList(db.DatHangs, "SoHoaDon", "MaKhachHang", chiTietDatHang.SoHoaDon);
        //    ViewBag.MaSanPham = new SelectList(db.SanPhams, "MaSanPham", "TenSanPham", chiTietDatHang.MaSanPham);
        //    return View(chiTietDatHang);
        //}

        // GET: Administrator/ChiTietDatHang/Delete/5
        public ActionResult Delete(int id)
        {
            if (id == 0)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OrderDetail chiTietDatHang = db.OrderDetails.Find(id);
            if (chiTietDatHang == null)
            {
                return HttpNotFound();
            }
            return View(chiTietDatHang);
        }

        // POST: Administrator/ChiTietDatHang/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            OrderDetail chiTietDatHang = db.OrderDetails.Find(id);
            db.OrderDetails.Remove(chiTietDatHang);
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