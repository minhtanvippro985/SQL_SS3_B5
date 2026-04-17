CREATE DATABASE cart_shopping;
USE cart_shopping;

CREATE TABLE ProductList(
	ProductID INT PRIMARY KEY auto_increment,
    ProductNAME VARCHAR(40) NOT NULL 
);

CREATE TABLE USERS(
  UserID INT auto_increment PRIMARY KEY,
  UserNAME VARCHAR(40)
);

CREATE TABLE CART_ITEMS(
  cart_itemID INT PRIMARY KEY AUTO_INCREMENT,
  UserID INT ,
  ProductID INT ,
  foreign key (ProductID) references ProductList(ProductID),
  foreign key (UserID) references USERS(UserID),
  Quantity INT CHECK(Quantity > 0),
  addedDATE DATETIME DEFAULT CURRENT_TIMESTAMP

);


INSERT INTO ProductList (ProductNAME) VALUES 
('Sữa'),
('MacBook Air M3'),
('AirPods Pro Gen 2'),
('Samsung Galaxy S24 Ultra');


INSERT INTO USERS (UserNAME) VALUES 
('Nguyễn Văn A'),
('Trần Thị B');



INSERT INTO CART_ITEMS (UserID, ProductID, Quantity) VALUES 
(1, 1, 1), -- Nguyễn Văn A mua 1 hộp sữa
(1, 3, 2), -- Nguyễn Văn A mua 2 chiếc AirPods
(2, 2, 1); -- Trần Thị B mua 1 chiếc MacBook



-- đã có quanity check ở bên giỏ hàng (DÙNG CHECK) vì thế giỏ hàng sẽ từ chối nhận giá trị bé hơn 0


-- Khách hàng bấm "Add to cart" đúng mặt hàng đã có sẵn trong giỏ?

INSERT INTO CART_ITEMS (UserID, ProductID, Quantity)
VALUES (1, 1, 1)
ON DUPLICATE KEY UPDATE Quantity = Quantity + 1;  -- ON DUPLICATE sẽ cộng thêm quanity khi mà nó bị trùng 

-- Xóa vì đổi ý 
DELETE FROM CART_ITEMS 
WHERE UserID = 1 AND ProductID = 1;
