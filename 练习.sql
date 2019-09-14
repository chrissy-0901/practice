use pratice;
create table Student
(学号 bigint, 
姓名 varchar(20),
出生年月 varchar(20),
性别 varchar(8));
desc Student;


insert into Student values
(170712378, '谢莹', '1993-07-20', '女'),
(170712379,'王小' , '1994-05-25','男');
desc Student;
select * from Student;

insert into Student values
(170712280,'乐乐','1994-09-01','女'),
(170712281,'江江','1994-08-01','男'),
(170712282,'莹儿','1993-07-24','女');

select * from Student;

Create table score (
学号 bigint primary key,
课程号 int,
成绩 int);
desc score;

insert into score values
('170712378','001',99),
('170712378','002',91),
('170712378','003',87),
('170712379','001',92),
('170712379','002',75),
('1707123800','001',66),
('170712380','002',75),
('170712381','001',75),
('170712381','002',75),
('170712381','003',80);
select * from score;

create table course(
课程号 int,
课程名称 varchar(20),
教师号 int);
desc course;

insert into course values
(001, '数学分析', 1900),
(002, '高等代数', 1901),
(001, '概率论', 1902);

select * from course;


create table teacher (
教师号 int,
教师姓名 varchar(20));

insert into teacher values
(1900,'杨慧'),
(1901,'周芳'),
(1902,'李文');

select * from teacher;
select * from Student;
select * from course;
select * from score;


select * from Student where 姓名 like '谢%';
select count(1) from Student where 姓名 like '谢%';
select sum(成绩) as '总成绩' from score where 课程号='001';
select count(distinct 学号) as '总人数' from score;
select 课程号, max(成绩) as '最高成绩', min(成绩) as '最低成绩' from score group by 课程号;
select 课程号, count(学号) as '总人数' from score group by 课程号;
select 性别, count(*) from Student group by 性别;
select 学号, avg(成绩) as '平均成绩' from score 
group by 学号 
having avg(成绩)>60;

alter table score add primary key (学号,课程号);
update score set 成绩=59 where 学号=170712380 and 课程号 = '001';
select * from score;

select 学号 from score group by 学号 having count(课程号)>2;

insert into Student values
(170712792,'谢莹','2001-09-03', '女');

select 姓名, count(1) from Student 
group by 姓名 
having count(1)>=2;

select 课程号,学号 from score where 成绩>80 order by 课程号 desc;

select 课程号, avg(成绩) from score
group by 课程号
order by avg(成绩) desc, 课程号 asc ;

select 课程号,count(1) from score 
group by 课程号
having count(1)>=2
order by count(1) desc, 课程号 asc;


select  学号, avg(成绩) from score
where 成绩<60
group by 学号
having count(课程号)>=1;

select 学号, 姓名 from Student where 学号 in
(select 学号 from score
where 成绩<60);

select 学号,姓名 from Student where 学号 in(
select 学号 from score
 group by 学号 having count(课程号)<(select count(*) from course));

select 学号,姓名 from Student where 学号 in(
select 学号 from score
 group by 学号 having count(课程号)=2);

select a.学号, a.姓名, count(b.课程号) as '课程数', sum(b.成绩) as '总成绩' from Student as a 
left join score as b on a.学号 = b.学号
group by a.学号;

update Student set 学号= 170712380 where 姓名='乐乐';
alter table Student add primary key(学号);
select * from Student;