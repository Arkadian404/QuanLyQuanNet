CREATE DATABASE QLNET_OFFICIAL
GO


USE [QLNET_OFFICIAL]
GO
/****** Object:  UserDefinedFunction [dbo].[sf_DangNhapTaiKhoan]    Script Date: 10/26/2022 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[sf_DangNhapTaiKhoan] (@taikhoan_input varchar(30), @matkhau_input varchar(30)) 
RETURNS tinyint
AS
BEGIN
	DECLARE @flag tinyint, @taikhoan varchar(30), @matkhau varchar(30)
	
	if(EXISTS(SELECT * FROM TAIKHOAN tk
		WHERE tk.TaiKhoan = @taikhoan_input))
	BEGIN
		SELECT @taikhoan = tk.TaiKhoan, @matkhau = tk.MatKhau
		FROM TAIKHOAN tk
		WHERE tk.TaiKhoan = @taikhoan_input
		if (@matkhau = @matkhau_input)
			SET @flag = 1;			
		else
			SET @flag = 0;
		RETURN @flag;
	END
	ELSE
		SET @flag = 2;
	RETURN @flag;
END
GO
/****** Object:  Table [dbo].[BANGLUONG]    Script Date: 10/26/2022 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BANGLUONG](
	[MaLuong] [char](10) NOT NULL,
	[VaiTro] [nvarchar](50) NOT NULL,
	[LuongTheoGio] [real] NOT NULL,
	[HinhThuc] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLuong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CONGVIEC]    Script Date: 10/26/2022 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONGVIEC](
	[MaCV] [char](10) NOT NULL,
	[TenCV] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GOIMON]    Script Date: 10/26/2022 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GOIMON](
	[STT] [int] IDENTITY(1,1) NOT NULL,
	[MaTK] [char](10) NULL,
	[MaMon] [char](10) NULL,
	[TongTien] [real] NOT NULL,
	[SoLuong] [int] NULL,
	[TrangThai] [char](15) NULL,
	[TgGoiMon] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[STT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 10/26/2022 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [char](10) NOT NULL,
	[MaTK] [char](10) NULL,
	[MaMay] [char](10) NULL,
	[HoTen] [nvarchar](50) NULL,
	[MaMayCu] [char](10) NULL,
	[ThoiGianConLai] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHACHHANGTHUONGXUYEN]    Script Date: 10/26/2022 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANGTHUONGXUYEN](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [char](10) NULL,
	[MaUuDai] [char](10) NULL,
	[SoTienNap] [real] NOT NULL,
	[TienGio] [real] NOT NULL,
	[TongThoiGian] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHACHHANGVANGLAI]    Script Date: 10/26/2022 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANGVANGLAI](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [char](10) NULL,
	[TienGio] [real] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MAYTINH]    Script Date: 10/26/2022 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MAYTINH](
	[MaMay] [char](10) NOT NULL,
	[Hang] [varchar](20) NOT NULL,
	[TrangThai] [nvarchar](5) NULL,
	[GiaTien] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 10/26/2022 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[MaNV] [char](10) NOT NULL,
	[MaLuong] [char](10) NULL,
	[MaCV] [char](10) NULL,
	[MaTK] [char](10) NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[Tuoi] [int] NOT NULL,
	[GioiTinh] [nvarchar](5) NOT NULL,
	[QueQuan] [nvarchar](100) NULL,
	[SDT] [char](20) NOT NULL,
	[TrinhDoVH] [nvarchar](50) NOT NULL,
	[TrinhDoHV] [nvarchar](50) NOT NULL,
	[SoNamKN] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QUANLYCONGVIEC]    Script Date: 10/26/2022 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QUANLYCONGVIEC](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [char](10) NULL,
	[NgayLamViec] [date] NULL,
	[CaLamViec] [nvarchar](10) NULL,
	[GioLamViec] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QUANTRI]    Script Date: 10/26/2022 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QUANTRI](
	[MaAdmin] [char](10) NOT NULL,
	[MaTK] [char](10) NOT NULL,
	[TgBatDau] [datetime] NOT NULL,
	[TgKetThuc] [datetime] NULL,
	[GhiChu] [char](100) NULL,
	[TinNhanAdmin] [nvarchar](100) NULL,
	[TinNhanNguoiDung] [nvarchar](100) NULL,
 CONSTRAINT [PK_QUANTRI_MaAdmin_MaTK_TgBatDau] PRIMARY KEY CLUSTERED 
(
	[MaAdmin] ASC,
	[MaTK] ASC,
	[TgBatDau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 10/26/2022 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[MaTK] [char](10) NOT NULL,
	[TaiKhoan] [varchar](30) NOT NULL,
	[MatKhau] [varchar](30) NOT NULL,
	[NgayTao] [date] NOT NULL,
	[TinhTrang] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THUCDON]    Script Date: 10/26/2022 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THUCDON](
	[MaMon] [char](10) NOT NULL,
	[TenMon] [nvarchar](10) NULL,
	[TienNguyenLieu] [real] NOT NULL,
	[GiaTien] [real] NOT NULL,
	[DaBan] [int] NOT NULL,
	[ConLai] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UUDAI]    Script Date: 10/26/2022 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UUDAI](
	[MaUuDai] [char](10) NOT NULL,
	[PhanTramTangThem] [real] NULL,
	[GhiChu] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaUuDai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BANGLUONG] ([MaLuong], [VaiTro], [LuongTheoGio], [HinhThuc]) VALUES (N'MaLuong001', N'Nhân viên', 14, N'Part-time')
INSERT [dbo].[BANGLUONG] ([MaLuong], [VaiTro], [LuongTheoGio], [HinhThuc]) VALUES (N'MaLuong002', N'Quản lí', 20, N'Full-time')
GO
INSERT [dbo].[CONGVIEC] ([MaCV], [TenCV]) VALUES (N'tn001     ', N'Thu Ngân')
INSERT [dbo].[CONGVIEC] ([MaCV], [TenCV]) VALUES (N'vs001     ', N'Vệ Sinh')
GO
SET IDENTITY_INSERT [dbo].[GOIMON] ON 

INSERT [dbo].[GOIMON] ([STT], [MaTK], [MaMon], [TongTien], [SoLuong], [TrangThai], [TgGoiMon]) VALUES (8, N'tk001     ', N'ma001     ', 125, 5, N'Thu tien...    ', CAST(N'2022-10-26T16:34:57.613' AS DateTime))
INSERT [dbo].[GOIMON] ([STT], [MaTK], [MaMon], [TongTien], [SoLuong], [TrangThai], [TgGoiMon]) VALUES (9, N'tk001     ', N'ma001     ', 125, 5, N'Thu tien...    ', CAST(N'2022-10-26T16:34:59.483' AS DateTime))
INSERT [dbo].[GOIMON] ([STT], [MaTK], [MaMon], [TongTien], [SoLuong], [TrangThai], [TgGoiMon]) VALUES (10, N'tk001     ', N'ma002     ', 125, 5, N'Thu tien...    ', CAST(N'2022-10-25T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[GOIMON] OFF
GO
INSERT [dbo].[KHACHHANG] ([MaKH], [MaTK], [MaMay], [HoTen], [MaMayCu], [ThoiGianConLai]) VALUES (N'kh001     ', N'tk001     ', NULL, N'Khach Hang A', N'Thuong001 ', 5.7241660859849715)
INSERT [dbo].[KHACHHANG] ([MaKH], [MaTK], [MaMay], [HoTen], [MaMayCu], [ThoiGianConLai]) VALUES (N'kh002     ', N'tk002     ', NULL, N'Khach Hang B', NULL, 4.9894444444444446)
GO
SET IDENTITY_INSERT [dbo].[KHACHHANGTHUONGXUYEN] ON 

INSERT [dbo].[KHACHHANGTHUONGXUYEN] ([ID], [MaKH], [MaUuDai], [SoTienNap], [TienGio], [TongThoiGian]) VALUES (1, N'kh001     ', NULL, 0, 6, 0.70972222222222225)
SET IDENTITY_INSERT [dbo].[KHACHHANGTHUONGXUYEN] OFF
GO
SET IDENTITY_INSERT [dbo].[KHACHHANGVANGLAI] ON 

INSERT [dbo].[KHACHHANGVANGLAI] ([ID], [MaKH], [TienGio]) VALUES (1, N'kh002     ', 8)
SET IDENTITY_INSERT [dbo].[KHACHHANGVANGLAI] OFF
GO
INSERT [dbo].[MAYTINH] ([MaMay], [Hang], [TrangThai], [GiaTien]) VALUES (N'Thuong001 ', N'Asus', N'on', 10000)
INSERT [dbo].[MAYTINH] ([MaMay], [Hang], [TrangThai], [GiaTien]) VALUES (N'Thuong002 ', N'Acer', N'on', 10000)
INSERT [dbo].[MAYTINH] ([MaMay], [Hang], [TrangThai], [GiaTien]) VALUES (N'Vip001    ', N'Dell', N'on', 10000)
GO
INSERT [dbo].[NHANVIEN] ([MaNV], [MaLuong], [MaCV], [MaTK], [HoTen], [Tuoi], [GioiTinh], [QueQuan], [SDT], [TrinhDoVH], [TrinhDoHV], [SoNamKN]) VALUES (N'tn001     ', N'maluong001', N'tn001     ', N'tk004     ', N'Nguyen Van A', 20, N'Nam', N'TPHCM', N'0111111111          ', N'DH', N'DH', 2)
INSERT [dbo].[NHANVIEN] ([MaNV], [MaLuong], [MaCV], [MaTK], [HoTen], [Tuoi], [GioiTinh], [QueQuan], [SDT], [TrinhDoVH], [TrinhDoHV], [SoNamKN]) VALUES (N'vs001     ', N'maluong001', N'vs001     ', N'tk005     ', N'Tran Thi B', 20, N'Nu', N'TPHCM', N'02222222222         ', N'DH', N'DH', 2)
GO
SET IDENTITY_INSERT [dbo].[QUANLYCONGVIEC] ON 

INSERT [dbo].[QUANLYCONGVIEC] ([ID], [MaNV], [NgayLamViec], [CaLamViec], [GioLamViec]) VALUES (1, N'tn001     ', CAST(N'2022-10-18' AS Date), N'13h-21h', 8)
INSERT [dbo].[QUANLYCONGVIEC] ([ID], [MaNV], [NgayLamViec], [CaLamViec], [GioLamViec]) VALUES (2, N'vs001     ', CAST(N'2022-10-18' AS Date), N'13h-21h', 8)
SET IDENTITY_INSERT [dbo].[QUANLYCONGVIEC] OFF
GO
INSERT [dbo].[QUANTRI] ([MaAdmin], [MaTK], [TgBatDau], [TgKetThuc], [GhiChu], [TinNhanAdmin], [TinNhanNguoiDung]) VALUES (N'tk004     ', N'tk001     ', CAST(N'2022-10-26T16:36:02.320' AS DateTime), CAST(N'2022-10-26T16:41:37.230' AS DateTime), NULL, NULL, N'hello')
GO
INSERT [dbo].[TAIKHOAN] ([MaTK], [TaiKhoan], [MatKhau], [NgayTao], [TinhTrang]) VALUES (N'tk001     ', N'taikhoan1', N'tk1', CAST(N'2022-10-18' AS Date), N'on')
INSERT [dbo].[TAIKHOAN] ([MaTK], [TaiKhoan], [MatKhau], [NgayTao], [TinhTrang]) VALUES (N'tk002     ', N'taikhoan2', N'tk2', CAST(N'2022-10-18' AS Date), N'on')
INSERT [dbo].[TAIKHOAN] ([MaTK], [TaiKhoan], [MatKhau], [NgayTao], [TinhTrang]) VALUES (N'tk003     ', N'admin1', N'ad1', CAST(N'2022-10-18' AS Date), N'on')
INSERT [dbo].[TAIKHOAN] ([MaTK], [TaiKhoan], [MatKhau], [NgayTao], [TinhTrang]) VALUES (N'tk004     ', N'thungan1', N'tn1', CAST(N'2022-10-18' AS Date), N'on')
INSERT [dbo].[TAIKHOAN] ([MaTK], [TaiKhoan], [MatKhau], [NgayTao], [TinhTrang]) VALUES (N'tk005     ', N'vesinh1', N'vs1', CAST(N'2022-10-18' AS Date), N'on')
GO
INSERT [dbo].[THUCDON] ([MaMon], [TenMon], [TienNguyenLieu], [GiaTien], [DaBan], [ConLai]) VALUES (N'ma001     ', N'Mì tôm', 10, 25, 0, 40)
INSERT [dbo].[THUCDON] ([MaMon], [TenMon], [TienNguyenLieu], [GiaTien], [DaBan], [ConLai]) VALUES (N'ma002     ', N'Cá viên', 20, 35, 0, 45)
INSERT [dbo].[THUCDON] ([MaMon], [TenMon], [TienNguyenLieu], [GiaTien], [DaBan], [ConLai]) VALUES (N'nu001     ', N'Pepsi', 6, 12, 0, 50)
INSERT [dbo].[THUCDON] ([MaMon], [TenMon], [TienNguyenLieu], [GiaTien], [DaBan], [ConLai]) VALUES (N'nu002     ', N'Cocacola', 6, 12, 0, 50)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__BANGLUON__4A1D98241B298AEA]    Script Date: 10/26/2022 4:45:04 PM ******/
ALTER TABLE [dbo].[BANGLUONG] ADD UNIQUE NONCLUSTERED 
(
	[VaiTro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__BANGLUON__4A1D98242C269121]    Script Date: 10/26/2022 4:45:04 PM ******/
ALTER TABLE [dbo].[BANGLUONG] ADD UNIQUE NONCLUSTERED 
(
	[VaiTro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__BANGLUON__4A1D9824AA033146]    Script Date: 10/26/2022 4:45:04 PM ******/
ALTER TABLE [dbo].[BANGLUONG] ADD UNIQUE NONCLUSTERED 
(
	[VaiTro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__CONGVIEC__4CF922062B8C20A6]    Script Date: 10/26/2022 4:45:04 PM ******/
ALTER TABLE [dbo].[CONGVIEC] ADD UNIQUE NONCLUSTERED 
(
	[TenCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KHACHHAN__27250071A58FA4F5]    Script Date: 10/26/2022 4:45:04 PM ******/
ALTER TABLE [dbo].[KHACHHANG] ADD UNIQUE NONCLUSTERED 
(
	[MaTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__NHANVIEN__CA1930A5E1F2CE78]    Script Date: 10/26/2022 4:45:04 PM ******/
ALTER TABLE [dbo].[NHANVIEN] ADD UNIQUE NONCLUSTERED 
(
	[SDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TAIKHOAN__D5B8C7F078F6A0B9]    Script Date: 10/26/2022 4:45:04 PM ******/
ALTER TABLE [dbo].[TAIKHOAN] ADD UNIQUE NONCLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TAIKHOAN__D5B8C7F0876410F7]    Script Date: 10/26/2022 4:45:04 PM ******/
ALTER TABLE [dbo].[TAIKHOAN] ADD UNIQUE NONCLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TAIKHOAN__D5B8C7F0957C22C7]    Script Date: 10/26/2022 4:45:04 PM ******/
ALTER TABLE [dbo].[TAIKHOAN] ADD UNIQUE NONCLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TAIKHOAN__D5B8C7F0FD5722FD]    Script Date: 10/26/2022 4:45:04 PM ******/
ALTER TABLE [dbo].[TAIKHOAN] ADD UNIQUE NONCLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__THUCDON__332EF5654638B0C6]    Script Date: 10/26/2022 4:45:04 PM ******/
ALTER TABLE [dbo].[THUCDON] ADD UNIQUE NONCLUSTERED 
(
	[TenMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__THUCDON__332EF5656CF2C5FC]    Script Date: 10/26/2022 4:45:04 PM ******/
ALTER TABLE [dbo].[THUCDON] ADD UNIQUE NONCLUSTERED 
(
	[TenMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__THUCDON__332EF56578347531]    Script Date: 10/26/2022 4:45:04 PM ******/
ALTER TABLE [dbo].[THUCDON] ADD UNIQUE NONCLUSTERED 
(
	[TenMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__THUCDON__332EF565FC38D770]    Script Date: 10/26/2022 4:45:04 PM ******/
ALTER TABLE [dbo].[THUCDON] ADD UNIQUE NONCLUSTERED 
(
	[TenMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GOIMON]  WITH CHECK ADD FOREIGN KEY([MaMon])
REFERENCES [dbo].[THUCDON] ([MaMon])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[GOIMON]  WITH CHECK ADD FOREIGN KEY([MaTK])
REFERENCES [dbo].[TAIKHOAN] ([MaTK])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[KHACHHANG]  WITH CHECK ADD FOREIGN KEY([MaMay])
REFERENCES [dbo].[MAYTINH] ([MaMay])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[KHACHHANG]  WITH CHECK ADD FOREIGN KEY([MaTK])
REFERENCES [dbo].[TAIKHOAN] ([MaTK])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[KHACHHANGTHUONGXUYEN]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[KHACHHANGTHUONGXUYEN]  WITH CHECK ADD  CONSTRAINT [FK_KHACHHANGTHUONGXUYEN_UUDAI_MaUuDai] FOREIGN KEY([MaUuDai])
REFERENCES [dbo].[UUDAI] ([MaUuDai])
GO
ALTER TABLE [dbo].[KHACHHANGTHUONGXUYEN] CHECK CONSTRAINT [FK_KHACHHANGTHUONGXUYEN_UUDAI_MaUuDai]
GO
ALTER TABLE [dbo].[KHACHHANGVANGLAI]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD FOREIGN KEY([MaCV])
REFERENCES [dbo].[CONGVIEC] ([MaCV])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD FOREIGN KEY([MaLuong])
REFERENCES [dbo].[BANGLUONG] ([MaLuong])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD FOREIGN KEY([MaTK])
REFERENCES [dbo].[TAIKHOAN] ([MaTK])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[QUANLYCONGVIEC]  WITH CHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[NHANVIEN] ([MaNV])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[QUANTRI]  WITH CHECK ADD  CONSTRAINT [FK_QUANTRI_TAIKHOAN_MaAdmin] FOREIGN KEY([MaAdmin])
REFERENCES [dbo].[TAIKHOAN] ([MaTK])
GO
ALTER TABLE [dbo].[QUANTRI] CHECK CONSTRAINT [FK_QUANTRI_TAIKHOAN_MaAdmin]
GO
ALTER TABLE [dbo].[QUANTRI]  WITH CHECK ADD  CONSTRAINT [FK_QUANTRI_TAIKHOAN_MaTK] FOREIGN KEY([MaTK])
REFERENCES [dbo].[TAIKHOAN] ([MaTK])
GO
ALTER TABLE [dbo].[QUANTRI] CHECK CONSTRAINT [FK_QUANTRI_TAIKHOAN_MaTK]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddTinNhanNguoiDung]    Script Date: 10/26/2022 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_AddTinNhanNguoiDung](@MaTK char(10), @noidungTinNhan nvarchar(100))
AS
BEGIN	
	DECLARE @MaAdmin char(10), 
	@TgBatDau datetime

	BEGIN TRAN

	SELECT TOP(1) @MaAdmin = qt.MaAdmin, @TgBatDau = qt.TgBatdau 
	FROM QUANTRI qt
	WHERE qt.MaTK = @MaTK
	ORDER BY qt.TgBatDau DESC
	
	IF (@MaAdmin IS NULL)
		BEGIN
			RAISERROR('Khong co nhan vien quan tri', 16, 1)
			ROLLBACK
			RETURN
		END
	ELSE
		BEGIN
			UPDATE QUANTRI
			SET TinNhanNguoiDung = @noidungTinNhan
			WHERE MaAdmin=@MaAdmin AND MaTK=@MaTK AND TgBatDau=@TgBatDau
			
		END
	COMMIT TRAN
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CapNhatMaMayChoKHACHHANG]    Script Date: 10/26/2022 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_CapNhatMaMayChoKHACHHANG](@MaKH char(10), @MaMay char(10))
AS 
BEGIN
	UPDATE KHACHHANG
	SET MaMay = @MaMay
	WHERE MaKH = @MaKH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DangXuatTaiKhoan]    Script Date: 10/26/2022 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_DangXuatTaiKhoan](@MaTK char(10))
