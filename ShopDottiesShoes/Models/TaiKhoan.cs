using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class TaiKhoan
    {
        public int MaTaiKhoan { get; set; }
        public int MaNguoiDung { get; set; }
        public string TaiKhoann { get; set; }
        public string MatKhau { get; set; }
        public string TrangThai { get; set; }
        public string LoaiQuyet { get; set; }
    }
}
