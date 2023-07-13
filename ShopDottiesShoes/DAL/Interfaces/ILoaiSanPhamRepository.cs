using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using Models;

namespace DAL.Interfaces
{
    public interface ILoaiSanPhamRepository
    {
        Task<List<LoaiSanPham>> GetAllLProduct();
    }
}
