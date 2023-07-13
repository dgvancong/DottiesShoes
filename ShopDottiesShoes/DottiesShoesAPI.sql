 Create Database DottiesShoesAPI

CREATE TABLE LoaiSanPham(
MaLoai	INT IDENTITY(1,1)NOT NULL,
TenLoai	nvarchar(100)	,
GhiChu	nvarchar(3000)	
PRIMARY KEY(MaLoai),
);

INSERT INTO LoaiSanPham(TenLoai, GhiChu)
VALUES ( N'Giày đi bộ', N'Cách chọn giày thể thao đối với người thích đi bộ là nên tìm một đôi giày nhẹ. Đôi giày đó cũng cần có thêm khả năng giảm sốc ở gót chân và bàn chân để giảm đau và căng cơ. Những đôi giày có phần đế hơi tròn sẽ giúp chuyển trọng lượng nhẹ nhàng hơn từ gót chân đến ngón chân. Giày đi bộ cũng có phần cứng hơn ở phía trước để người tập có thể cuộn các ngón chân thay vì uốn cong như như đi giày chạy bộ.'),
	(N'Giày tennis', N'Khi chơi quần vợt, người chơi thực hiện rất nhiều chuyển động nhanh từ bên này sang bên kia của sân thể thao. Muốn vậy, người chơi cần những đôi giày vừa hỗ trợ bên trong vừa hỗ trợ bên ngoài bàn chân. Đồng thời, đôi giày cần linh hoạt ở phần đế để có thể chuyển động nhanh về phía trước. Khi chơi tennis trên sân mềm, người chơi nên chọn đôi giày có đế mềm. Còn khi chơi trên sân cứng, người chơi nên chọn đôi giày có đế nhiều gai.'),
	( N'Giày tập luyện đa năng', N'Đôi giày này là một lựa chọn tốt nếu người chơi thích nhiều loại hình thể thao khác nhau. Vì vậy, người chơi có thể chọn đôi giày thiết kế linh hoạt ở bàn chân trước nếu muốn chạy bộ và có hỗ trợ cả 2 bên chân nếu muốn chơi tennis hoặc tập aerobic.'),
	( N'Giày chạy địa hình', N'Với những người thích chạy bộ địa hình thì những đôi giày có thể chống chọi với bùn, đất, nước và đá chính là lựa chọn không thể thiếu. Loại giày này có gai đế to hơn so với giày chạy bộ truyền thống. Chúng cũng có thêm phần hỗ trợ ở gót chân và 2 bên để giữ an toàn cho người tập khi chạy trên các bề mặt không bằng phẳng.')

CREATE TABLE TinTuc(
ID	INT IDENTITY(1,1),
TieuDe	nvarchar(2000),
NgayThang	date,
GhiChu	nvarchar(3000)	
	PRIMARY KEY(ID),
);

CREATE TABLE DanhMuc(
	MaDanhMuc INT IDENTITY(1,1),
	STT int null,
	TenDanhMuc	nvarchar(250),
	TrangThai	bit
	PRIMARY KEY(MaDanhMuc)
);

CREATE TABLE LienHe(
	MaLH INT IDENTITY(1,1),
	TenLH	nvarchar(200),
	Mota	nvarchar(500),
	TrangThai	bit
	PRIMARY KEY(MaLH)
);

CREATE TABLE NhanVien(
	MaNhanVien INT IDENTITY(1,1),
	TenNhanVien	nvarchar(250),
	Email	nvarchar(250) null,
	SoDT	nvarchar(10) null,
	DiaChi	nvarchar(250) null
	PRIMARY KEY(MaNhanVien)
);

INSERT INTO NhanVien(TenNhanVien, Email, SoDT, DiaChi)
VALUES ('vancong12', 'congkoi090@gmail.com', 0334624356,N'Hưng Yên'),
	  ('dangdang24', 'danghungdang@gmail.com', 0334624356,N'Hải Dương')

CREATE TABLE NhaCungCap(
MaNCC	INT IDENTITY(1,1)NOT NULL,
TenNCC	nvarchar(50),
DiaChi	nvarchar(500) NULL,
SoDT	nvarchar(50)
PRIMARY KEY(MaNCC),
);

INSERT INTO NhaCungCap(TenNCC, DiaChi, SoDT)
	VALUES 
	       ( 'Gucci', N'Phù Cừ', '0334624356'),
		   ('Louis Vuitton', N'Hải Dương', '0334624356'),
	       ( 'Chanel', N'Phù Cừ', '0334624356'),
	       ( 'Hermes', N'Phù Cừ', '0334624356')

CREATE TABLE KhachHang(
	MaKH	INT IDENTITY(1,1)NOT NULL,
	HoTen	nvarchar(80),
	DiaChi	nvarchar(500),
	Email	nvarchar(50),
	SoDT	int NOT NULL,
	TaiKhoan varchar(100) NULL,
	MatKhau varchar(100) NULL,
	PRIMARY KEY(MaKH),
);

INSERT INTO KhachHang(HoTen, DiaChi, Email, SoDT, TaiKhoan,MatKhau)
VALUES ('vancong12', N'Hưng Yên', 'congkoi090@gmail.com', 0334624356,'dongvancong24','12345'),
	  ('dangdang24', N'Hải Dương', 'danghungdang@gmail.com', 0334624356,'danghungdang23','12345')

CREATE TABLE ChiTietAnhSP(
	MaAnhChitiet int PRIMARY KEY IDENTITY (1,1) NOT NULL,
	MaSP int FOREIGN KEY REFERENCES SanPham(MaSP) ON DELETE CASCADE ON UPDATE CASCADE,
	Anh varchar(500) NULL,
);

INSERT INTO ChiTietAnhSP(MaSP, Anh)
VALUES (1,  '/UploadFiles/images/nike1s.jpg'),
	  (1, '/UploadFiles/images/nike1ss.jpg'),
	  (1, '/UploadFiles/images/nike1sss.jpg'),
	  (2,  '/UploadFiles/images/nike2s.jpg'),
	  (2, '/UploadFiles/images/nike2ss.jpg'),
	  (2, '/UploadFiles/images/nike2sss.jpg'),
	  (32,  '/UploadFiles/images/nike3s.jpg'),
	  (32, '/UploadFiles/images/nike3ss.jpg'),
	  (32, '/UploadFiles/images/nike3sss.jpg'),
	  (33,  '/UploadFiles/images/nike4s.jpg'),
	  (33, '/UploadFiles/images/nike4ss.jpg'),
	  (33, '/UploadFiles/images/nike4sss.jpg'),
	  (34,  '/UploadFiles/images/nike1s.jpg'),
	  (34, '/UploadFiles/images/nike1ss.jpg'),
	  (34, '/UploadFiles/images/nike1sss.jpg')

CREATE TABLE ThongTinCT(
	MaTTChiTiet int PRIMARY KEY IDENTITY (1,1) NOT NULL,
	MaSP int FOREIGN KEY REFERENCES SanPham(MaSP) ON DELETE CASCADE ON UPDATE CASCADE,
	MauSac varchar(500) NULL,
	DonGia FLOAT NOT NULL,
	Sale FLOAT NOT NULL,
	MoTa bit NULL,
	KichThuoc	nvarchar(500),
	SoLuong	int NOT NULL,
	ViewCout int
);

