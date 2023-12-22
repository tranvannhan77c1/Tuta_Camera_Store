CREATE TABLE Brands
(
    Id          INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Name        VARCHAR(100) NOT NULL UNIQUE,
    Description NVARCHAR(200)
)
    GO

CREATE TABLE Categories
(
    Id          INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Name        NVARCHAR(100) NOT NULL UNIQUE,
    Description NVARCHAR(200)
)
    GO

CREATE TABLE Cameras
(
    Id               INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Name             NVARCHAR(100) NOT NULL UNIQUE,
    CategoryId       INT NOT NULL,
    BrandId          INT NOT NULL,
    Price            INT,
    Quantity         INT CHECK (Quantity >= 0),
    Introduce        NVARCHAR(2000),
    Description1     NVARCHAR(2000),
    Description2     NVARCHAR(2000),
    Width            VARCHAR(100),
    Height           VARCHAR(100),
    Depth            VARCHAR(100),
    Weight           VARCHAR(100),
    PrimaryImage     NVARCHAR(100),
    AdditionalImage1 NVARCHAR(100),
    AdditionalImage2 NVARCHAR(100),
    AdditionalImage3 NVARCHAR(100),
    CONSTRAINT FK_Cameras_Categories FOREIGN KEY (CategoryId) REFERENCES Categories (Id),
    CONSTRAINT FK_Cameras_Brands FOREIGN KEY (BrandId) REFERENCES Brands (Id)
)
    GO

CREATE TABLE Accounts
(
    Id              INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Username        VARCHAR(100) NOT NULL UNIQUE,
    Password        VARCHAR(100) NOT NULL,
    Email           VARCHAR(100) NOT NULL UNIQUE,
    Firstname       NVARCHAR(100),
    Lastname        NVARCHAR(100),
    Phone           VARCHAR(10)  NOT NULL UNIQUE,
    Province        NVARCHAR(100),
    District        NVARCHAR(100),
    Ward            NVARCHAR(100),
    SpecificAddress NVARCHAR(200)
)
    GO


CREATE TABLE Orders
(
    Id               INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    AccountId        INT,
    OrderDate        DATE,
    TotalOrderAmount INT,
    PaymentMethod    BIT DEFAULT 0,
    Province         NVARCHAR(100),
    District         NVARCHAR(100),
    Ward             NVARCHAR(100),
    SpecificAddress  NVARCHAR(200),
    Email            VARCHAR(100),
    Firstname        NVARCHAR(100),
    Lastname         NVARCHAR(100),
    Phone            VARCHAR(10),
    CONSTRAINT FK_Orders_Accounts FOREIGN KEY (AccountId) REFERENCES Accounts (Id)
)
    GO

CREATE TABLE OrderDetails
(
    Id       INT IDENTITY(1,1) PRIMARY KEY,
    OrderId  INT,
    CameraId INT,
    Quantity INT,
    Price    INT,
    CONSTRAINT FK_OrderDetails_Orders FOREIGN KEY (OrderId) REFERENCES Orders (Id),
    CONSTRAINT FK_OrderDetails_Cameras FOREIGN KEY (CameraId) REFERENCES Cameras (Id)
)
    GO

CREATE TABLE Roles
(
    Id   VARCHAR(10) PRIMARY KEY,
    Name NVARCHAR(50)
)
    GO

CREATE TABLE Authorities
(
    Id        INT IDENTITY(1, 1) PRIMARY KEY,
    AccountId INT,
    RoleId    VARCHAR(10),
    CONSTRAINT FK_Authorities_Roles FOREIGN KEY (RoleId) REFERENCES Roles (Id),
    CONSTRAINT FK_Authorities_Accounts FOREIGN KEY (AccountId) REFERENCES Accounts (Id)
) GO



INSERT INTO Brands (Name, Description)
VALUES ('Canon', 'Máy ảnh Canon chất lượng cao'),
       ('Nikon', 'Máy ảnh Nikon chuyên nghiệp'),
       ('Sony', 'Máy ảnh Sony công nghệ tiên tiến'),
       ('Fujifilm', 'Máy ảnh Fujifilm với thiết kế đẹp'),
       ('Panasonic', 'Máy ảnh Panasonic nhẹ nhàng và tiện lợi');

-- Thêm dữ liệu mẫu cho bảng Categories
INSERT INTO Categories (Name, Description)
VALUES ('DSLR', 'Máy ảnh DSLR'),
       ('Mirrorless', 'Máy ảnh Mirrorless'),
       ('Compact', 'Máy ảnh Compact'),
       ('Bridge', 'Máy ảnh Bridge'),
       ('Action', 'Máy ảnh chụp hành động');

