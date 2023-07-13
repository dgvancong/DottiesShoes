using Models;
using Models.ViewModels.Common;
using Models.ViewModels.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Models.ViewModels.User;

namespace DAL.Interfaces
{
    public interface ITaiKhoanRepository
    {
        Task<string> Login(TaiModel model);
    }
}
