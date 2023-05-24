-- запросы, которые могут быть выполнены

-- 1) Сводка данных о сотрудниках: общее количество смен по каждому работавшему
SELECT employees.employee_name as 'Сотрудник / организация',
	   count(proc_schedule_id) as 'Количество смен'
FROM employee_scheduler
LEFT JOIN employees ON employees.id_employee = employee_scheduler.employee_id
GROUP BY employee_id
ORDER BY 1 ASC;

-- 2) Сводка данных о соответствии документов проектам
SELECT project_name as 'Проект',
       doc_name as 'Документ'
FROM docs
RIGHT JOIN projects_docs ON docs.id_doc = projects_docs.doc_id
LEFT JOIN projects ON projects_docs.project_id = projects.id_project
ORDER BY 1 ASC;

-- 3) Сводка данных о плановых и фактических сроках выполнения работ
-- 3.a) с перечислением процессов
SELECT work_name as 'Направление',
       plan_start_work_date as 'Дата начала (по плану)',
       plan_end_work_date as 'Дата окончания (по плану)',
       max(part_proc_date) as 'Дата выполнения',
       process_name as 'Процесс'
FROM works
LEFT JOIN statuses ON works.status_work_id = statuses.id_status
RIGHT JOIN proc_scheduler ON works.id_work = proc_scheduler.work_id
LEFT JOIN processes ON proc_scheduler.process_id = processes.id_process
WHERE statuses.status_name = 'verified' or statuses.status_name = 'finished'
GROUP BY work_name, plan_start_work_date, plan_end_work_date, process_name
ORDER BY 4 ASC;

-- 3.b) без перечисления процессов, только выполненные работы
SELECT work_name as 'Направление',
       plan_start_work_date as 'Дата начала (по плану)',
       plan_end_work_date as 'Дата окончания (по плану)',
       max(part_proc_date) as 'Дата выполнения'
FROM works
LEFT JOIN statuses ON works.status_work_id = statuses.id_status
RIGHT JOIN proc_scheduler ON works.id_work = proc_scheduler.work_id
LEFT JOIN processes ON proc_scheduler.process_id = processes.id_process
WHERE statuses.status_name = 'verified' or statuses.status_name = 'finished'
GROUP BY work_name, plan_start_work_date, plan_end_work_date
ORDER BY 4 ASC;
