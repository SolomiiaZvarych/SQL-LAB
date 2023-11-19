CREATE TABLE `Department` (
	`department_id` INT NOT NULL,
	`department_name` varchar(30) NOT NULL,
	`city` varchar(30) NOT NULL,
	`street` varchar(30) NOT NULL,
	`building` INT(5),
	PRIMARY KEY (`department_id`)
);

CREATE TABLE `Employee` (
	`employee_id` INT NOT NULL,
	`first_name` varchar(30) NOT NULL,
	`last_name` varchar(30) NOT NULL,
	`gender` varchar(1) NOT NULL,
	`birth_date` DATE NOT NULL,
	`phone_number` INT NOT NULL,
	`email` varchar(50) NOT NULL,
	`position` varchar(20) NOT NULL,
	`employment_date` DATE NOT NULL,
	`department_id` INT,
	`manager_id` INT,
	`rate` FLOAT NOT NULL,
	`bonus` FLOAT,
	PRIMARY KEY (`employee_id`)
);

CREATE TABLE `Customer` (
	`customer_id` INT NOT NULL AUTO_INCREMENT,
	`first_name` varchar(30) NOT NULL,
	`last_name` varchar(30) NOT NULL,
	`birth_date` DATE NOT NULL,
	`gender` varchar(1) NOT NULL,
	`city` varchar(20) NOT NULL,
	`street` varchar(30) NOT NULL,
	`building` INT(3) NOT NULL,
	`phone_number` INT NOT NULL,
	`email` varchar(50) NOT NULL,
	`discount` FLOAT NOT NULL,
	PRIMARY KEY (`customer_id`)
);

CREATE TABLE `Product` (
	`product_id` INT NOT NULL,
	`product_name` varchar(40) NOT NULL,
	`product_description` varchar(150) NOT NULL,
	`category` varchar(30) NOT NULL,
	`manufacture` varchar(30) NOT NULL,
	`product_type` varchar(20) NOT NULL,
	`amount` INT NOT NULL,
	`price` FLOAT NOT NULL,
	PRIMARY KEY (`product_id`)
);

CREATE TABLE `Orders` (
	`orders_id` INT NOT NULL AUTO_INCREMENT,
	`employee_id` INT NOT NULL,
	`product_id` INT NOT NULL,
	`customer_id` INT NOT NULL,
	`transaction_type` INT NOT NULL,
	`transaction_moment` DATETIME NOT NULL,
	`amount` INT NOT NULL,
	`status` varchar(20) NOT NULL,
	PRIMARY KEY (`orders_id`)
);

ALTER TABLE `Employee` ADD CONSTRAINT `Employee_fk0` FOREIGN KEY (`department_id`) REFERENCES `Department`(`department_id`);

ALTER TABLE `Employee` ADD CONSTRAINT `Employee_fk1` FOREIGN KEY (`manager_id`) REFERENCES `Employee`(`employee_id`);

ALTER TABLE `Orders` ADD CONSTRAINT `Orders_fk0` FOREIGN KEY (`employee_id`) REFERENCES `Employee`(`employee_id`);

ALTER TABLE `Orders` ADD CONSTRAINT `Orders_fk1` FOREIGN KEY (`product_id`) REFERENCES `Product`(`product_id`);

ALTER TABLE `Orders` ADD CONSTRAINT `Orders_fk2` FOREIGN KEY (`customer_id`) REFERENCES `Customer`(`customer_id`);






