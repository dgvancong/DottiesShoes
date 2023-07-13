using Model;
using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface IKhachHangBusiness
    {
        Task<KhachHang> GetByIdKhachHang(int id);
        bool Create(KhachHang model);
    }
}
