USE [master]
GO
/****** Object:  Database [QuanLyQuanNuoc]    Script Date: 4/18/2020 3:05:30 PM ******/
CREATE DATABASE [QuanLyQuanNuoc]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyQuanNuoc', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QuanLyQuanNuoc.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyQuanNuoc_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QuanLyQuanNuoc_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyQuanNuoc] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyQuanNuoc].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyQuanNuoc] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyQuanNuoc] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyQuanNuoc] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyQuanNuoc] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyQuanNuoc] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyQuanNuoc] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyQuanNuoc] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyQuanNuoc] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyQuanNuoc] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyQuanNuoc] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyQuanNuoc] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyQuanNuoc] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyQuanNuoc] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyQuanNuoc] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyQuanNuoc] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyQuanNuoc] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyQuanNuoc] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyQuanNuoc] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyQuanNuoc] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyQuanNuoc] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyQuanNuoc] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyQuanNuoc] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyQuanNuoc] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyQuanNuoc] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyQuanNuoc] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyQuanNuoc] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyQuanNuoc] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyQuanNuoc] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyQuanNuoc] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QuanLyQuanNuoc]
GO
/****** Object:  User [IIS APPPOOL\DefaultAppPool]    Script Date: 4/18/2020 3:05:30 PM ******/
CREATE USER [IIS APPPOOL\DefaultAppPool] FOR LOGIN [IIS APPPOOL\DefaultAppPool] WITH DEFAULT_SCHEMA=[db_owner]
GO
ALTER ROLE [db_owner] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
/****** Object:  Table [dbo].[Ban]    Script Date: 4/18/2020 3:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ban](
	[MaBan] [int] IDENTITY(1,1) NOT NULL,
	[SoBan] [int] NULL,
	[TinhTrang] [int] NULL,
	[HienTrang] [bit] NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[MaBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTHD]    Script Date: 4/18/2020 3:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTHD](
	[MaHD] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[ThanhTien] [money] NULL,
 CONSTRAINT [PK_CTHD] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 4/18/2020 3:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDanhMuc] [int] IDENTITY(1,1) NOT NULL,
	[TenDanhMuc] [nvarchar](50) NULL,
 CONSTRAINT [PK_DanhMuc] PRIMARY KEY CLUSTERED 
(
	[MaDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 4/18/2020 3:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[MaBan] [int] NOT NULL,
	[TongTien] [money] NULL,
	[GioVao] [datetime] NULL,
	[GioRa] [datetime] NULL,
	[TinhTrang] [bit] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 4/18/2020 3:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[MaNguoiDung] [int] IDENTITY(1,1) NOT NULL,
	[TenNguoiDung] [nvarchar](50) NULL,
	[TaiKhoan] [varchar](200) NULL,
	[MatKhau] [nvarchar](1000) NULL,
	[VaiTro] [bit] NULL,
	[NgayTao] [datetime] NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Spham]    Script Date: 4/18/2020 3:05:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Spham](
	[MaSanPham] [int] IDENTITY(1,1) NOT NULL,
	[TenSanPham] [nvarchar](500) NULL,
	[Gia] [money] NULL,
	[Anh] [nvarchar](max) NULL,
	[PhanBiet] [bit] NULL,
	[MaDanhMuc] [int] NULL,
	[HienTrang] [bit] NULL,
 CONSTRAINT [PK_Spham] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Ban] ON 

INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang], [HienTrang]) VALUES (1, 0, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang], [HienTrang]) VALUES (2, 1, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang], [HienTrang]) VALUES (3, 2, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang], [HienTrang]) VALUES (4, 3, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang], [HienTrang]) VALUES (5, 4, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang], [HienTrang]) VALUES (6, 5, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang], [HienTrang]) VALUES (7, 6, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang], [HienTrang]) VALUES (8, 7, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang], [HienTrang]) VALUES (9, 8, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang], [HienTrang]) VALUES (10, 9, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang], [HienTrang]) VALUES (11, 10, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang], [HienTrang]) VALUES (12, 11, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang], [HienTrang]) VALUES (13, 12, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang], [HienTrang]) VALUES (14, 13, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang], [HienTrang]) VALUES (15, 14, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang], [HienTrang]) VALUES (16, 15, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang], [HienTrang]) VALUES (17, 16, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang], [HienTrang]) VALUES (18, 17, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang], [HienTrang]) VALUES (19, 18, 1, 1)
SET IDENTITY_INSERT [dbo].[Ban] OFF
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (81, 45, 1, 16000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (81, 47, 1, 20000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (82, 19, 1, 12000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (82, 20, 1, 12000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (82, 34, 1, 18000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (83, 60, 3, 81000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (83, 63, 2, 60000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (84, 20, 2, 24000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (85, 47, 3, 60000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (86, 35, 1, 18000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (87, 35, 2, 36000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (88, 35, 1, 18000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (89, 35, 1, 18000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (95, 34, 1, 18000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (96, 34, 1, 18000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (97, 34, 1, 18000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (98, 27, 10, 220000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (98, 34, 10, 180000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (99, 21, 10, 150000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (100, 34, 1, 18000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (101, 34, 2, 36000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (102, 34, 3, 54000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (103, 34, 5, 90000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (104, 34, 10, 180000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (105, 34, 10, 180000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (105, 35, 10, 180000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (106, 81, 1, 30000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (106, 84, 5, 150000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (106, 85, 1, 30000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (106, 86, 3, 90000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (106, 87, 5, 150000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (106, 89, 4, 140000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (106, 90, 12, 420000.0000)
SET IDENTITY_INSERT [dbo].[DanhMuc] ON 

INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc]) VALUES (1, N'Cà phê')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc]) VALUES (2, N'Cacao')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc]) VALUES (3, N'Nước giải khát')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc]) VALUES (4, N'Lipton')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc]) VALUES (5, N'Yaourt')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc]) VALUES (6, N'Nước ép')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc]) VALUES (7, N'Trà')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc]) VALUES (8, N'Topping')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc]) VALUES (9, N'Sinh tố')
SET IDENTITY_INSERT [dbo].[DanhMuc] OFF
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHD], [MaBan], [TongTien], [GioVao], [GioRa], [TinhTrang]) VALUES (81, 1, 36000.0000, CAST(0x0000ABA00012AE88 AS DateTime), CAST(0x0000ABA00012B598 AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaBan], [TongTien], [GioVao], [GioRa], [TinhTrang]) VALUES (82, 3, 42000.0000, CAST(0x0000ABA000CAFFDB AS DateTime), CAST(0x0000ABA000CB04C8 AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaBan], [TongTien], [GioVao], [GioRa], [TinhTrang]) VALUES (83, 4, 141000.0000, CAST(0x0000ABA100D6C7E9 AS DateTime), CAST(0x0000ABA100D764DF AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaBan], [TongTien], [GioVao], [GioRa], [TinhTrang]) VALUES (84, 2, 24000.0000, CAST(0x0000ABA100D7163D AS DateTime), CAST(0x0000ABA100D86E2D AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaBan], [TongTien], [GioVao], [GioRa], [TinhTrang]) VALUES (85, 8, 60000.0000, CAST(0x0000ABA100D73244 AS DateTime), CAST(0x0000ABA100D82B4E AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaBan], [TongTien], [GioVao], [GioRa], [TinhTrang]) VALUES (86, 2, 18000.0000, CAST(0x0000ABA100DF5AF1 AS DateTime), CAST(0x0000ABA100DF5EDC AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaBan], [TongTien], [GioVao], [GioRa], [TinhTrang]) VALUES (87, 1, 36000.0000, CAST(0x0000ABA100DF77DA AS DateTime), CAST(0x0000ABA100DF7D74 AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaBan], [TongTien], [GioVao], [GioRa], [TinhTrang]) VALUES (88, 1, 18000.0000, CAST(0x0000ABA100DF8125 AS DateTime), CAST(0x0000ABA100DF85A3 AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaBan], [TongTien], [GioVao], [GioRa], [TinhTrang]) VALUES (89, 2, 18000.0000, CAST(0x0000ABA100F34FE4 AS DateTime), CAST(0x0000ABA100F35239 AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaBan], [TongTien], [GioVao], [GioRa], [TinhTrang]) VALUES (95, 1, 18000.0000, CAST(0x0000ABA0014E6191 AS DateTime), CAST(0x0000ABA0014E728F AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaBan], [TongTien], [GioVao], [GioRa], [TinhTrang]) VALUES (96, 4, 18000.0000, CAST(0x0000ABA0014E6A33 AS DateTime), CAST(0x0000ABA0014E769D AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaBan], [TongTien], [GioVao], [GioRa], [TinhTrang]) VALUES (97, 2, 18000.0000, CAST(0x0000ABA0014EBB1D AS DateTime), CAST(0x0000ABA0014EBFD9 AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaBan], [TongTien], [GioVao], [GioRa], [TinhTrang]) VALUES (98, 3, 400000.0000, CAST(0x0000ABA0014ED8F7 AS DateTime), CAST(0x0000ABA0014F0764 AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaBan], [TongTien], [GioVao], [GioRa], [TinhTrang]) VALUES (99, 3, 150000.0000, CAST(0x0000ABA0014F498C AS DateTime), CAST(0x0000ABA0014F5171 AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaBan], [TongTien], [GioVao], [GioRa], [TinhTrang]) VALUES (100, 2, 18000.0000, CAST(0x0000ABA001500B32 AS DateTime), CAST(0x0000ABA001501102 AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaBan], [TongTien], [GioVao], [GioRa], [TinhTrang]) VALUES (101, 3, 36000.0000, CAST(0x0000ABA001502BFF AS DateTime), CAST(0x0000ABA001502E8F AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaBan], [TongTien], [GioVao], [GioRa], [TinhTrang]) VALUES (102, 2, 54000.0000, CAST(0x0000ABA001503FF2 AS DateTime), CAST(0x0000ABA00150425A AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaBan], [TongTien], [GioVao], [GioRa], [TinhTrang]) VALUES (103, 1, 90000.0000, CAST(0x0000ABA0015050CA AS DateTime), CAST(0x0000ABA0015053E5 AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaBan], [TongTien], [GioVao], [GioRa], [TinhTrang]) VALUES (104, 1, 180000.0000, CAST(0x0000ABA001506211 AS DateTime), CAST(0x0000ABA001506724 AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaBan], [TongTien], [GioVao], [GioRa], [TinhTrang]) VALUES (105, 1, 360000.0000, CAST(0x0000ABA00150811B AS DateTime), CAST(0x0000ABA0015090B3 AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaBan], [TongTien], [GioVao], [GioRa], [TinhTrang]) VALUES (106, 2, 1010000.0000, CAST(0x0000ABA0015C565D AS DateTime), CAST(0x0000ABA0015C9965 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenNguoiDung], [TaiKhoan], [MatKhau], [VaiTro], [NgayTao]) VALUES (1, N'Dư', N'admin', N'123', 1, NULL)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenNguoiDung], [TaiKhoan], [MatKhau], [VaiTro], [NgayTao]) VALUES (2, N'tan', N'tan', N'1', 0, CAST(0x0000ABA100D7BADF AS DateTime))
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenNguoiDung], [TaiKhoan], [MatKhau], [VaiTro], [NgayTao]) VALUES (3, N'Khoa', N'khoa', N'123', 0, CAST(0x0000ABA000FEDD85 AS DateTime))
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
SET IDENTITY_INSERT [dbo].[Spham] ON 

INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (19, N'Cà phê nóng', 12000.0000, N'5468108078_cf129c5441_z.jpg', 0, 1, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (20, N'Cà phê đá', 12000.0000, N'e2470fb9c529c0cccfdaf8264d96a8d6.jpg', 0, 1, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (21, N'Cà phê sữa đá', 15000.0000, N'Vietnamese-Coffee-Caphe-Sua-Da-02-1280x1170.jpg', 0, 1, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (22, N'Cà phê sữa nóng', 15000.0000, N'maxresdefault.jpg', 0, 1, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (23, N'Cafe Capuchino', 24000.0000, N'Ca-phe-sua-da.jpg', 0, 1, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (24, N'Cafe Mocha', 80000.0000, N'cach-pha-ca-phe-mocha-1.jpg', 0, 1, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (25, N'Cafe cốt dừa', 30000.0000, N'recipe-cover-r28249.jpg', 0, 1, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (27, N'Cacao nóng', 22000.0000, N'recipe18916-636222385626592990.jpg', 0, 2, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (28, N'Cacao sữa đá', 25000.0000, N'cach-pha-ca-cao-sua-da-ngon-hap-dan-tai-nha-khong-can-ra-quan-nua.jpg', 1, 2, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (29, N'Cacao đá', 22000.0000, N'moc-tra-cacao-nong-300x300.jpg', 0, 2, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (31, N'Cacao sữa nóng', 25000.0000, N'ca-cao-nong.jpg', 0, 2, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (32, N'Cacao kem tươi', 27000.0000, N'cacao-nong-kem-tuoi.jpg', 0, 2, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (33, N'Cacao đá xay', 27000.0000, N'1466594856_ddb969589f7d4722b6f6381b9a333ef2.jpg', 0, 2, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (34, N'Bạc xỉu đá', 18000.0000, N'BacXiu-CaPheSuaDa_v01.jpg', 1, 2, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (35, N'Bạc xỉu nóng', 18000.0000, N'cach-lam-bac-xiu-nong.jpg', 0, 2, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (36, N'Chanh đá', 18000.0000, N'40_Other-kitchen-accessories_maxbrute.jpg', 0, 3, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (37, N'Chanh nóng', 18000.0000, N'Thay-the-nuoc-chanh-nong-1.jpg', 0, 3, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (38, N'Chanh muối đá', 15000.0000, N'cach-lam-chanh-muoi-ngon.jpg', 0, 3, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (39, N'Chanh muối nóng', 15000.0000, N'img_27711.jpg', 0, 3, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (40, N'Chanh xí muội', 0.0000, N'tra-chanh-xi-muoi-11556.jpg', 0, 3, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (41, N'Dừa tươi', 20000.0000, N'photo1530780323658-15307803236581688311414.jpg', 0, 3, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (42, N'Cam vắt', 25000.0000, N'cam-vat-4573.jpg', 0, 3, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (43, N'Cam vắt không đá', 35000.0000, N'nuoc-cam-ep-Vinfruits.jpeg', 0, 3, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (44, N'Sâm dứa sữa', 20000.0000, N'hinh-anh-cach-lam-nuoc-sam-dua-sua-7.jpg', 0, 3, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (45, N'Lipton nóng', 16000.0000, N'tra-lipton-ngon.jpg', 0, 4, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (46, N'Lipton đá', 16000.0000, N'tra-lipton-da1521777061.jpg', 0, 4, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (47, N'Lipton chanh', 20000.0000, N'lipton-chanh2.jpg', 0, 4, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (48, N'Lipton cam', 25000.0000, N'unnamed.png', 0, 4, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (49, N'Lipton xí muội', 20000.0000, N'a24d2f378a4df64ad5f42178410e306d.jpg', 0, 4, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (50, N'Lipton sữa', 22000.0000, N'chỉ mục.jfif', 0, 4, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (51, N'Yaourt hủ', 13000.0000, N'foody-upload-api-foody-mobile-hinh-thuy-tinh-yaour-190521101324.jpg', 0, 5, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (52, N'Yaourt đá', 18000.0000, N'cach-pha-che-yaourt-chanh-da-ngon-nhu-ngoai-hang-cach-lam-yourt-da-chanh-6-1529404784-299-width650height538.jpg', 0, 5, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (53, N'Yaourt cam', 25000.0000, N'yaourt-cam-🥤🥤-recipe-main-photo.jpg', 0, 5, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (54, N'Yaourt dâu', 27000.0000, N'Dau_Smoothie_thumb.jpg', 0, 5, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (55, N'Yaourt phúc bồn tử', 25000.0000, N'aaa.jfif', 0, 5, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (56, N'Yaourt việt quốc', 25000.0000, N'37685824_2122752597967411_5374442166900752384_n.jpg', 0, 5, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (57, N'Yaourt trái cây', 30000.0000, N'yaourt-trai-cay.jpg', 0, 5, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (58, N'Nước ép thơm', 27000.0000, N'Thơm-ép-1.jpg', 0, 6, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (59, N'Nước ép cà rốt', 27000.0000, N'Nước-ép-cà-rốt.jpg', 0, 6, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (60, N'Nước ép dưa hấu', 27000.0000, N'duahau.jfif', 0, 6, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (61, N'Nước ép cà chua', 27000.0000, N'tomato-juice.jpg', 0, 6, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (62, N'Nước ép táo', 27000.0000, N'p-t-o-min.jpg', 0, 6, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (63, N'Nước ép cam và cà rốt', 30000.0000, N'unnamed.jpg', 0, 6, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (64, N'Nước ép dâu', 75000.0000, N'dau.jpg', 0, 6, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (65, N'Nước ép bưởi', 30000.0000, N'buoi.jfif', 0, 6, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (66, N'Nước ép thập cẩm', 35000.0000, N'thapcam.jpg', 1, 6, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (68, N'Trà gừng nóng', 18000.0000, N'tra-gung_14176937.jpg', 0, 7, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (69, N'Trà gừng đá', 16000.0000, N'tragungda.jfif', 0, 7, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (70, N'Trà đào', 15000.0000, N'tradao.jpg', 0, 7, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (71, N'Trà vải', 15000.0000, N'travai.jpg', 0, 7, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (72, N'Trà sữa truyền thống', 20000.0000, N'trasua.jpg', 0, 7, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (73, N'Trà sữa Matcha', 20000.0000, N'trasuamatcha.jpg', 0, 7, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (74, N'Trà thái xanh', 20000.0000, N'trasuathaixanh.jpg', 0, 7, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (75, N'Trân châu trắng', 3000.0000, N'tranchautrang.jpg', 1, 8, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (76, N'Trân châu đen', 3000.0000, N'tranchauden.jpg', 1, 8, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (77, N'Thạch trái cây', 4000.0000, N'thachtraicay.jpg', 1, 8, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (78, N'Bánh flan', 6000.0000, N'banhflan.png', 1, 8, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (79, N'Thạch củ năng', 5000.0000, N'thachcunang.jpg', 1, 8, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (80, N'Thạch phô mai', 6000.0000, N'thachphmai.jpg', 1, 8, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (81, N'Sinh tố bơ', 30000.0000, N'sinhtobo.jpg', 0, 9, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (82, N'Sinh tố dâu', 30000.0000, N'sinhtodau.jpg', 0, 9, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (83, N'Sinh tố mãng cầu', 30000.0000, N'sinhtomangcau.jpg', 0, 9, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (84, N'Sinh tố sapoche', 30000.0000, N'sainhtosapoche.jpeg', 0, 9, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (85, N'Sinh tố cà rốt', 30000.0000, N'sinhtocarot.jpg', 0, 9, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (86, N'Sinh tố cà chua', 30000.0000, N'sinhtocachua.jpg', 0, 9, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (87, N'Sinh tố cam', 30000.0000, N'sinhtocam.jpg', 0, 9, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (88, N'Sinh tố dừa', 40000.0000, N'sinhtodua.jpg', 0, 9, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (89, N'Sinh tố bơ socola', 35000.0000, N'sinhtobosocola.jpg', 0, 9, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc], [HienTrang]) VALUES (90, N'Sinh tố bơ kem', 35000.0000, N'sinhtobokem.png', 0, 9, NULL)
SET IDENTITY_INSERT [dbo].[Spham] OFF
ALTER TABLE [dbo].[CTHD]  WITH CHECK ADD  CONSTRAINT [FK_CTHD_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[CTHD] CHECK CONSTRAINT [FK_CTHD_HoaDon]
GO
ALTER TABLE [dbo].[CTHD]  WITH CHECK ADD  CONSTRAINT [FK_CTHD_Spham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[Spham] ([MaSanPham])
GO
ALTER TABLE [dbo].[CTHD] CHECK CONSTRAINT [FK_CTHD_Spham]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_Ban] FOREIGN KEY([MaBan])
REFERENCES [dbo].[Ban] ([MaBan])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_Ban]
GO
ALTER TABLE [dbo].[Spham]  WITH CHECK ADD  CONSTRAINT [FK_Spham_DanhMuc] FOREIGN KEY([MaDanhMuc])
REFERENCES [dbo].[DanhMuc] ([MaDanhMuc])
GO
ALTER TABLE [dbo].[Spham] CHECK CONSTRAINT [FK_Spham_DanhMuc]
GO
USE [master]
GO
ALTER DATABASE [QuanLyQuanNuoc] SET  READ_WRITE 
GO
