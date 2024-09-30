-- 1. employees 테이블을 생성해주세요.
CREATE TABLE employees (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(100),
    salary DECIMAL(10, 2)
);

-- 2. 직원 데이터를 employees에 추가해주세요.
INSERT INTO employees (name, position, salary) VALUES ('혜린', 'PM', 90000);
INSERT INTO employees (name, position, salary) VALUES ('은우', 'Front', 80000);
INSERT INTO employees (name, position, salary) VALUES ('가을', 'Back', 92000);
INSERT INTO employees (name, position, salary) VALUES ('지수', 'Front', 78000);
INSERT INTO employees (name, position, salary) VALUES ('민혁', 'Front', 96000);
INSERT INTO employees (name, position, salary) VALUES ('하온', 'Back', 130000);

-- 3. 모든 직원의 이름과 연봉을 조회하는 쿼리를 작성하시오.
SELECT name, salary FROM employees;

-- 4. Frontend 직책중에서 연봉이 90000 이하인 직원의 이름과 연봉 조회
SELECT name, salary FROM employees WHERE position = 'Front' AND salary <= 90000;

-- 5. PM직책의 연봉을 10% 인상후 결과 조회
UPDATE employees SET salary = salary * 1.10 WHERE position = 'PM';
SELECT * FROM employees WHERE position = 'PM';

-- 6. Backend 직원의 연봉을 5% 인상하세요.
UPDATE employees SET salary = salary * 1.05 WHERE position = 'Back';

-- 7. 민혁 사원의 데이터를 삭제하세요.
DELETE FROM employees WHERE name = '민혁';

-- 8. 모든 직원을 position 별로 그룹화하여 각 직책의 평균 연봉을 계산하세요.
SELECT position, AVG(salary) AS average FROM employees GROUP BY position;

-- 9. employees 테이블을 삭제하세요
DROP TABLE employees;