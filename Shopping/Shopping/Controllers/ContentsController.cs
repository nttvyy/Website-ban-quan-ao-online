using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Shopping.Models;
using System.IO;
using System.Data;
using System.Data.SqlClient;

namespace Shopping.Controllers
{
    public class ContentsController : Controller
    {
       
        // GET: Content
        public ActionResult Index()
        {
            return View();
        }

        // GET: Content/Details/5
        
    }
}
