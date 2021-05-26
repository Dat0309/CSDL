CREATE DATABASE Lab07_QLSV
GO
USE Lab07_QLSV
GO

CREATE TABLE Khoa(
	MSKhoa CHAR(3) PRIMARY KEY,
	TenKhoa NVARCHAR(30),
	TenTat CHAR(10)
)
GO

CREATE TABLE Lop(
	MSLop CHAR(5) PRIMARY KEY,
	TenLop CHAR(30),
	MSKhoa CHAR(3),
	NienKhoa int
)
GO

CREATE TABLE Tinh(
	MSTinh CHAR(3) PRIMARY KEY,
	TenTinh CHAR(10)
)
GO

CREATE TABLE MonHoc(
	MSMH CHAR(5) PRIMARY KEY,
	TenMH CHAR(30),
	HeSo TINYINT
)
GO

CREATE TABLE SinhVien(
	MSSV CHAR(10) PRIMARY KEY,
	Ho CHAR(20),
	Ten CHAR(10),
	NgaySinh DATETIME,
	MSTinh CHAR(3) REFERENCES dbo.Tinh(MSTinh),
	NgayNhapHoc DATETIME,
	MSLop CHAR(5) REFERENCES dbo.Lop(MSLop),
	Phai CHAR(3),
	DiaChi CHAR(30),
	DienThoai CHAR(10)
)
GO

CREATE TABLE BangDiem(
	MSSV CHAR(10) REFERENCES dbo.SinhVien(MSSV),
	MSMH CHAR(5) REFERENCES dbo.MonHoc(MSMH),
	LanThi TINYINT,
	Diem FLOAT,
	PRIMARY KEY(MSSV,MSMH,LanThi)
)
GO

------------------------------------------
INSERT dbo.Khoa
VALUES
(   '01',  -- MSKhoa - char(3)
    N'Công nghệ thông tin', -- TenKhoa - nvarchar(30)
    'CNTT'   -- TenTat - char(10)
    )
INSERT dbo.Khoa
VALUES
(   '02',  -- MSKhoa - char(3)
    N'Điện tử viễn thông', -- TenKhoa - nvarchar(30)
    'DTVT'   -- TenTat - char(10)
    )
INSERT dbo.Khoa
VALUES
(   '03',  -- MSKhoa - char(3)
    N'Quản trị kinh doanh', -- TenKhoa - nvarchar(30)
    'QTKD'   -- TenTat - char(10)
    )
INSERT dbo.Khoa
VALUES
(   '04',  -- MSKhoa - char(3)
    N'Công nghệ sinh học', -- TenKhoa - nvarchar(30)
    'CNSH'   -- TenTat - char(10)
    )

-----------------------------------------
INSERT dbo.Lop
VALUES
(   '98TH', -- MSLop - char(5)
    'Tin hoc khoa 1998', -- TenLop - char(30)
    '01', -- MSKhoa - char(3)
    1998   -- NienKhoa - int
    )
INSERT dbo.Lop
VALUES
(   '98VT', -- MSLop - char(5)
    'Vien thong khoa 1998', -- TenLop - char(30)
    '02', -- MSKhoa - char(3)
    1998   -- NienKhoa - int
    )
INSERT dbo.Lop
VALUES
(   '99TH', -- MSLop - char(5)
    'Tin hoc khoa 1999', -- TenLop - char(30)
    '01', -- MSKhoa - char(3)
    1999   -- NienKhoa - int
    )
INSERT dbo.Lop
VALUES
(   '99VT', -- MSLop - char(5)
    'Vien thong khoa 99', -- TenLop - char(30)
    '02', -- MSKhoa - char(3)
    1999   -- NienKhoa - int
    )
INSERT dbo.Lop
VALUES
(   '99QT', -- MSLop - char(5)
    'Quan tri khoa 1999', -- TenLop - char(30)
    '03', -- MSKhoa - char(3)
    1999   -- NienKhoa - int
    )

----------------------------------------
INSERT dbo.Tinh
VALUES
(   '01', -- MSTinh - char(3)
    'An Gian'  -- TenTinh - char(10)
    )
