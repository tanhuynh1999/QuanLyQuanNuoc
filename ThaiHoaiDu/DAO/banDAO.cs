using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ThaiHoaiDu.DAO
{
    public class banDAO
    {
        public int IDBan { get; set; }
        public int IDSanPham { get; set; }
        public string TenSP { get; set; }
        public int DonGia { get; set; }
        public int SoLuong { get; set; }
        public int ThanhTien
        {
            get
            {
                return SoLuong * DonGia;
            }
        }
    }
}