INSERT INTO ThongTinCT(MaSP, MauSac, DonGia, Sale,MoTa,KichThuoc,SoLuong,ViewCout)
VALUES (32, N'Black/Tour Yellow/White',2069000,2069000 ,'true','EU 12' ,222,306),
	   (33, N'Grey with white',2999000,2069000 ,'true','EU 6' ,222,16),
	   (34, N'Black/Tour Yellow/White',4069000,2069000 ,'true','EU 11' ,222,26),
	   (35, N'Grey with white',2999000,2069000 ,'true','EU 6' ,222,56),
	   (36, N'Black/Tour Yellow/White',2569000,2069000 ,'true','EU 15' ,222,46),
	   (37, N'Grey with white',1999000,2069000 ,'true','EU 6' ,222,56),
	   (38, N'Black/Tour Yellow/White',3069000,2069000 ,'true','EU 7' ,222,56),
	   (39, N'Grey with white',8999000,2069000 ,'true','EU 6' ,222,56),
	   (40, N'Black/Tour Yellow/White',7069000,2069000 ,'true','EU 7' ,222,56),
	   (41, N'Grey with white',6999000,2069000 ,'true','EU 6' ,222,56),
	   (42, N'Black/Tour Yellow/White',4069000,2069000 ,'true','EU 7' ,222,56),
	   (43, N'Grey with white',1999000,2069000 ,'true','EU 6' ,222,56),
	   (44, N'Black/Tour Yellow/White',6069000,2069000 ,'true','EU 7' ,222,56),
	   (45, N'Grey with white',3999000,2069000 ,'true','EU 6' ,222,56),
	   (46, N'Black/Tour Yellow/White',4069000,2069000 ,'true','EU 7' ,222,56),
	   (47, N'Grey with white',1999000,2069000 ,'true','EU 6' ,222,56),
	   (48, N'Black/Tour Yellow/White',4069000,2069000 ,'true','EU 7' ,222,56),
	   (49, N'Grey with white',2999000,2069000 ,'true','EU 6' ,222,56),
	   (50, N'Black/Tour Yellow/White',4069000,2069000 ,'true','EU 7' ,222,56),
	   (51, N'Grey with white',1999000,2069000 ,'true','EU 6' ,222,56),
	   (52, N'Black/Tour Yellow/White',4069000,2069000 ,'true','EU 7' ,222,56),
	   (53, N'Grey with white',2999000,2069000 ,'true','EU 6' ,222,56),
	   (54, N'Black/Tour Yellow/White',4069000,2069000 ,'true','EU 7' ,222,56),
	   (55, N'Grey with white',3999000,2069000 ,'true','EU 6' ,222,36),
	   (56, N'Black/Tour Yellow/White',4069000,2069000 ,'true','EU 7' ,222,26),
	   (57, N'Grey with white',9999000,2069000 ,'true','EU 6' ,222,16)

CREATE TABLE SanPham(
	MaSP INT IDENTITY(1,1) NOT NULL,
	HinhAnh	nvarchar(200),
	MaLoai INT NULL,
	MaNCC INT NULL,
	TenSP NVARCHAR(500) NOT NULL,
	MoTa	nvarchar(4000),
	NgayTao date,
	PRIMARY KEY(MaSP),
	FOREIGN KEY (MaLoai) REFERENCES LoaiSanPham(MaLoai) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (MaNCC) REFERENCES NhaCungCap(MaNCC) ON DELETE CASCADE ON UPDATE CASCADE,
);

