using BLL;
using BLL.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Models;

namespace ShopDottiesShoes_ADmin.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NhanVienController : ControllerBase
    {
        private readonly INhanVienBusiness _nhanvienBusiness;
        public NhanVienController(INhanVienBusiness nhanvienBusiness)
        {
            _nhanvienBusiness = nhanvienBusiness;
        }
        [Route("GetAll_nhanvien")]
        [HttpGet]
        public async Task<List<NhanVien>> GetAllNhanVien()
        {
            return await _nhanvienBusiness.GetAllNhanVien();
        }
        [Route("get-by-id/{id}")]
        [HttpPost]
        public async Task<NhanVien> GetByIdNhanVien(int id)
        {
            return await _nhanvienBusiness.GetByIdNhanVien(id);
        }

        [Route("create_nhanvien")]
        [HttpPost]
        public NhanVien Create([FromBody] NhanVien model)
        {
            _nhanvienBusiness.Create(model);
            return model;
        }

        [Route("delete_nhanvien")]
        [HttpDelete]
        public async Task<bool> Delete(int id)
        {
            return await _nhanvienBusiness.Delete(id);
        }
        [Route("search_nhanvien")]
        [HttpPost]
        public ResponseModel Search([FromBody] Dictionary<string, object> formData)
        {
            ResponseModel response = new ResponseModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string tennhanvien = "";
                if (formData.Keys.Contains("tennhanvien") && !string.IsNullOrEmpty(Convert.ToString(formData["tennhanvien"]))) { tennhanvien = Convert.ToString(formData["tennhanvien"]); }
                string email = "";
                if (formData.Keys.Contains("email") && !string.IsNullOrEmpty(Convert.ToString(formData["email"]))) { email = Convert.ToString(formData["email"]); }
                long total = 0;
                var data = _nhanvienBusiness.Search(page, pageSize, out total, tennhanvien, email);
                response.TotalItems = total;
                response.Data = data;
                response.Page = page;
                response.PageSize = pageSize;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return response;
        }

    }
}
