using BLL.Interfaces;
using DAL;
using DAL.Interfaces;
using Model;
using Models;
using Models.ViewModels.Common;
using Models.ViewModels.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class TaiKhoanBusiness :ITaiKhoanBusiness
    {
        private readonly ITaiKhoanRepository _userRepository;

        public TaiKhoanBusiness(ITaiKhoanRepository userRepository)
        {
            _userRepository = userRepository;
        }

        public async Task<string> Login(TaiModel model)
        {
            return await _userRepository.Login(model);
        }
    }
}
