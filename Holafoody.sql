CREATE DATABASE Foodyhola2
GO

USE Foodyhola2
GO

CREATE TABLE [User]
 
(
	UserID INT IDENTITY PRIMARY KEY ,
	Username CHAR(20) NOT NULL,
	Password CHAR(20) NOT NULL,
	Name NVARCHAR(50) NOT NULL,
	Email CHAR(50) NOT NULL,
	AvatarUrl NCHAR(50) NOT NULL,
	Role INT NOT NULL	
)
ALTER TABLE [User] ADD Active int DEFAULT 1
GO

/*Infomration about Shop: Product, Comment*/

CREATE TABLE [Shop] (

	ShopID INT IDENTITY PRIMARY KEY,
	UserID INT NOT NULL,
	Title NVARCHAR(20) NOT NULL,
	Description NVARCHAR(50) ,
	OpenOrClose BIT
)

GO


ALTER TABLE dbo.Shop ALTER COLUMN Description NVARCHAR(200)
CREATE TABLE [Product]
(
	ProductID INT IDENTITY PRIMARY KEY,
	ShopID INT /*f*/,
	Name NVARCHAR(50) NOT NULL,
	Image NCHAR(50) NOT NULL,
	Price  FLOAT NOT NULL	
)

GO

CREATE TABLE [Comment]
(
	
	CommentID INT IDENTITY PRIMARY KEY,
	ShopID INT /*f*/,
	UserID INT,
	Content NVARCHAR(50)
	
)

GO

CREATE TABLE [Invoice]
(
	InvoiceID INT IDENTITY PRIMARY KEY,
	OrderTime DATE,
	UserID INT,
	Address NVARCHAR(20),
	PhoneNumber CHAR(20)
		
)

GO

CREATE	TABLE [InvoiceLine]
(
	InvoiceID INT,
	ProductID INT,
	Quatity INT,
	UnitPrice INT,
	Note NVARCHAR(50) NOT NULL
	PRIMARY KEY(InvoiceID, ProductID)
)
ALTER TABLE dbo.InvoiceLine ALTER COLUMN UnitPrice FLOAT


ALTER TABLE dbo.Shop ADD FOREIGN KEY (UserID) REFERENCES dbo.[User] (UserID) ;
GO

ALTER TABLE dbo.Comment ADD FOREIGN KEY (UserID) REFERENCES dbo.[User] (UserID) ;
GO

ALTER TABLE dbo.Comment ADD FOREIGN KEY (ShopID) REFERENCES dbo.Shop (ShopID) ;
GO

ALTER TABLE dbo.Product ADD FOREIGN KEY (ShopID) REFERENCES dbo.Shop (ShopID) ;
GO

ALTER TABLE dbo.Invoice ADD FOREIGN KEY (UserID) REFERENCES dbo.[User] (UserID) ;
GO

ALTER TABLE dbo.InvoiceLine ADD FOREIGN KEY (InvoiceID) REFERENCES dbo.Invoice (InvoiceID) ;
GO

ALTER TABLE dbo.InvoiceLine ADD FOREIGN KEY (ProductID) REFERENCES dbo.Product (ProductID) ;
GO
/*User*/
--T? t?o trong SIGN up 2 th?ng




/*
1. Tao User   OK 
5. liet ke all User OK
6. liet ke all Product OK



*/

/*2. tao shop voi User co ID = x*/


/*7.  Xem lich su mua hang cua Shop voi ID = x(xem san pham da mua va nguoi mua tuong ung)*/

 /*3. tao product cho Shop voi ID = x*/ 



/*4. xem hoa don cua User voi ID = x*/

 CREATE  PROCEDURE viewInvoice
@UserID INT
AS
BEGIN

SELECT a.OrderTime,b.Quatity,b.UnitPrice,c.Name,c.Image 
FROM	dbo.Invoice a INNER JOIN dbo.InvoiceLine b
ON a.InvoiceID = b.InvoiceID 
INNER JOIN dbo.Product c
ON b.ProductID = c.ProductID
WHERE UserID = @UserID
     
END   	       
GO

EXECUTE dbo.viewInvoice
 @UserID = 2 -- int


/*8. Liet ke danh sach Shop cua User voi ID = x*/
 CREATE  PROCEDURE listShop
@UserID INT
AS
BEGIN

SELECT b.ShopID,b.ShopOwner,b.Title,b.Description,b.OpenOrClose
FROM dbo.[User] a INNER JOIN dbo.Shop b
ON a.UserID = b.UserID 

WHERE a.UserID = @UserID
     
END   	       
GO

EXECUTE listShop
@UserID = 1

/*9. Liet ke cac comment cua Shop co ID = x*/
 CREATE  PROCEDURE listComment
@ShopID INT
AS
BEGIN

SELECT a.ShopID,b.Content,c.Name,b.UserID,c.Role
FROM dbo.Shop a INNER JOIN dbo.Comment b
ON a.ShopID = b.ShopID
INNER JOIN dbo.[User] c
ON b.UserID = c.UserID
WHERE a.ShopID = @ShopID
     
END   	       
GO

