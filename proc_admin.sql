Use QLNET_OFFICIAL
go


create Procedure sp_ThemCongViec (@maCV varchar(10), @tenCV nvarchar(50))
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
go

create Procedure sp_SuaCongViec (@maCV varchar (10), @tenCV nvarchar(50))
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
go

create Procedure sp_XoaCongViec (@maCV varchar(10))
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
go

create procedure sp_ThemBangLuong (@maLuong varchar(10), @vaiTro nvarchar(50), @luongTheoGio real, @hinhThuc nvarchar(50))
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
go

create procedure sp_SuaBangLuong (@maLuong varchar(10), @vaiTro nvarchar(50), @luongTheoGio real, @hinhThuc nvarchar(50))
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
go

create procedure sp_XoaBangLuong (@maLuong varchar(10))
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
go


create procedure sp_ThemNhanVien(@maNV varchar(10),@maLuong varchar(10), @maCV varchar(10), @maTk varchar(10), 
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
go

create procedure sp_SuaNhanVien(@maNV varchar(10),@maLuong varchar(10), @maCV varchar(10), @maTk varchar(10), 
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
go

create procedure sp_XoaNhanVien(@maNV varchar(10))
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
go


create procedure sp_ThemQLCV(@maNV varchar(10), @ngayLamViec date , @caLamViec nvarchar(10), @gioLamViec int)
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
go

create procedure sp_SuaQLCV(@id int, @maNV varchar(10), @ngayLamViec date , @caLamViec nvarchar(10), @gioLamViec int)
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
go

create procedure sp_XoaQLCV(@id int)
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
go

create procedure sp_ThemTaiKhoan (@maTK varchar(10), @taiKhoan varchar(30), @matKhau varchar(30), @ngayTao date, @tinhTrang varchar(30))
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
go

create procedure sp_SuaTaiKhoan (@maTK varchar(10), @taiKhoan varchar(30), @matKhau varchar(30), @ngayTao date, @tinhTrang varchar(30))
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
go

create procedure sp_XoaTaiKhoan (@maTK varchar(10))
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
go


create procedure sp_ThemKhachHang(@maKH varchar(10), @maTK varchar(10), @maMay varchar(10), @hoTen nvarchar(50),  @maMayCu varchar(10), @thoiGianConLai float)
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
go

create procedure sp_SuaKhachHang(@maKH varchar(10), @maTK varchar(10), @maMay varchar(10), @hoTen nvarchar(50),  @maMayCu varchar(10), @thoiGianConLai float)
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
go

create procedure sp_XoaKhachHang(@maKH varchar(10))
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
go


create procedure sp_ThemKHVL(@maKH varchar(10), @tienGio real)
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
go

create procedure sp_SuaKHVL(@id int ,@maKH varchar(10), @tienGio real)
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
go

create procedure sp_XoaKHVL(@id int)
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
go

create procedure sp_ThemKHTX(@maKH varchar(10), @maUuDai varchar(10), @soTienNap float, @tienGio float, @tongThoiGian float)
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
go

create procedure sp_SuaKHTX(@id int, @maKH varchar(10), @maUuDai varchar(10), @soTienNap float, @tienGio float, @tongThoiGian float)
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
go

create procedure sp_XoaKHTX(@id int)
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
go

create procedure sp_ThemQuanTri(@maAdmin varchar(10), @maTK varchar(10), @tgBatDau datetime, @tgKetThuc datetime,
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
go

create procedure sp_SuaQuanTri(@maAdmin varchar(10), @maTK varchar(10), @tgBatDau datetime, @tgKetThuc datetime,
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
go

create procedure sp_XoaQuanTri(@maAdmin varchar(10))
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
go

create procedure sp_ThemMayTinh(@maMay varchar(10), @hang varchar(20), @trangThai varchar(5), @giaTien int)
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
go

create procedure sp_SuaMayTinh(@maMay varchar(10), @hang varchar(20), @trangThai varchar(5), @giaTien int)
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
go


create procedure sp_XoaMayTinh(@maMay varchar(10))
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
go

create procedure sp_ThemThucDon(@maMon varchar(10), @tenMon nvarchar(20), @tienNguyenLieu real, @giaTien real, @daBan int, @conLai int)
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
go

create procedure sp_SuaThucDon(@maMon varchar(10), @tenMon nvarchar(20), @tienNguyenLieu real, @giaTien real, @daBan int, @conLai int)
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
go

create procedure sp_XoaThucDon(@maMon varchar(10))
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
go

create procedure sp_ThemGoiMon(@maTK varchar(10), @maMon varchar(10), @tongTien real, @soLuong int, @trangThai varchar(15), @tgGoiMon datetime)
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
go

create procedure sp_SuaGoiMon(@stt int, @maTK varchar(10), @maMon varchar(10), @tongTien real, @soLuong int, @trangThai varchar(15), @tgGoiMon datetime)
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
go

create procedure sp_XoaGoiMon(@stt int)
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
go

create procedure sp_ThemUuDai(@maUuDai varchar(10), @phanTramTangThem real, @ghiChu nvarchar(50))
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
go

create procedure sp_SuaUuDai(@maUuDai varchar(10), @phanTramTangThem real, @ghiChu nvarchar(50))
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
go

create procedure sp_XoaUuDai(@maUuDai varchar(10), @phanTramTangThem real, @ghiChu nvarchar(50))
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
go

create procedure sp_Login(@taiKhoan varchar(50), @matKhau varchar(50))
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
go

create procedure ThongKeChiPhiDATU
as
begin	
 
select TenMon, DaBan, DaBan*GiaTien as TongThu, (DaBan+ConLai)*TienNguyenLieu as TongChi, DaBan*GiaTien - (DaBan+ConLai)*TienNguyenLieu as LoiNhuan from THUCDON order by ConLai

end
go

Create View view_CongViec as
select * from CONGVIEC
go

Create View view_NhanVien as
select * from NHANVIEN
go

Create View view_BangLuong as
select * from BANGLUONG
go

Create View view_ThucDon as
select * from THUCDON
go

Create View view_GoiMon as
select * from GOIMON
go

Create View view_TaiKhoan as
select * from TAIKHOAN
go

Create View view_KhachHang as
select * from KHACHHANG
go

create View view_KHTX as
select * from KHACHHANGTHUONGXUYEN
go

create View view_KHVL as
select * from KHACHHANGVANGLAI
go

Create View view_QuanTri as
select * from QUANTRI
go

Create View view_QLCV as
select * from QUANLYCONGVIEC
go

Create View view_MayTinh as
select * from MAYTINH
go

Create View view_UuDai as
select * from UUDAI
go


Create View view_LuongNhanVien as
select nv.MaNV, nv.matk, nv.HoTen, nv.GioiTinh, nv.QueQuan, nv.SDT from NHANVIEN as nv, BANGLUONG as bl
where nv.MaLuong = bl.MaLuong
go


select * from view_CongViec
go


exec ThongKeChiPhiDATU