-- добавление данных
-- 1) в таблицу выполненных процессов (processes)
INSERT INTO processes
SELECT count(*) + 1, 'Соединение блоков', 4, '2022-12-21', '2023-02-07', NULL
FROM processes;
SELECT * FROM processes;

-- 2) в таблицу проектов с новым статусом "in planning"
INSERT INTO statuses
SELECT count(*) + 1, 'in planning'
FROM statuses;
SELECT * FROM statuses;
INSERT INTO projects
SELECT count(*) + 1, 'Ферма 1', 5, '2023-07-03', '2023-09-10', NULL
FROM projects;
SELECT * FROM projects;
SELECT *
FROM projects
LEFT JOIN statuses ON projects.status_proj_id = statuses.id_status;

-- DELETE FROM processes
-- WHERE id_process=10;
-- DELETE FROM projects
-- WHERE id_project=4;
-- DELETE FROM statuses
-- WHERE id_status=5;