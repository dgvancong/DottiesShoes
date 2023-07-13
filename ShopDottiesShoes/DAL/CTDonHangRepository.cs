using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Helper;
using DAL.Helper.Interfaces;
using DAL.Interfaces;
using Model;
using Models;
using Models.ViewModels.Order;

namespace DAL
{
    public partial class CTDonHangRepository : ICTDonHangRepository
    {
        private readonly IDatabaseHelper _dbHelper;
        public CTDonHangRepository(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public async Task<List<ChiTietDonHang>> GetAllLoai(int id)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "CTHDN_getall",
                     "@MaDonHang", id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<ChiTietDonHang>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
