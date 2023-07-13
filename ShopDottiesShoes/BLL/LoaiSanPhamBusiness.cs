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
    public partial class LoaiSanPhamBusiness : ILoaiSanPhamBusiness
    {
        private readonly ILoaiSanPhamRepository _res;
        public LoaiSanPhamBusiness(ILoaiSanPhamRepository res)
        {
            _res = res;
        }
        public async Task<List<LoaiSanPham>> GetAllLProduct()
        {
            return await _res.GetAllLProduct();
        }
    }
}
