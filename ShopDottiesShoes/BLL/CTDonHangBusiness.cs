using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BLL.Interfaces;
using DAL.Interfaces;
using Model;
using Models;
using Models.ViewModels.Order;

namespace BLL
{
    public partial class CTDonHangBusiness : ICTDonHangBusiness
    {
        private readonly ICTDonHangRepository _res;
        public CTDonHangBusiness(ICTDonHangRepository res)
        {
            _res = res;
        }
        public async Task<List<ChiTietDonHang>> GetAllLoai(int id)
        {
            return await _res.GetAllLoai(id);
        }
    }
}
