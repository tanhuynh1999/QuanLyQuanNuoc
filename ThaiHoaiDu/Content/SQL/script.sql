USE [master]
GO
/****** Object:  Database [QuanLyQuanNuoc]    Script Date: 4/17/2020 1:08:00 PM ******/
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
/****** Object:  Table [dbo].[Ban]    Script Date: 4/17/2020 1:08:00 PM ******/
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
/****** Object:  Table [dbo].[CTHD]    Script Date: 4/17/2020 1:08:00 PM ******/
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
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 4/17/2020 1:08:00 PM ******/
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
/****** Object:  Table [dbo].[HoaDon]    Script Date: 4/17/2020 1:08:00 PM ******/
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
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 4/17/2020 1:08:00 PM ******/
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
/****** Object:  Table [dbo].[Spham]    Script Date: 4/17/2020 1:08:00 PM ******/
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
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (81, 45, 1, 16000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (81, 47, 1, 20000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (82, 19, 1, 12000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (82, 20, 1, 12000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [SoLuong], [ThanhTien]) VALUES (82, 34, 1, 18000.0000)
SET IDENTITY_INSERT [dbo].[DanhMuc] ON 

INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc]) VALUES (1, N'Cà phê')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc]) VALUES (2, N'Cacao')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc]) VALUES (3, N'Nước giải khát')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc]) VALUES (4, N'Lipton')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc]) VALUES (5, N'Yaourt')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc]) VALUES (6, N'Nước ép')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc]) VALUES (7, N'Trà')
SET IDENTITY_INSERT [dbo].[DanhMuc] OFF
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHD], [MaBan], [TongTien], [GioVao], [GioRa], [TinhTrang]) VALUES (81, 1, 36000.0000, CAST(0x0000ABA00012AE88 AS DateTime), CAST(0x0000ABA00012B598 AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaBan], [TongTien], [GioVao], [GioRa], [TinhTrang]) VALUES (82, 3, 42000.0000, CAST(0x0000ABA000CAFFDB AS DateTime), CAST(0x0000ABA000CB04C8 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([MaNguoiDung], [TenNguoiDung], [TaiKhoan], [MatKhau], [VaiTro], [NgayTao]) VALUES (1, N'Dư', N'admin', N'123', 1, NULL)
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
SET IDENTITY_INSERT [dbo].[Spham] ON 

INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (19, N'Cà phê nóng', 12000.0000, N'5468108078_cf129c5441_z.jpg', 0, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (20, N'Cà phê đá', 12000.0000, N'e2470fb9c529c0cccfdaf8264d96a8d6.jpg', 0, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (21, N'Cà phê sữa đá', 15000.0000, N'Vietnamese-Coffee-Caphe-Sua-Da-02-1280x1170.jpg', 0, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (22, N'Cà phê sữa nóng', 15000.0000, N'maxresdefault.jpg', 0, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (23, N'Cafe Capuchino', 24000.0000, N'Ca-phe-sua-da.jpg', 0, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (24, N'Cafe Mocha', 80000.0000, N'cach-pha-ca-phe-mocha-1.jpg', 0, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (25, N'Cafe cốt dừa', 30000.0000, N'recipe-cover-r28249.jpg', 0, 1)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (27, N'Cacao nóng', 22000.0000, N'recipe18916-636222385626592990.jpg', 0, 2)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (28, N'Cacao sữa đá', 25000.0000, N'cach-pha-ca-cao-sua-da-ngon-hap-dan-tai-nha-khong-can-ra-quan-nua.jpg', 1, 2)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (29, N'Cacao đá', 22000.0000, N'moc-tra-cacao-nong-300x300.jpg', 0, 2)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (31, N'Cacao sữa nóng', 25000.0000, N'ca-cao-nong.jpg', 0, 2)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (32, N'Cacao kem tươi', 27000.0000, N'cacao-nong-kem-tuoi.jpg', 0, 2)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (33, N'Cacao đá xay', 27000.0000, N'1466594856_ddb969589f7d4722b6f6381b9a333ef2.jpg', 0, 2)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (34, N'Bạc xỉu đá', 18000.0000, N'BacXiu-CaPheSuaDa_v01.jpg', 0, 2)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (35, N'Bạc xỉu nóng', 18000.0000, N'cach-lam-bac-xiu-nong.jpg', 0, 2)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (36, N'Chanh đá', 18000.0000, N'40_Other-kitchen-accessories_maxbrute.jpg', 0, 3)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (37, N'Chanh nóng', 18000.0000, N'Thay-the-nuoc-chanh-nong-1.jpg', 0, 3)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (38, N'Chanh muối đá', 15000.0000, N'cach-lam-chanh-muoi-ngon.jpg', 0, 3)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (39, N'Chanh muối nóng', 15000.0000, N'img_27711.jpg', 0, 3)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (40, N'Chanh xí muội', 0.0000, N'tra-chanh-xi-muoi-11556.jpg', 0, 3)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (41, N'Dừa tươi', 20000.0000, N'photo1530780323658-15307803236581688311414.jpg', 0, 3)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (42, N'Cam vắt', 25000.0000, N'cam-vat-4573.jpg', 0, 3)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (43, N'Cam vắt không đá', 35000.0000, N'nuoc-cam-ep-Vinfruits.jpeg', 0, 3)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (44, N'Sâm dứa sữa', 20000.0000, N'hinh-anh-cach-lam-nuoc-sam-dua-sua-7.jpg', 0, 3)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (45, N'Lipton nóng', 16000.0000, N'tra-lipton-ngon.jpg', 0, 4)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (46, N'Lipton đá', 16000.0000, N'tra-lipton-da1521777061.jpg', 0, 4)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (47, N'Lipton chanh', 20000.0000, N'lipton-chanh2.jpg', 0, 4)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (48, N'Lipton cam', 25000.0000, N'unnamed.png', 0, 4)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (49, N'Lipton xí muội', 20000.0000, N'a24d2f378a4df64ad5f42178410e306d.jpg', 0, 4)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (50, N'Lipton sữa', 22000.0000, N'chỉ mục.jfif', 0, 4)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (51, N'Yaourt hủ', 13000.0000, N'foody-upload-api-foody-mobile-hinh-thuy-tinh-yaour-190521101324.jpg', 0, 5)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (52, N'Yaourt đá', 18000.0000, N'cach-pha-che-yaourt-chanh-da-ngon-nhu-ngoai-hang-cach-lam-yourt-da-chanh-6-1529404784-299-width650height538.jpg', 0, 5)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (53, N'Yaourt cam', 25000.0000, N'yaourt-cam-🥤🥤-recipe-main-photo.jpg', 0, 5)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (54, N'Yaourt dâu', 27000.0000, N'Dau_Smoothie_thumb.jpg', 0, 5)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (55, N'Yaourt phúc bồn tử', 25000.0000, N'aaa.jfif', 0, 5)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (56, N'Yaourt việt quốc', 25000.0000, N'37685824_2122752597967411_5374442166900752384_n.jpg', 0, 5)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (57, N'Yaourt trái cây', 30000.0000, N'yaourt-trai-cay.jpg', 0, 5)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (58, N'Nước ép thơm', 27000.0000, N'Thơm-ép-1.jpg', 0, 6)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (59, N'Nước ép cà rốt', 27000.0000, N'Nước-ép-cà-rốt.jpg', 0, 6)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (60, N'Nước ép dưa hấu', 27000.0000, N'duahau.jfif', 0, 6)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (61, N'Nước ép cà chua', 27000.0000, N'tomato-juice.jpg', 0, 6)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (62, N'Nước ép táo', 27000.0000, N'p-t-o-min.jpg', 0, 6)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (63, N'Nước ép cam và cà rốt', 30000.0000, N'unnamed.jpg', 0, 6)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (64, N'Nước ép dâu', 75000.0000, N'dau.jpg', 0, 6)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (65, N'Nước ép bưởi', 30000.0000, N'buoi.jfif', 0, 6)
INSERT [dbo].[Spham] ([MaSanPham], [TenSanPham], [Gia], [Anh], [PhanBiet], [MaDanhMuc]) VALUES (66, N'Nước ép thập cẩm', 35000.0000, N'thapcam.jpg', 1, 6)
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
