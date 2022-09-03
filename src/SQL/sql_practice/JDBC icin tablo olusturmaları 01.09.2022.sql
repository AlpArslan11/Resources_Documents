CREATE TABLE companies
(
  company_id SMALLINT,
  company VARCHAR(20),
  number_of_employees SMALLINT
);
INSERT INTO companies VALUES(100, 'IBM', 12000);
INSERT INTO companies VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies VALUES(103, 'APPLE', 21000);
SELECT * FROM companies;


--1. Örnek: companies tablosundan en yüksek ikinci number_of_employees değeri olan company ve number_of_employees değerlerini çağırın.

--1.YOL OFSSET ve FETCH NEXT kullanarak
SELECT company, number_of_employees
FROM companies 
ORDER BY number_of_employees DESC
OFFSET 1 ROW --1 sutun atla 
FETCH NEXT 1 ROW ONLY --atladoktan sonra sadece 1 tanesini getir


SELECT * FROM companies
--2.YOL
SELECT company, number_of_employees
FROM companies
ORDER BY number_of_employees DESC
OFFSET 1 ROW LIMIT 1

SELECT company, number_of_employees
FROM companies
WHERE number_of_employees = (SELECT MAX(number_of_employees)
                             FROM companies 
                             WHERE number_of_employees < (SELECT MAX(number_of_employees)
                             FROM companies) ) 


SELECT MAX(number_of_employees)
FROM companies 
WHERE number_of_employees < (SELECT MAX(number_of_employees)
FROM companies) 


--1. Örnek: number_of_employees değeri ortalama çalışan sayısından az olan
--number_of_employees değerlerini 16000 olarak UPDATE edin.
UPDATE companies
SET number_of_employees = 16000
WHERE number_of_employees < (SELECT AVG(number_of_employees)
							 FROM companies)


--1. Örnek: Prepared statement kullanarak company adı IBM olan number_of_employees değerini 9999 olarak güncelleyin.

UPDATE companies
SET number_of_employees = 9999
WHERE company = 'IBM'