EXECUTE listComment
@ShopID = 1
 

/* Check if username,email has already existed*/
CREATE  TRIGGER addUser
 ON dbo.[User] 
 FOR INSERT,UPDATE 
 AS
 BEGIN
	--For insert
	DECLARE @NewUsername CHAR(20);
	DECLARE @NewEmail CHAR(50)
	SELECT @NewUsername = a.Username,@NewEmail = a.Email FROM Inserted a
	 
	DECLARE @cnt1 INT;
	SELECT @cnt1 = COUNT(*)
	FROM dbo.[User] a
	WHERE a.Username = @NewUsername	

	DECLARE @cnt2 INT;
	SELECT @cnt2 = COUNT(*)
	FROM dbo.[User] a
	WHERE a.Email = @NewEmail

	IF (@cnt1 >=2 OR @cnt2 >= 2)
		ROLLBACK TRANSACTION
			
 END 



 create proc GetShops
@u int,
@v int
as
begin
 SELECT * FROM ( 
  SELECT *, ROW_NUMBER() OVER (ORDER BY a.ShopID) as row 
  FROM dbo.Shop a
 ) a WHERE a.row >= @u and a.row <= @v
end
go
exec GetShops 6, 15
select * from [Shop]

select * from [User] WHERE userid=1




INSERT INTO [Comment](shopId,userId,content ) values(1,2,'abc')
INSERT INTO [Comment](shopId,userId,content ) values(1,2,'cdf')

Create  PROCEDURE viewInvoice
@UserID INT
AS
BEGIN

SELECT a.OrderTime,b.Quatity,b.UnitPrice,c.Name,c.Image 
FROM	dbo.Invoice a INNER JOIN dbo.InvoiceLine b
ON a.InvoiceID = b.InvoiceID 
INNER JOIN dbo.Product c
ON b.ProductID = c.ProductID
WHERE UserID = @UserID	
     
END   	       
GO

EXECUTE viewInvoice
 @UserID = 3 -- int


/*8. Liet ke danh sach Shop cua User voi ID = x*/
 CREATE   PROCEDURE listShop
@UserID INT
AS
BEGIN

SELECT b.ShopID,a.Username,b.Title,b.Description,b.OpenOrClose,b.Title,b.Description
FROM dbo.[User] a INNER JOIN dbo.Shop b
ON a.UserID = b.UserID 


WHERE a.UserID = @UserID
     
END   	       
GO

EXECUTE listShop
@UserID = 6

/*9. Liet ke cac comment cua Shop co ID = x*/
 CREATE  PROCEDURE listComment
@ShopID INT
AS
BEGIN

SELECT a.ShopID,b.Content,c.Name,b.UserID,c.Role
FROM dbo.Shop a INNER JOIN dbo.Comment b
ON a.ShopID = b.ShopID
INNER JOIN dbo.[User] c
ON b.UserID = c.UserID
WHERE a.ShopID = @ShopID
     
END   	       
GO

EXECUTE listComment
@ShopID = 1
 

/* Check if username,email has already existed*/
CREATE  TRIGGER addUser
 ON dbo.[User] 
 FOR INSERT,UPDATE 
 AS
 BEGIN
	--For insert
	DECLARE @NewUsername CHAR(20);
	DECLARE @NewEmail CHAR(50)
	SELECT @NewUsername = a.Username,@NewEmail = a.Email FROM Inserted a
	 
	DECLARE @cnt1 INT;
	SELECT @cnt1 = COUNT(*)
	FROM dbo.[User] a
	WHERE a.Username = @NewUsername	

	DECLARE @cnt2 INT;
	SELECT @cnt2 = COUNT(*)
	FROM dbo.[User] a
	WHERE a.Email = @NewEmail

	IF (@cnt1 >=2 OR @cnt2 >= 2)
		ROLLBACK TRANSACTION
			
 END 

/* Get Shops */
ALTER proc GetShops
@u int,
@v int
as
begin
 SELECT * FROM ( 
  SELECT *, ROW_NUMBER() OVER (ORDER BY a.ShopID) as row 
  FROM dbo.Shop a
  WHERE a.OpenOrClose=1
 ) a WHERE a.row >= @u and a.row <= @v 
end
go

ALTER proc GetShopsOldest
@u int,
@v int
as
begin
 SELECT * FROM ( 
  SELECT *, ROW_NUMBER() OVER (ORDER BY a.ShopID DESC) as row 
  FROM dbo.Shop a
  WHERE a.OpenOrClose=1
 ) a WHERE a.row >= @u and a.row <= @v 
 
END

exec GetShops 1,9
exec GetShopsOldest 1,9


/*List User's Invoices*/
 Create  PROCEDURE listInvoice
@UserID INT
AS
BEGIN

SELECT b.InvoiceID,b.OrderTime,b.UserID,b.Address,b.PhoneNumber
FROM dbo.[User] a INNER JOIN dbo.Invoice b
ON a.UserID = b.UserID
WHERE a.UserID = @UserID
     
END   	       
GO

EXECUTE listInvoice
@UserID = 6

