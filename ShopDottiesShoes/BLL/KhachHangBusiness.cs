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
    public partial class KhachHangBusiness : IKhachHangBusiness
    {
        private readonly IKhachHangRepository _res;
        public KhachHangBusiness(IKhachHangRepository res)
        {
            _res = res;
        }

        public async Task<KhachHang> GetByIdKhachHang(int id)
        {
            return await _res.GetByIdKhachHang(id);
        }

        public bool Create(KhachHang model)
        {
            return _res.Create(model);
        }
    }
}
