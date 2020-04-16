
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ThaiHoaiDu.Models;

namespace ThaiHoaiDu.Controllers
{
    public class ThongKeController : Controller
    {
        QuanLyQuanNuocEntities db = new QuanLyQuanNuocEntities();
        // GET: ThongKe
        public ActionResult Index()
        {
            return View();
        }
        public PartialViewResult tkNgay()
        {
            return PartialView(db.CTHDs.Where(t => DbFunctions.DiffDays(t.HoaDon.GioRa, DateTime.Now) <= 1 && t.HoaDon.GioRa != null).ToList());
        }
        public PartialViewResult tkTuan()
        {
            return PartialView(db.CTHDs.Where(t => DbFunctions.DiffDays(t.HoaDon.GioRa, DateTime.Now) <= 7 && t.HoaDon.GioRa != null).ToList());
        }
        public PartialViewResult tkThang()
        {
            return PartialView(db.CTHDs.Where(t => t.HoaDon.GioRa.Value.Month == DateTime.Now.Month && t.HoaDon.GioRa.Value.Year == DateTime.Now.Year && t.HoaDon.GioRa != null).ToList());
        }
        public PartialViewResult tkNam()
        {
            return PartialView(db.CTHDs.Where(t => t.HoaDon.GioRa.Value.Year == DateTime.Now.Year && t.HoaDon.GioRa != null).ToList());
        }
    }
}