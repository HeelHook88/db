------------------------------------------------------------------------------------------
���������� ������� ���������� ��������, ������� ��������� � ������ � �������
������������ �� 07.04.2020


select developer_id,
	count(developer_id) as project_count
	from project_history 
	where end_date >= '2020-04-07'
	group by developer_id
	order by developer_id

;

------------------------------------------------------------------------------------------
����� ���� � ���� ������ � ������� ������������� ��������� ������ ����� �� ����� (id)
� ����� ������������ (name). ���������� ������� ��������������� ������. ��� �����
������� �����?

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
������� ��� �������, ������� ������� �� ������� � ������ ��������������


select projects.id ,
	projects.name
		from projects
			left join project_history
			on project_history.project_id = projects.id
			where project_history.project_id is null
;
	
-------------------------------------------------------------------------------------------	
���������� ������� ���� ������������� � �������� ������� �� ��� ��������� ����������
��� ������ ����, ��� ������������� ����������� group by.	

select name,
	to_tsvector("name")
	from developers ;


------------------------------------------------------------------------------------------

��� ����������� ����� ������� �������� ���������� ������� ������ ��������, �
������� ����������� ��� ������������.


select project_id,
	count(developer_id) as dev_cnt
	from project_history
		join developers
		on project_history.developer_id = developers.id
	group by project_id
	order by dev_cnt  desc limit 10
	
;		
	