INSERT INTO SanPham(HinhAnh, MaLoai,MaNCC, TenSP, MoTa, NgayTao)
VALUES ('/UploadFiles/images/nike2.jpg', 6,3, 'Forum Mid Hanami',  N'Nếu chúng tôi chỉ sản xuất một chiếc giày chạy bộ, thì chiếc giày đó sẽ là chiếc 1080. Điều khiến chiếc 1080 trở nên độc đáo không chỉ là nó là chiếc giày chạy bộ tốt nhất mà chúng tôi tạo ra, mà còn là chiếc giày linh hoạt nhất. 1080 mang lại hiệu suất hàng đầu cho mọi loại vận động viên, cho dù bạn đang tập luyện cho cuộc thi đẳng cấp thế giới hay bắt một chuyến tàu vào giờ cao điểm. Fresh Foam X 1080v12 đại diện cho sự phát triển nhất quán về chất lượng đặc trưng của mô hình. Sự chuyển đổi mượt mà của trải nghiệm đệm dưới chân đỉnh cao được tinh chỉnh với cách sắp xếp đế giữa được cập nhật, áp dụng nhiều bọt hơn cho các khu vực rộng hơn của đế giữa và tăng tính linh hoạt ở các điểm hẹp hơn. Viễn cảnh cực kỳ hiện đại cũng được phản ánh trong phần trên của 1080. v12 cung cấp một phong cách da thứ hai hỗ trợ phù hợp với mặt trên Hypoknit được thiết kế kỹ thuật, cho một thiết kế tổng thể hợp lý hơn.', '2023-03-04'),
('/UploadFiles/images/nike3.jpg', 7,2, 'Adizero Adios Pro 3', N'Loại Fresh Foam được sử dụng nhiều nhất trong bất kỳ loại giày nào cho đến nay, dòng sản phẩm mới nhất sử dụng nhiều Fresh Foam X hơn, xếp nó cao hơn bao giờ hết và phân bổ nó dọc theo chiều dài của giày, mang lại trải nghiệm êm ái nhưng ổn định dưới chân. Đế ngoài điều khiển bằng dữ liệu áp dụng vị trí chiến lược của các vùng đệm ấn tượng và các vùng uốn cong quyết liệt thúc đẩy sải chân tự nhiên trong khi cấu hình bập bênh của hình bóng thúc đẩy quá trình chuyển đổi và di chuyển suôn sẻ. Tất cả những thứ này nằm bên dưới lớp lưới được thiết kế phía trên giúp bạn luôn cố định với sự thoải mái và hỗ trợ thoáng khí. ', '2023-03-04'),
('/UploadFiles/images/nike4.jpg', 2,2, 'Ultra Adidas 4D Shoes',  N'Loại Fresh Foam được sử dụng nhiều nhất trong bất kỳ loại giày nào cho đến nay, dòng sản phẩm mới nhất sử dụng nhiều Fresh Foam X hơn, xếp nó cao hơn bao giờ hết và phân bổ nó dọc theo chiều dài của giày, mang lại trải nghiệm êm ái nhưng ổn định dưới chân. Đế ngoài điều khiển bằng dữ liệu áp dụng vị trí chiến lược của các vùng đệm ấn tượng và các vùng uốn cong quyết liệt thúc đẩy sải chân tự nhiên trong khi cấu hình bập bênh của hình bóng thúc đẩy quá trình chuyển đổi và di chuyển suôn sẻ. Tất cả những thứ này nằm bên dưới lớp lưới được thiết kế phía trên giúp bạn luôn cố định với sự thoải mái và hỗ trợ thoáng khí. ', '2023-03-04'),
('/UploadFiles/images/nike5.jpg', 2,3, 'KD Trey 5 X EP', N'Loại Fresh Foam được sử dụng nhiều nhất trong bất kỳ loại giày nào cho đến nay, dòng sản phẩm mới nhất sử dụng nhiều Fresh Foam X hơn, xếp nó cao hơn bao giờ hết và phân bổ nó dọc theo chiều dài của giày, mang lại trải nghiệm êm ái nhưng ổn định dưới chân. Đế ngoài điều khiển bằng dữ liệu áp dụng vị trí chiến lược của các vùng đệm ấn tượng và các vùng uốn cong quyết liệt thúc đẩy sải chân tự nhiên trong khi cấu hình bập bênh của hình bóng thúc đẩy quá trình chuyển đổi và di chuyển suôn sẻ. Tất cả những thứ này nằm bên dưới lớp lưới được thiết kế phía trên giúp bạn luôn cố định với sự thoải mái và hỗ trợ thoáng khí. ', '2023-03-04'),
('/UploadFiles/images/nike6.jpg', 6,3, 'Nike React Infinity 3', N'Nếu chúng tôi chỉ sản xuất một chiếc giày chạy bộ, thì chiếc giày đó sẽ là chiếc 1080. Điều khiến chiếc 1080 trở nên độc đáo không chỉ là nó là chiếc giày chạy bộ tốt nhất mà chúng tôi tạo ra, mà còn là chiếc giày linh hoạt nhất. 1080 mang lại hiệu suất hàng đầu cho mọi loại vận động viên, cho dù bạn đang tập luyện cho cuộc thi đẳng cấp thế giới hay bắt một chuyến tàu vào giờ cao điểm. Fresh Foam X 1080v12 đại diện cho sự phát triển nhất quán về chất lượng đặc trưng của mô hình. Sự chuyển đổi mượt mà của trải nghiệm đệm dưới chân đỉnh cao được tinh chỉnh với cách sắp xếp đế giữa được cập nhật, áp dụng nhiều bọt hơn cho các khu vực rộng hơn của đế giữa và tăng tính linh hoạt ở các điểm hẹp hơn. Viễn cảnh cực kỳ hiện đại cũng được phản ánh trong phần trên của 1080. v12 cung cấp một phong cách da thứ hai hỗ trợ phù hợp với mặt trên Hypoknit được thiết kế kỹ thuật, cho một thiết kế tổng thể hợp lý hơn.', '2023-03-04'),
('/UploadFiles/images/nike7.jpg', 7,2, 'Nike Tempo',  N'Loại Fresh Foam được sử dụng nhiều nhất trong bất kỳ loại giày nào cho đến nay, dòng sản phẩm mới nhất sử dụng nhiều Fresh Foam X hơn, xếp nó cao hơn bao giờ hết và phân bổ nó dọc theo chiều dài của giày, mang lại trải nghiệm êm ái nhưng ổn định dưới chân. Đế ngoài điều khiển bằng dữ liệu áp dụng vị trí chiến lược của các vùng đệm ấn tượng và các vùng uốn cong quyết liệt thúc đẩy sải chân tự nhiên trong khi cấu hình bập bênh của hình bóng thúc đẩy quá trình chuyển đổi và di chuyển suôn sẻ. Tất cả những thứ này nằm bên dưới lớp lưới được thiết kế phía trên giúp bạn luôn cố định với sự thoải mái và hỗ trợ thoáng khí. ', '2023-03-04'),
('/UploadFiles/images/nike8.jpg', 2,2, 'Jordan Max Aura 4',  N'Loại Fresh Foam được sử dụng nhiều nhất trong bất kỳ loại giày nào cho đến nay, dòng sản phẩm mới nhất sử dụng nhiều Fresh Foam X hơn, xếp nó cao hơn bao giờ hết và phân bổ nó dọc theo chiều dài của giày, mang lại trải nghiệm êm ái nhưng ổn định dưới chân. Đế ngoài điều khiển bằng dữ liệu áp dụng vị trí chiến lược của các vùng đệm ấn tượng và các vùng uốn cong quyết liệt thúc đẩy sải chân tự nhiên trong khi cấu hình bập bênh của hình bóng thúc đẩy quá trình chuyển đổi và di chuyển suôn sẻ. Tất cả những thứ này nằm bên dưới lớp lưới được thiết kế phía trên giúp bạn luôn cố định với sự thoải mái và hỗ trợ thoáng khí. ', '2023-03-04'),
('/UploadFiles/images/nike9.jpg', 3,2, 'NikeCourt Air Zoom Lite 3',  N'Loại Fresh Foam được sử dụng nhiều nhất trong bất kỳ loại giày nào cho đến nay, dòng sản phẩm mới nhất sử dụng nhiều Fresh Foam X hơn, xếp nó cao hơn bao giờ hết và phân bổ nó dọc theo chiều dài của giày, mang lại trải nghiệm êm ái nhưng ổn định dưới chân. Đế ngoài điều khiển bằng dữ liệu áp dụng vị trí chiến lược của các vùng đệm ấn tượng và các vùng uốn cong quyết liệt thúc đẩy sải chân tự nhiên trong khi cấu hình bập bênh của hình bóng thúc đẩy quá trình chuyển đổi và di chuyển suôn sẻ. Tất cả những thứ này nằm bên dưới lớp lưới được thiết kế phía trên giúp bạn luôn cố định với sự thoải mái và hỗ trợ thoáng khí. ', '2023-03-04'),
('/UploadFiles/images/nike10.jpg', 4,3, 'Air Max Alpha Trainer 5',  N'Loại Fresh Foam được sử dụng nhiều nhất trong bất kỳ loại giày nào cho đến nay, dòng sản phẩm mới nhất sử dụng nhiều Fresh Foam X hơn, xếp nó cao hơn bao giờ hết và phân bổ nó dọc theo chiều dài của giày, mang lại trải nghiệm êm ái nhưng ổn định dưới chân. Đế ngoài điều khiển bằng dữ liệu áp dụng vị trí chiến lược của các vùng đệm ấn tượng và các vùng uốn cong quyết liệt thúc đẩy sải chân tự nhiên trong khi cấu hình bập bênh của hình bóng thúc đẩy quá trình chuyển đổi và di chuyển suôn sẻ. Tất cả những thứ này nằm bên dưới lớp lưới được thiết kế phía trên giúp bạn luôn cố định với sự thoải mái và hỗ trợ thoáng khí. ', '2023-03-04'),
('/UploadFiles/images/nike11.jpg', 5,2, 'Giannis Immortality 2',  N'Loại Fresh Foam được sử dụng nhiều nhất trong bất kỳ loại giày nào cho đến nay, dòng sản phẩm mới nhất sử dụng nhiều Fresh Foam X hơn, xếp nó cao hơn bao giờ hết và phân bổ nó dọc theo chiều dài của giày, mang lại trải nghiệm êm ái nhưng ổn định dưới chân. Đế ngoài điều khiển bằng dữ liệu áp dụng vị trí chiến lược của các vùng đệm ấn tượng và các vùng uốn cong quyết liệt thúc đẩy sải chân tự nhiên trong khi cấu hình bập bênh của hình bóng thúc đẩy quá trình chuyển đổi và di chuyển suôn sẻ. Tất cả những thứ này nằm bên dưới lớp lưới được thiết kế phía trên giúp bạn luôn cố định với sự thoải mái và hỗ trợ thoáng khí. ', '2023-03-04'),
('/UploadFiles/images/nike12.jpg', 5,3, 'Air Max 270',  N'Loại Fresh Foam được sử dụng nhiều nhất trong bất kỳ loại giày nào cho đến nay, dòng sản phẩm mới nhất sử dụng nhiều Fresh Foam X hơn, xếp nó cao hơn bao giờ hết và phân bổ nó dọc theo chiều dài của giày, mang lại trải nghiệm êm ái nhưng ổn định dưới chân. Đế ngoài điều khiển bằng dữ liệu áp dụng vị trí chiến lược của các vùng đệm ấn tượng và các vùng uốn cong quyết liệt thúc đẩy sải chân tự nhiên trong khi cấu hình bập bênh của hình bóng thúc đẩy quá trình chuyển đổi và di chuyển suôn sẻ. Tất cả những thứ này nằm bên dưới lớp lưới được thiết kế phía trên giúp bạn luôn cố định với sự thoải mái và hỗ trợ thoáng khí. ', '2023-03-04'),
('/UploadFiles/images/nike13.jpg', 6,5, 'Gripknit Phantom GX Elite Dynamic Fit FG',  N'Loại Fresh Foam được sử dụng nhiều nhất trong bất kỳ loại giày nào cho đến nay, dòng sản phẩm mới nhất sử dụng nhiều Fresh Foam X hơn, xếp nó cao hơn bao giờ hết và phân bổ nó dọc theo chiều dài của giày, mang lại trải nghiệm êm ái nhưng ổn định dưới chân. Đế ngoài điều khiển bằng dữ liệu áp dụng vị trí chiến lược của các vùng đệm ấn tượng và các vùng uốn cong quyết liệt thúc đẩy sải chân tự nhiên trong khi cấu hình bập bênh của hình bóng thúc đẩy quá trình chuyển đổi và di chuyển suôn sẻ. Tất cả những thứ này nằm bên dưới lớp lưới được thiết kế phía trên giúp bạn luôn cố định với sự thoải mái và hỗ trợ thoáng khí. ', '2023-03-04'),
('/UploadFiles/images/nike14.jpg', 2,5, 'Phantom GX Academy TF',N'Loại Fresh Foam được sử dụng nhiều nhất trong bất kỳ loại giày nào cho đến nay, dòng sản phẩm mới nhất sử dụng nhiều Fresh Foam X hơn, xếp nó cao hơn bao giờ hết và phân bổ nó dọc theo chiều dài của giày, mang lại trải nghiệm êm ái nhưng ổn định dưới chân. Đế ngoài điều khiển bằng dữ liệu áp dụng vị trí chiến lược của các vùng đệm ấn tượng và các vùng uốn cong quyết liệt thúc đẩy sải chân tự nhiên trong khi cấu hình bập bênh của hình bóng thúc đẩy quá trình chuyển đổi và di chuyển suôn sẻ. Tất cả những thứ này nằm bên dưới lớp lưới được thiết kế phía trên giúp bạn luôn cố định với sự thoải mái và hỗ trợ thoáng khí. ', '2023-03-04'),
('/UploadFiles/images/nike15.jpg', 3,5, 'Nike Air Force 1 07 LV8 EMB',  N'Loại Fresh Foam được sử dụng nhiều nhất trong bất kỳ loại giày nào cho đến nay, dòng sản phẩm mới nhất sử dụng nhiều Fresh Foam X hơn, xếp nó cao hơn bao giờ hết và phân bổ nó dọc theo chiều dài của giày, mang lại trải nghiệm êm ái nhưng ổn định dưới chân. Đế ngoài điều khiển bằng dữ liệu áp dụng vị trí chiến lược của các vùng đệm ấn tượng và các vùng uốn cong quyết liệt thúc đẩy sải chân tự nhiên trong khi cấu hình bập bênh của hình bóng thúc đẩy quá trình chuyển đổi và di chuyển suôn sẻ. Tất cả những thứ này nằm bên dưới lớp lưới được thiết kế phía trên giúp bạn luôn cố định với sự thoải mái và hỗ trợ thoáng khí. ', '2023-03-04'),
('/UploadFiles/images/nike16.jpg', 4,3, 'Nike Waffle One SE',  N'Loại Fresh Foam được sử dụng nhiều nhất trong bất kỳ loại giày nào cho đến nay, dòng sản phẩm mới nhất sử dụng nhiều Fresh Foam X hơn, xếp nó cao hơn bao giờ hết và phân bổ nó dọc theo chiều dài của giày, mang lại trải nghiệm êm ái nhưng ổn định dưới chân. Đế ngoài điều khiển bằng dữ liệu áp dụng vị trí chiến lược của các vùng đệm ấn tượng và các vùng uốn cong quyết liệt thúc đẩy sải chân tự nhiên trong khi cấu hình bập bênh của hình bóng thúc đẩy quá trình chuyển đổi và di chuyển suôn sẻ. Tất cả những thứ này nằm bên dưới lớp lưới được thiết kế phía trên giúp bạn luôn cố định với sự thoải mái và hỗ trợ thoáng khí. ', '2023-03-04'),
('/UploadFiles/images/nike17.jpg', 5,3, 'Nike Blazer Low 77 Jumbo',  N'Loại Fresh Foam được sử dụng nhiều nhất trong bất kỳ loại giày nào cho đến nay, dòng sản phẩm mới nhất sử dụng nhiều Fresh Foam X hơn, xếp nó cao hơn bao giờ hết và phân bổ nó dọc theo chiều dài của giày, mang lại trải nghiệm êm ái nhưng ổn định dưới chân. Đế ngoài điều khiển bằng dữ liệu áp dụng vị trí chiến lược của các vùng đệm ấn tượng và các vùng uốn cong quyết liệt thúc đẩy sải chân tự nhiên trong khi cấu hình bập bênh của hình bóng thúc đẩy quá trình chuyển đổi và di chuyển suôn sẻ. Tất cả những thứ này nằm bên dưới lớp lưới được thiết kế phía trên giúp bạn luôn cố định với sự thoải mái và hỗ trợ thoáng khí. ', '2023-03-04'),
('/UploadFiles/images/nike18.jpg', 5,4, 'Nike Air Force 1 Mid React4', N'Loại Fresh Foam được sử dụng nhiều nhất trong bất kỳ loại giày nào cho đến nay, dòng sản phẩm mới nhất sử dụng nhiều Fresh Foam X hơn, xếp nó cao hơn bao giờ hết và phân bổ nó dọc theo chiều dài của giày, mang lại trải nghiệm êm ái nhưng ổn định dưới chân. Đế ngoài điều khiển bằng dữ liệu áp dụng vị trí chiến lược của các vùng đệm ấn tượng và các vùng uốn cong quyết liệt thúc đẩy sải chân tự nhiên trong khi cấu hình bập bênh của hình bóng thúc đẩy quá trình chuyển đổi và di chuyển suôn sẻ. Tất cả những thứ này nằm bên dưới lớp lưới được thiết kế phía trên giúp bạn luôn cố định với sự thoải mái và hỗ trợ thoáng khí. ','2023-03-04'),
('/UploadFiles/images/nike20.jpg', 3,3, 'NMD_S1',  N'Loại Fresh Foam được sử dụng nhiều nhất trong bất kỳ loại giày nào cho đến nay, dòng sản phẩm mới nhất sử dụng nhiều Fresh Foam X hơn, xếp nó cao hơn bao giờ hết và phân bổ nó dọc theo chiều dài của giày, mang lại trải nghiệm êm ái nhưng ổn định dưới chân. Đế ngoài điều khiển bằng dữ liệu áp dụng vị trí chiến lược của các vùng đệm ấn tượng và các vùng uốn cong quyết liệt thúc đẩy sải chân tự nhiên trong khi cấu hình bập bênh của hình bóng thúc đẩy quá trình chuyển đổi và di chuyển suôn sẻ. Tất cả những thứ này nằm bên dưới lớp lưới được thiết kế phía trên giúp bạn luôn cố định với sự thoải mái và hỗ trợ thoáng khí. ', '2023-03-04'),
('/UploadFiles/images/nike21.jpg', 4,6, 'Rivalry Low 86',  N'Loại Fresh Foam được sử dụng nhiều nhất trong bất kỳ loại giày nào cho đến nay, dòng sản phẩm mới nhất sử dụng nhiều Fresh Foam X hơn, xếp nó cao hơn bao giờ hết và phân bổ nó dọc theo chiều dài của giày, mang lại trải nghiệm êm ái nhưng ổn định dưới chân. Đế ngoài điều khiển bằng dữ liệu áp dụng vị trí chiến lược của các vùng đệm ấn tượng và các vùng uốn cong quyết liệt thúc đẩy sải chân tự nhiên trong khi cấu hình bập bênh của hình bóng thúc đẩy quá trình chuyển đổi và di chuyển suôn sẻ. Tất cả những thứ này nằm bên dưới lớp lưới được thiết kế phía trên giúp bạn luôn cố định với sự thoải mái và hỗ trợ thoáng khí. ', '2023-03-04'),
('/UploadFiles/images/nike22.jpg', 6,3, 'Hyperturf Adventure',  N'Loại Fresh Foam được sử dụng nhiều nhất trong bất kỳ loại giày nào cho đến nay, dòng sản phẩm mới nhất sử dụng nhiều Fresh Foam X hơn, xếp nó cao hơn bao giờ hết và phân bổ nó dọc theo chiều dài của giày, mang lại trải nghiệm êm ái nhưng ổn định dưới chân. Đế ngoài điều khiển bằng dữ liệu áp dụng vị trí chiến lược của các vùng đệm ấn tượng và các vùng uốn cong quyết liệt thúc đẩy sải chân tự nhiên trong khi cấu hình bập bênh của hình bóng thúc đẩy quá trình chuyển đổi và di chuyển suôn sẻ. Tất cả những thứ này nằm bên dưới lớp lưới được thiết kế phía trên giúp bạn luôn cố định với sự thoải mái và hỗ trợ thoáng khí. ', '2023-03-04'),
('/UploadFiles/images/nike23.jpg', 6,7, 'Adizero Boston 11', N'Loại Fresh Foam được sử dụng nhiều nhất trong bất kỳ loại giày nào cho đến nay, dòng sản phẩm mới nhất sử dụng nhiều Fresh Foam X hơn, xếp nó cao hơn bao giờ hết và phân bổ nó dọc theo chiều dài của giày, mang lại trải nghiệm êm ái nhưng ổn định dưới chân. Đế ngoài điều khiển bằng dữ liệu áp dụng vị trí chiến lược của các vùng đệm ấn tượng và các vùng uốn cong quyết liệt thúc đẩy sải chân tự nhiên trong khi cấu hình bập bênh của hình bóng thúc đẩy quá trình chuyển đổi và di chuyển suôn sẻ. Tất cả những thứ này nằm bên dưới lớp lưới được thiết kế phía trên giúp bạn luôn cố định với sự thoải mái và hỗ trợ thoáng khí. ', '2023-03-04'),
('/UploadFiles/images/nike24.jpg', 2,6, 'Supernova 2.0 X PARLEY',  N'Loại Fresh Foam được sử dụng nhiều nhất trong bất kỳ loại giày nào cho đến nay, dòng sản phẩm mới nhất sử dụng nhiều Fresh Foam X hơn, xếp nó cao hơn bao giờ hết và phân bổ nó dọc theo chiều dài của giày, mang lại trải nghiệm êm ái nhưng ổn định dưới chân. Đế ngoài điều khiển bằng dữ liệu áp dụng vị trí chiến lược của các vùng đệm ấn tượng và các vùng uốn cong quyết liệt thúc đẩy sải chân tự nhiên trong khi cấu hình bập bênh của hình bóng thúc đẩy quá trình chuyển đổi và di chuyển suôn sẻ. Tất cả những thứ này nằm bên dưới lớp lưới được thiết kế phía trên giúp bạn luôn cố định với sự thoải mái và hỗ trợ thoáng khí. ', '2023-03-04'),
('/UploadFiles/images/nike25.jpg', 5,6, 'Forum Low Classic 4',  N'Loại Fresh Foam được sử dụng nhiều nhất trong bất kỳ loại giày nào cho đến nay, dòng sản phẩm mới nhất sử dụng nhiều Fresh Foam X hơn, xếp nó cao hơn bao giờ hết và phân bổ nó dọc theo chiều dài của giày, mang lại trải nghiệm êm ái nhưng ổn định dưới chân. Đế ngoài điều khiển bằng dữ liệu áp dụng vị trí chiến lược của các vùng đệm ấn tượng và các vùng uốn cong quyết liệt thúc đẩy sải chân tự nhiên trong khi cấu hình bập bênh của hình bóng thúc đẩy quá trình chuyển đổi và di chuyển suôn sẻ. Tất cả những thứ này nằm bên dưới lớp lưới được thiết kế phía trên giúp bạn luôn cố định với sự thoải mái và hỗ trợ thoáng khí. ', '2023-03-04'),
('/UploadFiles/images/nike26.jpg', 5,3, 'NMD_V3', N'Loại Fresh Foam được sử dụng nhiều nhất trong bất kỳ loại giày nào cho đến nay, dòng sản phẩm mới nhất sử dụng nhiều Fresh Foam X hơn, xếp nó cao hơn bao giờ hết và phân bổ nó dọc theo chiều dài của giày, mang lại trải nghiệm êm ái nhưng ổn định dưới chân. Đế ngoài điều khiển bằng dữ liệu áp dụng vị trí chiến lược của các vùng đệm ấn tượng và các vùng uốn cong quyết liệt thúc đẩy sải chân tự nhiên trong khi cấu hình bập bênh của hình bóng thúc đẩy quá trình chuyển đổi và di chuyển suôn sẻ. Tất cả những thứ này nằm bên dưới lớp lưới được thiết kế phía trên giúp bạn luôn cố định với sự thoải mái và hỗ trợ thoáng khí. ', '2023-03-04'),
('/UploadFiles/images/nike27.jpg', 3,4, 'Superstar 82', N'Loại Fresh Foam được sử dụng nhiều nhất trong bất kỳ loại giày nào cho đến nay, dòng sản phẩm mới nhất sử dụng nhiều Fresh Foam X hơn, xếp nó cao hơn bao giờ hết và phân bổ nó dọc theo chiều dài của giày, mang lại trải nghiệm êm ái nhưng ổn định dưới chân. Đế ngoài điều khiển bằng dữ liệu áp dụng vị trí chiến lược của các vùng đệm ấn tượng và các vùng uốn cong quyết liệt thúc đẩy sải chân tự nhiên trong khi cấu hình bập bênh của hình bóng thúc đẩy quá trình chuyển đổi và di chuyển suôn sẻ. Tất cả những thứ này nằm bên dưới lớp lưới được thiết kế phía trên giúp bạn luôn cố định với sự thoải mái và hỗ trợ thoáng khí. ', '2023-03-04'),
('/UploadFiles/images/nike28.jpg', 4,6, 'BÓNG ĐÁ X Ghodted.3 Turf', N'Loại Fresh Foam được sử dụng nhiều nhất trong bất kỳ loại giày nào cho đến nay, dòng sản phẩm mới nhất sử dụng nhiều Fresh Foam X hơn, xếp nó cao hơn bao giờ hết và phân bổ nó dọc theo chiều dài của giày, mang lại trải nghiệm êm ái nhưng ổn định dưới chân. Đế ngoài điều khiển bằng dữ liệu áp dụng vị trí chiến lược của các vùng đệm ấn tượng và các vùng uốn cong quyết liệt thúc đẩy sải chân tự nhiên trong khi cấu hình bập bênh của hình bóng thúc đẩy quá trình chuyển đổi và di chuyển suôn sẻ. Tất cả những thứ này nằm bên dưới lớp lưới được thiết kế phía trên giúp bạn luôn cố định với sự thoải mái và hỗ trợ thoáng khí. ', '2023-03-04'),
('/UploadFiles/images/nike29.jpg', 2,5, 'Forum Low CL',N'Loại Fresh Foam được sử dụng nhiều nhất trong bất kỳ loại giày nào cho đến nay, dòng sản phẩm mới nhất sử dụng nhiều Fresh Foam X hơn, xếp nó cao hơn bao giờ hết và phân bổ nó dọc theo chiều dài của giày, mang lại trải nghiệm êm ái nhưng ổn định dưới chân. Đế ngoài điều khiển bằng dữ liệu áp dụng vị trí chiến lược của các vùng đệm ấn tượng và các vùng uốn cong quyết liệt thúc đẩy sải chân tự nhiên trong khi cấu hình bập bênh của hình bóng thúc đẩy quá trình chuyển đổi và di chuyển suôn sẻ. Tất cả những thứ này nằm bên dưới lớp lưới được thiết kế phía trên giúp bạn luôn cố định với sự thoải mái và hỗ trợ thoáng khí. ', '2023-03-04'),
('/UploadFiles/images/nike30.jpg', 1,4, 'NB Fresh Foam X More v4', N'Loại Fresh Foam được sử dụng nhiều nhất trong bất kỳ loại giày nào cho đến nay, dòng sản phẩm mới nhất sử dụng nhiều Fresh Foam X hơn, xếp nó cao hơn bao giờ hết và phân bổ nó dọc theo chiều dài của giày, mang lại trải nghiệm êm ái nhưng ổn định dưới chân. Đế ngoài điều khiển bằng dữ liệu áp dụng vị trí chiến lược của các vùng đệm ấn tượng và các vùng uốn cong quyết liệt thúc đẩy sải chân tự nhiên trong khi cấu hình bập bênh của hình bóng thúc đẩy quá trình chuyển đổi và di chuyển suôn sẻ. Tất cả những thứ này nằm bên dưới lớp lưới được thiết kế phía trên giúp bạn luôn cố định với sự thoải mái và hỗ trợ thoáng khí. ', '2023-03-04')

