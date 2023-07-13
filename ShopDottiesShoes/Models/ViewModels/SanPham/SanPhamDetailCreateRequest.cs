using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.ViewModels.SanPham
{
    public class SanPhamDetailCreateRequest
    {
        public string MauSac { get; set; }
        public float DonGia { get; set; }
        public float Sale { get; set; }
        public string KichThuoc { get; set; }
        public int SoLuong { get; set; }
        public int ViewCout { get; set; }
    }
}
