using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Shopping.Models;
using PagedList;
using PagedList.Mvc;

namespace Shopping.Controllers
{
    public class ProductController : Controller
    {
        QAShopEntities2 db = new QAShopEntities2();
        //get: Product
        public ActionResult Product(string category, int? page)
        {            
            int pageSize = 6;
            int pageNum = (page ?? 1);
            ViewBag.SanPhamMoi = db.Products.OrderByDescending(x => x.CreatedDate).Take(4).ToList();
            ViewBag.CoTheBanThich = db.Products.Where(m => m.CategoryID == 3).ToList();
            if (category == null)
            {
                var productList = db.Products.OrderByDescending(x => x.ProductName);
                return View(productList.OrderBy(x => x.ProductName).ToPagedList(pageNum, pageSize));
            }
            else
            {
                Session["namecate"] = category;
                var productList = db.Products.OrderByDescending(x => x.ProductName).Where(x => x.ProductCategory.NameCategory == category);
                return View(productList.OrderBy(x => x.ProductName).ToPagedList(pageNum, pageSize));
            }
        }
        public ActionResult SearchName(string searchString)
        {
            return View(db.Products.Where(s => s.ProductName.Contains(searchString) || searchString == null).ToList());
        }
    }
}