USE [master]
GO
/****** Object:  Database [QuanLyQuanNuoc]    Script Date: 4/15/2020 12:05:54 AM ******/
CREATE DATABASE [QuanLyQuanNuoc]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyQuanNuoc', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QuanLyQuanNuoc.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyQuanNuoc_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QuanLyQuanNuoc_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[Ban]    Script Date: 4/15/2020 12:05:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ban](
	[MaBan] [int] IDENTITY(1,1) NOT NULL,
	[SoBan] [int] NULL,
	[TinhTrang] [int] NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[MaBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTHD]    Script Date: 4/15/2020 12:05:54 AM ******/
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
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 4/15/2020 12:05:54 AM ******/
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
/****** Object:  Table [dbo].[HoaDon]    Script Date: 4/15/2020 12:05:54 AM ******/
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
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 4/15/2020 12:05:54 AM ******/
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
/****** Object:  Table [dbo].[Spham]    Script Date: 4/15/2020 12:05:54 AM ******/
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
 CONSTRAINT [PK_Spham] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Ban] ON 

INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang]) VALUES (1, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang]) VALUES (2, 2, 1)
INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang]) VALUES (3, 3, 1)
INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang]) VALUES (4, 4, 1)
INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang]) VALUES (5, 5, 1)
INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang]) VALUES (6, 6, 1)
INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang]) VALUES (7, 7, 1)
INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang]) VALUES (8, 8, 1)
INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang]) VALUES (9, 9, 1)
INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang]) VALUES (10, 10, 1)
INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang]) VALUES (11, 11, 1)
INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang]) VALUES (12, 12, 1)
INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang]) VALUES (13, 13, 1)
INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang]) VALUES (14, 14, 1)
INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang]) VALUES (15, 15, 1)
INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang]) VALUES (16, 16, 1)
INSERT [dbo].[Ban] ([MaBan], [SoBan], [TinhTrang]) VALUES (17, 17, 1)
SET IDENTITY_INSERT [dbo].[Ban] OFF
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (4, 3, 1, 1.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (5, 3, 1, 1.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (6, 1, 3, 3.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (7, 2, 1, 1.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (7, 3, 3, 3.0000)
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHD], [MaBan], [TongTien], [GioVao], [GioRa], [TinhTrang]) VALUES (4, 3, 1.0000, CAST(0x0000AB9E000077D4 AS DateTime), CAST(0x0000AB9E0000808E AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaBan], [TongTien], [GioVao], [GioRa], [TinhTrang]) VALUES (5, 3, 1.0000, CAST(0x0000AB9E00008C5F AS DateTime), CAST(0x0000AB9E0000ACC4 AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaBan], [TongTien], [GioVao], [GioRa], [TinhTrang]) VALUES (6, 3, 3.0000, CAST(0x0000AB9E0000B46F AS DateTime), CAST(0x0000AB9E0000B786 AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaBan], [TongTien], [GioVao], [GioRa], [TinhTrang]) VALUES (7, 1, 1.0000, CAST(0x0000AB9E0000FBB1 AS DateTime), CAST(0x0000AB9E0001056F AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaBan], [TongTien], [GioVao], [GioRa], [TinhTrang]) VALUES (8, 1, 3.0000, CAST(0x0000AB9E000102AF AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenNguoiDung], [TaiKhoan], [MatKhau], [VaiTro], [NgayTao]) VALUES (1, N'aaa', N'Admin01', N'1', 1, NULL)
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
SET IDENTITY_INSERT [dbo].[Spham] ON 

INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (1, N'Sting', 1.0000, N'0f391453-e020-40fa-83b3-fe63cc51dfff (1).jpg', 1, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (2, N'Sting', 1.0000, N'0f391453-e020-40fa-83b3-fe63cc51dfff (1).jpg', 1, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (3, N'Sting', 1.0000, N'0f391453-e020-40fa-83b3-fe63cc51dfff (1).jpg', 1, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (4, N'Sting', 1.0000, N'0f391453-e020-40fa-83b3-fe63cc51dfff (1).jpg', 1, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (5, N'Sting', 2.0000, N'0f391453-e020-40fa-83b3-fe63cc51dfff (1).jpg', 1, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (6, N'Sting', 2.0000, N'0f391453-e020-40fa-83b3-fe63cc51dfff (1).jpg', 1, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (7, N'Sting', 2.0000, N'0f391453-e020-40fa-83b3-fe63cc51dfff (1).jpg', 1, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (8, N'Sting', 2.0000, N'0f391453-e020-40fa-83b3-fe63cc51dfff (1).jpg', 1, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (9, N'Sting', 2.0000, N'0f391453-e020-40fa-83b3-fe63cc51dfff (1).jpg', 1, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (10, N'Sting', 2.0000, N'0f391453-e020-40fa-83b3-fe63cc51dfff (1).jpg', 1, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (11, N'Sting', 2.0000, N'0f391453-e020-40fa-83b3-fe63cc51dfff (1).jpg', 1, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (12, N'Sting', 2.0000, N'0f391453-e020-40fa-83b3-fe63cc51dfff (1).jpg', 1, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (13, N'Sting', 2.0000, N'0f391453-e020-40fa-83b3-fe63cc51dfff (1).jpg', 1, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (14, N'Sting', 2.0000, N'0f391453-e020-40fa-83b3-fe63cc51dfff (1).jpg', 1, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (15, N'Sting', 2.0000, N'0f391453-e020-40fa-83b3-fe63cc51dfff (1).jpg', 1, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (16, N'Sting', 2.0000, N'0f391453-e020-40fa-83b3-fe63cc51dfff (1).jpg', 1, NULL)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (17, N'Sting', 2.0000, N'0f391453-e020-40fa-83b3-fe63cc51dfff (1).jpg', 1, NULL)
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
