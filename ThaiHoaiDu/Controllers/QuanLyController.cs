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
        public ActionResult Index(int? id)
        {
            Session["idbanngoi"] = id;
            if (id == null)
                Session["idbanngoi"] = id = 0;
            BanNgoi(id); 
            return View();
        }
        public PartialViewResult BanNgoi(int? id)
        {
            if(id == 0)
            {
                return PartialView(db.Bans.OrderBy(n => n.SoBan).ToList());
            }
            if(id == 1)
            {
                return PartialView(db.Bans.Where(t => t.TinhTrang == 0).OrderBy(n => n.SoBan).ToList());
            }   
            if(id == 2)
            {
                return PartialView(db.Bans.Where(t => t.TinhTrang == 1).OrderBy(n => n.SoBan).ToList());
            }
            return PartialView();
        }
        public ActionResult SanPham()
        {
            return View(db.Sphams.ToList());
        }
    }
}