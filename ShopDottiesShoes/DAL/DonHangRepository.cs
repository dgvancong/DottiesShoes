using DAL.Helper;
using DAL.Helper.Interfaces;
using DAL.Interfaces;
using Microsoft.EntityFrameworkCore;
using Model;
using Models;
using Models.ViewModels.Order;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public partial class DonHangRepository : IDonHangRepository
    {
        private readonly IDatabaseHelper _dbHelper;
        public DonHangRepository(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public async Task<List<DonHang>> GetAllDonHang()
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "getall-donhang");
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<DonHang>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<ChiTietDonHang> GetByIdCTDonHang(int id)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_ctdonhang_get_by_id", "@MaDonHang", id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<ChiTietDonHang>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public async Task<DonHang> GetByIdDonHang(int id)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "getbyid-donhang", "@MaDonHang", id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<DonHang>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<bool> Create(OrderVM model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "create_donhang",
                    "@HoTen", model.HoTen,
                    "@SoDT", model.SoDT,
                    "@DiaChi", model.DiaChi,
                    "@TrangThaiDonHang", Convert.ToInt32(model.TrangThaiDonHang),
                    "@GhiChu", model.GhiChu,
                    "@listjson_detail", model.listjson_detail != null ? MessageConvert.SerializeObject(model.listjson_detail) : null);
                //"@objectjson_customer", model.objectjson_customer != null ? MessageConvert.SerializeObject(model.objectjson_customer) : null,
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
                var result = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "delete-donhang", "@MaDonHang", id);
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
