using BLL.Interfaces;
using DAL.Interfaces;
using Model;
using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public partial class NhanVienBusiness : INhanVienBusiness
    {
        private readonly INhanVienRepository _res;
        public NhanVienBusiness(INhanVienRepository res)
        {
            _res = res;
        }
        public async Task<List<NhanVien>> GetAllNhanVien()
        {
            return await _res.GetAllNhanVien();
        }
        public async Task<NhanVien> GetByIdNhanVien(int id)
        {
            return await _res.GetByIdNhanVien(id);
        }

        public bool Create(NhanVien model)
        {
            return _res.Create(model);
        }

        public async Task<bool> Delete(int id)
        {
            return await _res.Delete(id);
        }
        public List<NhanVien> Search(int pageIndex, int pageSize, out long total, string tennhanvien, string email)
        {
            return _res.Search(pageIndex, pageSize, out total, tennhanvien, email);
        }
    }
}