-- Thêm dữ liệu mẫu cho bảng Accounts
INSERT INTO Accounts (Username, Password, Email, Firstname, Lastname, Phone, Province, District, Ward, SpecificAddress)
VALUES ('user1', 'password1', 'user1@example.com', 'Nguyen', 'Van A', '0123456789', 'Tinh 1', 'Huyen 1', 'Xa 1',
        'Dia chi 1'),
       ('user2', 'password2', 'user2@example.com', 'Tran', 'Thi B', '0987654321', 'Tinh 2', 'Huyen 2', 'Xa 2',
        'Dia chi 2'),
       ('user3', 'password3', 'user3@example.com', 'Le', 'Van C', '0369852147', 'Tinh 3', 'Huyen 3', 'Xa 3',
        'Dia chi 3'),
       ('user4', 'password4', 'user4@example.com', 'Pham', 'Van D', '0754321896', 'Tinh 4', 'Huyen 4', 'Xa 4',
        'Dia chi 4'),
       ('user5', 'password5', 'user5@example.com', 'Hoang', 'Thi E', '0321654987', 'Tinh 5', 'Huyen 5', 'Xa 5',
        'Dia chi 5');

-- Thêm dữ liệu mẫu cho bảng Orders
INSERT INTO Orders (AccountId, OrderDate, TotalOrderAmount, Province, District, Ward, SpecificAddress, Email, Firstname,
                    Lastname, Phone)
VALUES (1, '2023-11-20', 5000000, 'Tinh DH1', 'Huyen DH1', 'Xa DH1', 'Dia chi DH1', 'dh1@example.com', 'Ho 1', 'Ten 1',
        '0123456789'),
       (2, '2023-11-21', 8000000, 'Tinh DH2', 'Huyen DH2', 'Xa DH2', 'Dia chi DH2', 'dh2@example.com', 'Ho 2', 'Ten 2',
        '0987654321'),
       (3, '2023-11-22', 3000000, 'Tinh DH3', 'Huyen DH3', 'Xa DH3', 'Dia chi DH3', 'dh3@example.com', 'Ho 3', 'Ten 3',
        '0369852147'),
       (4, '2023-11-23', 6500000, 'Tinh DH4', 'Huyen DH4', 'Xa DH4', 'Dia chi DH4', 'dh4@example.com', 'Ho 4', 'Ten 4',
        '0754321896'),
       (5, '2023-11-24', 4200000, 'Tinh DH5', 'Huyen DH5', 'Xa DH5', 'Dia chi DH5', 'dh5@example.com', 'Ho 5', 'Ten 5',
        '0321654987');

-- Thêm dữ liệu mẫu cho bảng Cameras
INSERT INTO Cameras (Name, CategoryId, BrandId, Price, Quantity, Introduce, Description1, Description2, Width, Height,
                     Depth, Weight, PrimaryImage, AdditionalImage1, AdditionalImage2, AdditionalImage3)
VALUES ('Canon R8', 1, 1, 15000000, 50, 'Máy ảnh DSLR Canon', 'Đây là mô tả 1', 'Đây là mô tả 2', '10cm', '20cm',
        '15cm', '1kg', 'image1.jpg', 'image2.jpg', 'image3.jpg', 'image4.jpg'),
       ('Sony A74', 2, 2, 12000000, 40, 'Máy ảnh Mirrorless Nikon', 'Đây là mô tả 1', 'Đây là mô tả 2', '8cm', '18cm',
        '12cm', '800g', 'image5.jpg', 'image6.jpg', 'image7.jpg', 'image8.jpg'),
       ('Canon R3', 3, 3, 8000000, 30, 'Máy ảnh Compact Sony', 'Đây là mô tả 1', 'Đây là mô tả 2', '6cm', '15cm',
        '10cm', '500g', 'image9.jpg', 'image10.jpg', 'image11.jpg', 'image12.jpg'),
       ('Canon R10', 4, 4, 5000000, 20, 'Máy ảnh Bridge Fujifilm', 'Đây là mô tả 1', 'Đây là mô tả 2', '7cm', '16cm',
        '11cm', '600g', 'image13.jpg', 'image14.jpg', 'image15.jpg', 'image16.jpg'),
       ('Canon R6', 5, 5, 3000000, 25, 'Máy ảnh chụp hành động Panasonic', 'Đây là mô tả 1', 'Đây là mô tả 2', '5cm',
        '12cm', '9cm', '400g', 'image17.jpg', 'image18.jpg', 'image19.jpg', 'image20.jpg');

-- Thêm dữ liệu mẫu cho bảng OrderDetails
INSERT INTO OrderDetails (OrderId, CameraId, Quantity, Price)
VALUES (1, 1, 2, 30000000),
       (2, 2, 1, 12000000),
       (3, 3, 3, 24000000),
       (4, 4, 4, 20000000),
       (5, 5, 2, 6000000);


-- Thêm dữ liệu mẫu cho bảng Roles
INSERT INTO Roles (Id, Name)
VALUES ('MANAGER', 'Managers'),
       ('CUSTOMER', 'Customers'),
       ('EMPLOYEE', 'Employees');

-- Thêm dữ liệu vào bảng Authorities
INSERT INTO Authorities (AccountId, RoleId)
VALUES (1, 'MANAGER'),
       (2, 'CUSTOMER'),
       (3, 'EMPLOYEE');