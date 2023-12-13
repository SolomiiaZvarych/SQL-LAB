USE company;

SELECT * FROM employee;

-- Task 4.3 Показати список перших семи співробітників та наявної інформаціїї про них 
SELECT 
employee_id,
first_name,
last_name,
position
FROM
employee
LIMIT 7;

-- Done

-- Task 4.4 Показати список унікальних значень для поля посада (position)
SELECT DISTINCT 
position 
FROM 
employee;
    
-- Done 

-- Task 4.5 Показати список унікальних посад відсортувавши їх 
SELECT DISTINCT 
position 
FROM
employee
ORDER BY 
position ASC;
    
SELECT DISTINCT 
position 
FROM
employee
ORDER BY 
position DESC;
    
-- Done

-- Task 4.6 Показати список працівників, що займають посаду Seller відсортованих по даті прийому на роботу 
SELECT 
employee_id,
last_name,
first_name, 
position, 
employment_date
FROM 
employee
WHERE
position = 'Seller'
ORDER BY
employment_date ASC;

-- Done

-- Task 4.7 Показати список працівників, що займають посади Seller та Consultant, які були прийняті на роботу після 1 січня 2013 року 
SELECT 
employee_id,
last_name, 
first_name,
position, 
employment_date
FROM
employee
WHERE
(
position = 'Seller'
OR
position = 'Consultant'
)
AND 
employment_date > '2013-01-01'
ORDER BY
employment_date DESC;

-- Done

-- Task 4.8 Показати список працівників, що займають посади Seller, Consultant та Senior Consultant, які були прийняті на роботу 
-- після 1 січня 2013 року відсортованих по даті прийому на роботу.

-- Solution 1
SELECT 
last_name, 
first_name,
position, 
employment_date
FROM
employee
WHERE
(
position LIKE 'Seller'
OR
position IN ('Senior Consultant', 'Consultant')
)
AND 
employment_date > '2013-01-01'
ORDER BY
employment_date DESC;

-- Solution 2
SELECT 
last_name, 
first_name,
position, 
employment_date
FROM
employee
WHERE
( position LIKE 'S_____'
OR
( position LIKE '%Consultant'
AND 
position NOT LIKE 'A%'
))
AND
employment_date > '2013-01-01'
ORDER BY
employment_date DESC;

-- Done

-- Task 4.9 Показати список працівників, які належать до певного департаменту і включити їх до переліку таких, що не мають прямого підпорядкування (не мають менеджера).
SELECT 
employee_id,
last_name,
first_name,
position,
manager_id,
department_id
FROM
employee
WHERE
manager_id IS NULL
OR
department_id IS NOT NULL
ORDER BY
manager_id ASC;

-- Done

-- Task 4.10 Показати список співробітників, які отримали премію та були прийняті на роботу в 2016 році.
-- Деталі: Вивести ім'я, прізвище, посада, дата прийняття на роботу, премію.
-- Solution 1
SELECT 
last_name, 
first_name,
position,
employment_date,
bonus
FROM
employee
WHERE
bonus IS NOT NULL
AND
(
  employment_date > '2015-12-31'
and
  employment_date < '2016-12-31'
)
ORDER BY
last_name ASC;

-- Solution 2
SELECT 
last_name, 
first_name,
position,
employment_date,
bonus
FROM
employee
WHERE
bonus IS NOT NULL
AND 
employment_date BETWEEN '2015-12-31' AND '2016-12-31'
ORDER BY
last_name ASC;

-- Done

-- Task 4.11 Відобразити залученість до процесу продажу за посадою співробітника. 
-- Деталі: Вивести ім'я, прізвище, посада + взаємодія з клієнтом.
SELECT 
last_name,
first_name,
position,
CASE 
WHEN position = 'Senior Consultant' THEN 'Can Seles, Consulting and Lead'
WHEN position IN ('Senior Consultant', 'Consultant') THEN 'Can Seles and Consulting'
WHEN position LIKE  'Assistant Consultant' THEN 'Can only Consulting'
WHEN position LIKE 'Seller' THEN 'Can only Sale'
ELSE 'Service Roles'
END AS 'Relation to Customer'
FROM 
employee
ORDER BY
last_name;

-- Done

-- Task 4.12 Відобразити звіт про працівників змінивши назву колонок.
-- Деталі: Вивести ім'я, прізвище, посада, дата прийому на роботу.
SELECT
last_name 'Last Name',
first_name 'First Name',
position Title,
employment_date AS 'Hire Date'
FROM
employee;

-- Done


-- Homework
-- Task 1. Дізнатися, які клієнти були зареєстровані в нашій компанії (показати всі доступні поля). Відсортуйте список за Прізвищем.
SELECT 
*
FROM 
customer
ORDER BY
last_name; 

-- Done

-- Task 2. Вивести унікальні назви виробників (manufacture) з таблиці продуктів в одному запиті, впорядкованому за алфавітом.
SELECT DISTINCT 
manufacture 
FROM 
product 
ORDER BY 
manufacture ASC;

-- Done 

-- Task 3. Отримати коротку інформацію про продукти (назва продукту, виробник, категорія, тип продукту, ціна), вироблені компанією "DELL",
		-- з таблиці продуктів в одному запиті, впорядкованому за назвою продукту в алфавітному порядку.
SELECT 
product_name,
manufacture,
category,
product_type, 
price
FROM 
product
WHERE 
manufacture = 'DELL'
ORDER BY 
product_name ASC;

-- Done 

-- Task 4. Отримати інформацію про клієнтів-жінок 1990-2000 років народження (ім'я, прізвище, стать, дата народження, номер телефону) з 
        -- з таблиці customer в одному запиті, відсортованому за прізвищем в алфавітному порядку. 
SELECT 
first_name, 
last_name, 
gender, 
birth_date,
phone_number 
FROM 
customer 
WHERE 
gender = 'F'
AND 
birth_date BETWEEN '1990-01-01' AND '2000-12-31'
ORDER BY 
last_name ASC;

-- Done

-- Task 5. Отримати інформацію з таблиці товарів про наявні на складі ноутбуки, які оснащені дисковими накопичувачами об'ємом 512 Гб.
SELECT 
*
FROM 
product
WHERE 
category = 'NOTEBOOK'
AND 
product_description LIKE '%512GB%';

-- Done 

-- Task 6. Отримати інформацію з таблиці товарів про наявні на складі ноутбуки або настільні комп'ютери, які оснащені дисковими накопичувачами 
        -- 512 Гб або 1 Тб.
SELECT 
* 
FROM 
product 
WHERE 
(
category = 'NOTEBOOK' 
OR 
category = 'Desktops'  
) 
AND
(
product_description LIKE '%512GB%'
OR
product_description LIKE '%1TB%'
);

-- Done

-- Task 7. Отримати інформацію з таблиці рахунків-фактур (invoice) про всі покупки, зроблені неавторизованими покупцями (customer_id NULL).
SELECT 
*
FROM
invoice
WHERE 
customer_id IS NULL;

-- Done