AS
BEGIN
	/* off Tình Trạng Tài khoản */
	UPDATE TAIKHOAN
	SET TinhTrang='off'
	WHERE MaTK=@MaTK
END
GO
/****** Object:  StoredProcedure [dbo].[sp_KhachHangDoiMatKhau]    Script Date: 10/26/2022 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_KhachHangDoiMatKhau]
(@MaTK char(10), @matkhaucu varchar(30), @matkhaumoi varchar(30))
AS
BEGIN
	DECLARE @matkhau varchar(30)

	SELECT @matkhau = tk.MatKhau
	FROM TAIKHOAN tk
	WHERE tk.MaTK = @MaTK

	BEGIN TRAN

	IF (@matkhau IS NULL)
	BEGIN
		RAISERROR('Mat khau rong', 16, 1)
		ROLLBACK
		RETURN
	END
	ELSE 
	BEGIN
		IF (@matkhau = @matkhaucu)
			BEGIN
				UPDATE TAIKHOAN 
				SET MatKhau = @matkhaumoi
				WHERE TAIKHOAN.MaTK = @MaTK
			END
		ELSE
			BEGIN
				RAISERROR('Sai mat khau', 16, 1)
				ROLLBACK
				RETURN 
			END
	END
	COMMIT TRAN
END

GO
/****** Object:  StoredProcedure [dbo].[sp_KhachHangGoiMon]    Script Date: 10/26/2022 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_KhachHangGoiMon]
(@MaTK char(10), @MaMon char(10), @soluong int)
AS
BEGIN
	DECLARE @giatien real, @SoLuongConLai int

	SELECT @giatien = td.GiaTien, @SoLuongConLai = td.ConLai 
	FROM THUCDON td
	WHERE td.MaMon = @MaMon

	BEGIN TRAN

	IF (@giatien IS NULL)
	BEGIN
		RAISERROR('Khong tim thay mon an trong Thuc Don', 16, 1)
		ROLLBACK
		RETURN
	END
	ELSE
	BEGIN
		IF (@SoLuongConLai>@soluong)
		BEGIN
			INSERT INTO GOIMON (MaTK, MaMon, TongTien, TrangThai, SoLuong, TgGoiMon)
			VALUES (@MaTK, @MaMon, @soluong*@giatien, 'Thu tien...', @soluong,GETDATE())
			
		END
		ELSE
		BEGIN
			RAISERROR('Khong con du mon an trong Thuc Don', 16, 1)
			ROLLBACK 
			RETURN
		END
	END
	COMMIT TRAN
END
GO
/****** Object:  Trigger [dbo].[tg_GoiMonCapNhat_ConLai_THUCDON]    Script Date: 10/26/2022 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create TRIGGER [dbo].[tg_GoiMonCapNhat_ConLai_THUCDON] on [dbo].[GOIMON]
AFTER INSERT
AS
	DECLARE @STT int,
			@MaMon char(10), 
			@SoLuong int,
			@MaMonTrongThucDon char(10)
BEGIN
	/* Lay Ma Mon vua Them vao */
	SELECT  @STT = ne.STT,
			@MaMon = ne.MaMon, 
			@SoLuong = ne.SoLuong
	FROM inserted ne
	SELECT @MaMonTrongThucDon = td.MaMon
	FROM THUCDON td 
	WHERE td.MaMon = @MaMon


	BEGIN TRAN
	
	IF (@MaMonTrongThucDon IS NULL)
	BEGIN
		RAISERROR('Khong co mon an do trong thuc don', 16, 1)
		ROLLBACK
		RETURN
	END
	ELSE
	BEGIN
		/* Cap nhat so luong trong THUCDON */
		UPDATE THUCDON
		SET ConLai = ConLai - @SoLuong, DaBan = DaBan + @SoLuong
		WHERE MaMon = @MaMon
		
	END
	COMMIT TRAN