INSERT dbo.Tinh
VALUES
(   '02', -- MSTinh - char(3)
    'TPHCM'  -- TenTinh - char(10)
    )
INSERT dbo.Tinh
VALUES
(   '03', -- MSTinh - char(3)
    'Dong Nai'  -- TenTinh - char(10)
    )
INSERT dbo.Tinh
VALUES
(   '04', -- MSTinh - char(3)
    'Long An'  -- TenTinh - char(10)
    )
INSERT dbo.Tinh
VALUES
(   '05', -- MSTinh - char(3)
    'Hue'  -- TenTinh - char(10)
    )
INSERT dbo.Tinh
VALUES
(   '06', -- MSTinh - char(3)
    'Ca Mau'  -- TenTinh - char(10)
    )

----------------------------------------
INSERT dbo.MonHoc
VALUES
(   'TA01', -- MSMH - char(5)
    'Nhap mon tin hoc', -- TenMH - char(30)
    2   -- HeSo - tinyint
    )
INSERT dbo.MonHoc
VALUES
(   'TA02', -- MSMH - char(5)
    'Lap trinh co ban', -- TenMH - char(30)
    3   -- HeSo - tinyint
    )
INSERT dbo.MonHoc
VALUES
(   'TB01', -- MSMH - char(5)
    'Cau truc du lieu', -- TenMH - char(30)
    2   -- HeSo - tinyint
    )
INSERT dbo.MonHoc
VALUES
(   'TB02', -- MSMH - char(5)
    'Co so du lieu', -- TenMH - char(30)
    2   -- HeSo - tinyint
    )
INSERT dbo.MonHoc
VALUES
(   'QA01', -- MSMH - char(5)
    'Kinh te vi mo', -- TenMH - char(30)
    2   -- HeSo - tinyint
    )
INSERT dbo.MonHoc
VALUES
(   'QA02', -- MSMH - char(5)
    'Quan tri chat luong', -- TenMH - char(30)
    3   -- HeSo - tinyint
    )
INSERT dbo.MonHoc
VALUES
(   'VA01', -- MSMH - char(5)
    'Dien tu co ban', -- TenMH - char(30)
    2   -- HeSo - tinyint
    )
INSERT dbo.MonHoc
VALUES
(   'VA02', -- MSMH - char(5)
    'Mach so', -- TenMH - char(30)
    3   -- HeSo - tinyint
    )
INSERT dbo.MonHoc
VALUES
(   'VB01', -- MSMH - char(5)
    'Tryen so lieu', -- TenMH - char(30)
    3   -- HeSo - tinyint
    )
INSERT dbo.MonHoc
VALUES
(   'XA01', -- MSMH - char(5)
    'Vat ly dai cuong', -- TenMH - char(30)
    2   -- HeSo - tinyint
    )

---------------------------------
INSERT dbo.SinhVien
VALUES
(   '98TH001',        -- MSSV - char(10)
    'Nguyen Van',        -- Ho - char(20)
    'An',        -- Ten - char(10)
    '08/06/1980', -- NgaySinh - datetime
    '01',        -- MSTinh - char(3)
    '09/03/1998', -- NgayNhapHoc - datetime
    '98TH',        -- MSLop - char(5)
    'Yes',        -- Phai - char(3)
    '12 Tran Hung Dao, Q.1',        -- DiaChi - char(30)
    '8234512'         -- DienThoai - char(10)
    )
INSERT dbo.SinhVien
VALUES
(   '98TH002',        -- MSSV - char(10)
    'Le Thi',        -- Ho - char(20)
    'An',        -- Ten - char(10)
    '10/17/1979', -- NgaySinh - datetime
    '01',        -- MSTinh - char(3)
    '09/03/1998', -- NgayNhapHoc - datetime
    '98TH',        -- MSLop - char(5)
    'No',        -- Phai - char(3)
    '23 CMT8, Q. Tan Binh',        -- DiaChi - char(30)
    '0303234342'         -- DienThoai - char(10)
    )
