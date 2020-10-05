------------------------------------------------------------------------------------------
Необходимо вывести количество проектов, которое находится в работе у каждого
разработчика на 07.04.2020


select developer_id,
	count(developer_id) as project_count
	from project_history 
	where end_date >= '2020-04-07'
	group by developer_id
	order by developer_id

;

------------------------------------------------------------------------------------------
После сбоя в базе данных в таблице разработчиков появились полные дубли по ключу (id)
и имени разработчика (name). Необходимо вывести задублированные строки. Как можно
удалить дубли?

select * 
	from developers 
	group by id, "name"
	having count (*) > 1
	
;

select distinct id , "name"
	from developers 
	order by id
	
;


-------------------------------------------------------------------------------------------
Вывести все проекты, которые никогда не брались в работу разработчиками


select projects.id ,
	projects.name
		from projects
			left join project_history
			on project_history.project_id = projects.id
			where project_history.project_id is null
;
	
-------------------------------------------------------------------------------------------	
Необходимо вывести всех разработчиков и напротив каждого из них посчитать количество
его полных тёзок, без использования конструкции group by.	

select name,
	to_tsvector("name")
	from developers ;


------------------------------------------------------------------------------------------

Для определения самых крупных проектов необходимо вывести список проектов, в
которых участвовали все разработчики.


select project_id,
	count(developer_id) as dev_cnt
	from project_history
		join developers
		on project_history.developer_id = developers.id
	group by project_id
	order by dev_cnt  desc limit 10
	
;		
	

