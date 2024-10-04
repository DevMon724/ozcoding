-- 초급 생성 10문제
INSERT INTO customers (customerNumber, customerName, contactLastName, contactFirstName, phone, addressLine1, addressLine2, city, state, postalCode, country, salesRepEmployeeNumber, creditLimit) 
VALUES (1001, 'Jake', 'younghyun', 'Lee', '01031100273', 'cheonmasanro 100', NULL, 'jeonju', NULL, '35272', 'South Korea', '1611', '12000');

INSERT INTO products (productCode, productName, productLine, productScale, productVendor, productDescription, quantityInStock, buyPrice, MSRP) 
VALUES ('S782', 'Super Ultra Car', 'Classic Cars', '1:18', 'Welly Diecast Productions', '1:18 scale die-cast about 10" long doors open, hood opens, trunk opens and wheels roll', '567', '800', '112.08');

INSERT INTO employees (employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle) 
VALUES ('8892', 'Johnson', 'Martin', 'x2028', 'martin@naver.com', '7', '1088', 'Sales Rep');

INSERT INTO offices (officeCode, city, phone, addressLine1, addressLine2, state, country, postalCode, territory) 
VALUES ('8', 'seoul', '+82.8282.8282', 'euljiro 143', 'Floor3', NULL, 'South Korea', '52341', 'NA');

INSERT INTO orders (orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber) 
VALUES ('10426', '2005-06-01', '2005-06-08', NULL, 'Shipped', NULL, '412');

INSERT INTO orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber) 
VALUES (10206, 'S24_2022', '11', '40.5', '5');

INSERT INTO payments (customerNumber, checkNumber, paymentDate, amount) 
VALUES (497, 'MN89921', '2023-01-01', '52166.00');

INSERT INTO productlines (productLine, textDescription, htmlDescription, image) 
VALUES ('Bus', 'Classic Bus', NULL, NULL);

INSERT INTO customers (customerNumber, customerName, contactLastName, contactFirstName, phone, addressLine1, addressLine2, city, state, postalCode, country, salesRepEmployeeNumber, creditLimit) 
VALUES (1001, 'Jake', 'pall', 'robin', '01031100273', 'cheonmasanro 100', NULL, 'Los Angeles', NULL, '35272', 'USA', '1611', '12000');

INSERT INTO products (productCode, productName, productLine, productScale, productVendor, productDescription, quantityInStock, buyPrice, MSRP) 
VALUES ('S782', 'Ultra Bus', 'Classic Bus', '1:18', 'Welly Diecast Productions', '1:18 scale die-cast about 10" long doors open, hood opens, trunk opens and wheels roll', '567', '800', '112.08');

-- 초급 읽기 10문제
SELECT * FROM customers;

SELECT name, price FROM products;

SELECT firstName, lastName, jobTitle FROM employees;

SELECT address FROM offices;

SELECT * FROM orders ORDER BY orderDate DESC LIMIT 10;

SELECT * FROM orderdetails WHERE orderID = 10105;

SELECT * FROM payments WHERE customerID = 112;

SELECT productLine, textDescription FROM productlines;

SELECT * FROM customers WHERE city = 'Madrid';

SELECT * FROM products WHERE price BETWEEN 10 AND 60;


-- 초급 갱신 10문제
UPDATE customers SET address = 'gyeryongro 74' WHERE customerID = 112;

UPDATE products SET price = 333 WHERE productID = 'S10_4962';

UPDATE employees SET jobTitle = 'Manager' WHERE employeeID = 1111;

UPDATE offices SET phone = '010-3110-0273' WHERE officeID = 2;

UPDATE orders SET status = 'Cancelled' WHERE orderID = 10181;

UPDATE orderdetails SET quantityOrdered = 15 WHERE orderID = 10105 AND productID = 'S700_2610';

UPDATE payments SET amount = 1000.00 WHERE customerID = 113 AND paymentDate = '2024-10-04';

UPDATE productlines SET textDescription = 'super ultra zzang zzang' WHERE productLine = 'Ships';

UPDATE customers SET email = 'young@naver.com' WHERE customerID = 112;

UPDATE products SET price = price * 1.20;


-- 초급 삭제 10문제
DELETE FROM customers WHERE customerID = 121;

DELETE FROM products WHERE productID = 'S10_4962';

DELETE FROM employees WHERE employNumber = 1166;

DELETE FROM offices WHERE officeID = 1;

DELETE FROM orders WHERE orderID = 10105;

DELETE FROM orderdetails WHERE orderID = 10110;

DELETE FROM payments WHERE customerID = 103;

DELETE FROM productlines WHERE productLine = 'Classic Cars';

DELETE FROM customers WHERE city = 'Melbourne';

DELETE FROM products WHERE productLine = 'Classic Cars';


