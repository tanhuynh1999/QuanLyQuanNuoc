using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.Mvc;
using ThaiHoaiDu.DAO;
using ThaiHoaiDu.Models;

namespace ThaiHoaiDu.Controllers
{
    public class ThemMonController : Controller
    {
        QuanLyQuanNuocEntities db = new QuanLyQuanNuocEntities();
        // GET: ThemMon
        public ActionResult Index(int IDBan)
        {
            Session["IDBAN"] = IDBan;
            ganSession(IDBan);
            List<banDAO> temp = Session["banDAO"] as List<banDAO>;
            return View(temp.ToList());
        }
        public PartialViewResult SanPham()
        {
            return PartialView(db.Sphams.ToList());
        }
        public void ganSession(int IDBan)
        {
            Session["banDAO"] = new List<banDAO>(); // khoi tao session ban tam aa
            List<banDAO> temp = Session["banDAO"] as List<banDAO>;
            List<CTHD> cthd = db.CTHDs.Where(t => t.HoaDon.MaBan == IDBan && t.HoaDon.TinhTrang == false).ToList();
            if (cthd == null)
                return;
            foreach(CTHD item in cthd)
            {
                banDAO ban = new banDAO()
                {
                    IDBan = (int)IDBan,
                    IDSanPham = item.MaSP,
                    DonGia = (int)item.Spham.Gia,
                    SoLuong = (int)item.SoLuong,
                    TenSP = item.Spham.TenSanPham
                };
                temp.Add(ban);
            }
        }
        public ActionResult ThemSP(int IDSP, int soLuong)
        {
            int IDBan = int.Parse(Session["IDBAN"].ToString());
            ganSession(IDBan);
            List<banDAO> giohang = Session["banDAO"] as List<banDAO>;  // Gán qua biến giohang dễ code
            int donGia = (int)db.Sphams.Find(IDSP).Gia;
            if (giohang.FirstOrDefault(t => t.IDSanPham == IDSP) == null)
            {
                banDAO ban = new banDAO()
                {
                    IDBan = IDBan,
                    IDSanPham = IDSP,
                    DonGia = donGia,
                    SoLuong = soLuong,
                    TenSP = db.Sphams.Find(IDSP).TenSanPham
                };
                giohang.Add(ban);
                if(giohang.Count == 1)
                {
                    HoaDon additemHD = new HoaDon()
                    {
                        GioVao = DateTime.Now,
                        MaBan = IDBan,
                        TinhTrang = false,
                        TongTien = donGia * soLuong
                    };
                    db.HoaDons.Add(additemHD);
                    db.SaveChanges();
                    db.Bans.Find(IDBan).TinhTrang = 0;
                }
                else
                {
                    HoaDon hoaDon = db.HoaDons.FirstOrDefault(t => t.MaBan == IDBan && t.TinhTrang == false);
                    hoaDon.TongTien += donGia * soLuong;
                }
                int maHD = (int)db.HoaDons.FirstOrDefault(t => t.MaBan == IDBan && t.TinhTrang == false).MaHD;
                CTHD additemCTHD = new CTHD()
                {
                    MaHD = maHD,
                    MaSP = IDSP,
                    SoLuong = soLuong,
                    ThanhTien = soLuong * donGia
                };
                db.CTHDs.Add(additemCTHD);
                db.SaveChanges();
            }
            else
            {
                banDAO ban = giohang.FirstOrDefault(t => t.IDSanPham == IDSP);
                ban.SoLuong += soLuong;
                int maHD = (int)db.HoaDons.FirstOrDefault(t => t.MaBan == IDBan && t.TinhTrang == false).MaHD;
                db.CTHDs.FirstOrDefault(t => t.MaHD == maHD && t.MaSP == IDSP).SoLuong += soLuong;
                db.CTHDs.FirstOrDefault(t => t.MaHD == maHD && t.MaSP == IDSP).ThanhTien += soLuong * donGia;
                db.HoaDons.Find(maHD).TongTien += soLuong * donGia;
                db.SaveChanges();
            }
            return Redirect(Request.UrlReferrer.ToString());
        }
        public ActionResult XoaSP(int idSP)
        {
            int IDBan = int.Parse(Session["IDBAN"].ToString());
            HoaDon removehd = db.HoaDons.FirstOrDefault(t => t.MaBan == IDBan && t.TinhTrang == false);
            CTHD removecthd = db.CTHDs.FirstOrDefault(t => t.MaSP == idSP && t.MaHD == removehd.MaHD);
            removehd.TongTien -= removecthd.ThanhTien;
            db.CTHDs.Remove(removecthd);
            db.SaveChanges();
            List<CTHD> cthd = db.CTHDs.Where(t => t.MaHD == removehd.MaHD).ToList();
            if(cthd.Count == 0)
            {
                removehd.Ban.TinhTrang = 1;
                db.HoaDons.Remove(removehd);
                db.SaveChanges();
            }
            ganSession(IDBan);
            return Redirect(Request.UrlReferrer.ToString());
        }
        public ActionResult ThanhToan()
        {
            int IDBan = int.Parse(Session["IDBAN"].ToString());
            if (db.HoaDons.FirstOrDefault(t => t.MaBan == IDBan && t.TinhTrang == false) == null)
            {
                ViewBag.ThanhToanTrong = "Không có giá trị để thanh toán!";
                return View();
            }
            Session["banDAO"] = null;
            db.Bans.Find(IDBan).TinhTrang = 1;
            db.HoaDons.FirstOrDefault(t => t.MaBan == IDBan && t.TinhTrang == false).GioRa = DateTime.Now;
            db.HoaDons.FirstOrDefault(t => t.MaBan == IDBan && t.TinhTrang == false).TinhTrang = true;
            db.SaveChanges();
            return Redirect("/QuanLy/Index");
        }
    }
}