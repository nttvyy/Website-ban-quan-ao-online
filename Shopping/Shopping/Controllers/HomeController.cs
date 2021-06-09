using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Shopping.Models;

namespace Shopping.Controllers
{
    public class HomeController : Controller
    {
        QAShopEntities2 db = new QAShopEntities2();
        // GET: Home
        public ActionResult Index()
        {
            ViewBag.SanPhamMoi = db.Products.OrderByDescending(x => x.CreatedDate).Take(8).ToList();
            ViewBag.CoTheBanThich = db.Products.Where(m => m.CategoryID == 3).ToList();
            ViewBag.SanPhamBC = db.Products.OrderBy(x => x.TotalQuantity).Take(8).ToList();
            return View();
        }

        public ActionResult SanPhamMoi()
        {
            ViewBag.TrangSanPhamMoi = db.Products.OrderByDescending(x => x.CreatedDate).Take(10000).ToList();
            return View();
        }

    }
}