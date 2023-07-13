using BLL.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Models.ViewModels.Common;
using Models.ViewModels.User;

namespace ShopDottiesShoes_ADmin.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TaiKhoanController : ControllerBase
    {
        private readonly ITaiKhoanBusiness _userBusiness;

        public TaiKhoanController(ITaiKhoanBusiness userBusiness)
        {
            _userBusiness = userBusiness;
        }

        [AllowAnonymous]
        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] TaiModel model)
        {
            try
            {
                string token = await _userBusiness.Login(model);
                if (token == null)
                    return BadRequest();
                else
                    return Ok(new { token });
            }
            catch (Exception ex)
            {
                return BadRequest();
            }
        }
    }
}
