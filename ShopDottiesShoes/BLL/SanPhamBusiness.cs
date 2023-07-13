using BLL.Interfaces;
using DAL.Interfaces;
using Model;
using Models;
using Models.ViewModels.SanPham;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public partial class SanPhamBusiness : ISanPhamBusiness
    {
        private readonly ISanPhamRepository _res;
        public SanPhamBusiness(ISanPhamRepository res)
        {
            _res = res;
        }
        public async Task<List<SanPham>> GetAllProduct()
        {
            return await _res.GetAllProduct();
        }
        public async Task<List<ChiTietAnhSP>> GetIDHinhAnh( int MaSP)
        {
            return await _res.GetIDHinhAnh(MaSP);
        }
        public async Task<SanPham> GetByIdProduct(int id)
        {
            return await _res.GetByIdProduct(id);
        }
        public async Task<List<HomeModel>> GetNewProduct(int SoLuong)
        {
            return await _res.GetNewProduct(SoLuong);
        }

        public async Task<List<HomeModel>> GetProductBanChay(int SoLuong)
        {
            return await _res.GetProductBanChay(SoLuong);
        }

        public async Task<bool> Delete(int id)
        {
            return await _res.Delete(id);
        }
        public async Task<bool> Update(SanPham model)
        {
            return await _res.Update(model);
        }
        public List<SanPham> Search(int pageIndex, int pageSize, out long total, string tensp, int? MaLoai, string option)
        {
            return _res.Search(pageIndex, pageSize, out total, tensp,  MaLoai,  option);
        }

        public async Task<List<SanPham>> GetSanPhamByViewCount(int id)
        {
            return await _res.GetSanPhamByViewCount(id);
        }
        public async Task<bool> Create(SanPhamVM model)
        {
            return await _res.Create(model);
        }
    }
}
