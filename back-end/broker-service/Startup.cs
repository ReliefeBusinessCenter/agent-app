using System;

using broker.Data;
using broker.Models;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;

using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.AspNetCore.Mvc.NewtonsoftJson;

namespace broker_service
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {

            services.AddDbContext<DataContext>(opt => opt.UseSqlServer(Configuration.GetConnectionString("brokerConnection")));
            services.AddControllers();
            //  services.AddControllersWithViews()

            // .AddNewtonsoftJson(options =>
            // options.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore);

            services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());
            services.AddCors(option =>
            {
                option.AddPolicy("allowedOrigin",
                    builder => builder.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader()
                    );
            });
            services.AddSwaggerGen(c =>
            {
                // c.SwaggerDoc("v1", new OpenApiInfo { Title = "broker_service", Version = "v1" });
                c.SwaggerDoc("v1", new Microsoft.OpenApi.Models.OpenApiInfo { Title = "broker_service", Description = "Swagger Core API" });
            });

            // services.AddScoped<IRepository<Broker>, BrokerRepository>();

            services.AddScoped<IRepository<Broker>, BrokerRepository>();
            services.AddScoped<IRepository<User>, UserRepository>();
            services.AddScoped<IRepository<Category>, CategoryRepository>();
            services.AddScoped<IRepository<Skills>, SkillsRepository>();
            services.AddScoped<IRepository<Portfolio>, PortfolioRepository>();
            services.AddScoped<IRepository<Delivery>, DeliveryRepository>();
            services.AddScoped<IRepository<Deals>, DealsRepository>();
            services.AddScoped<IRepository<Review>, ViewRepository>();
            services.AddScoped<IRepository<Customer>, CustomerRepository>();
             services.AddScoped<IRepository<Sales>, SalesRepository>();
        }


        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "broker_service v1"));
            }

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