CREATE TABLE NguoiDung(
	MaNguoiDung int,
	HoTen nvarchar(250) NULL,
	NgaySinh datetime NULL,
	GioiTinh nvarchar(20) NULL,
	AnhDaiDien varchar(500) NULL,
	DiaChi nvarchar(1500) NULL,
	Email nvarchar(100) NULL,
	DienThoai char(20) NULL,
	TrangThai bit NULL,
	PRIMARY KEY(MaNguoiDung)
);

CREATE TABLE TaiKhoan(
	MaTaiKhoan int ,
	MaNguoiDung int NULL,
	TaiKhoan varchar(100) NULL,
	MatKhau varchar(100) NULL,
	TrangThai bit NULL,
	LoaiQuyet varchar(10) NULL,
	PRIMARY KEY(MaTaiKhoan),
	FOREIGN KEY (MaNguoiDung) REFERENCES NguoiDung(MaNguoiDung) ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE HoaDonNhap(
	MaHDN INT IDENTITY(1,1),
	MaNCC INT,
	NgayNhap	date NOT NULL,
	SDT	nvarchar(50),
	DiaChi	nvarchar(500),
	TrangThai	bit,
	GhiChu	nvarchar(50),
	PRIMARY KEY(MaHDN),
	FOREIGN KEY (MaNCC) REFERENCES NhaCungCap(MaNCC) ON DELETE CASCADE ON UPDATE CASCADE,
);

--Insert HoaDon
INSERT INTO HoaDonBan(MaKH, NgayDat, SDT, TrangThai, DiaChi,GhiChu)
VALUES (1,23 , 0334624356, N'Đang Giao Hàng', N'Hải Dương', N'Xin Nhẹ Tay Hàng Dễ Vỡ'),
	  (2,03, 0334624356,N'Đợi Xác Nhận',N'Hải Dương', N'Xin Nhẹ Tay Hàng Dễ Vỡ')

CREATE TABLE CT_HoaDonNhap(
	MaCTHDN INT IDENTITY(1,1),
	MaHDN	int ,
	MaSP	int ,
	SoLuong	int,
	DonGia FLOAT,
	TongTien FLOAT,
	PRIMARY KEY(MaCTHDN),
	FOREIGN KEY (MaHDN) REFERENCES HoaDonNhap(MaHDN) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP) ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE HoaDonBan(
	MaHDB INT IDENTITY(1,1),
	MaKH	INT NULL,
	NgayDat	date NOT NULL,
	SDT	nvarchar(50),
	DiaChi	nvarchar(500),
	TrangThai	bit,
	GhiChu	nvarchar(500),
	PRIMARY KEY(MaHDB),
	FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH) ON DELETE CASCADE ON UPDATE CASCADE,
);

