﻿// <auto-generated />
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using Persistence;

namespace Persistence.Migrations
{
    [DbContext(typeof(ServerContext))]
    partial class ServerContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "5.0.0");

            modelBuilder.Entity("Persistence.Models.ConfigurationProperty", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<string>("Key")
                        .HasColumnType("TEXT");

                    b.Property<string>("Value")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.ToTable("ConfigurationValues");
                });

            modelBuilder.Entity("Persistence.Models.MinecraftServer", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<string>("JarFile")
                        .HasColumnType("TEXT");

                    b.Property<string>("MaxRam")
                        .HasColumnType("TEXT");

                    b.Property<string>("MinRam")
                        .HasColumnType("TEXT");

                    b.Property<string>("MinecraftVersion")
                        .HasColumnType("TEXT");

                    b.Property<int>("Port")
                        .HasColumnType("INTEGER");

                    b.Property<string>("SecondaryVersionNumber")
                        .HasColumnType("TEXT");

                    b.Property<string>("ServerName")
                        .HasColumnType("TEXT");

                    b.Property<int>("ServerType")
                        .HasColumnType("INTEGER");

                    b.Property<string>("WorkingFolder")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.ToTable("Servers");
                });
#pragma warning restore 612, 618
        }
    }
}
