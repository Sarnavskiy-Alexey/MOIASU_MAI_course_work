CREATE DATABASE project_organization;

-- reference depth 0
-- Типы документов
CREATE TABLE doc_types (
    id_doc_type INT PRIMARY KEY NOT NULL CHECK (id_doc_type > 0),
    doc_type_name TEXT NOT NULL
);

-- Статусы готовности процессов / направлений / проектов
CREATE TABLE statuses (
    id_status INT PRIMARY KEY NOT NULL CHECK (id_status > 0),
    status_name TEXT NOT NULL
);

-- Цели финансирования
CREATE TABLE fin_targets (
    id_fin_target INT PRIMARY KEY NOT NULL CHECK (id_fin_target > 0),
    fin_target TEXT NOT NULL
);

-- Типы сотрудников / субподрядчиков
CREATE TABLE employee_types (
    id_employee_type INT PRIMARY KEY,
    employee_type_name TEXT
);

-- reference depth 1
-- Документы
CREATE TABLE docs (
    id_doc INT PRIMARY KEY NOT NULL CHECK (id_doc > 0),
    doc_name TEXT NOT NULL,
    doc_revision INT DEFAULT 0,
    doc_approval_date DATE NOT NULL CHECK (doc_approval_date > "1900-01-01"),
    doc_type_id INT,
    doc_reference TEXT,
    FOREIGN KEY (doc_type_id) REFERENCES doc_types (id_doc_type) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Проекты
CREATE TABLE projects (
    id_project INT PRIMARY KEY NOT NULL CHECK (id_project > 0),
    project_name TEXT NOT NULL,
    status_proj_id INT,
    plan_start_proj_date DATE NOT NULL CHECK (plan_start_proj_date > "1900-01-01"),
    plan_end_proj_date DATE NOT NULL CHECK (plan_end_proj_date > "1900-01-01"),
    commentary TEXT,
    FOREIGN KEY (status_proj_id) REFERENCES statuses (id_status) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Финансы
CREATE TABLE finances (
    id_finance INT PRIMARY KEY NOT NULL CHECK (id_finance > 0),
    fin_sum DECIMAL(15, 3) NOT NULL,
    project_id INT,
    fin_target_id INT,
    commentary TEXT,
    FOREIGN KEY (project_id) REFERENCES projects (id_project) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (fin_target_id) REFERENCES fin_targets (id_fin_target) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Сотрудники / субподрядчики
CREATE TABLE employees (
    id_employee INT PRIMARY KEY,
    employee_name TEXT NOT NULL,
    employee_type_id INT,
    FOREIGN KEY (employee_type_id) REFERENCES employee_types (id_employee_type) ON DELETE SET NULL ON UPDATE CASCADE
);

-- reference depth 2
-- Связь "Проекты-Документы"
CREATE TABLE projects_docs (
    project_id INT,
    doc_id INT,
    FOREIGN KEY (project_id) REFERENCES projects (id_project) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (doc_id) REFERENCES docs (id_doc) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Направления
CREATE TABLE works (
    id_work INT PRIMARY KEY NOT NULL CHECK (id_work > 0),
    work_name TEXT NOT NULL,
    project_id INT,
    status_work_id INT,
    plan_start_work_date DATE NOT NULL CHECK (plan_start_work_date > "1900-01-01"),
    plan_end_work_date DATE NOT NULL CHECK (plan_end_work_date > "1900-01-01"),
    commentary TEXT,
    FOREIGN KEY (project_id) REFERENCES projects (id_project) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (status_work_id) REFERENCES statuses (id_status) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Процессы
CREATE TABLE processes (
    id_process INT PRIMARY KEY NOT NULL CHECK (id_process > 0),
    process_name TEXT NOT NULL,
    status_proc_id INT,
    plan_start_proc_datetime DATETIME NOT NULL CHECK (plan_start_proc_datetime > "1900-01-01 00:00:00"),
    plan_end_proc_datetime DATETIME NOT NULL CHECK (plan_end_proc_datetime > "1900-01-01 00:00:00"),
    commentary TEXT,
    FOREIGN KEY (status_proc_id) REFERENCES statuses (id_status) ON DELETE SET NULL ON UPDATE CASCADE
);

-- reference depth 3
-- График частей процессов по каждому направлению
CREATE TABLE proc_scheduler (
    id_proc_schedule INT PRIMARY KEY NOT NULL CHECK (id_proc_schedule > 0),
    work_id INT,
    process_id INT,
    part_proc_date DATETIME NOT NULL CHECK (part_proc_date > "1900-01-01 00:00:00"),
    FOREIGN KEY (work_id) REFERENCES works (id_work) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (process_id) REFERENCES processes (id_process) ON DELETE SET NULL ON UPDATE CASCADE
);

-- reference depth 4
-- График работы сотрудников / субподрядчиков
CREATE TABLE employee_scheduler (
    proc_schedule_id INT,
    employee_id INT,
    FOREIGN KEY (proc_schedule_id) REFERENCES proc_scheduler (id_proc_schedule) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (employee_id) REFERENCES employees (id_employee) ON DELETE SET NULL ON UPDATE CASCADE
);
