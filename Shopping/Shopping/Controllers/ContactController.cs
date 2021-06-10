using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Shopping.Models;

namespace Shopping.Controllers
{
    public class ContactController : Controller
    {
        QAShop1Entities3 db = new QAShop1Entities3();
        // GET: Contact
        public ActionResult Contact()
        {
            ViewBag.SanPhamMoi = db.Products.OrderByDescending(x => x.CreatedDate).Take(4).ToList();
            ViewBag.CoTheBanThich = db.Products.Where(m => m.CategoryID == 3).ToList();
            return View();
        }
        //public int GuidId()
        //{
        //    var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        //    var stringChars = new char[10];
        //    var random = new Random();

        //    for (int i = 0; i < stringChars.Length; i++)
        //    {
        //        stringChars[i] = chars[random.Next(chars.Length)];
        //    }

        //    var finalString = new String(stringChars);
        //    return finalString;
        //}
        public ActionResult Feedback(FormCollection form)
        {
            Feedback fb = new Feedback();
            fb.Name = form["NameFeedback"];
            fb.Mail = form["MailFeedback"];
            fb.Description = form["Motafeedback"];
            db.Feedbacks.Add(fb);
            db.SaveChanges();
            return RedirectToAction("Feedback_Success", "Contact");
        }
        public ActionResult Feedback_Success()
        {
            return View();
        }
    }
}