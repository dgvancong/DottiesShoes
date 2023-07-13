using BLL.Interfaces;
using BLL;
using DAL;
using DAL.Helper;
using DAL.Interfaces;
using DAL.Helper.Interfaces;
using Models.Helpers;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddTransient<IDatabaseHelper, DatabaseHelper>();
builder.Services.AddTransient<AppSettings, AppSettings>();
builder.Services.AddTransient<AppSettings, AppSettings>();

builder.Services.AddTransient<ISanPhamRepository, SanPhamRepository>();
builder.Services.AddTransient<ISanPhamBusiness, SanPhamBusiness>();

builder.Services.AddTransient<INhanVienRepository, NhanVienRepository>();
builder.Services.AddTransient<INhanVienBusiness, NhanVienBusiness>();

builder.Services.AddTransient<ICTDonHangRepository, CTDonHangRepository>();
builder.Services.AddTransient<ICTDonHangBusiness, CTDonHangBusiness>();

builder.Services.AddTransient<ILoaiSanPhamRepository, LoaiSanPhamRepository>();
builder.Services.AddTransient<ILoaiSanPhamBusiness, LoaiSanPhamBusiness>();

builder.Services.AddTransient<INhaSanXuatRepository, NhaSanXuatRepository>();
builder.Services.AddTransient<INhaSanXuatBusiness, NhaSanXuatBusiness>();

builder.Services.AddTransient<IDonHangRepository, DonHangRepository>();
builder.Services.AddTransient<IDonHangBusiness, DonHangBusiness>();

builder.Services.AddTransient<IKhachHangRepository, KhachHangRepository>();
builder.Services.AddTransient<IKhachHangBusiness, KhachHangBusiness>();

builder.Services.AddTransient<ITaiKhoanRepository, TaiKhoanRepository>();
builder.Services.AddTransient<ITaiKhoanBusiness, TaiKhoanBusiness>();

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll", builder => builder.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader());
});

var app = builder.Build();

app.UseCors(x => x
    .AllowAnyOrigin()
    .AllowAnyMethod()
    .AllowAnyHeader());

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseStaticFiles();
app.UseDirectoryBrowser();

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
