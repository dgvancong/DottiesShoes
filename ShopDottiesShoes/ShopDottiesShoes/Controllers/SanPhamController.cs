using BLL;
using BLL.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Model;
using Models;


namespace ShopDottiesShoes.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SanPhamController : ControllerBase
    {
        private readonly ISanPhamBusiness _sanPhamBusiness;
        public SanPhamController(ISanPhamBusiness sanPhamBusiness)
        {
            _sanPhamBusiness = sanPhamBusiness;
        }

        [Route("GetAll")]
        [HttpGet]
        public async Task<List<SanPham>> GetAllProduct()
        {
            return await _sanPhamBusiness.GetAllProduct();
        }
        [Route("get-by-id/{id}")]
        [HttpPost]
        public async Task<SanPham> GetByIdProduct(int id)
        {
            return await _sanPhamBusiness.GetByIdProduct(id);
        }
        [Route("sp_IDhinhanh")]
        [HttpGet]
        public async Task<IActionResult> GetIDHinhAnh(int MaSP)
        {
            var image = await _sanPhamBusiness.GetIDHinhAnh(MaSP);
            return Ok(image);
        }
        [Route("GetSanPhamByViewCount")]
        [HttpGet]
        public async Task<IActionResult> GetSanPhamByViewCount(int id)
        {
            var result = await _sanPhamBusiness.GetSanPhamByViewCount(id);
            return Ok(result);
        }

        [Route("search_sanpham")]
        [HttpPost]
        public ResponseModel Search([FromBody] Dictionary<string, object> formData)
        {
            ResponseModel response = new ResponseModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string tensp = "";
                if (formData.Keys.Contains("tensp") && !string.IsNullOrEmpty(Convert.ToString(formData["tensp"]))) { tensp = Convert.ToString(formData["tensp"]); }
                int? MaLoai = null;
                if (formData.Keys.Contains("MaLoai") && !string.IsNullOrEmpty(Convert.ToString(formData["MaLoai"]))) { MaLoai = Convert.ToInt32(formData["MaLoai"]); }
                string option = "";
                if (formData.Keys.Contains("option") && !string.IsNullOrEmpty(Convert.ToString(formData["option"]))) { option = Convert.ToString(formData["option"]); }
                long total = 0;
                var data = _sanPhamBusiness.Search(page, pageSize, out total, tensp, MaLoai, option);
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
