using Models.ViewModels.Common;
using Models.ViewModels.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Interfaces
{
    public interface ITaiKhoanBusiness
    {
        public Task<string> Login(TaiModel model);
    }
}
