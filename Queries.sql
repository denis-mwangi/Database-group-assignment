-- CREATING THE DATABASE
CREATE DATABASE bookstore;

-- SELECTING THE DATABASE
USE bookstore;

-- CREATING BOOK'S TABLE
CREATE TABLE book( 
bookId INT PRIMARY KEY AUTO_INCREMENT, 
languageId INT, 
ISBN_number INT(13), 
bookTitle VARCHAR(100), 
publisherId INT, price INT(10), 
category VARCHAR(20) );

-- ADDING THE FOREIGN KEYS CONTRAINTS TO THE APPROPIATE ROWS
ALTER TABLE book 
ADD FOREIGN KEY (publisherId) REFERENCES publisher(publisherId);

ALTER TABLE book 
ADD FOREIGN KEY (languageId) REFERENCES bookLanguage(languageId);


-- CREATING TABLE COUNTRY
CREATE TABLE country( 
country_id INT PRIMARY KEY AUTO_INCREMENT, 
countryName VARCHAR(30), 
continent VARCHAR(20) );

-- CREATING TABLE AUTHORS
CREATE TABLE authors(
authorId INT PRIMARY KEY AUTO_INCREMENT,
firstName VARCHAR(100),
secondName VARCHAR(100),
bio VARCHAR(200),
email VARCHAR(100),
contact VARCHAR(20),
nationality VARCHAR(20),
address VARCHAR(20),
country VARCHAR(100)
);

-- CREATING TABLE BOOKAUTHOR

CREATE TABLE bookAuthor( 
bookAuthorId INT PRIMARY KEY AUTO_INCREMENT, 
bookId INT, 
authorId INT, 
FOREIGN KEY (bookId) REFERENCES book(bookId), 
FOREIGN KEY (authorId) REFERENCES authors(authorId) );

-- CREATING TABLE ORDERLINE
CREATE TABLE orderLine(
orderLineId INT PRIMARY KEY AUTO_INCREMENT,
bookId INT,
quantity INT(20),
price INT(10),
FOREIGN KEY (bookId) REFERENCES book(bookId)
);

-- CREATING TABLE BOOKLANGUAGE
CREATE TABLE bookLanguage(
languageId INT PRIMARY KEY AUTO_INCREMENT,
langaugeName VARCHAR(30)
);

-- CREATING TABLE SHIPPINGMETHOD
CREATE TABLE shippingMethod(
methodId INT PRIMARY KEY AUTO_INCREMENT,
methodName VARCHAR(30),
methodCost INT(20)
);

-- CREATING TABLE CUSTOMER
CREATE TABLE customer(
customerId INT PRIMARY KEY AUTO_INCREMENT,
email VARCHAR(100),
contact INT(20),
customerName VARCHAR(30),
phoneNumber VARCHAR(10)
);

-- CREATING TABLE ADDRESS
CREATE TABLE address( addressId INT PRIMARY KEY AUTO_INCREMENT, 
street VARCHAR(100), 
city VARCHAR(100) , 
postalCode INT(20), 
country_id INT, FOREIGN KEY (country_id) REFERENCES country(country_id) );

-- CREATING 
CREATE TABLE customer_address( 
customerId INT, 
addressId INT, 
statusId INT, 
FOREIGN KEY (customerId) REFERENCES customer(customerId), 
FOREIGN KEY (addressId) REFERENCES address(addressId), 
FOREIGN KEY (statusId) REFERENCES addressStatus(statusId) );

-- CREATING 
CREATE TABLE custOrder( 
orderId INT PRIMARY KEY AUTO_INCREMENT, 
orderDate DATETIME, 
customerId INT(20), 
totalAmount INT(10), 
methodId INT(20), 
FOREIGN KEY (customerId) REFERENCES customer(customerId), 
FOREIGN KEY (methodId) REFERENCES shippingMethod(methodId) );

-- CREATING 
CREATE TABLE orderStatus(
orderStatusId INT PRIMARY KEY AUTO_INCREMENT,
orderDescription VARCHAR(30)
);

-- CREATING
CREATE TABLE publisher(
publisherId INT PRIMARY KEY AUTO_INCREMENT,
contact VARCHAR(20),
publishersName VARCHAR(30)
);

-- CREATING
CREATE TABLE orderHistory( 
    historyId INT PRIMARY KEY AUTO_INCREMENT, 
orderId INT, 
orderStatusId INT, 
FOREIGN KEY (orderId) REFERENCES custOrder(orderId), 
 FOREIGN KEY (orderStatusId) REFERENCES orderStatus(orderStatusId) );

-- 
CREATE TABLE addressStatus( 
statusId INT PRIMARY KEY AUTO_INCREMENT, 
statusDescription VARCHAR(20) );

CREATE USER 'bookstore_admin'@'localhost' IDENTIFIED BY '1234';

GRANT ALL PRIVILEGES ON bookstoreDB.* TO 'bookstore_admin'@'localhost';

CREATE USER 'Nerdella'@'localhost' IDENTIFIED BY 'Ella123';
GRANT SELECT ON BookstoreDB.* TO 'Nerdella'@'localhost';

 CREATE USER 'Denoe'@'localhost' IDENTIFIED BY 'de432';
GRANT SELECT ON bookstoreDB.* TO 'Denoe'@'localhost';











