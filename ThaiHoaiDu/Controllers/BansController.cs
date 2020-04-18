using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ThaiHoaiDu.Models;

namespace ThaiHoaiDu.Controllers
{
    public class BansController : Controller
    {
        private QuanLyQuanNuocEntities db = new QuanLyQuanNuocEntities();

        // GET: Bans
        public ActionResult Index()
        {
            return View(db.Bans.ToList());
        }

      
        // POST: Bans/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaBan,SoBan,TinhTrang,HienTrang")] Ban ban)
        {
            if (ModelState.IsValid)
            {
                ban.TinhTrang = 1;
                ban.HienTrang = true;
                db.Bans.Add(ban);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(ban);
        }

        // GET: Bans/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Ban ban = db.Bans.Find(id);
            if (ban == null)
            {
                return HttpNotFound();
            }
            return View(ban);
        }

        // POST: Bans/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaBan,SoBan,TinhTrang,HienTrang")] Ban ban)
        {
            if (ModelState.IsValid)
            {
                db.Entry(ban).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(ban);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
