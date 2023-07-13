using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface INhanVienBusiness
    {
        Task<List<NhanVien >> GetAllNhanVien();
        Task<NhanVien> GetByIdNhanVien(int id);
        bool Create(NhanVien model);
        Task<bool> Delete(int id);
        List<NhanVien> Search(int pageIndex, int pageSize, out long total, string tennhanvien, string email);
    }
}