END
GO
ALTER TABLE [dbo].[GOIMON] ENABLE TRIGGER [tg_GoiMonCapNhat_ConLai_THUCDON]
GO
/****** Object:  Trigger [dbo].[tg_SuaSoLuongMonCapNhat_ConLai_THUCDON]    Script Date: 10/26/2022 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create TRIGGER [dbo].[tg_SuaSoLuongMonCapNhat_ConLai_THUCDON] on [dbo].[GOIMON]
AFTER UPDATE
AS
	DECLARE @STT int,
			@MaMon char(10), 
			@SoLuongNew int,
			@SoLuongOld int,
			@TrangThai char(15),
			@SLConLai int
BEGIN
	/* Lay Ma Mon vua Them vao */
	SELECT  @STT = ne.STT,
			@MaMon = ne.MaMon, 
			@SoLuongNew = ne.SoLuong,
			@TrangThai = ne.TrangThai
	FROM inserted ne

	SELECT @SoLuongOld = ol.SoLuong
	FROM deleted ol

	SELECT @SLConLai = td.ConLai
	FROM THUCDON td
	WHERE td.MaMon = @MaMon

	BEGIN TRAN

	IF (@TrangThai = 'Thu tien...')
	BEGIN
		IF (@SoLuongNew < @SLConLai)
		BEGIN
			/* Cap nhat so luong trong THUCDON */
			UPDATE THUCDON
			SET ConLai = ConLai + @SoLuongOld - @SoLuongNew, DaBan = DaBan + @SoLuongNew - @SoLuongOld
			WHERE MaMon = @MaMon
			
		END
		ELSE
		BEGIN
			RAISERROR('Khong con du mon trong thuc don', 16, 1)
			ROLLBACK
			RETURN
		END	
	END
	ELSE
	BEGIN
		RAISERROR('Bep dang lam mon an cho ban', 16, 1)
		ROLLBACK
		RETURN
	END
	COMMIT TRAN