INSERT dbo.SinhVien
VALUES
(   '98VT001',        -- MSSV - char(10)
    'Nguyen Duc',        -- Ho - char(20)
    'Binh',        -- Ten - char(10)
    '11/25/1981', -- NgaySinh - datetime
    '02',        -- MSTinh - char(3)
    '09/03/1998', -- NgayNhapHoc - datetime
    '98VT',        -- MSLop - char(5)
    'Yes',        -- Phai - char(3)
    '245 Lac Long Quan, Q.11',        -- DiaChi - char(30)
    '8654323'         -- DienThoai - char(10)
    )
INSERT dbo.SinhVien
VALUES
(   '98VT002',        -- MSSV - char(10)
    'Tran Ngoc',        -- Ho - char(20)
    'Anh',        -- Ten - char(10)
    '08/19/1980', -- NgaySinh - datetime
    '02',        -- MSTinh - char(3)
    '09/03/1998', -- NgayNhapHoc - datetime
    '98VT',        -- MSLop - char(5)
    'No',        -- Phai - char(3)
    '242 Tran Hung Dao, Q.1',        -- DiaChi - char(30)
    ''         -- DienThoai - char(10)
    )
INSERT dbo.SinhVien
VALUES
(   '99TH001',        -- MSSV - char(10)
    'Ly Van Hung',        -- Ho - char(20)
    'Dung',        -- Ten - char(10)
    '09/27/1981', -- NgaySinh - datetime
    '03',        -- MSTinh - char(3)
    '10/05/1999', -- NgayNhapHoc - datetime
    '99TH',        -- MSLop - char(5)
    'Yes',        -- Phai - char(3)
    '178 CMT8, Q. Tan Binh',        -- DiaChi - char(30)
    '7569213'         -- DienThoai - char(10)
    )
INSERT dbo.SinhVien
VALUES
(   '99TH002',        -- MSSV - char(10)
    'Van Minh',        -- Ho - char(20)
    'Hoang',        -- Ten - char(10)
    '01/01/1981', -- NgaySinh - datetime
    '04',        -- MSTinh - char(3)
    '10/05/1999', -- NgayNhapHoc - datetime
    '99TH',        -- MSLop - char(5)
    'Yes',        -- Phai - char(3)
    '272 Ly Thuong Kiet, Q.10',        -- DiaChi - char(30)
    '8341234'         -- DienThoai - char(10)
    )
INSERT dbo.SinhVien
VALUES
(   '99TH003',        -- MSSV - char(10)
    'Nguyen',        -- Ho - char(20)
    'Tuan',        -- Ten - char(10)
    '01/12/1980', -- NgaySinh - datetime
    '03',        -- MSTinh - char(3)
    '10/05/1999', -- NgayNhapHoc - datetime
    '99TH',        -- MSLop - char(5)
    'Yes',        -- Phai - char(3)
    '162 Tran Hung Dao, Q.5',        -- DiaChi - char(30)
    ''         -- DienThoai - char(10)
    )
INSERT dbo.SinhVien
VALUES
(   '99TH004',        -- MSSV - char(10)
    'Tran Van',        -- Ho - char(20)
    'Minh',        -- Ten - char(10)
    '06/25/1981', -- NgaySinh - datetime
    '04',        -- MSTinh - char(3)
    '10/05/1999', -- NgayNhapHoc - datetime
    '99TH',        -- MSLop - char(5)
    'Yes',        -- Phai - char(3)
    '147 Dien Bien Phu, Q.3',        -- DiaChi - char(30)
    '7236754'         -- DienThoai - char(10)
    )
INSERT dbo.SinhVien
VALUES
(   '99TH005',        -- MSSV - char(10)
    'Nguyen Thai',        -- Ho - char(20)
    'Minh',        -- Ten - char(10)
    '01/01/1980', -- NgaySinh - datetime
    '04',        -- MSTinh - char(3)
    '10/05/1999', -- NgayNhapHoc - datetime
    '99TH',        -- MSLop - char(5)
    'Yes',        -- Phai - char(3)
    '345 Le Dai Hanh, Q.1',        -- DiaChi - char(30)
    ''         -- DienThoai - char(10)
    )
