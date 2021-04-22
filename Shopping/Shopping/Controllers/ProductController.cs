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
    public class ProductController : Controller
    {
        string conString = "Data Source=. ;Initial Catalog = OnlineShop; Integrated Security = True;";
        QuanAoOnlineEntities db = new QuanAoOnlineEntities();
        // GET: Product
        public ActionResult Index(string name)
        {
            if (name == null)
            {
                return View(db.Products.ToList());
            }
            else
            {
                return View(db.Products.Where(s=> s.Name.Contains(name)).ToList());
            }
            
        }
        // GET: Product/Create
        public ActionResult Create()
        {
            Product p = new Product();
            return View(p);
        }

        // POST: Product/Create
        [HttpPost]      
        public ActionResult Create(Product pro)
        {
            try
             {
                 // TODO: Add insert logic here
                 if (pro.ImageUpload != null)
                 {
                     string file = Path.GetFileNameWithoutExtension(pro.ImageUpload.FileName);
                     string extension = Path.GetExtension(pro.ImageUpload.FileName);
                     file = file + extension;
                     pro.Image = "/Content/images/" + file;
                     //pro.MoreImages= "~/Contents/images/" + file;
                     pro.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/images/"), file));
                 }
                 db.Products.Add(pro);
                 db.SaveChanges();
                 return RedirectToAction("Index");
             }
             catch (Exception e)
            {
                 return View();
             }
            
            return View();
        }
        private DataTable GetFileDetails()
        {
            DataTable dtData = new DataTable();
            SqlConnection con = new SqlConnection(conString);
            con.Open();
            SqlCommand command = new SqlCommand("Select * From Product", con);
            SqlDataAdapter da = new SqlDataAdapter(command);
            da.Fill(dtData);
            con.Close();
            return dtData;
        }
        private bool SaveFile(Product pro)
        {
            string strQry = "INSERT INTO Product (Image) VALUES('" +
                pro.Image + "')";
            SqlConnection con = new SqlConnection(conString);
            con.Open();
            SqlCommand command = new SqlCommand(strQry, con);
            int numResult = command.ExecuteNonQuery();
            con.Close();
            if (numResult > 0)
                return true;
            else
                return false;
        }
    

    // GET: Product/Edit/5
    public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Product/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Product/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Product/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }

        }
        //Cate
        public ActionResult SelectCate()
        {
            ProductCategory cate = new ProductCategory();
            cate.ListCate = db.ProductCategories.ToList<ProductCategory>();
            return PartialView(cate);
        }
    }
}