CREATE TABLE CT_HoaDonBan(
	MaCTHDB INT IDENTITY(1,1),
	MaHDB	int,
	MaSP	int,
	SoLuong	int,
	DonGia FLOAT NOT NULL,
	PRIMARY KEY(MaCTHDB),
	FOREIGN KEY (MaHDB) REFERENCES HoaDonBan(MaHDB) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP) ON DELETE CASCADE ON UPDATE CASCADE,
	CHECK(DonGia >= 0)
);

CREATE TABLE DonHang(
	MaDonHang int IDENTITY(1,1) NOT NULL,
	MaKH INT NULL,
	NgayDat datetime NULL,
	TrangThaiDonHang int NULL,
	PRIMARY KEY(MaDonHang),
	FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH) ON DELETE CASCADE ON UPDATE CASCADE,
);	

CREATE TABLE ChiTietDonHang(
	MaChiTietDonHang int IDENTITY(1,1) NOT NULL,
	MaDonHang int NOT NULL,
	MaSP int NOT NULL,
	SoLuong int NOT NULL,
	GiaMua float NOT NULL,
	PRIMARY KEY(MaChiTietDonHang),
	FOREIGN KEY (MaDonHang) REFERENCES DonHang(MaDonHang) ON DELETE CASCADE ON UPDATE CASCADE,
);