INSERT dbo.SinhVien
VALUES
(   '99VT001',        -- MSSV - char(10)
    'Le Ngoc',        -- Ho - char(20)
    'Mai',        -- Ten - char(10)
    '06/21/1982', -- NgaySinh - datetime
    '01',        -- MSTinh - char(3)
    '10/05/1999', -- NgayNhapHoc - datetime
    '99VT',        -- MSLop - char(5)
    'No',        -- Phai - char(3)
    '129 Tran Hung Dao, Q.1',        -- DiaChi - char(30)
    '0903124534'         -- DienThoai - char(10)
    )
INSERT dbo.SinhVien
VALUES
(   '99QT001',        -- MSSV - char(10)
    'Nguyen Thi',        -- Ho - char(20)
    'Oanh',        -- Ten - char(10)
    '08/19/1973', -- NgaySinh - datetime
    '04',        -- MSTinh - char(3)
    '10/05/1999', -- NgayNhapHoc - datetime
    '99QT',        -- MSLop - char(5)
    'No',        -- Phai - char(3)
    '76 Hung Vuong, Q.5',        -- DiaChi - char(30)
    '0901656324'         -- DienThoai - char(10)
    )
INSERT dbo.SinhVien
VALUES
(   '99QT002',        -- MSSV - char(10)
    'Le My',        -- Ho - char(20)
    'Hanh',        -- Ten - char(10)
    '05/20/1976', -- NgaySinh - datetime
    '04',        -- MSTinh - char(3)
    '10/05/1999', -- NgayNhapHoc - datetime
    '99QT',        -- MSLop - char(5)
    'No',        -- Phai - char(3)
    '12 Phan Ngoc Thach, Q.3',        -- DiaChi - char(30)
    ''         -- DienThoai - char(10)
    )

----------------------------------------
INSERT dbo.BangDiem
VALUES
(   '98TH001', -- MSSV - char(10)
    'TA01', -- MSMH - char(5)
    1,  -- LanThi - tinyint
    8.5 -- Diem - float
    )
INSERT dbo.BangDiem
VALUES
(   '98TH001', -- MSSV - char(10)
    'TA02', -- MSMH - char(5)
    1,  -- LanThi - tinyint
    8 -- Diem - float
    )
INSERT dbo.BangDiem
VALUES
(   '98TH002', -- MSSV - char(10)
    'TA01', -- MSMH - char(5)
    1,  -- LanThi - tinyint
    4 -- Diem - float
    )
INSERT dbo.BangDiem
VALUES
(   '98TH002', -- MSSV - char(10)
    'TA01', -- MSMH - char(5)
    2,  -- LanThi - tinyint
    5.5 -- Diem - float
    )
INSERT dbo.BangDiem
VALUES
(   '98TH001', -- MSSV - char(10)
    'TB01', -- MSMH - char(5)
    1,  -- LanThi - tinyint
    7.5 -- Diem - float
    )
INSERT dbo.BangDiem
VALUES
(   '98TH002', -- MSSV - char(10)
    'TB01', -- MSMH - char(5)
    1,  -- LanThi - tinyint
    8 -- Diem - float
    )
INSERT dbo.BangDiem
VALUES
(   '98VT001', -- MSSV - char(10)
    'VA01', -- MSMH - char(5)
    1,  -- LanThi - tinyint
    4 -- Diem - float
    )
INSERT dbo.BangDiem
VALUES
(   '98VT001', -- MSSV - char(10)
    'VA01', -- MSMH - char(5)
    2,  -- LanThi - tinyint
    5 -- Diem - float
    )
INSERT dbo.BangDiem
VALUES
(   '98VT002', -- MSSV - char(10)
    'VA02', -- MSMH - char(5)
    1,  -- LanThi - tinyint
    7.5 -- Diem - float
    )
INSERT dbo.BangDiem
VALUES
(   '98TH001', -- MSSV - char(10)
    'TA01', -- MSMH - char(5)
    1,  -- LanThi - tinyint
    4 -- Diem - float
    )
INSERT dbo.BangDiem
VALUES
(   '99TH001', -- MSSV - char(10)
    'TA01', -- MSMH - char(5)
    2,  -- LanThi - tinyint
    6 -- Diem - float
    )
