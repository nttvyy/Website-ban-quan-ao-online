using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Shopping.Models;

namespace Shopping.Controllers
{
    public class CategoryController : Controller
    {
        QAShop1Entities1 db = new QAShop1Entities1();
        // GET: Categories
        public PartialViewResult CategoryPartial()
        {
            var cateList = db.ProductCategories.ToList();
            return PartialView(cateList);
        }
    }
}