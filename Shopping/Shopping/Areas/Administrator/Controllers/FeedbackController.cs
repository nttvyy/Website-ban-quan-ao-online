using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Shopping.Models;

namespace Shopping.Areas.Administrator.Controllers
{
    public class FeedbackController : Controller
    {
        QAShop1Entities3 db = new QAShop1Entities3();
        // GET: Administrator/Feedback
        public ActionResult Index()
        {
            return View(db.Feedbacks.ToList());
        }
    }
}