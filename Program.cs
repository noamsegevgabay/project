var builder = WebApplication.CreateBuilder(args);

<<<<<<< HEAD

var app = builder.Build();

app.MapGet("/", () => "Hello World!");
=======
// Add services to the container.
builder.Services.AddControllersWithViews();

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

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");
>>>>>>> 3e6f69dba29b1a3410a8d82cee6d3cea476f1bc3

app.Run();
