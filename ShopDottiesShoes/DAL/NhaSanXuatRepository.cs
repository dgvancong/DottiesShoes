using DAL.Helper;
using DAL.Helper.Interfaces;
using DAL.Interfaces;
using Model;
using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public partial class NhaSanXuatRepository: INhaSanXuatRepository
    {
        private readonly IDatabaseHelper _dbHelper;
        public NhaSanXuatRepository(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }
        public async Task<List<NhaSanXuat>> GetAllNhaSanXuat()
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_nhasanxuat_getall");
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<NhaSanXuat>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
