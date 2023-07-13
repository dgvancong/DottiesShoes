using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using Models;


namespace DAL.Interfaces
{
    public interface IKhachHangRepository
    {
        Task<KhachHang> GetByIdKhachHang(int id);
        bool Create(KhachHang model);
        
    }
}