/*List Invoice's product*/
 Create  PROCEDURE invoiceProduct
@InvoiceID INT
AS
BEGIN

SELECT c.ProductID,c.ShopID,c.Name,c.Image,c.Price,b.Quatity,b.Note
FROM dbo.Invoice a INNER JOIN dbo.InvoiceLine b
ON a.InvoiceID = b.InvoiceID
INNER JOIN dbo.Product c
ON b.ProductID = c.ProductID
WHERE a.InvoiceID = @InvoiceID
     
END   	       
GO

EXECUTE invoiceProduct
@InvoiceID = 1

INSERT INTO dbo.Invoice
        ( OrderTime ,
          UserID ,
          Address ,
          PhoneNumber
        )
VALUES  ( GETDATE() , -- OrderTime - date
          6 , -- UserID - int
          N'Ha Noi' , -- Address - nvarchar(20)
          '0123'  -- PhoneNumber - char(20)
        )
INSERT INTO dbo.InvoiceLine
        ( InvoiceID ,
          ProductID ,
          Quatity ,
          UnitPrice ,
          Note
        )
VALUES  ( 1 , -- InvoiceID - int
          2 , -- ProductID - int
          5 , -- Quatity - int
          70000 , -- UnitPrice - int
          N'Ngu vc'  -- Note - nvarchar(50)
        )

ALTER TABLE dbo.[User] ALTER COLUMN AvatarUrl NCHAR(100)
ALTER TABLE dbo.Product ALTER COLUMN Image NCHAR(100)


select * from [User] WHERE Username='deptrai'




ALTER  PROCEDURE showOrderShop
	@ShopID INT,@inputDate date
AS
BEGIN 
	SELECT d.InvoiceID,b.ShopID,e.UserID,e.Name UserName,b.Name ProductName,c.Quatity,c.UnitPrice,c.Note,d.Address,d.PhoneNumber,d.OrderTime
FROM dbo.Product b INNER JOIN dbo.InvoiceLine c
ON b.ProductID = c.ProductID
INNER JOIN dbo.Invoice d
ON c.InvoiceID = d.InvoiceID
INNER JOIN dbo.[User] e
ON d.UserID = e.UserID
WHERE b.ShopID = @ShopID AND d.OrderTime=@inputDate
 END 

 EXECUTE dbo.showOrderShop @ShopID = 13, @inputDate='2018-10-28'



 INSERT INTO dbo.Invoice
        ( OrderTime ,
          UserID ,
          Address ,
          PhoneNumber
        )
VALUES  ( GETDATE() , -- OrderTime - date
          8 , -- UserID - int
          N'Ha Noi' , -- Address - nvarchar(20)
          '0123'  -- PhoneNumber - char(20)
        )
INSERT INTO dbo.InvoiceLine
        ( InvoiceID ,
          ProductID ,
          Quatity ,
          UnitPrice ,
          Note
        )
VALUES  ( 3 , -- InvoiceID - int
          5 , -- ProductID - int
          5 , -- Quatity - int
         55 , -- UnitPrice - int
          N'Ngu vc'  -- Note - nvarchar(50)
        )
INSERT INTO dbo.InvoiceLine
        ( InvoiceID ,
          ProductID ,
          Quatity ,
          UnitPrice ,
          Note
        )
VALUES  ( 3 , -- InvoiceID - int
          6 , -- ProductID - int
          3 , -- Quatity - int
         39 , -- UnitPrice - int
          N'Ng0'  -- Note - nvarchar(50)
        )



		 INSERT INTO dbo.Invoice
        ( OrderTime ,
          UserID ,
          Address ,
          PhoneNumber
        )
VALUES  ( GETDATE() , -- OrderTime - date
          8 , -- UserID - int
          N'HCM' , -- Address - nvarchar(20)
          '0123'  -- PhoneNumber - char(20)
        )
		INSERT INTO dbo.InvoiceLine
        ( InvoiceID ,
          ProductID ,
          Quatity ,
          UnitPrice ,
          Note
        )
VALUES  ( 4 , -- InvoiceID - int
          7 , -- ProductID - int
          3 , -- Quatity - int
         55.5 , -- UnitPrice - int
          N'Ng0'  -- Note - nvarchar(50)
        )


UPDATE [Product] SET name='bún', image='43E0D101E0763F3925753C1944EA12DB09EC46C3CA63E74059B414DE4DC62E32.jpg',price=10 WHERE productid=4

INSERT INTO dbo.[User]
        ( Username ,
          Password ,
          Name ,
          Email ,
          AvatarUrl ,
          Role
        )
VALUES  ( 'admin' , -- Username - char(20)
          '123' , -- Password - char(20)
          N'Tân đẹp trai' , -- Name - nvarchar(50)
          '123@123' , -- Email - char(50)
          N'A33F858029651D82285EEE923A025F49FA9B1F3395711BC35E8200C714F321CB.jpg' , -- AvatarUrl - nchar(100)
          0  -- Role - int
        )


ALTER TABLE dbo.Product add  Show BIT DEFAULT 1


UPDATE [Shop] SET openOrClose=1 WHERE userId=7