--Thủ Tục Sản Phẩm
CREATE PROCEDURE [dbo].[sp_IDhinhanh](@MaSP Int)
AS
    BEGIN
        SELECT  [MaAnhChitiet]               , 
					 MaSP           ,
					 Anh          
        FROM ChiTietAnhSP
      where  MaSP = @MaSP;
    END;
GO

ALTER PROCEDURE [dbo].[sanpham_moinhat]
(@SoLuong int )
AS
BEGIN
        SELECT top(@SoLuong) S.*,I.DonGia,I.MauSac,I.KichThuoc, I.SoLuong, I.ViewCout
							
        FROM SanPham S INNER JOIN ThongTinCT I on S.MaSP = I.MaSP
	ORDER BY S.NgayTao DESC
END

CREATE procedure [dbo].[sanpham_banchay]
(@SoLuong int)
as
	begin
		select top (@SoLuong) sp.MaSP, 
		SUM(ct.SoLuong) as SoLuongDaBan 
		from ThongTinCT as sp left join CT_HoaDonBan as ct on sp.MaSP = ct.MaSP
		group by sp.MaSP
		order by sum(ct.Soluong) desc 
	end;
	
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[create_sanpham](@HinhAnh NVARCHAR(200) ,@MaLoai int ,@MaNCC int ,@TenSP NVARCHAR(500), @MoTa NVARCHAR(4000), @NgayTao date, @listjson_specifications NVARCHAR(MAX))
AS
BEGIN
			-- Thêm bảng SanPham
			INSERT INTO [dbo].[SanPham] ([HinhAnh] ,[MaLoai] ,[MaNCC] ,[TenSP],[MoTa] ,[NgayTao])
			VALUES (@HinhAnh, @MaLoai, @MaNCC, @TenSP, @MoTa, @NgayTao);

			INSERT INTO [dbo].[ThongTinCT](MaSP, MauSac, DonGia, Sale, KichThuoc, SoLuong, ViewCout)
			SELECT 
					IDENT_CURRENT('SanPham'),
					JSON_VALUE(l.value, '$.mauSac'),
					JSON_VALUE(l.value, '$.donGia'), 
					JSON_VALUE(l.value, '$.sale'),
					JSON_VALUE(l.value, '$.kichThuoc'),
					JSON_VALUE(l.value, '$.soLuong'), 
					JSON_VALUE(l.value, '$.viewCout')
			FROM OPENJSON(@listjson_specifications) AS l;
			SELECT '';
		END
		GO












