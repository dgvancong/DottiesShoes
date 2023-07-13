using BLL;
using BLL.Interfaces;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Models;
using Models.ViewModels.Order;

namespace ShopDottiesShoes_ADmin.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DonHangController : ControllerBase
    {
        private readonly IDonHangBusiness _donhangBusiness;
        public DonHangController(IDonHangBusiness donhangBusiness)
        {
            _donhangBusiness = donhangBusiness;
        }

        [Route("getall-donhang")]
        [HttpGet]
        public async Task<List<DonHang>> GetAllDonHang()
        {
            return await _donhangBusiness.GetAllDonHang();
        }
        
        [Route("sp_ctdonhang_get_by_id")]
        [HttpPost]
        public async Task<ChiTietDonHang> GetByIdCTDonHang(int id)
        {
            return await _donhangBusiness.GetByIdCTDonHang(id);
        }
        [Route("getbyid-donhang")]
        [HttpPost]
        public async Task<DonHang> GetByIdDonHang(int id)
        {
            return await _donhangBusiness.GetByIdDonHang(id);
        }
        [Route("create_donhang")]
        [HttpPost]
        public async Task<bool> Create([FromBody] OrderVM model)
        {
            return await _donhangBusiness.Create(model);
        }

        [Route("delete-donhang")]
        [HttpDelete]
        public async Task<bool> Delete(int id)
        {
            return await _donhangBusiness.Delete(id);
        }
       
    }
}
