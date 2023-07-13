using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class SanPham
    {
        public int MaSP { get; set; }
        public string HinhAnh { get; set; }
        public int MaLoai { get; set; }
        public int MaNCC { get; set; }
        public string TenSP { get; set; }
        public string MoTa { get; set; }
        public DateTime NgayTao { get; set; }
        public double DonGia { get; set; }
        public string MauSac { get; set; }
        public string KichThuoc { get; set; }
        public int ViewCout { get; set; }

    }

    public class SanPhamEdit
    {
        public int MaSP { get; set; }
        public string HinhAnh { get; set; }
        public int MaLoai { get; set; }
        public int MaNCC { get; set; }
        public string TenSP { get; set; }
        public string MoTa { get; set; }
        public DateTime NgayTao { get; set; }
    }

}