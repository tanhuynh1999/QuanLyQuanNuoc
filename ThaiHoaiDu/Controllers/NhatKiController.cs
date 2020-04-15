using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ThaiHoaiDu.Models;

namespace ThaiHoaiDu.Controllers
{
    public class NhatKiController : Controller
    {
        QuanLyQuanNuocEntities db = new QuanLyQuanNuocEntities();
        // GET: NhatKi
        public ActionResult Index(int? id)
        {
            DateTime dat = DateTime.Now;   
            if(id == 1)
            {
                ViewBag.ID = "tuần";
                return View(db.CTHDs.Where(t => DbFunctions.DiffDays(t.HoaDon.GioRa,dat) <= 7 && t.HoaDon.GioRa != null).OrderByDescending(t => t.HoaDon.GioRa).ToList());
            }
            else if(id == 2)
            {
                ViewBag.ID = "tháng";
                return View(db.CTHDs.Where(t => t.HoaDon.GioRa.Value.Month == dat.Month && t.HoaDon.GioRa.Value.Year == dat.Year && t.HoaDon.GioRa != null).OrderByDescending(t => t.HoaDon.GioRa).ToList());
            }
            else if(id == 3)
            {
                ViewBag.ID = "tất cả";
                return View(db.CTHDs.ToList());
            }
            ViewBag.ID = "ngày";
            return View(db.CTHDs.Where(t => t.HoaDon.GioRa.Value.Day == dat.Day && t.HoaDon.GioRa.Value.Month == dat.Month && t.HoaDon.GioRa.Value.Year == dat.Year && t.HoaDon.GioRa != null).OrderByDescending(t => t.HoaDon.GioRa).ToList());
        }
        public int truNgayTheoTuan(DateTime dat)
        {
            int kq = (DateTime.Now - dat).Days;
            if (kq > 7)
                return 0;
            return 1;
        }
    }
}