INSERT dbo.BangDiem
VALUES
(   '99TH001', -- MSSV - char(10)
    'TB01', -- MSMH - char(5)
    1,  -- LanThi - tinyint
    6.5 -- Diem - float
    )
INSERT dbo.BangDiem
VALUES
(   '99TH002', -- MSSV - char(10)
    'TB01', -- MSMH - char(5)
    1,  -- LanThi - tinyint
    10 -- Diem - float
    )
INSERT dbo.BangDiem
VALUES
(   '99TH002', -- MSSV - char(10)
    'TB02', -- MSMH - char(5)
    1,  -- LanThi - tinyint
    9 -- Diem - float
    )
INSERT dbo.BangDiem
VALUES
(   '99TH003', -- MSSV - char(10)
    'TA02', -- MSMH - char(5)
    1,  -- LanThi - tinyint
    7.5 -- Diem - float
    )
INSERT dbo.BangDiem
VALUES
(   '99TH003', -- MSSV - char(10)
    'TB01', -- MSMH - char(5)
    1,  -- LanThi - tinyint
    3 -- Diem - float
    )
INSERT dbo.BangDiem
VALUES
(   '99TH003', -- MSSV - char(10)
    'TB01', -- MSMH - char(5)
    2,  -- LanThi - tinyint
    6 -- Diem - float
    )
INSERT dbo.BangDiem
VALUES
(   '99TH003', -- MSSV - char(10)
    'TB02', -- MSMH - char(5)
    1,  -- LanThi - tinyint
    8 -- Diem - float
    )
INSERT dbo.BangDiem
VALUES
(   '99TH004', -- MSSV - char(10)
    'TB02', -- MSMH - char(5)
    1,  -- LanThi - tinyint
    2 -- Diem - float
    )
INSERT dbo.BangDiem
VALUES
(   '99TH004', -- MSSV - char(10)
    'TB02', -- MSMH - char(5)
    2,  -- LanThi - tinyint
    4 -- Diem - float
    )
INSERT dbo.BangDiem
VALUES
(   '99TH004', -- MSSV - char(10)
    'TB02', -- MSMH - char(5)
    3,  -- LanThi - tinyint
    3 -- Diem - float
    )
INSERT dbo.BangDiem
VALUES
(   '99QT001', -- MSSV - char(10)
    'QA01', -- MSMH - char(5)
    1,  -- LanThi - tinyint
    7 -- Diem - float
    )
INSERT dbo.BangDiem
VALUES
(   '99QT001', -- MSSV - char(10)
    'QA02', -- MSMH - char(5)
    1,  -- LanThi - tinyint
    6.5 -- Diem - float
    )
INSERT dbo.BangDiem
VALUES
(   '99QT002', -- MSSV - char(10)
    'QA01', -- MSMH - char(5)
    1,  -- LanThi - tinyint
    8.5 -- Diem - float
    )
INSERT dbo.BangDiem
VALUES
(   '99QT002', -- MSSV - char(10)
    'QA02', -- MSMH - char(5)
    1,  -- LanThi - tinyint
    9 -- Diem - float
    )


