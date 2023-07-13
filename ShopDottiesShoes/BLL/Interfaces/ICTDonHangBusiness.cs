using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using Models;
using Models.ViewModels.Order;

namespace BLL.Interfaces
{
    public interface ICTDonHangBusiness
    {
        Task<List<ChiTietDonHang>> GetAllLoai(int id);
    }
}
