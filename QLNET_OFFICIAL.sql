USE [QLNET_OFFICIAL]
GO
/****** Object:  UserDefinedFunction [dbo].[sf_DangNhapTaiKhoan]    Script Date: 11/23/2022 10:05:52 AM ******/
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
/****** Object:  Table [dbo].[CONGVIEC]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONGVIEC](
	[MaCV] [varchar](50) NOT NULL,
	[TenCV] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__CONGVIEC__27258E76FFD5DC4F] PRIMARY KEY CLUSTERED 
(
	[MaCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__CONGVIEC__4CF9220619BB6A6C] UNIQUE NONCLUSTERED 
(
	[TenCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[TenCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[TenCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_CongViec]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create View [dbo].[view_CongViec] as
select * from CONGVIEC
GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[MaNV] [varchar](50) NOT NULL,
	[MaLuong] [varchar](50) NULL,
	[MaCV] [varchar](50) NULL,
	[MaTK] [varchar](50) NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[Tuoi] [int] NOT NULL,
	[GioiTinh] [nvarchar](5) NOT NULL,
	[QueQuan] [nvarchar](100) NULL,
	[SDT] [char](20) NOT NULL,
	[TrinhDoVH] [nvarchar](50) NOT NULL,
	[TrinhDoHV] [nvarchar](50) NULL,
	[SoNamKN] [int] NOT NULL,
 CONSTRAINT [PK__NHANVIEN__2725D70ADEA45C2D] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[SDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__NHANVIEN__CA1930A54B2304AF] UNIQUE NONCLUSTERED 
(
	[SDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__NHANVIEN__CA1930A553E84182] UNIQUE NONCLUSTERED 
(
	[SDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_NhanVien]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create View [dbo].[view_NhanVien] as
select * from NHANVIEN
GO
/****** Object:  Table [dbo].[BANGLUONG]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BANGLUONG](
	[MaLuong] [varchar](50) NOT NULL,
	[VaiTro] [nvarchar](50) NOT NULL,
	[LuongTheoGio] [real] NOT NULL,
	[HinhThuc] [nvarchar](50) NULL,
 CONSTRAINT [PK__BANGLUON__6609A48D168F6028] PRIMARY KEY CLUSTERED 
(
	[MaLuong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__BANGLUON__4A1D982408A033F2] UNIQUE NONCLUSTERED 
(
	[VaiTro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[VaiTro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[VaiTro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[VaiTro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__BANGLUON__4A1D9824547CBA97] UNIQUE NONCLUSTERED 
(
	[VaiTro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[VaiTro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[VaiTro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[VaiTro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__BANGLUON__4A1D9824FE65CD94] UNIQUE NONCLUSTERED 
(
	[VaiTro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_BangLuong]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create View [dbo].[view_BangLuong] as
select * from BANGLUONG
GO
/****** Object:  Table [dbo].[THUCDON]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THUCDON](
	[MaMon] [varchar](50) NOT NULL,
	[TenMon] [nvarchar](20) NULL,
	[TienNguyenLieu] [real] NOT NULL,
	[GiaTien] [real] NOT NULL,
	[DaBan] [int] NOT NULL,
	[ConLai] [int] NOT NULL,
 CONSTRAINT [PK__THUCDON__3A5B29A8E71F2FCE] PRIMARY KEY CLUSTERED 
(
	[MaMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__THUCDON__332EF5652D88679C] UNIQUE NONCLUSTERED 
(
	[TenMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__THUCDON__332EF5653EA71446] UNIQUE NONCLUSTERED 
(
	[TenMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__THUCDON__332EF565467CF44E] UNIQUE NONCLUSTERED 
(
	[TenMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__THUCDON__332EF56551A1D806] UNIQUE NONCLUSTERED 
(
	[TenMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__THUCDON__332EF5655A36B52B] UNIQUE NONCLUSTERED 
(
	[TenMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__THUCDON__332EF5656ECAA987] UNIQUE NONCLUSTERED 
(
	[TenMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__THUCDON__332EF56576D121F6] UNIQUE NONCLUSTERED 
(
	[TenMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__THUCDON__332EF5658C55C695] UNIQUE NONCLUSTERED 
(
	[TenMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__THUCDON__332EF5659A8C64A3] UNIQUE NONCLUSTERED 
(
	[TenMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__THUCDON__332EF565CB5E509F] UNIQUE NONCLUSTERED 
(
	[TenMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__THUCDON__332EF565D1ED62AE] UNIQUE NONCLUSTERED 
(
	[TenMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__THUCDON__332EF565FEF5BB40] UNIQUE NONCLUSTERED 
(
	[TenMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_ThucDon]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create View [dbo].[view_ThucDon] as
select * from THUCDON
GO
/****** Object:  Table [dbo].[GOIMON]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GOIMON](
	[STT] [int] IDENTITY(1,1) NOT NULL,
	[MaTK] [varchar](50) NULL,
	[MaMon] [varchar](50) NULL,
	[TongTien] [real] NOT NULL,
	[SoLuong] [int] NULL,
	[TrangThai] [char](15) NULL,
	[TgGoiMon] [datetime] NOT NULL,
 CONSTRAINT [PK__GOIMON__CA1EB690E294DCD2] PRIMARY KEY CLUSTERED 
(
	[STT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_GoiMon]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create View [dbo].[view_GoiMon] as
select * from GOIMON
GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[MaTK] [varchar](50) NOT NULL,
	[TaiKhoan] [varchar](30) NOT NULL,
	[MatKhau] [varchar](30) NOT NULL,
	[NgayTao] [date] NOT NULL,
	[TinhTrang] [varchar](30) NULL,
 CONSTRAINT [PK__TAIKHOAN__27250070EC2D6B2B] PRIMARY KEY CLUSTERED 
(
	[MaTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__TAIKHOAN__D5B8C7F08F3D1951] UNIQUE NONCLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__TAIKHOAN__D5B8C7F098630D39] UNIQUE NONCLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__TAIKHOAN__D5B8C7F09B8C130E] UNIQUE NONCLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__TAIKHOAN__D5B8C7F0DE579AAF] UNIQUE NONCLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_TaiKhoan]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create View [dbo].[view_TaiKhoan] as
select * from TAIKHOAN
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [varchar](50) NOT NULL,
	[MaTK] [varchar](50) NULL,
	[MaMay] [varchar](50) NULL,
	[HoTen] [nvarchar](50) NULL,
	[MaMayCu] [varchar](50) NULL,
	[ThoiGianConLai] [float] NULL,
 CONSTRAINT [PK__KHACHHAN__2725CF1E4CECB5D9] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[MaTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__KHACHHAN__272500716D044BE0] UNIQUE NONCLUSTERED 
(
	[MaTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[MaTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_KhachHang]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create View [dbo].[view_KhachHang] as
select * from KHACHHANG
GO
/****** Object:  Table [dbo].[KHACHHANGTHUONGXUYEN]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANGTHUONGXUYEN](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [varchar](50) NULL,
	[MaUuDai] [varchar](50) NULL,
	[SoTienNap] [real] NOT NULL,
	[TienGio] [real] NOT NULL,
	[TongThoiGian] [float] NULL,
 CONSTRAINT [PK__KHACHHAN__3214EC275D534B96] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_KHTX]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[view_KHTX] as
select * from KHACHHANGTHUONGXUYEN
GO
/****** Object:  Table [dbo].[KHACHHANGVANGLAI]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANGVANGLAI](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [varchar](50) NULL,
	[TienGio] [real] NOT NULL,
 CONSTRAINT [PK__KHACHHAN__3214EC27E9D801F0] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_KHVL]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE View [dbo].[view_KHVL] as
select * from KHACHHANGVANGLAI
GO
/****** Object:  Table [dbo].[QUANTRI]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QUANTRI](
	[MaAdmin] [varchar](50) NOT NULL,
	[MaTK] [varchar](50) NOT NULL,
	[TgBatDau] [datetime] NOT NULL,
	[TgKetThuc] [datetime] NULL,
	[GhiChu] [varchar](100) NULL,
	[TinNhanAdmin] [nvarchar](100) NULL,
	[TinNhanNguoiDung] [nvarchar](100) NULL,
 CONSTRAINT [PK_QUANTRI_MaAdmin_MaTK_TgBatDau] PRIMARY KEY CLUSTERED 
(
	[MaAdmin] ASC,
	[MaTK] ASC,
	[TgBatDau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_QuanTri]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create View [dbo].[view_QuanTri] as
select * from QUANTRI
GO
/****** Object:  Table [dbo].[QUANLYCONGVIEC]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QUANLYCONGVIEC](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [varchar](50) NULL,
	[NgayLamViec] [date] NULL,
	[CaLamViec] [nvarchar](10) NULL,
	[GioLamViec] [int] NULL,
 CONSTRAINT [PK__QUANLYCO__3214EC27FDDDF9DF] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_QLCV]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create View [dbo].[view_QLCV] as
select * from QUANLYCONGVIEC
GO
/****** Object:  Table [dbo].[MAYTINH]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MAYTINH](
	[MaMay] [varchar](50) NOT NULL,
	[Hang] [varchar](20) NOT NULL,
	[TrangThai] [nvarchar](5) NULL,
	[GiaTien] [int] NULL,
 CONSTRAINT [PK__MAYTINH__3A5BBB410890A036] PRIMARY KEY CLUSTERED 
(
	[MaMay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_MayTinh]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create View [dbo].[view_MayTinh] as
select * from MAYTINH
GO
/****** Object:  Table [dbo].[UUDAI]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UUDAI](
	[MaUuDai] [varchar](50) NOT NULL,
	[PhanTramTangThem] [real] NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK__UUDAI__9650302AA2CEE7A4] PRIMARY KEY CLUSTERED 
(
	[MaUuDai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_UuDai]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create View [dbo].[view_UuDai] as
select * from UUDAI
GO
/****** Object:  View [dbo].[view_LuongNhanVien]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create View [dbo].[view_LuongNhanVien] as
select nv.MaNV, nv.matk, nv.HoTen, nv.GioiTinh, nv.QueQuan, nv.SDT from NHANVIEN as nv, BANGLUONG as bl
where nv.MaLuong = bl.MaLuong
GO
ALTER TABLE [dbo].[GOIMON]  WITH CHECK ADD  CONSTRAINT [FK__GOIMON__MaMon__49C3F6B7] FOREIGN KEY([MaMon])
REFERENCES [dbo].[THUCDON] ([MaMon])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[GOIMON] CHECK CONSTRAINT [FK__GOIMON__MaMon__49C3F6B7]
GO
ALTER TABLE [dbo].[GOIMON]  WITH CHECK ADD  CONSTRAINT [FK__GOIMON__MaTK__4AB81AF0] FOREIGN KEY([MaTK])
REFERENCES [dbo].[TAIKHOAN] ([MaTK])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[GOIMON] CHECK CONSTRAINT [FK__GOIMON__MaTK__4AB81AF0]
GO
ALTER TABLE [dbo].[KHACHHANG]  WITH CHECK ADD  CONSTRAINT [FK__KHACHHANG__MaMay__4BAC3F29] FOREIGN KEY([MaMay])
REFERENCES [dbo].[MAYTINH] ([MaMay])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[KHACHHANG] CHECK CONSTRAINT [FK__KHACHHANG__MaMay__4BAC3F29]
GO
ALTER TABLE [dbo].[KHACHHANG]  WITH CHECK ADD  CONSTRAINT [FK__KHACHHANG__MaTK__4CA06362] FOREIGN KEY([MaTK])
REFERENCES [dbo].[TAIKHOAN] ([MaTK])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[KHACHHANG] CHECK CONSTRAINT [FK__KHACHHANG__MaTK__4CA06362]
GO
ALTER TABLE [dbo].[KHACHHANGTHUONGXUYEN]  WITH CHECK ADD  CONSTRAINT [FK__KHACHHANGT__MaKH__4D94879B] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[KHACHHANGTHUONGXUYEN] CHECK CONSTRAINT [FK__KHACHHANGT__MaKH__4D94879B]
GO
ALTER TABLE [dbo].[KHACHHANGTHUONGXUYEN]  WITH CHECK ADD  CONSTRAINT [FK_KHACHHANGTHUONGXUYEN_UUDAI_MaUuDai] FOREIGN KEY([MaUuDai])
REFERENCES [dbo].[UUDAI] ([MaUuDai])
GO
ALTER TABLE [dbo].[KHACHHANGTHUONGXUYEN] CHECK CONSTRAINT [FK_KHACHHANGTHUONGXUYEN_UUDAI_MaUuDai]
GO
ALTER TABLE [dbo].[KHACHHANGVANGLAI]  WITH CHECK ADD  CONSTRAINT [FK__KHACHHANGV__MaKH__4F7CD00D] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[KHACHHANGVANGLAI] CHECK CONSTRAINT [FK__KHACHHANGV__MaKH__4F7CD00D]
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD  CONSTRAINT [FK__NHANVIEN__MaCV__5070F446] FOREIGN KEY([MaCV])
REFERENCES [dbo].[CONGVIEC] ([MaCV])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[NHANVIEN] CHECK CONSTRAINT [FK__NHANVIEN__MaCV__5070F446]
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD  CONSTRAINT [FK__NHANVIEN__MaLuon__5165187F] FOREIGN KEY([MaLuong])
REFERENCES [dbo].[BANGLUONG] ([MaLuong])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[NHANVIEN] CHECK CONSTRAINT [FK__NHANVIEN__MaLuon__5165187F]
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD  CONSTRAINT [FK__NHANVIEN__MaTK__52593CB8] FOREIGN KEY([MaTK])
REFERENCES [dbo].[TAIKHOAN] ([MaTK])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[NHANVIEN] CHECK CONSTRAINT [FK__NHANVIEN__MaTK__52593CB8]
GO
ALTER TABLE [dbo].[QUANLYCONGVIEC]  WITH CHECK ADD  CONSTRAINT [FK__QUANLYCONG__MaNV__534D60F1] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NHANVIEN] ([MaNV])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[QUANLYCONGVIEC] CHECK CONSTRAINT [FK__QUANLYCONG__MaNV__534D60F1]
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
/****** Object:  StoredProcedure [dbo].[sp_AddTinNhanNguoiDung]    Script Date: 11/23/2022 10:05:52 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CapNhatMaMayChoKHACHHANG]    Script Date: 11/23/2022 10:05:52 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_DangXuatTaiKhoan]    Script Date: 11/23/2022 10:05:52 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_KhachHangDoiMatKhau]    Script Date: 11/23/2022 10:05:52 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_KhachHangGoiMon]    Script Date: 11/23/2022 10:05:52 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_Login]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_Login](@taiKhoan varchar(50), @matKhau varchar(50))
as
begin tran
	if(@taiKhoan is null or @matKhau is null)
		begin
			raiserror('Khong duoc bo trong',16,1)
			rollback
			return
		end
	declare @status varchar(10)
	if exists( select * from TAIKHOAN as tk join QUANTRI as qt on tk.MaTK = qt.MaAdmin where tk.TaiKhoan = @taiKhoan and tk.MatKhau = @matKhau)
		set @status = 'admin'
	else if exists( select tk.MaTK from TAIKHOAN as tk where tk.TaiKhoan = @taiKhoan and tk.MatKhau = @matKhau)
		select @status = tk.MaTK from TAIKHOAN as tk where tk.TaiKhoan = @taiKhoan and tk.MatKhau = @matKhau
	else
		set @status = 'none'
	select @status
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_SearchNhanVien]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_SearchNhanVien](@maNV varchar(10))
as
begin
	select * from NHANVIEN where MaNV = @maNV
end
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaBangLuong]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_SuaBangLuong] (@maLuong varchar(10), @vaiTro nvarchar(50), @luongTheoGio real, @hinhThuc nvarchar(50))
as
begin tran
if(@maLuong is null or @vaiTro is null or @luongTheoGio is null or @hinhThuc is null)
		begin
			raiserror('Khong duoc bo trong!', 16,1)
			rollback
			return
		end
	update BANGLUONG set VaiTro = @vaiTro, LuongTheoGio = @luongTheoGio, HinhThuc= @hinhThuc where MaLuong = @maLuong
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaCongViec]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[sp_SuaCongViec] (@maCV varchar (10), @tenCV nvarchar(50))
as
begin tran
	if(@maCV is null or @tenCV is null)
		begin
			raiserror('Khong duoc bo trong!', 16,1)
			rollback
			return
		end
	update CONGVIEC set TenCV = @tenCV where MaCV = @maCV
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaGoiMon]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_SuaGoiMon](@stt int, @maTK varchar(10), @maMon varchar(10), @tongTien real, @soLuong int, @trangThai varchar(15), @tgGoiMon datetime)
as
begin tran
	if(@maTK is null or @maMon is null or  @tongTien is null or @soLuong is null or @trangThai is null or @tgGoiMon is null)
		begin
			raiserror('Khong duoc bo trong!',16,1)
			rollback
			return
		end
	update GOIMON set MaTK = @maTK, MaMon = @maMon, TongTien = @tongTien, SoLuong = @soLuong, TrangThai = @trangThai, TgGoiMon = @tgGoiMon
	where stt = @stt
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaKhachHang]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_SuaKhachHang](@maKH varchar(10), @maTK varchar(10), @maMay varchar(10), @hoTen nvarchar(50),  @maMayCu varchar(10), @thoiGianConLai float)
as
begin tran
	if(@maKH is null or @maTK is null or @hoTen is null)
		begin
			raiserror('Khong duoc bo trong!',16,1)
			rollback
			return
		end
	update KHACHHANG set MaTK = @maTK, MaMay = @maMay, HoTen=  @hoTen, MaMayCu = @maMayCu, ThoiGianConLai = @thoiGianConLai
	where MaKH = @maKH
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaKHTX]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_SuaKHTX](@id int, @maKH varchar(10), @maUuDai varchar(10), @soTienNap float, @tienGio float, @tongThoiGian float)
as
begin tran
	if(@maKH is null or @soTienNap is null or @tienGio is null)
		begin
			raiserror('Khong duoc bo trong!',16,1)
			rollback
			return
		end
	update KHACHHANGTHUONGXUYEN set MaKH = @maKH, MaUuDai = @maUuDai, SoTienNap = @soTienNap, TienGio = @tienGio, TongThoiGian = @tongThoiGian
	where id = @id
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaKHVL]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_SuaKHVL](@id int ,@maKH varchar(10), @tienGio real)
as
begin tran
	if(@maKH is null or @tienGio is null)
		begin
			raiserror('Khong duoc bo trong!',16,1)
			rollback
			return
		end
	update KHACHHANGVANGLAI set MaKH = @maKH, TienGio = @tienGio
	where id=@id
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaMayTinh]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_SuaMayTinh](@maMay varchar(10), @hang varchar(20), @trangThai varchar(5), @giaTien int)
as
begin tran
	if(@maMay is null or @hang is null or @trangThai is null or @giaTien is null)
		begin
			raiserror('Khong duoc bo trong!',16,1)
			rollback
			return
		end
	update MAYTINH set Hang = @hang, TrangThai = @trangThai, GiaTien = @giaTien
	where MaMay = @maMay
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaNhanVien]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_SuaNhanVien](@maNV varchar(10),@maLuong varchar(10), @maCV varchar(10), @maTk varchar(10), 
@hoTen nvarchar(50), @tuoi int, @gioiTinh nvarchar(5), @queQuan nvarchar(100), 
@sdt varchar(20), @trinhDoVH nvarchar(50), @trinhDoHV nvarchar(50), @soNamKN int)
as
begin tran
	if(@maNV is null or @maLuong is null or @maCV is null or @maTk is null or 
	@hoTen is null or @tuoi is null or @gioiTinh is null or @queQuan is null or 
	@sdt is null or @trinhDoVH is null or @trinhDoHV is null or @soNamKN is null)
		begin
			raiserror('Khong duoc bo trong!',16,1)
			rollback
			return
		end
	update NHANVIEN set MaLuong = @maLuong, MaCV = @maCV, MaTK = @maTk,
	HoTen = @hoTen, tuoi =  @tuoi, GioiTinh =  @gioiTinh, QueQuan = @queQuan,
	SDT = @sdt, TrinhDoVH = @trinhDoVH, TrinhDoHV = @trinhDoHV, SoNamKN = @soNamKN
	where MaNV = @maNV
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaQLCV]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_SuaQLCV](@id int, @maNV varchar(10), @ngayLamViec date , @caLamViec nvarchar(10), @gioLamViec int)
as
begin tran
	if(@maNV is null or @ngayLamViec is null or @caLamViec is null or @gioLamViec is null)
		begin
			raiserror('Khong duoc bo trong!',16,1)
			rollback
			return
		end
	update QUANLYCONGVIEC set MaNV = @maNV ,NgayLamViec = @ngayLamViec,CaLamViec = @caLamViec, GioLamViec = @gioLamViec
	where id = @id
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaQuanTri]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_SuaQuanTri](@maAdmin varchar(10), @maTK varchar(10), @tgBatDau datetime, @tgKetThuc datetime,
@ghiChu varchar(10), @tinNhanAdmin nvarchar(100), @tinNhanNguoiDung nvarchar(100))
as 
begin tran
	if(@maAdmin is null or @maTK is null or @tgBatDau is null)
		begin
			raiserror('Khong duoc bo trong!',16,1)
			rollback
			return
		end
	update QUANTRI set MaTK = @maTK, TgBatDau=  @tgBatDau, TgKetThuc = @tgKetThuc, 
	GhiChu = @ghiChu, TinNhanAdmin = @tinNhanAdmin, TinNhanNguoiDung = @tinNhanNguoiDung
	where MaAdmin = @maAdmin
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaTaiKhoan]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_SuaTaiKhoan] (@maTK varchar(10), @taiKhoan varchar(30), @matKhau varchar(30), @ngayTao date, @tinhTrang varchar(30))
as
begin tran
	if(@maTK is null or @taiKhoan is null or @matKhau is null or @ngayTao is null or @tinhTrang is null)
		begin
			raiserror('Khong duoc bo trong!',16,1)
			rollback
			return
		end
	update TAIKHOAN set TaiKhoan = @taiKhoan, MatKhau = @matKhau, NgayTao = @ngayTao, TinhTrang = @tinhTrang
	where MaTK = @maTK
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaThucDon]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_SuaThucDon](@maMon varchar(10), @tenMon nvarchar(20), @tienNguyenLieu real, @giaTien real, @daBan int, @conLai int)
as
begin tran
	if(@maMon is null or @tenMon is null or @tienNguyenLieu is null or @giaTien is null or @daBan is null or @conLai is null)
		begin
			raiserror('Khong duoc bo trong!',16,1)
			rollback
			return
		end
	update THUCDON set TenMon = @tenMon, TienNguyenLieu = @tienNguyenLieu, GiaTien = @giaTien, DaBan = @daBan, ConLai = @conLai
	where MaMon = @maMon
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_SuaUuDai]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_SuaUuDai](@maUuDai varchar(10), @phanTramTangThem real, @ghiChu nvarchar(50))
as
begin tran
	if(@maUuDai is null or @phanTramTangThem is null)
		begin
			raiserror('Khong duoc bo trong!', 16,1)
			rollback
			return
		end
	update UUDAI set PhanTramTangThem =  @phanTramTangThem, GhiChu = @ghiChu where MaUuDai = @maUuDai
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemBangLuong]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_ThemBangLuong] (@maLuong varchar(10), @vaiTro nvarchar(50), @luongTheoGio real, @hinhThuc nvarchar(50))
as
begin tran
	if(@maLuong is null or @vaiTro is null or @luongTheoGio is null or @hinhThuc is null)
		begin
			raiserror('Khong duoc bo trong!', 16,1)
			rollback
			return
		end
	insert into BANGLUONG values(@maLuong, @vaiTro, @luongTheoGio, @hinhThuc)
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemCongViec]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[sp_ThemCongViec] (@maCV varchar(10), @tenCV nvarchar(50))
as
begin tran
	if(@maCV is null or @tenCV is null)
		begin
			raiserror('Khong duoc bo trong!', 16,1)
			rollback
			return
		end
	Insert into CONGVIEC values (@maCV, @tenCV)
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemGoiMon]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_ThemGoiMon](@maTK varchar(10), @maMon varchar(10), @tongTien real, @soLuong int, @trangThai varchar(15), @tgGoiMon datetime)
as
begin tran
	if(@maTK is null or @maMon is null or  @tongTien is null or @soLuong is null or @trangThai is null or @tgGoiMon is null)
		begin
			raiserror('Khong duoc bo trong!',16,1)
			rollback
			return
		end
	insert into GOIMON values (@maTK, @maMon, @tongTien, @soLuong, @trangThai, @tgGoiMon)
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemKhachHang]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_ThemKhachHang](@maKH varchar(10), @maTK varchar(10), @maMay varchar(10), @hoTen nvarchar(50),  @maMayCu varchar(10), @thoiGianConLai float)
as
begin tran
	if(@maKH is null or @maTK is null or @hoTen is null)
		begin
			raiserror('Khong duoc bo trong!',16,1)
			rollback
			return
		end
	insert into KHACHHANG values(@maKH, @maTK, @maMay, @hoTen, @maMayCu, @thoiGianConLai)
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemKHTX]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_ThemKHTX](@maKH varchar(10), @maUuDai varchar(10), @soTienNap float, @tienGio float, @tongThoiGian float)
as
begin tran
	if(@maKH is null or @soTienNap is null or @tienGio is null)
		begin
			raiserror('Khong duoc bo trong!',16,1)
			rollback
			return
		end
	insert into KHACHHANGTHUONGXUYEN values (@maKH, @maUuDai, @soTienNap, @tienGio, @tongThoiGian)
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemKHVL]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[sp_ThemKHVL](@maKH varchar(10), @tienGio real)
as
begin tran
	if(@maKH is null or @tienGio is null)
		begin
			raiserror('Khong duoc bo trong!',16,1)
			rollback
			return
		end
	insert into KHACHHANGVANGLAI values(@maKH, @tienGio)
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemMayTinh]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_ThemMayTinh](@maMay varchar(10), @hang varchar(20), @trangThai varchar(5), @giaTien int)
as
begin tran
	if(@maMay is null or @hang is null or @trangThai is null or @giaTien is null)
		begin
			raiserror('Khong duoc bo trong!',16,1)
			rollback
			return
		end
	insert into MAYTINH values (@maMay, @hang, @trangThai, @giaTien)
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemNhanVien]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[sp_ThemNhanVien](@maNV varchar(10),@maLuong varchar(10), @maCV varchar(10), @maTk varchar(10), 
@hoTen nvarchar(50), @tuoi int, @gioiTinh nvarchar(5), @queQuan nvarchar(100), 
@sdt varchar(20), @trinhDoVH nvarchar(50), @trinhDoHV nvarchar(50), @soNamKN int)
as
begin tran
	if(@maNV is null or @maLuong is null or @maCV is null or @maTk is null or 
	@hoTen is null or @tuoi is null or @gioiTinh is null or @queQuan is null or 
	@sdt is null or @trinhDoVH is null or @trinhDoHV is null or @soNamKN is null)
		begin
			raiserror('Khong duoc bo trong!',16,1)
			rollback
			return
		end
	insert into NHANVIEN values (@maNV, @maLuong, @maCV, @maTk, @hoTen, @tuoi, @gioiTinh, @queQuan, @sdt, @trinhDoVH, @trinhDoHV, @soNamKN)
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemQLCV]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[sp_ThemQLCV](@maNV varchar(10), @ngayLamViec date , @caLamViec nvarchar(10), @gioLamViec int)
as
begin tran
	if(@maNV is null or @ngayLamViec is null or @caLamViec is null or @gioLamViec is null)
		begin
			raiserror('Khong duoc bo trong!',16,1)
			rollback
			return
		end
	insert into QUANLYCONGVIEC values (@maNV, @ngayLamViec, @caLamViec, @gioLamViec)
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemQuanTri]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_ThemQuanTri](@maAdmin varchar(10), @maTK varchar(10), @tgBatDau datetime, @tgKetThuc datetime,
@ghiChu varchar(10), @tinNhanAdmin nvarchar(100), @tinNhanNguoiDung nvarchar(100))
as 
begin tran
	if(@maAdmin is null or @maTK is null or @tgBatDau is null)
		begin
			raiserror('Khong duoc bo trong!',16,1)
			rollback
			return
		end
	insert into QUANTRI values (@maAdmin, @maTK, @tgBatDau, @tgKetThuc, @ghiChu, @tinNhanAdmin, @tinNhanNguoiDung)
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemTaiKhoan]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_ThemTaiKhoan] (@maTK varchar(10), @taiKhoan varchar(30), @matKhau varchar(30), @ngayTao date, @tinhTrang varchar(30))
as
begin tran
	if(@maTK is null or @taiKhoan is null or @matKhau is null or @ngayTao is null or @tinhTrang is null)
		begin
			raiserror('Khong duoc bo trong!',16,1)
			rollback
			return
		end
	insert into TAIKHOAN values(@maTK, @taiKhoan, @matKhau, @ngayTao, @tinhTrang)
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemThucDon]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_ThemThucDon](@maMon varchar(10), @tenMon nvarchar(20), @tienNguyenLieu real, @giaTien real, @daBan int, @conLai int)
as
begin tran
	if(@maMon is null or @tenMon is null or @tienNguyenLieu is null or @giaTien is null or @daBan is null or @conLai is null)
		begin
			raiserror('Khong duoc bo trong!',16,1)
			rollback
			return
		end
	insert into THUCDON values (@maMon, @tenMon, @tienNguyenLieu, @giaTien, @daBan, @conLai)
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemUuDai]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_ThemUuDai](@maUuDai varchar(10), @phanTramTangThem real, @ghiChu nvarchar(50))
as
begin tran
	if(@maUuDai is null or @phanTramTangThem is null)
		begin
			raiserror('Khong duoc bo trong!', 16,1)
			rollback
			return
		end
	insert into UUDAI values (@maUuDai, @phanTramTangThem, @ghiChu)
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaBangLuong]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_XoaBangLuong] (@maLuong varchar(10))
as
begin tran
if(@maLuong is null)
		begin
			raiserror('Khong duoc bo trong!', 16,1)
			rollback
			return
		end
	delete from BANGLUONG where MaLuong = @maLuong
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaCongViec]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[sp_XoaCongViec] (@maCV varchar(10))
as 
begin tran
	if(@maCV is null)
		begin
			raiserror('Khong duoc bo trong!', 16,1)
			rollback
			return
		end
	delete from CONGVIEC where MaCV = @maCV
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaGoiMon]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_XoaGoiMon](@stt int)
as
begin tran
	if(@stt is null)
		begin
			raiserror('Khong duoc bo trong!',16,1)
			rollback
			return
		end
	delete from GOIMON where stt = @stt
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaKhachHang]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_XoaKhachHang](@maKH varchar(10))
as
begin tran
	if(@maKH is null)
		begin
			raiserror('Khong duoc bo trong!',16,1)
			rollback
			return
		end
	delete from KHACHHANG where MaKH = @maKH
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaKHTX]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_XoaKHTX](@id int)
as
begin tran
	if(@id is null)
		begin
			raiserror('Khong duoc bo trong!',16,1)
			rollback
			return
		end
	delete  from KHACHHANGTHUONGXUYEN where id = @id
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaKHVL]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_XoaKHVL](@id int)
as
begin tran
	if(@id is null)
		begin
			raiserror('Khong duoc bo trong!',16,1)
			rollback
			return
		end
	delete from KHACHHANGVANGLAI where id = @id
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaMayTinh]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[sp_XoaMayTinh](@maMay varchar(10))
as
begin tran
	if(@maMay is null)
		begin
			raiserror('Khong duoc bo trong!',16,1)
			rollback
			return
		end
	delete from MAYTINH where MaMay = @maMay
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaNhanVien]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_XoaNhanVien](@maNV varchar(10))
as
begin tran
	if(@maNV is null)
		begin
			raiserror('Khong duoc bo trong!',16,1)
			rollback
			return
		end
	delete NHANVIEN where MaNV = @maNV
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaQLCV]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_XoaQLCV](@id int)
as
begin tran
	if(@id is null)
		begin
			raiserror('Khong duoc bo trong!',16,1)
			rollback
			return
		end
	delete from QUANLYCONGVIEC where id = @id
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaQuanTri]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_XoaQuanTri](@maAdmin varchar(10))
as 
begin tran
	if(@maAdmin is null)
		begin
			raiserror('Khong duoc bo trong!',16,1)
			rollback
			return
		end
	delete from QUANTRI where MaAdmin = @maAdmin
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaTaiKhoan]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_XoaTaiKhoan] (@maTK varchar(10))
as
begin tran
	if(@maTK is null)
		begin
			raiserror('Khong duoc bo trong!',16,1)
			rollback
			return
		end
	delete from TAIKHOAN where matk = @maTK
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaThucDon]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_XoaThucDon](@maMon varchar(10))
as
begin tran
	if(@maMon is null)
		begin
			raiserror('Khong duoc bo trong!',16,1)
			rollback
			return
		end
	delete from THUCDON where MaMon = @maMon
commit tran
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaUuDai]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_XoaUuDai](@maUuDai varchar(10), @phanTramTangThem real, @ghiChu nvarchar(50))
as
begin tran
	if(@maUuDai is null)
		begin
			raiserror('Khong duoc bo trong!', 16,1)
			rollback
			return
		end
	delete UUDAI where MaUuDai = @maUuDai
commit tran
GO
/****** Object:  StoredProcedure [dbo].[ThongKeChiPhiDATU]    Script Date: 11/23/2022 10:05:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ThongKeChiPhiDATU]
as
begin	
 
select TenMon, DaBan, DaBan*GiaTien as TongThu, (DaBan+ConLai)*TienNguyenLieu as TongChi, DaBan*GiaTien - (DaBan+ConLai)*TienNguyenLieu as LoiNhuan from THUCDON order by ConLai

end
GO
