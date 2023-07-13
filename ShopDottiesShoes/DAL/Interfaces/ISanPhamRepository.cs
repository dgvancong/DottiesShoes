using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using Models;
using Models.ViewModels.SanPham;

namespace DAL.Interfaces
{
    public interface ISanPhamRepository
    {
        Task<List<SanPham>> GetAllProduct();
        Task<SanPham> GetByIdProduct(int id);
        Task<bool> Update(SanPham model);
        Task<bool> Delete(int id);
        List<SanPham> Search(int pageIndex, int pageSize, out long total, string tensp, int? MaLoai, string option);
        Task<List<HomeModel>> GetNewProduct(int SoLuong);

        Task<List<HomeModel>> GetProductBanChay(int SoLuong);

        Task<List<ChiTietAnhSP>> GetIDHinhAnh(int MaSP);

        Task<List<SanPham>> GetSanPhamByViewCount(int id);
        Task<bool> Create(SanPhamVM model);
    }
}