END
GO
ALTER TABLE [dbo].[GOIMON] ENABLE TRIGGER [tg_SuaSoLuongMonCapNhat_ConLai_THUCDON]
GO
/****** Object:  Trigger [dbo].[tg_XoaGoiMonCapNhat_ConLai_THUCDON]    Script Date: 10/26/2022 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create TRIGGER [dbo].[tg_XoaGoiMonCapNhat_ConLai_THUCDON] on [dbo].[GOIMON]
FOR DELETE
AS
	DECLARE @STT int,
			@MaMon char(10), 
			@SoLuong int,
			@TrangThai char(15)
BEGIN
	/* Lay Ma Mon vua Them vao */
	SELECT  @STT = ol.STT,
			@MaMon = ol.MaMon, 
			@SoLuong = ol.SoLuong,
			@TrangThai = ol.TrangThai
	FROM deleted ol
	
	BEGIN TRAN
	IF (@TrangThai = 'Thu tien...')
	BEGIN
		/* Cap nhat so luong trong THUCDON */
		UPDATE THUCDON
		SET ConLai = ConLai + @SoLuong, DaBan = DaBan - @SoLuong
		WHERE MaMon = @MaMon
		
	END
	ELSE 
	BEGIN
		RAISERROR('Bep dang lam mon an cho ban', 16, 1)
		ROLLBACK
		RETURN
	END
	COMMIT TRAN
