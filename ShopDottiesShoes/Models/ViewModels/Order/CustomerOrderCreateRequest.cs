using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.ViewModels.Order
{
    public class CustomerOrderCreateRequest
    {
        public string? HoTen { get; set; }
        public string? DiaChi { get; set; }
        public string? SoDT { get; set; }
        public string? Email { get; set; }
    }
}
