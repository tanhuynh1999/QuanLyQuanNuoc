using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ThaiHoaiDu.Models;

namespace ThaiHoaiDu.Controllers
{
    public class ChiTietBanController : Controller
    {
        QuanLyQuanNuocEntities db = new QuanLyQuanNuocEntities();
        // GET: ChiTietBan
        public RedirectToRouteResult ktraBan(int? id)
        {
            bool ktra = db.Bans.FirstOrDefault(t => t.MaBan == id && t.TinhTrang == 0) != null;
            if (ktra)
            {
                return RedirectToAction("taoHD", new { id = id});
            }
            else
            {
                return RedirectToAction("hienHD");
            }
        }
        public RedirectToRouteResult taoHD(int id)
        {
            HoaDon hd = new HoaDon()
            {
                MaBan = id,
                GioVao = DateTime.Now,
                TinhTrang = false
            };
            db.HoaDons.Add(hd);
            db.SaveChanges();
            HoaDon hd1 = db.HoaDons.FirstOrDefault(t => t.TinhTrang == false && t.MaBan == id);
            return RedirectToAction("hienHD", new { id = hd.MaHD });
        }
        public ActionResult hienHD(int? id)
        {
            HoaDon hd = db.HoaDons.Find(id);
            ViewBag.MaSP = new MultiSelectList(db.Sphams.ToList(), "MaSanPham", "TenSanPham", hd.CTHDs.Select(t => t.MaSP).ToArray());
            return View(hd);
        }
        [HttpPost]
        public ActionResult hienHD(HoaDon hd, int[] MaSP)
        {
            hd.GioRa = DateTime.Now;
            // remove item

            var removeitems = hd.CTHDs.Where(t => !MaSP.Contains(t.MaSP)).ToList();

            foreach (var i in removeitems)
            {
                db.Entry(i).State = EntityState.Deleted;
            }

            // add item

            var additems = MaSP.Where(t => !hd.CTHDs.Select(x => x.MaSP).Contains(t));

            foreach (var item in additems)
            {
                CTHD cthd = new CTHD();
                cthd.MaHD = hd.MaHD;
                cthd.MaSP = item
                    ;
                cthd.SoLuong = 1;
                db.CTHDs.Add(cthd);
            }
            db.SaveChanges();
            return View();
        }
    }
}