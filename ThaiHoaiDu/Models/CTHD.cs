//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ThaiHoaiDu.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class CTHD
    {
        public int MaHD { get; set; }
        public int MaSP { get; set; }
        public Nullable<int> SoLuong { get; set; }
        public Nullable<decimal> ThanhTien { get; set; }
    
        public virtual HoaDon HoaDon { get; set; }
        public virtual Spham Spham { get; set; }
    }
}
