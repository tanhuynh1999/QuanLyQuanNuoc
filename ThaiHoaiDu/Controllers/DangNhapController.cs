﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ThaiHoaiDu.Models;

namespace ThaiHoaiDu.Controllers
{
    public class DangNhapController : Controller
    {
        QuanLyQuanNuocEntities db = new QuanLyQuanNuocEntities();
        // GET: Index
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(FormCollection f)
        {
            string sTaiKhoan = f["taikhoan"].ToString();
            string sMatKhau = f["password"].ToString();
            NguoiDung tk = db.NguoiDungs.SingleOrDefault(n => n.TaiKhoan == sTaiKhoan && n.MatKhau == sMatKhau);
            if(tk == null)
            {
                ViewBag.ThongBao = "Sai tài khoản hoặc mật khẩu!";
                return View();
            }
            else if (tk.VaiTro == true)
            {
                Session["TaiKhoan"] = tk;
                return Redirect("/QuanLy/Index");
            }
            else
            {
                Session["TaiKhoan"] = tk;
                return Redirect("/QuanLy/Index");
            }    
        }
        public ActionResult DangXuat()
        {
            Session["TaiKhoan"] = Session["IDBAN"] = null;
            return Redirect("/DangNhap/Index");
        }
    }
}