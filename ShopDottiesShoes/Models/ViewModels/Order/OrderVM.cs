using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.ViewModels.Order
{
    public class OrderVM
    {
        //public int MaDonHang { get; set; }
        //public int MaKH { get; set; }
        public int? TrangThaiDonHang { get; set; }
        public string HoTen { get; set; }
        public string SoDT { get; set; }
        public string DiaChi { get; set; }
        public string GhiChu { get; set; }
        public List<OrderDetailCreateRequest?>? listjson_detail { get; set; }
    }
}
