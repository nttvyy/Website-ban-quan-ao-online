using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Shopping.Models;

namespace Shopping.Controllers
{
    public class ProductDetailController : Controller
    {
        QAShopEntities2 db = new QAShopEntities2();
        // GET: ProductDetail
        public ActionResult ProductDetail(int id, string category)
        {

            //Tìm sản phẩm có mã sản phẩm = id
            Product sp = db.Products.SingleOrDefault(x => x.ProductID == id);
            //Nếu không tìm thấy
            if (sp == null)
            {
                return HttpNotFound();
            }
            ViewBag.SanPhamMoi = db.Products.OrderByDescending(x => x.CreatedDate).Take(4).ToList();
            ViewBag.CoTheBanThich = db.Products.Where(m => m.CategoryID == 3).ToList();
            ViewBag.SanPhamBC = db.Products.OrderBy(x => x.TotalQuantity).Take(3).ToList();
            return View(sp);

        }
    }
}