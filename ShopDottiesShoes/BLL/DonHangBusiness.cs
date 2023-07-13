using BLL.Interfaces;
using DAL.Interfaces;
using Model;
using Models;
using Models.ViewModels.Order;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public partial class DonHangBusiness : IDonHangBusiness
    {
        private readonly IDonHangRepository _res;
        public DonHangBusiness(IDonHangRepository res)
        {
            _res = res;
        }
        public async Task<List<DonHang>> GetAllDonHang()
        {
            return await _res.GetAllDonHang();
        }

        public async Task<ChiTietDonHang> GetByIdCTDonHang(int id)
        {
            return await _res.GetByIdCTDonHang(id);
        }

        public async Task<DonHang> GetByIdDonHang(int id)
        {
            return await _res.GetByIdDonHang(id);
        }


        public async Task<bool> Create(OrderVM model)
        {
            return await _res.Create(model);
        }

        public async Task<bool> Delete(int id)
        {
            return await _res.Delete(id);
        }
    }
}
