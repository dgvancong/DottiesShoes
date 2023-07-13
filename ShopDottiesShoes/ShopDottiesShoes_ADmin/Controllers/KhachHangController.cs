using BLL;
using BLL.Interfaces;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Models;

namespace ShopDottiesShoes_ADmin.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class KhachHangController : ControllerBase
    {
        private readonly IKhachHangBusiness _khachhangBusiness;
        public KhachHangController(IKhachHangBusiness khachhangBusiness)
        {
            _khachhangBusiness = khachhangBusiness;
        }

        [Route("get-by-id/{id}")]
        [HttpPost]
        public async Task<KhachHang> GetByIdKhachHang(int id)
        {
            return await _khachhangBusiness.GetByIdKhachHang(id);
        }
        [Route("create_khachhang")]
        [HttpPost]
        public KhachHang Create([FromBody] KhachHang model)
        {
            _khachhangBusiness.Create(model);
            return model;
        }
        
    }
}
