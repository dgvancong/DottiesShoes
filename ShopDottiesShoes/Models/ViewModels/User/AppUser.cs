using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.ViewModels.User
{
    public class AppUser
    {
        public long MaKH { get; set; }
        public string HoTen { get; set; }
        public string SoDT { get; set; }
        public string Email { get; set; }
        public string DiaChi { get; set; }
        public string TaiKhoan { get; set; }
        public string MatKhau { get; set; }
    }
}