USE Lab01_QLNV
GO

--a.Thêm bộ <'06','photoshop'> vào bảng KyNang
INSERT INTO dbo.KyNang
VALUES
(   '06', -- MSKN - char(2)
    N'PhotoShop' -- TenKN - nvarchar(30)
    )
SELECT * FROM dbo.KyNang

--b.Thêm các bộ sau vào bảng NhanVienKyNang
INSERT INTO dbo.NhanVienKyNang
VALUES
(   '0001', -- MANV - char(4)
    '06', -- MSKN - char(2)
    3   -- MucDo - tinyint
    )
INSERT INTO dbo.NhanVienKyNang
VALUES
(   '0005', -- MANV - char(4)
    '06', -- MSKN - char(2)
    2   -- MucDo - tinyint
    )
SELECT * FROM dbo.NhanVienKyNang

--c.Cập nhật cho các nhân viên có sử dụng kỹ anwng 'word' có mức độ tăng thêm một bậc
UPDATE dbo.NhanVienKyNang SET MucDo =MucDo+1
WHERE MSKN='01'
SELECT * FROM dbo.NhanVienKyNang

--d.Tạo bảng mới NhanVienChiNhanh1
CREATE TABLE NhanVienChiNhanh1(
	MANV CHAR(4) REFERENCES dbo.NhanVien(MANV),
	HoTen NVARCHAR(30),
	SoKyNang TINYINT,
	PRIMARY KEY(MANV)
)
DROP TABLE dbo.NhanVienChiNhanh1
--e.Thêm vào bảng trên các thông tin như đã liệt kê của các nhân viên thuộc chi nhánh 1
INSERT INTO dbo.NhanVienChiNhanh1
VALUES
(   '0001',  -- MANV - char(4)
    N'Lê Văn Minh', -- HoTen - nvarchar(30)
    3    -- SoKyNang - tinyint
    )
	SELECT * FROM dbo.NhanVienChiNhanh1