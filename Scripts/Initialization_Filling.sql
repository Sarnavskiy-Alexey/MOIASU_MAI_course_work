-- Удаление всех данных из всех таблиц
DELETE FROM employee_scheduler;
DELETE FROM proc_scheduler;
DELETE FROM processes;
DELETE FROM works;
DELETE FROM projects_docs;
DELETE FROM employees;
DELETE FROM finances;
DELETE FROM projects;
DELETE FROM docs;
DELETE FROM employee_types;
DELETE FROM fin_targets;
DELETE FROM statuses;
DELETE FROM doc_types;

-- Заполнение таблиц 0 depth
-- Заполнение таблицы doc_types
LOAD DATA INFILE "c:/ProgramData/MySQL/MySQL Server 8.0/Uploads/EASPO/doc_types_table.txt"
REPLACE INTO TABLE doc_types
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n';

-- Заполнение таблицы statuses
LOAD DATA INFILE "c:/ProgramData/MySQL/MySQL Server 8.0/Uploads/EASPO/statuses_table.txt"
REPLACE INTO TABLE statuses
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n';

-- Заполнение таблицы fin_targets
LOAD DATA INFILE "c:/ProgramData/MySQL/MySQL Server 8.0/Uploads/EASPO/fin_targets_table.txt"
REPLACE INTO TABLE fin_targets
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n';

-- Заполнение таблицы employee_types
LOAD DATA INFILE "c:/ProgramData/MySQL/MySQL Server 8.0/Uploads/EASPO/employee_types_table.txt"
REPLACE INTO TABLE employee_types
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n';

-- Заполнение таблиц 1 depth
-- Заполнение таблицы docs
LOAD DATA INFILE "c:/ProgramData/MySQL/MySQL Server 8.0/Uploads/EASPO/docs_table.txt"
REPLACE INTO TABLE docs
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n';

-- Заполнение таблицы projects
LOAD DATA INFILE "c:/ProgramData/MySQL/MySQL Server 8.0/Uploads/EASPO/projects_table.txt"
REPLACE INTO TABLE projects
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n';

-- Заполнение таблицы finances
LOAD DATA INFILE "c:/ProgramData/MySQL/MySQL Server 8.0/Uploads/EASPO/finances_table.txt"
REPLACE INTO TABLE finances
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n';

-- Заполнение таблицы employees
LOAD DATA INFILE "c:/ProgramData/MySQL/MySQL Server 8.0/Uploads/EASPO/employees_table.txt"
REPLACE INTO TABLE employees
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n';

-- Заполнение таблиц 2 depth
-- Заполнение таблицы projects_docs
LOAD DATA INFILE "c:/ProgramData/MySQL/MySQL Server 8.0/Uploads/EASPO/projects_docs_table.txt"
REPLACE INTO TABLE projects_docs
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n';

-- Заполнение таблицы works
LOAD DATA INFILE "c:/ProgramData/MySQL/MySQL Server 8.0/Uploads/EASPO/works_table.txt"
REPLACE INTO TABLE works
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n';

-- Заполнение таблицы processes
LOAD DATA INFILE "c:/ProgramData/MySQL/MySQL Server 8.0/Uploads/EASPO/processes_table.txt"
REPLACE INTO TABLE processes
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n';

-- Заполнение таблиц 3 depth
-- Заполнение таблицы proc_scheduler
LOAD DATA INFILE "c:/ProgramData/MySQL/MySQL Server 8.0/Uploads/EASPO/proc_scheduler_table.txt"
REPLACE INTO TABLE proc_scheduler
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n';

-- Заполнение таблиц 4 depth
-- Заполнение таблицы employee_scheduler
LOAD DATA INFILE "c:/ProgramData/MySQL/MySQL Server 8.0/Uploads/EASPO/employee_scheduler_table.txt"
REPLACE INTO TABLE employee_scheduler
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n';
