-- USE yes24;
-- CREATE TABLE Books (
--     bookID INT AUTO_INCREMENT PRIMARY KEY,
--     title VARCHAR(255) NOT NULL,
--     author VARCHAR(255),
--     publisher VARCHAR(255),
--     publishing DATE,
--     rating DECIMAL(4, 1),
--     review INT,
--     sales INT,
--     price DECIMAL(10, 2),
--     ranking INT,
--     ranking_weeks INT
-- );

-- SELECT title, author FROM Books;
-- SELECT * FROM Books WHERE rating >= 9.5;
-- SELECT title, review FROM Books WHERE review >= 100 ORDER BY review DESC;
-- SELECT title, price FROM Books WHERE price < 20000;
-- SELECT * FROM Books WHERE ranking_weeks >= 4 ORDER BY ranking_weeks DESC;
-- SELECT * FROM Books WHERE author = '정유정 저';
-- SELECT * FROM Books WHERE publisher = '웅진지식하우스';

-- SELECT author, COUNT(*) AS book_count FROM Books GROUP BY author ORDER BY book_count DESC;
-- SELECT publisher, COUNT(*) AS publishing_count FROM Books GROUP BY publisher ORDER BY publishing_count DESC LIMIT 1;
-- SELECT author, avg(rating) AS rating_avg FROM Books GROUP BY author ORDER BY rating_avg DESC;
-- SELECT * FROM Books WHERE ranking = 1
-- SELECT title, sales, review FROM Books ORDER BY sales DESC, review DESC LIMIT 10; 
-- SELECT * FROM Books ORDER BY publishing DESC LIMIT 5;

-- SELECT author, AVG(rating) AS rating_avg FROM Books GROUP BY author;
-- SELECT publishing, COUNT(*) FROM Books GROUP BY publishing;
-- SELECT title, price FROM Books;
-- SELECT * FROM Books ORDER BY review DESC LIMIT 5;
-- SELECT ranking, AVG(review) FROM Books GROUP BY ranking;

-- SELECT title, rating FROM Books WHERE rating > (SELECT AVG(rating) FROM Books) ORDER BY rating DESC;
-- SELECT title, price FROM Books WHERE price > (SELECT AVG(price) FROM Books) ORDER BY price DESC;
-- SELECT title, review FROM Books WHERE review > (SELECT MAX(review) FROM Books);
-- SELECT title, sales FROM Books WHERE sales < (SELECT AVG(sales) FROM Books);
-- SELECT author, title FROM Books WHERE author = (SELECT author FROM Books GROUP BY author ORDER BY COUNT(*) DESC LIMIT 1);

-- UPDATE Books SET price = 99999 WHERE title = "한국사";
-- UPDATE Books SET title = '제목업데이트' WHERE author = '최태성 저';
-- DELETE FROM Books WHERE sales = (SELECT MIN(sales) FROM Books);
-- UPDATE Books SET rating = rating+1 WHERE publisher = '웅진하우스';

-- SELECT author, AVG(rating), AVG(sales) FROM Books GROUP BY author ORDER BY AVG(rating) DESC, AVG(sales) DESC;
-- SELECT publishing, AVG(price) FROM Books GROUP BY publishing ORDER BY publishing ASC; 
-- SELECT publisher, COUNT(*) AS book_count, SUM(review) AS review_sum FROM Books GROUP BY publisher ORDER BY book_count DESC;
-- SELECT price, AVG(review), AVG(rating) FROM Books GROUP BY price;

-- SELECT publisher, author, AVG(sales) AS avg_sales FROM Books GROUP BY publisher, author ORDER BY publisher, avg_sales DESC;
-- SELECT title, review, price FROM Books WHERE review > (SELECT AVG(review) FROM Books) AND price < (SELECT AVG(price) FROM Books);
-- SELECT author, COUNT(DISTINCT title) AS num_books FROM Books GROUP BY author ORDER BY num_books DESC LIMIT 1;
-- SELECT author, MAX(sales) AS max_sales FROM Books GROUP BY author;
-- SELECT YEAR(publishing) as month, COUNT(*) as num_books, AVG(price) AS avg_price FROM Books GROUP BY month;
-- SELECT publisher, MAX(rating) - MIN(rating) AS rating_difference FROM Books GROUP BY publisher HAVING COUNT(*) > 2 ORDER BY rating_difference DESC;
-- SELECT title, sales, rating / sales AS ratio FROM Books WHERE author = '김태성 저' ORDER BY ratio DESC LIMIT 1; 


