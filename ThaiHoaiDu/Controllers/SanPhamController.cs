using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ThaiHoaiDu.Models;
using PagedList;
using PagedList.Mvc;
using System.Net;
using System.Data.Entity;
using System.IO;

namespace ThaiHoaiDu.Controllers
{
    public class SanPhamController : Controller
    {
        QuanLyQuanNuocEntities db = new QuanLyQuanNuocEntities();
        // GET: SanPham
        public ActionResult Index(int? id, int? page)
        {
            Session["idSP"] = id;
            if(id == 0 || id == null)
            {
                ViewBag.TBSP = "Tất cả";
                return View(db.Sphams.OrderBy(t => t.TenSanPham).ToPagedList(page ?? 1, 20));
            }
            ViewBag.TBSP = db.DanhMucs.Find(id).TenDanhMuc;
            return View(db.Sphams.Where(t => t.MaDanhMuc == id).OrderBy(t => t.TenSanPham).ToPagedList(page ?? 1, 20));
        }
        public PartialViewResult dsDanhMuc()
        {
            return PartialView(db.DanhMucs.ToList());
        }
        public ActionResult Create()
        {
            ViewBag.MaDanhMuc = new SelectList(db.DanhMucs, "MaDanhMuc", "TenDanhMuc");
            return View();
        }

        // POST: Sphams/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaSanPham,TenSanPham,Gia,Anh,PhanBiet,MaDanhMuc")] Spham spham, HttpPostedFileBase fileimg)
        {
            if (ModelState.IsValid)
            {
                // add file img
                var img = Path.GetFileName(fileimg.FileName);
                var pathimg = Path.Combine(Server.MapPath("~/Content/Layout/images"), img);
                if (fileimg == null)
                {
                    ViewBag.Img = "Chose images";
                    return View();
                }
                else if (System.IO.File.Exists(pathimg))
                    ViewBag.Img = "Images had exists";
                else
                    fileimg.SaveAs(pathimg);
                spham.Anh = fileimg.FileName;
                spham.HienTrang = true;
                db.Sphams.Add(spham);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaDanhMuc = new SelectList(db.DanhMucs, "MaDanhMuc", "TenDanhMuc", spham.MaDanhMuc);
            return View(spham);
        }

        // GET: Sphams/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Spham spham = db.Sphams.Find(id);
            if (spham == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaDanhMuc = new SelectList(db.DanhMucs, "MaDanhMuc", "TenDanhMuc", spham.MaDanhMuc);
            return View(spham);
        }

        // POST: Sphams/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaSanPham,TenSanPham,Gia,Anh,PhanBiet,MaDanhMuc,HienTrang")] Spham spham, HttpPostedFileBase fileimg)
        {
            if (ModelState.IsValid)
            {
                if(fileimg != null)
                {
                    var img = Path.GetFileName(fileimg.FileName);
                    var pathimg = Path.Combine(Server.MapPath("~/Content/Layout/images"), img);
                    if (fileimg == null)
                    {
                        ViewBag.Img = "Chose images";
                        return View();
                    }
                    else if (System.IO.File.Exists(pathimg))
                        ViewBag.Img = "Images had exists";
                    else
                        fileimg.SaveAs(pathimg);
                    spham.Anh = fileimg.FileName;
                }    
                db.Entry(spham).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaDanhMuc = new SelectList(db.DanhMucs, "MaDanhMuc", "TenDanhMuc", spham.MaDanhMuc);
            return View(spham);
        }

        public ActionResult DeleteConfirmed(int id)
        {
            foreach(CTHD item in db.CTHDs.Where(t => t.MaSP == id).ToList())
            {
                db.CTHDs.Remove(item);
                db.SaveChanges();
            }
            Spham spham = db.Sphams.Find(id);
            db.Sphams.Remove(spham);
            db.SaveChanges();
            return Redirect(Request.UrlReferrer.ToString());
        }
    }
}