using DAL.Helper;
using DAL.Helper.Interfaces;
using DAL.Interfaces;
using Model;
using Models;
using Models.ViewModels.SanPham;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public partial class SanPhamRepository : ISanPhamRepository
    {
        private readonly IDatabaseHelper _dbHelper;
        public SanPhamRepository(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public async Task<List<SanPham>> GetAllProduct()
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_sanpham_getall");
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<SanPham>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task< SanPham> GetByIdProduct(int id)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_sanpham_get_by_id", "@MaSP", id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<SanPham>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<bool> Update(SanPham model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_sanpham_update",
                   "@MaSP", model.MaSP,
                    "@HinhAnh", model.HinhAnh,
                  "@MaLoai", model.MaLoai,
                  "@MaNCC", model.MaNCC,
                  "@TenSP", model.TenSP,
                  "@MoTa", model.MoTa,
                  "@NgayTao", model.NgayTao);
                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public async Task<bool> Delete(int id)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "delete-sanpham", "@MaSP", id);
                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<SanPham> Search(int pageIndex, int pageSize, out long total, string tensp, int? MaLoai, string option)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "search_sanpham",
                    "@page_index", pageIndex,
                    "@page_size", pageSize,
                    "@tensp", tensp,
                    "@MaLoai", MaLoai,
                    "@option", option
                    );
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<SanPham>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public async Task<List<HomeModel>> GetNewProduct(int SoLuong)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sanpham_moinhat", "@SoLuong", SoLuong);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<HomeModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<List<HomeModel>> GetProductBanChay(int SoLuong)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sanpham_banchay", "@SoLuong", SoLuong);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<HomeModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<List<ChiTietAnhSP>> GetIDHinhAnh(int MaSP)
        {
            string msgError = "";
            try
            {
                try
                {
                    var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_IDhinhanh", "@MaSP", MaSP);
                    if (!string.IsNullOrEmpty(msgError))
                        throw new Exception(msgError);
                    return dt.ConvertTo<ChiTietAnhSP>().ToList();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
        public async Task<List<SanPham>> GetSanPhamByViewCount(int id)
        {
            string msgError = "";

            try
            {

                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "GetSanPhamByViewCount",
                     "@ViewCountThreshold", id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<SanPham>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public async Task<bool> Create(SanPhamVM model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "create_sanpham",
                    "@HinhAnh", model.HinhAnh,
                    "@MaLoai", model.MaLoai,
                    "@MaNCC", model.MaNCC,
                    "@TenSP", model.TenSP,
                    "@MoTa", model.MoTa,
                    "@NgayTao", model.NgayTao,
                    "@listjson_specifications", model.listjson_specifications != null ? MessageConvert.SerializeObject(model.listjson_specifications) : null);
                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}