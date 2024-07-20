CREATE TABLE Category
(
  Category_ID INT IDENTITY(1,1) NOT NULL,
  [Name] VARCHAR(100) NOT NULL,
  PRIMARY KEY (Category_ID)
);

CREATE TABLE Author
(
  Author_ID INT IDENTITY(1,1) NOT NULL,
  [Name] VARCHAR(100) NOT NULL,
  PRIMARY KEY (Author_ID)
);

CREATE TABLE Publisher
(
  Publisher_ID INT IDENTITY(1,1) NOT NULL,
  [Name] VARCHAR(100) NOT NULL,
  PRIMARY KEY (Publisher_ID),
);

CREATE TABLE Book
(
  Book_ID INT IDENTITY(1,1) NOT NULL,
  Price FLOAT NOT NULL,
  Title VARCHAR(100) NOT NULL,
  Category_ID INT NOT NULL,
  Author_ID INT NOT NULL,
  Publisher_ID INT NOT NULL,
  Year_of_Publication INT NOT NULL,
  Quantity INT NOT NULL,
  Description VARCHAR(1000) NOT NULL,
  Rate FLOAT NOT NULL,
  Rate_Count INT NOT NULL,
  Sold INT NOT NULL,
  [Image] VARCHAR(MAX) NOT NULL,
  PRIMARY KEY (Book_ID),
  FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID),
  FOREIGN KEY (Author_ID) REFERENCES Author(Author_ID),
  FOREIGN KEY (Publisher_ID) REFERENCES Publisher(Publisher_ID)
);

CREATE TABLE [User]
(
  [User_ID] INT IDENTITY(1,1) NOT NULL,
  First_Name VARCHAR(100) NOT NULL,
  Last_Name VARCHAR(100) NOT NULL,
  username VARCHAR(100) NOT NULL,
  passwordHash VARCHAR(255) NOT NULL,
  City VARCHAR(50),
  District VARCHAR(50),
  Ward VARCHAR(50),
  Phone_Number VARCHAR(11),
  Email VARCHAR(50),
  Birthday DATE,
  [Role] VARCHAR(10) NOT NULL CHECK ([Role] IN ('Customer', 'Admin')),
  [Gender] VARCHAR(10) CHECK ([Gender] IN ('Male', 'Female')),
  Avatar VARCHAR(255),
  [Address] VARCHAR(100),
  PRIMARY KEY ([User_ID]),
  UNIQUE (username),
  UNIQUE (Email)
);

CREATE TABLE [Order]
(
  Order_ID INT IDENTITY(1,1) NOT NULL,
  [User_ID] INT NOT NULL,
  Unit_Quantity int NOT NULL,
  Total_Price FLOAT NOT NULL,
  [Status] VARCHAR(20) CHECK ([Status] IN ('Pending', 'Shipping', 'Accepted', 'Rejected')) NOT NULL,
  Payment VARCHAR(50) CHECK(Payment IN ('Online Banking','COD','Credit Card','QR Code')) NOT NULL,
  Shipping_Address VARCHAR(100) NOT NULL,
  [Date] DATE NOT NULL,
  PRIMARY KEY (Order_ID),
  FOREIGN KEY ([User_ID]) REFERENCES [User]([User_ID])
);

CREATE TABLE Order_Book
( 
  Order_ID INT NOT NULL,
  Book_ID INT NOT NULL,
  Title VARCHAR(100) NOT NULL,
  Amount INT NOT NULL,
  [Image] VARCHAR(MAX) NOT NULL,
  Price FLOAT NOT NULL,
  PRIMARY KEY (Book_ID, Order_ID),
  FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID),
  FOREIGN KEY (Order_ID) REFERENCES [Order](Order_ID)
);

CREATE TABLE Review
(
	Review_ID INT IDENTITY(1,1) NOT NULL,
	Book_ID INT NOT NULL,
	[User_ID] INT NOT NULL,
	[Date] DATE NOT NULL,
	[Image] VARCHAR(MAX),
	Name NVARCHAR(250),
	Comment NVARCHAR(500),
	PRIMARY KEY(Review_ID),
	FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID),
	FOREIGN KEY ([User_ID]) REFERENCES [User]([User_ID])
)
