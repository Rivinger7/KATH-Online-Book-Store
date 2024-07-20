
--
-- Xóa dữ liệu từ bảng Book
--
DELETE FROM Book;

--
-- Reset giá trị seed của cột IDENTITY
--
DBCC CHECKIDENT ('Book', RESEED, 0);

--
-- Xóa dữ liệu từ bảng User
--
DELETE FROM [User]

--
-- Xóa dữ liệu cá nhân từ bảng User
--
DELETE FROM [User] WHERE User_ID = 4;

--
-- Reset giá trị seed của cột IDENTITY
--

-- Tìm user cuối cùng
DECLARE @LastUserID INT
SELECT @LastUserID = MAX(User_ID) FROM [User]

-- Đặt lại giá trị seed của IDENTITY để bắt đầu từ giá trị lớn hơn
DBCC CHECKIDENT ('[User]', RESEED, 2)






DBCC CHECKIDENT ('User', RESEED, 1);


DELETE FROM [Order]
DELETE FROM Order_Book

DBCC CHECKIDENT('[Order]', RESEED, 0)
