using DAL.Helper.Interfaces;
using DAL.Interfaces;
using Microsoft.IdentityModel.Tokens;
using Models.Helpers;
using Models;
using Models.ViewModels.Common;
using Models.ViewModels.User;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Claims;
using System.Data;
using Microsoft.Extensions.Options;
using DAL.Helper;

namespace DAL
{
    public class TaiKhoanRepository : ITaiKhoanRepository
    {
        private readonly IDatabaseHelper _dbHelper;
        private readonly AppSettings _appSettings;

        public TaiKhoanRepository(IDatabaseHelper context, IOptions<AppSettings> appSettings)
        {
            _dbHelper = context;
            _appSettings = appSettings.Value;
        }

        public async Task<string> Login(TaiModel model)
        {
            string msgError = "";
            var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_login_user",
                "@TaiKhoan", model.TaiKhoan,
                "@MatKhau", model.MatKhau);
            if (dt == null) return ("Tài khoản hoặc mật khẩu không đúng");

            var user = dt.ConvertTo<AppUser>().FirstOrDefault();

            // authentication successful so generate jwt token
            var tokenHanlder = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes("lRiOjKQlNLfPZAzW8ZIiR1Ls2QbG9dUc9mpb3T6TqTm");
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new Claim[]
                {
                    new Claim(ClaimTypes.Name, user.TaiKhoan.ToString()),
                    new Claim(ClaimTypes.DenyOnlyWindowsDeviceGroup, user.MatKhau)
                }),
                Expires = DateTime.UtcNow.AddDays(7),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };
            var tmp = tokenHanlder.CreateToken(tokenDescriptor);
            var token = tokenHanlder.WriteToken(tmp);
            return token;
        }
    }
}
