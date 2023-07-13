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
    public interface ICTDonHangRepository
    {
        Task<List<ChiTietDonHang>> GetAllLoai(int id);
    }
}
