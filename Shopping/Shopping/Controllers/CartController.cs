using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Shopping.Models;

namespace Shopping.Controllers
{
    public class CartController : Controller
    {
        QAShop1Entities1 db = new QAShop1Entities1();
        // GET: Cart
        public ActionResult Cart()
        {
            if (Session["Content.GioHang"] == null)
                return View("EmptyCart");
            Content.GioHang gh = Session["Content.GioHang"] as Content.GioHang;
            ViewBag.SanPhamMoi = db.Products.OrderByDescending(x => x.CreatedDate).Take(4).ToList();
            ViewBag.CoTheBanThich = db.Products.Where(m => m.CategoryID == 3).ToList();
            return View(gh);
        }
        //Tao moi gio hang
        public Content.GioHang GetGioHang()
        {
            Content.GioHang gh = Session["Content.GioHang"] as Content.GioHang;
            if (gh == null || Session["Content.GioHang"] == null)
            {
                gh = new Content.GioHang();
                Session["Content.GioHang"] = gh;
            }
            ViewBag.SanPhamMoi = db.Products.OrderByDescending(x => x.CreatedDate).Take(4).ToList();
            ViewBag.CoTheBanThich = db.Products.Where(m => m.CategoryID == 3).ToList();
            return gh;
        }
        //them sp vao gio hang
        public ActionResult addtocart(int id)
        {
            var pro = db.Products.SingleOrDefault(s => s.ProductID == id);
            if (pro != null)
            {
                GetGioHang().ThemSPVaoGioHang(pro);
            }
            return RedirectToAction("Cart", "Cart");
        }
        //update gio hang
        public ActionResult Update_Cart_Qua(FormCollection form)
        {
            Content.GioHang cart = Session["Content.GioHang"] as Content.GioHang;
            int id = int.Parse(form["IDPro"]);
            int qua = int.Parse(form["QualityPro"]);
            cart.update_sp(id, qua);
            return RedirectToAction("Cart", "Cart");
        }
        //xoa gio hang
        public ActionResult Remove(int id)
        {
            Content.GioHang cart = Session["Content.GioHang"] as Content.GioHang;
            cart.XoaSP(id);
            return RedirectToAction("Cart", "Cart");

        }
        public PartialViewResult BagCart()
        {
            int total_quality = 0;
            Content.GioHang cart = Session["Content.GioHang"] as Content.GioHang;
            if (cart != null)
            {
                total_quality = cart.TongSP();

            }
            ViewBag.QuantityCart = total_quality;
            return PartialView("BagCart");
        }
        public ActionResult CustomerForm()
        {
            return View();
        }

        public string GuidId()
        {
            var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            var stringChars = new char[10];
            var random = new Random();

            for (int i = 0; i < stringChars.Length; i++)
            {
                stringChars[i] = chars[random.Next(chars.Length)];
            }

            var finalString = new String(stringChars);
            return finalString;
        }

