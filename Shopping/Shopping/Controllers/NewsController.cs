using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Shopping.Models;

namespace Shopping.Controllers
{
    public class NewsController : Controller
    {
        QAShopEntities2 db = new QAShopEntities2();
        // GET: News
        public ActionResult News()
        {
            return View(db.News.ToList());
        }
    }
}