CREATE PROCEDURE [dbo].[sp_sanpham_update]
(
@MaSP             int, 
@HinhAnh	nvarchar(200),
@MaLoai int ,
@MaNCC int ,
@TenSP nvarchar(500),
@MoTa	nvarchar(4000),
@NgayTao Date
)
AS
    BEGIN
     
  Update  SanPham 
   set  
   HinhAnh = IIf(@HinhAnh is Null, HinhAnh, @HinhAnh),
   MaLoai = @MaLoai ,
   MaNCC = @MaNCC  ,
   TenSP = @TenSP,
   MoTa =	IIf(@MoTa is Null, MoTa, @MoTa),
   NgayTao =	@NgayTao
      Where MaSP = @MaSP
      
   SELECT '';
    END;


ALTER PROC [dbo].[search_sanpham] (@page_index  INT, 
                                       @page_size   INT,
									   @tensp Nvarchar(150),
									   @MaLoai int,
									   @option varchar(50))
AS
	BEGIN
		DECLARE @RecordCount bigint;
		IF(@page_size <> 0)
			BEGIN 
				SET NOCOUNT ON;
					SELECT(ROW_NUMBER() OVER(
						ORDER BY
						CASE
							WHEN @option = 'TEN' THEN p.TenSP
						END ASC)) AS RowNumber,
						p.MaSP,
						p.HinhAnh,
						p.MaLoai,
						p.MaNCC,
						p.TenSP,
						p.MoTa,
						p.NgayTao,
						d.DonGia,
						d.MauSac,
						d.KichThuoc,
						d.ViewCout
						INTO #Results1
					FROM [SanPham] AS p INNER JOIN ThongTinCT d ON p.MaSP = d.MaSP
					WHERE(@tensp ='' or p.TenSP like N'%' + @tensp + '%') AND
						(@MaLoai is null or p.MaLoai = @MaLoai);
					SELECT @RecordCount = Count(*)
					FROM #Results1
					SELECT *,
						@RecordCount AS RecordCount
					FROM #Results1
					WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND (((@page_index - 1) * @page_size + 1) + @page_size) - 1
						OR @page_index = -1;
					DROP TABLE #Results1;
			END;
			ELSE
			BEGIN
				SET NOCOUNT ON;
					SELECT(ROW_NUMBER() OVER(
						ORDER BY
						CASE 
							WHEN @option = 'TEN' THEN p.TenSP
						END ASC )) AS ROWNUMBER,
						p.MaSP,
						p.HinhAnh,
						p.MaLoai,
						p.MaNCC,
						p.TenSP,
						p.MoTa,
						p.NgayTao,
						d.DonGia,
						d.MauSac,
						d.KichThuoc,
						d.ViewCout
						INTO #Results2
					FROM [SanPham] AS p INNER JOIN ThongTinCT d ON p.MaSP = d.MaSP
					WHERE (@tensp ='' or p.TenSP like N'%' + @tensp + '%') AND
						(@MaLoai is null or p.MaLoai = @MaLoai);
					SELECT @RecordCount = COUNT(*)
                    FROM #Results2;
                    SELECT *, 
						@RecordCount AS RecordCount
                    FROM #Results2;
                    DROP TABLE #Results2;
		END;
	END;

GO

CREATE PROCEDURE [dbo].[delete-sanpham]
(@MaSP             varchar(50) 
)
AS
    BEGIN
		delete from [SanPham] where MaSP = @MaSP;
        SELECT '';
    END;
GO

ALTER PROCEDURE [dbo].[sp_sanpham_get_by_id](@MaSP Int)
AS
    BEGIN
        SELECT S.*,I.DonGia,I.MauSac,I.KichThuoc, I.ViewCout
							
        FROM SanPham S INNER JOIN ThongTinCT I on S.MaSP = I.MaSP
      where  S.MaSP = @MaSP
    END;
GO

CREATE PROCEDURE [dbo].[GetSanPhamByViewCount](@ViewCountThreshold Int)  
AS  
BEGIN  
    SELECT S.*,I.DonGia,I.MauSac,I.KichThuoc, I.ViewCout
							
        FROM SanPham S INNER JOIN ThongTinCT I on S.MaSP = I.MaSP
		
    WHERE ViewCout > @ViewCountThreshold;  
END  


SET ANSI_NULLS ON

alter PROCEDURE [dbo].[sp_sanpham_getall]
AS
    BEGIN
        SELECT S.*,I.DonGia,I.MauSac,I.KichThuoc, I.ViewCout
							
        FROM SanPham S INNER JOIN ThongTinCT I on S.MaSP = I.MaSP
    END;
GO
 
CREATE PROCEDURE [dbo].[sp_loaisanpham_getall]
AS
    BEGIN
        SELECT LoaiSanPham.MaLoai, 
               LoaiSanPham.TenLoai, 
			   LoaiSanPham.GhiChu                         
        FROM LoaiSanPham 
    END;
GO

CREATE PROCEDURE [dbo].[sp_nhasanxuat_getall]
AS
    BEGIN
        SELECT NhaSanXuat.MaNCC, 
               NhaSanXuat.TenNCC, 
			   NhaSanXuat.DiaChi,
			   NhaSanXuat.SoDT
        FROM NhaSanXuat 
    END;
