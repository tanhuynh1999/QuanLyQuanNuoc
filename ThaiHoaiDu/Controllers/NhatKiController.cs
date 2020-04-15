using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ThaiHoaiDu.Models;
using PagedList;
using PagedList.Mvc;

namespace ThaiHoaiDu.Controllers
{
    public class NhatKiController : Controller
    {
        QuanLyQuanNuocEntities db = new QuanLyQuanNuocEntities();
        // GET: NhatKi
        public ActionResult Index(int? id, int? page)
        {
            Session["idnk"] = id;
            int pagenum = (page ?? 1);
            DateTime dat = DateTime.Now;
            if (id == 1)
            {
                ViewBag.ID = "tuần";
                return PartialView(db.CTHDs.Where(t => DbFunctions.DiffDays(t.HoaDon.GioRa, dat) <= 7 && t.HoaDon.GioRa != null).OrderByDescending(t => t.HoaDon.GioRa).ToPagedList(pagenum, 10));
            }
            else if (id == 2)
            {
                ViewBag.ID = "tháng";
                return PartialView(db.CTHDs.Where(t => t.HoaDon.GioRa.Value.Month == dat.Month && t.HoaDon.GioRa.Value.Year == dat.Year && t.HoaDon.GioRa != null).OrderByDescending(t => t.HoaDon.GioRa).ToPagedList(pagenum, 10));
            }
            else if (id == 3)
            {
                ViewBag.ID = "tất cả";
                return PartialView(db.CTHDs.OrderByDescending(t => t.HoaDon.GioRa).ToPagedList(pagenum, 10));
            }
            ViewBag.id = 0;
            ViewBag.ID = "ngày";
            return PartialView(db.CTHDs.Where(t => t.HoaDon.GioRa.Value.Day == dat.Day && t.HoaDon.GioRa.Value.Month == dat.Month && t.HoaDon.GioRa.Value.Year == dat.Year && t.HoaDon.GioRa != null).OrderByDescending(t => t.HoaDon.GioRa).ToPagedList(pagenum, 10));
        }
    }

}