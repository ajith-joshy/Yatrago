using YatraGo.Interfaces;
using YatraGo.Repositories;
using YatraGo.Repository;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

builder.Services.AddScoped
    <IAdminRepository, AdminRepository>();

builder.Services.AddScoped
    <IStateRepository,StateRepository>();

builder.Services.AddScoped
    <IUserRepository,UserRepository>();

builder.Services.AddScoped
    <IBusRouteRepository,BusRouteRepository>();

builder.Services.AddScoped
    <IBusRepository,BusRepository>();

builder.Services.AddScoped
    <IBookingRepository,BookingRepository>();

builder.Services.AddSession();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();

app.UseStaticFiles();

app.UseRouting();

app.UseSession();

app.UseAuthorization();

app.MapStaticAssets();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}")
    .WithStaticAssets();


app.Run();
