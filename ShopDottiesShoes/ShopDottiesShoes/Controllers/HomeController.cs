using BLL;
using BLL.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Model;
using Models;
using Models.ViewModels.Order;
using Models.ViewModels.SanPham;

namespace ShopDottiesShoes.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HomeController : ControllerBase
    {
        private readonly ISanPhamBusiness _sanPhamBusiness;
        public HomeController(ISanPhamBusiness sanPhamBusiness)
        {
            _sanPhamBusiness = sanPhamBusiness;
        }
        [Route("GetNewProduct")]
        [HttpGet]
        public async Task<List<HomeModel>> GetNewProduct(int Soluong)
        {
            return await _sanPhamBusiness.GetNewProduct(Soluong);
        }

        [Route("GetProductBanchay")]
        [HttpGet]
        public async Task<List<HomeModel>> GetProductBanChay(int sl)
        {
            return await _sanPhamBusiness.GetProductBanChay(sl);
        }

        [Route("create")]
        [HttpPost]
        public async Task<bool> Create([FromForm] SanPhamVM model)
        {
            return await _sanPhamBusiness.Create(model);
        }
    }
}
