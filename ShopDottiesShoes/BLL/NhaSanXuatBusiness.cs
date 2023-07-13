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
    public partial class NhaSanXuatBusiness : INhaSanXuatBusiness
    {
        private readonly INhaSanXuatRepository _res;
        public NhaSanXuatBusiness(INhaSanXuatRepository res)
        {
            _res = res;
        }
        public async Task<List<NhaSanXuat>> GetAllNhaSanXuat()
        {
            return await _res.GetAllNhaSanXuat();
        }
    }
}