----------------------------------
--TRUY VẤN CƠ BẢN
----------------------------------
--1.liệt kê mssv, họ, tên, ddiacj chỉ của tất cả các sinh viên
SELECT MSSV,Ho,Ten,DiaChi 
FROM dbo.SinhVien
--2.Liệt kê mssv, họ, tên, ms tỉnh của tất cả các sinh viên. Sắp xếp kết quả theo MS tỉnh, trong cùng tỉnh sắp xếp theo họ tên của sinh viên
SELECT sv.MSSV,sv.Ho,sv.Ten,sv.MSTinh
FROM dbo.SinhVien sv
ORDER BY sv.MSTinh,sv.Ten
--3.Liệt kê các sinh viên nữ của tỉnh Long An
SELECT sv.MSSV,sv.Ho,sv.Ten,sv.NgaySinh,t.MSTinh,t.TenTinh
FROM dbo.SinhVien sv,dbo.Tinh t
WHERE sv.MSTinh=t.MSTinh AND t.TenTinh = 'Long An' AND sv.Phai='No'
--4.Liệt kê các sinh viên có sinh nhật trọng tháng giêng
SELECT *
FROM dbo.SinhVien
WHERE MONTH(NgaySinh) = 1
--5.Liệt kê các sinh viên có sinh nhật nhằm ngày 1/1
SELECT * 
FROM dbo.SinhVien
WHERE MONTH(NgaySinh)=1 AND DAY(NgaySinh)=1
--6.Liệt kê các sinh viên có số điện thoại
SELECT *
FROM dbo.SinhVien
WHERE DienThoai = ''
--7.Liệt kê các sinh viên có số điện thoại di động
SELECT * 
FROM dbo.SinhVien
WHERE LEN(DienThoai)>7
--8.Liệt kê các sinh viên tên 'Minh' học lớp '99TH'
SELECT *
FROM dbo.SinhVien
WHERE Ten='Minh' AND MSLop='99TH'
--9.Liệt kê các sih viên có địa chỉ ở đường 'Tran Hung Dao'
SELECT *
FROM dbo.SinhVien 
WHERE DiaChi LIKE '%Tran Hung Dao%'
--10.Liệt kê các sinh viên có tên lót 'Van'
SELECT *
FROM dbo.SinhVien
WHERE Ho LIKE '%Van'
--11.Liệt kê MSSV, họ tên, tuổi của các sinh viên ở tính Long an
SELECT MSSV,Ho + ' '+Ten AS HoTen,1999 - YEAR(NgaySinh) AS Tuoi
FROM dbo.SinhVien
--12.Liệt kê các sinh viên nam từ 23 đến 28 tuổi
SELECT MSSV,Ho + ' '+Ten AS HoTen,1999 - YEAR(NgaySinh) AS Tuoi
FROM dbo.SinhVien
WHERE 1999 - YEAR(NgaySinh) BETWEEN 23 AND 28
--13.Liệt kê các sinh viên nam từ 32 tuổi trở lên và các sinh nữ từ 27 tuổi trở lên
SELECT MSSV,Ho + ' '+Ten AS HoTen,YEAR(GETDATE()) - YEAR(NgaySinh) AS Tuoi, Phai
FROM dbo.SinhVien
WHERE YEAR(GETDATE()) - YEAR(NgaySinh) > 32 AND Phai = 'Yes' or MSSV IN(	SELECT sv.MSSV 
																			FROM dbo.SinhVien sv
																			WHERE YEAR(GETDATE()) - YEAR(sv.NgaySinh) > 27 AND sv.Phai ='No')
--14.Liệt kê các sinh viên nhập học còn dưới 18 tuổi hoặc đã trên 25 tuổi
SELECT MSSV,Ho + ' '+Ten AS HoTen,YEAR(NgayNhapHoc) - YEAR(NgaySinh) AS Tuoi
FROM dbo.SinhVien 
WHERE YEAR(NgayNhapHoc)-YEAR(NgaySinh) <18 OR YEAR(NgayNhapHoc)-YEAR(NgaySinh) >25
--15.Liệt kê các danh sách các sinh viên của khóa 99
SELECT * 
FROM dbo.SinhVien
WHERE MSSV LIKE '99%'
--16.Liệt kê MSSV, điểm thi lần 1 môn 'co so du lieu' của lớp '99TH'
SELECT sv.MSSV,bd.Diem
FROM dbo.BangDiem bd, dbo.MonHoc mh, dbo.SinhVien sv
WHERE bd.MSSV=sv.MSSV AND bd.MSMH=mh.MSMH AND mh.TenMH='Co so du lieu' AND bd.LanThi=1 AND sv.MSLop='99TH'
--17.Liệt kê mssv, họ tên của các sinh viên lớp '99TH' thi không đạt lần 1 môn csdl
SELECT DISTINCT(sv.MSSV), sv.Ho + ' '+sv.Ten AS HoTen
FROM dbo.BangDiem bd, dbo.MonHoc mh, dbo.SinhVien sv
WHERE bd.MSSV=sv.MSSV AND bd.MSMH=mh.MSMH AND mh.TenMH='Co so du lieu' AND bd.LanThi>1 AND sv.MSLop='99TH'
--18.Liệt kê tất cả các điểm thi của sinh viên có mã số '99TH001' theo mẫu sau:
SELECT bd.MSMH,mh.TenMH,bd.LanThi,bd.Diem
FROM dbo.MonHoc mh, dbo.BangDiem bd
WHERE mh.MSMH=bd.MSMH AND bd.MSSV='99TH001' 
--19.Liệt kê MSSV, họ tên, mslop của các sinh viên có điểm thi lần 1 môn 'co so du lieu' từ 8 điểm trở lên
SELECT sv.MSSV,sv.Ho+' '+sv.Ten AS HoTen
FROM dbo.BangDiem bd, dbo.MonHoc mh, dbo.SinhVien sv
WHERE bd.MSSV=sv.MSSV AND bd.MSMH=mh.MSMH AND mh.TenMH='Co so du lieu' AND bd.LanThi=1 AND bd.Diem >=8
--20.Liệt kê các tỉnh không có sinh viên theo học
SELECT *
FROM dbo.Tinh t
WHERE t.MSTinh NOT IN (	SELECT MSTinh FROM dbo.SinhVien)
--21.Liệt kê các sinh viên hiện chưa có điểm môn thi nào
SELECT * 
FROM dbo.SinhVien
WHERE MSSV NOT IN (	SELECT DISTINCT(MSSV) FROM dbo.BangDiem )

