using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class ChiTietDonHang
    {
        public int MaChiTietDonHang { get; set; }
        public int MaDonHang { get; set; }
        public int MaSP { get; set; }
        public int SoLuong { get; set; }
        public float DonGia { get; set; }

        public string HinhAnh { get; set; }
        public string TenSP { get; set; }


    }
}