GO

CREATE PROCEDURE [dbo].[sp_IDhinhanh](@MaSP Int)
AS
    BEGIN
        SELECT  [MaAnhChitiet]               , 
					 MaSP           ,
					 Anh          
        FROM ChiTietAnhSP
      where  MaSP = @MaSP;
    END;
GO

CREATE PROCEDURE [dbo].[delete_donhang]
(@MaDonHang             int 
)
AS
    BEGIN
		delete from [DonHang] where MaDonHang = @MaDonHang;
        SELECT '';
    END;
GO

CREATE PROCEDURE [dbo].[getall_donhang]
AS
    BEGIN				
        SELECT H.*,K.HoTen, K.DiaChi , K.Email, K.SoDT                    
        FROM DonHang H INNER JOIN KhachHang K on H.MaKH = K.MaKH
    END;
GO

CREATE PROCEDURE [dbo].[getbyid_donhang](@MaDonHang Int)
AS
    BEGIN
        SELECT H.*,K.HoTen, K.DiaChi , K.Email, K.SoDT                    
        FROM DonHang H INNER JOIN KhachHang K on H.MaKH = K.MaKH
      where  [MaDonHang] = @MaDonHang;
    END;
GO

ALTER PROCEDURE [dbo].[create_donhang](@TrangThaiDonHang INT, @HoTen nvarchar(50), @SoDT nvarchar(50), @DiaChi nchar(10), @GhiChu nvarchar(500), @listjson_detail NVARCHAR(MAX))
AS
	BEGIN
		BEGIN
			INSERT INTO KhachHang(HoTen, [DiaChi], SoDT)
			VALUES (@HoTen, @DiaChi, @SoDT)
		END;
		IF(@listjson_detail IS NOT NULL)
		BEGIN
			-- Thêm bảng Order
			INSERT INTO [DonHang]([MaKH] ,[NgayDat],TrangThaiDonHang, HoTen, SoDT, DiaChi ,GhiChu)
			VALUES (IDENT_CURRENT('KhachHang'), GETDATE(),@TrangThaiDonHang, @HoTen, @SoDT, @DiaChi,@GhiChu);
			
			-- Thêm vào bảng OrderDetail
			INSERT INTO [ChiTietDonHang]([MaDonHang] ,[MaSP] ,[SoLuong] ,[DonGia])
			SELECT 
				IDENT_CURRENT('DonHang'),
				json_value(p.value, '$.maSP'),
				json_value(p.value, '$.soLuong'),
				json_value(p.value, '$.donGia')
			FROM OPENJSON(@listjson_detail) AS p;
		END;
		SELECT '';
	END;
GO


CREATE PROCEDURE [dbo].[create_khachhang]
(
@HoTen nvarchar(80),
@DiaChi nvarchar(500) ,
@Email nvarchar(50),
@SoDT	int,
@TaiKhoann nvarchar(100),
@MatKhau nvarchar(100)
)
AS
    BEGIN
      INSERT INTO [KhachHang]
                (
					 HoTen           ,
					 DiaChi          ,
					 Email           ,
					 SoDT           ,
					 TaiKhoann              ,
					 MatKhau              
				)
                VALUES
                (
					 @HoTen           ,
					 @DiaChi          ,
					 @Email           ,
					 @SoDT,
					 @TaiKhoann   ,
					 @MatKhau             
				);
        SELECT '';
    END;
GO
CREATE PROCEDURE [dbo].[sp_khachhang_get_by_id](@MaKH Int)
AS
    BEGIN
        SELECT S.*
							
        FROM KhachHang S 
      where  S.MaKH = @MaKH
    END;
GO
--NHÂN VIÊN

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[delete_nhanvien]
(@MaNhanVien             varchar(50) 
)
AS
    BEGIN
		delete from [NhanVien] where MaNhanVien = @MaNhanVien;
        SELECT '';
    END;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[search_nhanvien] (@page_index  INT, 
                                       @page_size   INT,
									   @tennhanvien nvarchar(150),
									    @email varchar(30)
									   )
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY u.TenNhanVien ASC)) AS RowNumber, 
                             u.MaNhanVien              , 
							 u.TenNhanVien           ,
							 u.Email          ,
							 u.SoDT           ,
							 u.DiaChi 
                        INTO #Results1
                        FROM [NhanVien] AS u
						WHERE ((@tennhanvien = '') OR (u.TenNhanVien LIKE '%' + @tennhanvien + '%'));
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                         SELECT(ROW_NUMBER() OVER(
                              ORDER BY u.TenNhanVien ASC)) AS RowNumber, 
                            u.MaNhanVien              , 
							 u.TenNhanVien           ,
							 u.Email          ,
							 u.SoDT           ,
							 u.DiaChi 
                        INTO #Results2
                        FROM [NhanVien] AS u
						WHERE ((@tennhanvien = '') OR (u.TenNhanVien LIKE '%' + @tennhanvien + '%'));
						SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;
                        DROP TABLE #Results2;
        END;
    END;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[create_nhanvien]
(
@TenNhanVien	nvarchar(200),
@Email nvarchar(500),
@SoDT	nvarchar(500),
@DiaChi nvarchar(500) 
)
AS
    BEGIN
      INSERT INTO [NhanVien]
                (
							 TenNhanVien           ,
							 Email          ,
							 SoDT           ,
							 DiaChi 
				)
                VALUES
                (
							 @TenNhanVien           ,
							 @Email          ,
							 @SoDT           ,
							 @DiaChi 
				);
        SELECT '';
    END;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_nhanvien_get_by_id](@MaNhanVien Int)
AS
    BEGIN
        SELECT  [MaNhanVien]               , 
					 TenNhanVien           ,
					 Email          ,
					 SoDT           ,
					 DiaChi 
        FROM [NhanVien]
      where  [MaNhanVien] = @MaNhanVien;
    END;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
create PROCEDURE [dbo].[sp_nhanvien_getall]
AS
    BEGIN
        SELECT NhanVien.MaNhanVien, 
               NhanVien.TenNhanVien, 
               NhanVien.Email, 
			   NhanVien.SoDT, 
			   NhanVien.DiaChi                         
        FROM NhanVien 
    END;
GO

/****** Object:  StoredProcedure [dbo].[sp_login_user]    Script Date: 12/04/2023 6:20:17 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[sp_login_user](@TaiKhoan nvarchar(200), @MatKhau nvarchar(200))
AS	
	BEGIN
		SELECT c.MaKH, c.HoTen, c.[DiaChi], c.Email,c.SoDT, c.TaiKhoan, c.[MatKhau]
		FROM KhachHang c INNER JOIN [DonHang] o on c.MaKH = o.MaKH
		WHERE c.TaiKhoan = @TaiKhoan AND c.[MatKhau] = @MatKhau
	END
GO

CREATE PROCEDURE [dbo].[CTHDN_getall](@MaDonHang int)
AS
    BEGIN
		SELECT S.*,I.HinhAnh,I.TenSP
		FROM ChiTietDonHang S INNER JOIN SanPham I on S.MaSP = I.MaSP
		where S.MaDonHang = @MaDonHang
	end; 
GO

exec [dbo].[CTHDN_getall] @MaDonHang =1022