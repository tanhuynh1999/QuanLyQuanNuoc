using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ThaiHoaiDu.Controllers
{
    public class ThongBao_HienThiController : Controller
    {
        // GET: ThongBao_HienThi
        public PartialViewResult HuongDan()
        {
            return PartialView();
        }
    }
}