        public ActionResult CheckOut(FormCollection form)
        {
            try
            { 
            Content.GioHang cart = Session["Content.GioHang"] as Content.GioHang;
                // Khach hang moi
                /* IDEA
                 * Tạo 1 hàm, trong đó đầu vào là 1 chuỗi cũ (gọi là chuỗi x)
                 * (VD: KH0001 -> Lấy từ db.TAIKHOAN.FindLast)
                 * x.Subtring (0,2) -> chuỗi tĩnh
                 * convert.ToInt(x.substring(2,last) -> số i cũ
                 * Tăng i++
                 * Convert i mới sang chuỗi 4 ký tự
                 * kết quả= chuỗi tỉnh + chuỗi i
                 */

                //Session["userid"] = kh.UserID;
                //var dn = Session["userid"];
                //if(dn==null)
                //{
                //    return RedirectToAction("Login","Login");
                //}   
                //else
                //{

                //}
                //kh.UserName
                //kh.MaKhachHang = this.GuidId();
                //kh.NgaySinh = DateTime.Now;
                ////kh.Us = form["TenKhachHang"];
                //kh.PhoneNumber = form["DienThoaiKhach"];
                //kh.Email = form["Email"];
                Order order = new Order();                    
                if (Convert.ToString(Session["userid"]) != "" )//login roi
                {
                    if(Convert.ToString(Session["xacnhan"]) == "")
                    {
                        return RedirectToAction("DNROI");
                    }    
                    else
                    {
                        Session.Remove("xacnhan");
                        order.UserID = Convert.ToInt32(Session["userid"]);
                        order.ShipAddress = db.Users.Where(s => s.UserID == order.UserID).FirstOrDefault().Address;
                        order.ShipName = db.Users.Where(s => s.UserID == order.UserID).FirstOrDefault().UserName;
                        order.ShipPhone = db.Users.Where(s => s.UserID == order.UserID).FirstOrDefault().PhoneNumber;
                        order.ShipEmail = db.Users.Where(s => s.UserID == order.UserID).FirstOrDefault().Email;
                        order.CreatedDate = DateTime.Now;
                    }                                   
                }
                else if (Convert.ToString(Session["userid_chuadn"]) == "")
                {
                    return RedirectToAction("CHUADN");
                }
                else
                {
                    order.UserID = Convert.ToInt32(Session["userid_chuadn"]);
                    order.ShipAddress = db.Users.Where(s => s.UserID == order.UserID).FirstOrDefault().Address;
                    order.ShipName = db.Users.Where(s => s.UserID == order.UserID).FirstOrDefault().UserName;
                    order.ShipPhone = db.Users.Where(s => s.UserID == order.UserID).FirstOrDefault().PhoneNumber;
                    order.ShipEmail = db.Users.Where(s => s.UserID == order.UserID).FirstOrDefault().Email;
                    order.CreatedDate = DateTime.Now;
                }
                // kh.UserID = int.Parse(this.GuidId());
                //var dn = Session["userid"];



                //order.OrderID = this.GuidId();//Đổi 1 lần 

                db.Orders.Add(order);

                foreach (var item in cart.Items)
                {
                    OrderDetail order_detail = new OrderDetail();
                    //order_detail.ID = i.ToString();
                    order_detail.OrderID = order.OrderID;
                    order_detail.ProductID = item.sp.ProductID;
                    //order_detail.ID = this.GuidId();
                    order_detail.Price = (int)item.sp.Price;
                    order_detail.Quantity = item.SoLuong;
                    db.OrderDetails.Add(order_detail);
                    foreach (var p in db.Products.Where(s => s.ProductID == order_detail.ProductID))
                    {
                        var update_quan_pro = p.TotalQuantity - item.SoLuong;
                        p.TotalQuantity = update_quan_pro;
                    }
                }

                db.SaveChanges();
                cart.ClearCart();

            return RedirectToAction("Check_out_success", "Cart");
        }
            catch(Exception e)
            {
                return Content("Error checkout. Please check information customer...");
            }
            
            
        }
        public ActionResult Check_out_success()
        {
            return View();
        }
        public ActionResult DNROI()
        {
            int id_user = Convert.ToInt32(Session["userid"]);
            return View(db.Users.Where(s => s.UserID == id_user).FirstOrDefault());
        }

        [HttpPost]
        public ActionResult DNROI(User us)
        {
            db.Entry(us).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            Session["xacnhan"] = "true";
            return RedirectToAction("CheckOut");
        }

        public ActionResult CHUADN()
        {
            User kh = new User();
            return View();
        }

        [HttpPost]
        public ActionResult CHUADN(User kh, string shipname, string DiaChiKhachHang, string shiphone, string shipmail)
        {
            kh.UserName = shipname;
            kh.Address = DiaChiKhachHang;
            kh.PhoneNumber = Convert.ToInt32(shiphone);
            kh.Email = shipmail;
            db.Users.Add(kh);
            db.SaveChanges();
            Session["userid_chuadn"] = kh.UserID;
            return RedirectToAction("CheckOut");
        }
    }
}