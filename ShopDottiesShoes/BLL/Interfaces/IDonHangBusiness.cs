using Model;
using Models;
using Models.ViewModels.Order;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace BLL.Interfaces
{
    public interface IDonHangBusiness
    {
        Task<List<DonHang>> GetAllDonHang();
        Task<DonHang> GetByIdDonHang(int id);
        Task<bool> Create(OrderVM model);
        Task<bool> Delete(int id);
        Task<ChiTietDonHang> GetByIdCTDonHang(int id);

    }
}
