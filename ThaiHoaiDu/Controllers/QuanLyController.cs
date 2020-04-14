using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ThaiHoaiDu.Models;

namespace ThaiHoaiDu.Controllers
{
    public class QuanLyController : Controller
    {
        QuanLyQuanNuocEntities db = new QuanLyQuanNuocEntities();
        // GET: QuanLy
        public ActionResult Index()
        {
            return View();
        }
        public PartialViewResult BanNgoi()
        {
            return PartialView(db.Bans.OrderBy(n=>n.SoBan).ToList());
        }
        public ActionResult SanPham()
        {
            return View(db.Sphams.ToList());
        }
        public ActionResult NhatKy()
        {
            return View();
        }
        public ActionResult NhatKyNgay()
        {
            return View();
        }

    }
}