﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using broker.Data;

namespace broker_service.Migrations
{
    [DbContext(typeof(DataContext))]
    [Migration("20210822195603_InitialCreate")]
    partial class InitialCreate
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("ProductVersion", "5.0.9")
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("broker.Models.Broker", b =>
                {
                    b.Property<int>("BrokerId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int?>("CategoryId")
                        .HasColumnType("int");

                    b.Property<int?>("CatigoryId")
                        .HasColumnType("int");

                    b.Property<int?>("UserId")
                        .HasColumnType("int");

                    b.HasKey("BrokerId");

                    b.HasIndex("CatigoryId");

                    b.HasIndex("UserId");

                    b.ToTable("Brokers");
                });

            modelBuilder.Entity("broker.Models.Buy", b =>
                {
                    b.Property<int>("BuyID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int?>("BrokerId")
                        .HasColumnType("int");

                    b.Property<int>("UserID")
                        .HasColumnType("int");

                    b.HasKey("BuyID");

                    b.HasIndex("BrokerId");

                    b.HasIndex("UserID");

                    b.ToTable("Buys");
                });

            modelBuilder.Entity("broker.Models.Catigory", b =>
                {
                    b.Property<int>("CatigoryId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("CatigoryName")
                        .HasColumnType("int");

                    b.HasKey("CatigoryId");

                    b.ToTable("Catigories");
                });

            modelBuilder.Entity("broker.Models.Customer", b =>
                {
                    b.Property<int>("CustomerId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("UserId")
                        .HasColumnType("int");

                    b.HasKey("CustomerId");

                    b.HasIndex("UserId");

                    b.ToTable("Customers");
                });

            modelBuilder.Entity("broker.Models.Deals", b =>
                {
                    b.Property<int>("DealsId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("BrokerId")
                        .HasColumnType("int");

                    b.Property<string>("Color")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("CustomerId")
                        .HasColumnType("int");

                    b.Property<string>("DealsStatus")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Location")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("PaymentOption")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("ProductId")
                        .HasColumnType("int");

                    b.Property<int>("Quantity")
                        .HasColumnType("int");

                    b.HasKey("DealsId");

                    b.HasIndex("BrokerId");

                    b.HasIndex("CustomerId");

                    b.HasIndex("ProductId");

                    b.ToTable("Deals");
                });

            modelBuilder.Entity("broker.Models.Delivery", b =>
                {
                    b.Property<int>("DeliveryId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("BrokerId")
                        .HasColumnType("int");

                    b.Property<int>("CustomerId")
                        .HasColumnType("int");

                    b.Property<string>("DeliveryStatus")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Location")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("DeliveryId");

                    b.HasIndex("BrokerId");

                    b.HasIndex("CustomerId");

                    b.ToTable("Deliveries");
                });

            modelBuilder.Entity("broker.Models.Portfolio", b =>
                {
                    b.Property<int>("PortfolioId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("BrokerId")
                        .HasColumnType("int");

                    b.Property<string>("Description")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Image")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Name")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("PortfolioId");

                    b.HasIndex("BrokerId");

                    b.ToTable("Portfolios");
                });

            modelBuilder.Entity("broker.Models.Product", b =>
                {
                    b.Property<int>("ProductId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.HasKey("ProductId");

                    b.ToTable("Product");
                });

            modelBuilder.Entity("broker.Models.Review", b =>
                {
                    b.Property<int>("ReviewId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("BrokerId")
                        .HasColumnType("int");

                    b.Property<int>("CustomerId")
                        .HasColumnType("int");

                    b.Property<int>("rate")
                        .HasColumnType("int");

                    b.HasKey("ReviewId");

                    b.HasIndex("BrokerId");

                    b.HasIndex("CustomerId");

                    b.ToTable("Reviews");
                });

            modelBuilder.Entity("broker.Models.Skills", b =>
                {
                    b.Property<int>("SkillsId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("BrokerId")
                        .HasColumnType("int");

                    b.Property<double>("BrokingSkill")
                        .HasColumnType("float");

                    b.Property<double>("CommunicationSkill")
                        .HasColumnType("float");

                    b.Property<double>("WorkDone")
                        .HasColumnType("float");

                    b.Property<double>("WorkInProgress")
                        .HasColumnType("float");

                    b.HasKey("SkillsId");

                    b.HasIndex("BrokerId")
                        .IsUnique();

                    b.ToTable("Skills");
                });

            modelBuilder.Entity("broker.Models.User", b =>
                {
                    b.Property<int>("UserId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Address")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Email")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("FullName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Password")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Phone")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Picture")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Role")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Sex")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("UserId");

                    b.ToTable("Users");
                });

            modelBuilder.Entity("broker.Models.Broker", b =>
                {
                    b.HasOne("broker.Models.Catigory", "Catigory")
                        .WithMany()
                        .HasForeignKey("CatigoryId");

                    b.HasOne("broker.Models.User", "User")
                        .WithMany()
                        .HasForeignKey("UserId");

                    b.Navigation("Catigory");

                    b.Navigation("User");
                });

            modelBuilder.Entity("broker.Models.Buy", b =>
                {
                    b.HasOne("broker.Models.Broker", null)
                        .WithMany("Buys")
                        .HasForeignKey("BrokerId");

                    b.HasOne("broker.Models.User", "User")
                        .WithMany()
                        .HasForeignKey("UserID")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("User");
                });

            modelBuilder.Entity("broker.Models.Customer", b =>
                {
                    b.HasOne("broker.Models.User", "User")
                        .WithMany()
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("User");
                });

            modelBuilder.Entity("broker.Models.Deals", b =>
                {
                    b.HasOne("broker.Models.Broker", "Broker")
                        .WithMany("Deals")
                        .HasForeignKey("BrokerId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("broker.Models.Customer", "Customer")
                        .WithMany("Deals")
                        .HasForeignKey("CustomerId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("broker.Models.Product", "Product")
                        .WithMany()
                        .HasForeignKey("ProductId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Broker");

                    b.Navigation("Customer");

                    b.Navigation("Product");
                });

            modelBuilder.Entity("broker.Models.Delivery", b =>
                {
                    b.HasOne("broker.Models.Broker", "Broker")
                        .WithMany("Deliveries")
                        .HasForeignKey("BrokerId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("broker.Models.Customer", "Customer")
                        .WithMany("Delivery")
                        .HasForeignKey("CustomerId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Broker");

                    b.Navigation("Customer");
                });

            modelBuilder.Entity("broker.Models.Portfolio", b =>
                {
                    b.HasOne("broker.Models.Broker", "Broker")
                        .WithMany("Portfolios")
                        .HasForeignKey("BrokerId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Broker");
                });

            modelBuilder.Entity("broker.Models.Review", b =>
                {
                    b.HasOne("broker.Models.Broker", "Broker")
                        .WithMany("Reviews")
                        .HasForeignKey("BrokerId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("broker.Models.Customer", "Customer")
                        .WithMany("Reviews")
                        .HasForeignKey("CustomerId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Broker");

                    b.Navigation("Customer");
                });

            modelBuilder.Entity("broker.Models.Skills", b =>
                {
                    b.HasOne("broker.Models.Broker", "Broker")
                        .WithOne("Skills")
                        .HasForeignKey("broker.Models.Skills", "BrokerId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Broker");
                });

            modelBuilder.Entity("broker.Models.Broker", b =>
                {
                    b.Navigation("Buys");

                    b.Navigation("Deals");

                    b.Navigation("Deliveries");

                    b.Navigation("Portfolios");

                    b.Navigation("Reviews");

                    b.Navigation("Skills");
                });

            modelBuilder.Entity("broker.Models.Customer", b =>
                {
                    b.Navigation("Deals");

                    b.Navigation("Delivery");

                    b.Navigation("Reviews");
                });
#pragma warning restore 612, 618
        }
    }
}