------------------------------------------------------------
--Truy vấn gom nhóm
------------------------------------------------------------
--22.Thống kê số lượng sinh viên ở mỗi lớp theo mẫu.
SELECT l.MSLop,l.TenLop, COUNT(sv.MSSV) AS SLSV
FROM dbo.SinhVien sv, dbo.Lop l
WHERE sv.MSLop=l.MSLop
GROUP BY l.MSLop,l.TenLop
--23.Thống kê só lượng sinh viên ở mỗi tỉnh theo mẫu sau:
SELECT A.MSTinh,A.TenTinh,SVNam.SoSVNam,SVNu.SoSVNu
FROM (SELECT t.MSTinh,t.TenTinh,COUNT(sv.Phai) AS TongSV
		FROM dbo.Tinh t,dbo.SinhVien sv
		WHERE sv.MSTinh=t.MSTinh
		GROUP BY t.MSTinh,t.TenTinh) AS A FULL JOIN (SELECT t.MSTinh,t.TenTinh,COUNT(sv.Phai) AS SoSVNam 
													FROM dbo.Tinh t,dbo.SinhVien sv
													WHERE t.MSTinh=sv.MSTinh AND sv.Phai='Yes'
													GROUP BY t.MSTinh,t.TenTinh) AS SVNam ON (A.MSTinh=SVNam.MSTinh) FULL JOIN(SELECT t.MSTinh,t.TenTinh,COUNT(sv.Phai) AS SoSVNu
																																FROM dbo.Tinh t,dbo.SinhVien sv
																																WHERE sv.MSTinh=t.MSTinh AND sv.Phai='No'
																																GROUP BY t.MSTinh,t.TenTinh) AS SVNu ON(SVNam.MSTinh=SVNu.MSTinh) 


--25.Lọc ra điểm cao nhất trong các lần thi cho các sinh viên tho mẫu sau:
SELECT bd.MSSV,mh.MSMH,mh.TenMH,mh.HeSo,MAX(bd.Diem) AS N'Điểm', MAX(bd.Diem)*mh.HeSo AS N'Điểm x hệ số'
FROM dbo.SinhVien sv, dbo.BangDiem bd,dbo.MonHoc mh
WHERE sv.MSSV=bd.MSSV AND bd.MSMH=mh.MSMH
GROUP BY bd.MSSV,mh.MSMH,mh.TenMH,mh.HeSo
--26.Lập bảng tổng kết theo mẫu
SELECT bd.MSSV,sv.Ho,sv.Ten,SUM(bd.Diem*mh.HeSo)/SUM(mh.HeSo) AS N'ĐTB'
FROM dbo.SinhVien sv, dbo.BangDiem bd,dbo.MonHoc mh
WHERE sv.MSSV=bd.MSSV AND bd.MSMH=mh.MSMH
GROUP BY bd.MSSV,sv.Ho,sv.Ten
--27.Thống kê số lượng sinh viên tỉnh 'Long An' đang theo học ở các khoa, theo mẫu sau:
SELECT l.NienKhoa,l.MSKhoa,k.TenKhoa,COUNT(sv.MSSV) AS SLSV
FROM dbo.SinhVien sv, dbo.Khoa k, dbo.Tinh t,dbo.Lop l
WHERE sv.MSTinh=t.MSTinh AND l.MSLop=sv.MSLop AND k.MSKhoa=l.MSKhoa AND t.TenTinh='Long An'
GROUP BY l.NienKhoa,l.MSKhoa,k.TenKhoa

