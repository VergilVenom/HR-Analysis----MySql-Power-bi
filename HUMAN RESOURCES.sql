CREATE DATABASE project;

USE project;

SELECT * FROM project.`human resources`;

ALTER TABLE `human resources`
CHANGE COLUMN ï»¿id emp_id VARCHAR(20)NULL;
DESCRIBE `human resources`;

SELECT birthdate FROM `human resources`;


UPDATE `human resources`
SET birthdate = CASE
   WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
   WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d')
 ELSE NULL
END;

ALTER TABLE `human resources`
MODIFY COLUMN birthdate DATE;
SELECT birthdate FROM `human resources`;


UPDATE `human resources`
SET hire_date = CASE
   WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
   WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d')
 ELSE NULL
END;

ALTER TABLE `human resources`
MODIFY COLUMN hire_date DATE;

SELECT hire_date FROM `human resources`


#---------------------------------------------------------------------------------------------
---------------- ------------------------- ------------------------------------------

SET SQL_MODE='';

UPDATE `human resources`
SET termdate = date(str_to_date(termdate,'%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate != '';

SELECT termdate FROM `human resources`;

ALTER TABLE `human resources`
MODIFY COLUMN termdate DATE;

ALTER TABLE `human resources` ADD COLUMN age INT;


DESCRIBE `human resources`;

SELECT * FROM `human resources`;



UPDATE `human resources`
SET age = timestampdiff(YEAR,birthdate,CURDATE());

SELECT birthdate,age FROM `human resources`;

SELECT
 MIN(age) AS youngest,
 MAX(age) AS oldest
 FROM `human resources`;
 
 
 SELECT COUNT(*) FROM `human resources` WHERE age < 18;
 
 
 
 
 
