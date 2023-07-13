using BLL.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ShopDottiesShoes_ADmin.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CTDonHangController : ControllerBase
    {
        private readonly ICTDonHangBusiness _ctdonhangBusiness;
        public CTDonHangController(ICTDonHangBusiness ctdonhangBusiness)
        {
            _ctdonhangBusiness = ctdonhangBusiness;
        }

        [Route("CTHDN_getall")]
        [HttpGet]
        public async Task<IActionResult> GetAllLoai(int id)
        {
            var result = await _ctdonhangBusiness.GetAllLoai(id);
            return Ok(result);
        }
    }
}
