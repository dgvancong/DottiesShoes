using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.ViewModels.SanPham
{
    public class SanPhamVM
    {
        public string HinhAnh { get; set; }
        public int MaLoai { get; set; }
        public int MaNCC { get; set; }
        public string TenSP { get; set; }
        public string MoTa { get; set; }
        public DateTime NgayTao { get; set; }
        public List<SanPhamDetailCreateRequest?>? listjson_specifications { get; set; }
    }
}
