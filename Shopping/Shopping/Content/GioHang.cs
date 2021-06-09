using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Shopping.Models;
namespace Shopping.Content
{
    public class GioHangItem
    {
        public  Product sp { get; set; }
        public int SoLuong { get; set; }
    }
    public class GioHang
    {
        List<GioHangItem> items = new List<GioHangItem>();
        public IEnumerable<GioHangItem> Items
        {
            get { return items; }
        }
        public void ThemSPVaoGioHang(Product sp, int sl = 1)
        {
            var item = Items.FirstOrDefault(s => s.sp.ProductID == sp.ProductID);
            if (item == null)
                items.Add(new GioHangItem
                {
                    sp = sp,



                    SoLuong = sl
                });
            else
            {
                item.SoLuong += sl;
            }
        }
        public int TongSP()
        {
            return items.Sum(s => s.SoLuong);
        }
        public decimal TongTien()
        {
            var total = items.Sum(s => s.SoLuong * s.sp.Price);
            return (decimal)total;
        }
        public void update_sp(int id, int new_sp)
        {
            var itm = items.Find(s => s.sp.ProductID == id);
            if (itm != null)
            {
                itm.SoLuong = new_sp;
            }
        }
        public void XoaSP(int id)
        {
            items.RemoveAll(s => s.sp.ProductID == id);
        }
        public void ClearCart()
        {
            items.Clear();
        }
        public void Update_quantity(int id, int _new_quan)
        {
            var item = items.Find(s => s.sp.ProductID == id);
            if (item != null)
            {
                if (items.Find(s => s.sp.TotalQuantity > _new_quan) != null)
                    item.SoLuong = _new_quan;
                else item.SoLuong = 1;
            }
        }
    }
}
