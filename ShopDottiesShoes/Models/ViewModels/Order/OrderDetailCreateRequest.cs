using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.ViewModels.Order
{
    public class OrderDetailCreateRequest
    {
        public int MaHoaDon { get; set; }
        public int MaSP { get; set; }
        public int SoLuong { get; set; }
        public float DonGia { get; set; }
    }
}