END
GO
ALTER TABLE [dbo].[GOIMON] ENABLE TRIGGER [tg_XoaGoiMonCapNhat_ConLai_THUCDON]
GO
/****** Object:  Trigger [dbo].[tg_KhachHangSuDungMayTinh_CapNhat_QuanTri]    Script Date: 10/26/2022 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tg_KhachHangSuDungMayTinh_CapNhat_QuanTri] on [dbo].[KHACHHANG]
AFTER UPDATE
AS
	DECLARE  @MaMayNew char(10),
			@MaMayCu char(10),
			@MaKH char(10),
			@TgConLai real,
			@MaTK char(10)
BEGIN
	SELECT @MaMayNew=ne.MaMay, @MaMayCu=ne.MaMayCu, 
				@MaKH=ne.MaKH, @TgConLai = ne.ThoiGianConLai, @MaTK = ne.MaTK
	FROM inserted ne

	BEGIN TRAN

	IF (@MaMayNew IS NOT NULL)
	BEGIN

		/*Kiem tra loai may*/
		DECLARE @MayThuong char(10),
				@MayVip char(10)

		/*Lay loai may tu MaMay vua dang nhap*/
		SET @MayThuong = SUBSTRING(@MaMayNew, 1, 6)
		SET @MayVip = SUBSTRING(@MaMayNew, 1, 3)
	
	

		/*Neu la may thuong*/
		IF (@MayThuong = 'Thuong')
		BEGIN
			SET @MayThuong = SUBSTRING(@MaMayCu, 1, 6)
			SET @MayVip = SUBSTRING(@MaMayCu, 1, 3)

			IF (@MayVip='Vip')
				SET @TgConLai = 1.25  * @TgConLai
		END
		ELSE
		BEGIN
			/*Neu la may Vip*/
			IF (@MayVip = 'Vip')
			BEGIN
			SET @MayThuong = SUBSTRING(@MaMayCu, 1, 6)
			SET @MayVip = SUBSTRING(@MaMayCu, 1, 3)

			IF (@MayThuong='Thuong')
				SET @TgConLai = 0.8  * @TgConLai
			END
		END
		/*Update ThoiGianConLai*/
		UPDATE KHACHHANG
		SET ThoiGianConLai = @TgConLai
		WHERE MaKH = @MaKH

		/*Them vao bang QUANTRI*/
		DECLARE @MaTKNhanVienThuNgan char(10)

		SELECT @MaTKNhanVienThuNgan = nv.MaTK
		FROM [dbo].[NHANVIEN] nv 
		JOIN TAIKHOAN tk
		ON nv.MaTK = tk.MaTK
		JOIN [dbo].[CONGVIEC] cv
		ON cv.MaCV = nv.MaCV
		WHERE tk.TinhTrang = 'on' AND cv.TenCV = 'Thu Ngân'

		IF (@MaTKNhanVienThuNgan IS NULL)
		BEGIN
			RAISERROR('MaTKNhanVienThuNgan may null', 16, 1)
			ROLLBACK
			RETURN
		END
		ELSE
		BEGIN
			INSERT INTO [dbo].[QUANTRI] (MaAdmin, MaTK, TgBatDau) 
			VALUES (@MaTKNhanVienThuNgan, @MaTK, GETDATE())
			
		END
	END
	COMMIT TRAN
