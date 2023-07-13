using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using Models;
using Models.ViewModels.Order;

namespace DAL.Interfaces
{
    public interface IDonHangRepository
    {
        Task<List<DonHang>> GetAllDonHang();
        Task<ChiTietDonHang> GetByIdCTDonHang(int id);
        Task<DonHang> GetByIdDonHang(int id);
        Task<bool> Create(OrderVM model);
        Task<bool> Delete(int id);
    }
}
