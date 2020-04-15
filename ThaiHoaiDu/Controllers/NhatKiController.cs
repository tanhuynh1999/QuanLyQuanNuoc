using System;
using System.Collections.Generic;
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
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult doanhThuNgay()
        {
            DateTime dat = DateTime.Now;
            return View(db.HoaDons.Where(t => t.GioRa.Value.Day == dat.Day && t.GioRa.Value.Month == dat.Month && t.GioRa.Value.Year == dat.Year && t.GioRa == null).OrderByDescending(t => t.GioRa).ToList());
        }
    }
}