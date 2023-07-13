using BLL.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Models;

namespace ShopDottiesShoes_ADmin.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoaiSanPhamController : ControllerBase
    {
        private readonly ILoaiSanPhamBusiness _loaisanPhamBusiness;
        public LoaiSanPhamController(ILoaiSanPhamBusiness loaisanPhamBusiness)
        {
            _loaisanPhamBusiness = loaisanPhamBusiness;
        }

        [Route("GetAll")]
        [HttpGet]
        public async Task<List<LoaiSanPham>> GetAllLProduct()
        {
            return await _loaisanPhamBusiness.GetAllLProduct();
        }
    }
}
