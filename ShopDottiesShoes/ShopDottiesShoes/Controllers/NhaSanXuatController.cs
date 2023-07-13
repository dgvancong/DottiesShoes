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
    public class NhaSanXuatController : ControllerBase
    {
        private readonly INhaSanXuatBusiness _nhacungcapBusiness;
        public NhaSanXuatController(INhaSanXuatBusiness nhacungcapBusiness)
        {
            _nhacungcapBusiness = nhacungcapBusiness;
        }

        [Route("GetAll")]
        [HttpGet]
        public async Task<List<NhaSanXuat>> GetAllNhaSanXuat()
        {
            return await _nhacungcapBusiness.GetAllNhaSanXuat();
        }
    }
}