----------------------------------------------------
--Hàm & thủ tục
----------------------------------------------------
--28.Nhập vào MSSV, in ra bảng điểm của sinh viên đó theo mẫu sau
CREATE PROC usp_InThongTinSV @mssv CHAR(10)
AS
	IF EXISTS(SELECT * FROM dbo.SinhVien WHERE MSSV=@mssv)
		BEGIN
		    SELECT mh.MSMH,mh.TenMH,mh.HeSo,MAX(bd.Diem) AS N'Điểm'
			FROM dbo.SinhVien sv, dbo.BangDiem bd,dbo.MonHoc mh
			WHERE sv.MSSV=bd.MSSV AND bd.MSMH=mh.MSMH AND sv.MSSV=@mssv
			GROUP BY mh.MSMH,mh.TenMH,mh.HeSo
		END
	ELSE
		PRINT N'Không tồn tại sinh viên!'

------------
EXEC usp_InThongTinSV '98TH001'

--29.Nhập vào MS lớp, in ra bảng tổng kết của lớp đó
CREATE PROC usp_InBTK @mslop CHAR(5)
AS
	IF EXISTS(SELECT * FROM dbo.Lop WHERE MSLop=@mslop)
		BEGIN
			
			SELECT bd.MSSV,sv.Ho,sv.Ten,SUM(bd.Diem*mh.HeSo)/SUM(mh.HeSo) AS N'ĐTB',N'Xếp Loại' =CASE
				WHEN SUM(bd.Diem*mh.HeSo)/SUM(mh.HeSo) >=8 THEN N'GIỎI'
				WHEN SUM(bd.Diem*mh.HeSo)/SUM(mh.HeSo)>=6 THEN N'KHÁ'
				WHEN SUM(bd.Diem*mh.HeSo)/SUM(mh.HeSo)>=5 THEN N'TRUNG BÌNH'
				ELSE N'Yếu' END
			FROM dbo.SinhVien sv, dbo.BangDiem bd,dbo.MonHoc mh
			WHERE sv.MSSV=bd.MSSV AND bd.MSMH=mh.MSMH AND sv.MSLop=@mslop
			GROUP BY bd.MSSV,sv.Ho,sv.Ten
		END
	ELSE 
		PRINT N'Không tồn tại lớp'
        
-------------------------
EXEC usp_InBTK '98TH'

---------------------------------------------------------
--Cập nhật dữ liệu
---------------------------------------------------------
--30,31,32 Tạo bảng SinhVienTinh trong đó chứa hồ sơ của các sinh viên có quên quán không phải ở TPHCM. Thêm thuộc tính HBONG cho tất cả các sinh viên
--Cập nhật thuộc tính HBONG trong table SinhVienThanh 10000 cho tất cả các sinh viên
CREATE VIEw SinhVienTinh AS 
SELECT *, 'HBONG' = CASE
WHEN MSSV LIKE '%%' THEN 10000
END
FROM dbo.SinhVien
WHERE MSSV NOT IN (	SELECT sv.MSSV FROM dbo.SinhVien sv, dbo.Tinh t WHERE sv.MSTinh=t.MSTinh AND t.TenTinh ='TPHCM')

--SELECT * FROM SinhVienTinh
--DROP VIEW dbo.SinhVienTinh
