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
    
    public partial class Spham
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Spham()
        {
            this.CTHDs = new HashSet<CTHD>();
        }
    
        public int MaSanPham { get; set; }
        public string TenSanPham { get; set; }
        public Nullable<decimal> Gia { get; set; }
        public string Anh { get; set; }
        public Nullable<bool> PhanBiet { get; set; }
        public Nullable<int> MaDanhMuc { get; set; }
        public Nullable<bool> HienTrang { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CTHD> CTHDs { get; set; }
        public virtual DanhMuc DanhMuc { get; set; }
    }
}