END
GO
ALTER TABLE [dbo].[KHACHHANG] ENABLE TRIGGER [tg_KhachHangSuDungMayTinh_CapNhat_QuanTri]
GO
/****** Object:  Trigger [dbo].[TTMayTinhThayDoiKhachHang]    Script Date: 10/26/2022 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create TRIGGER [dbo].[TTMayTinhThayDoiKhachHang] on [dbo].[MAYTINH]
AFTER UPDATE
AS
	DECLARE @NewTrangThai nvarchar(5),
			@MaMay char(10)
BEGIN
	SELECT @NewTrangThai = ne.TrangThai, @MaMay = ne.MaMay
	FROM inserted ne
	
	BEGIN TRAN

	IF (@NewTrangThai = 'off')
	BEGIN
		UPDATE KHACHHANG
		SET MaMay = null
		FROM KHACHHANG kh
		WHERE kh.MaMay = @MaMay
		
	END
	--ELSE
	--BEGIN
	--	RAISERROR('May tinh con hoat dong', 16, 1)
	--	ROLLBACK
	--	RETURN
	--END
	COMMIT TRAN
END





GO
ALTER TABLE [dbo].[MAYTINH] ENABLE TRIGGER [TTMayTinhThayDoiKhachHang]
GO
/****** Object:  Trigger [dbo].[tg_DangXuatTaiKhoanUpdate_KHACHHANG_QUANTRI_KHACHHANGTHUONGXUYEN]    Script Date: 10/26/2022 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tg_DangXuatTaiKhoanUpdate_KHACHHANG_QUANTRI_KHACHHANGTHUONGXUYEN] on [dbo].[TAIKHOAN]
AFTER UPDATE
AS
BEGIN
	/*Lấy MaTK và TinhTrang mới đăng xuất*/
	DECLARE @MaTK char(10), @TinhTrangNew varchar(30)
	SELECT @MaTK = ne.MaTK, @TinhTrangNew = ne.TinhTrang
	FROM inserted ne

	
	BEGIN TRAN
	IF (@TinhTrangNew='off')
	BEGIN
		/*Cập nhật TgKetThuc bản quản trị*/
		DECLARE @MaAdmin char(10), 	@TgBatDau datetime, @TgKetThuc datetime

		SELECT TOP(1) @MaAdmin = qt.MaAdmin, @TgBatDau = qt.TgBatdau 
		FROM QUANTRI qt
		WHERE qt.MaTK = @MaTK
		ORDER BY qt.TgBatDau DESC

		UPDATE QUANTRI
		SET @TgKetThuc = GETDATE(), TgKetThuc = GETDATE()
		WHERE MaAdmin=@MaAdmin AND MaTK=@MaTK AND TgBatDau=@TgBatDau

		/*Cập nhật TongThoiGian*/
		-- Lấy mã khách hàng
		DECLARE @MaKH char(10), 
				@TGConLai int
		SELECT @MaKH = kh.MaKH, @TGConLai = kh.ThoiGianConLai
		FROM KHACHHANG kh
		WHERE kh.MaTK = @MaTK
		
		--Tính thời gian cộng thêm
		DECLARE @TgThem float
		SELECT @TgThem = CAST(DATEDIFF(second, @TgBatDau, @TgKetThuc) as float)/3600.0
		--Update tổng thời gian
		UPDATE KHACHHANGTHUONGXUYEN
		SET TongThoiGian = TongThoiGian + @TgThem

		IF (@TgThem <= @TGConLai)
		BEGIN
			/*Cập nhật mã máy cũ và số giờ còn lại, set null MaMay*/
			UPDATE KHACHHANG
			SET ThoiGianConLai = ThoiGianConLai - @TgThem, MaMayCu = MaMay, MaMay = null
			WHERE MaTK=@MaTK	
		END
		ELSE
		BEGIN
			RAISERROR('Thoi gian choi > Thoi gian con lai', 16, 1)
			ROLLBACK
			RETURN
		END
	END
	COMMIT TRAN
END
GO
ALTER TABLE [dbo].[TAIKHOAN] ENABLE TRIGGER [tg_DangXuatTaiKhoanUpdate_KHACHHANG_QUANTRI_KHACHHANGTHUONGXUYEN]
GO
/****** Object:  Trigger [dbo].[tg_TTTaiKhoanThayDoiKhachHang]    Script Date: 10/26/2022 4:45:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tg_TTTaiKhoanThayDoiKhachHang] on [dbo].[TAIKHOAN]
AFTER UPDATE
AS
	DECLARE @newTinhTrang varchar(30),
			@MaTK char(10)
BEGIN
	SELECT @newTinhTrang = ne.TinhTrang, @MaTK = ne.MaTK
	FROM inserted ne

	BEGIN TRAN

	IF (@newTinhTrang = 'off')
	BEGIN
		UPDATE KHACHHANG
		SET MaMay = null
		FROM KHACHHANG kh
		WHERE kh.MaTK = @MaTK
		
	END
	COMMIT TRAN
END
GO
ALTER TABLE [dbo].[TAIKHOAN] ENABLE TRIGGER [tg_TTTaiKhoanThayDoiKhachHang]
GO
USE [master]
GO
ALTER DATABASE [NET] SET  READ_WRITE 
GO