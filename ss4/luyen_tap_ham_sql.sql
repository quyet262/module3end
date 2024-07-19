use quan_ly_sinh_vien;
select *
from subject
where credit >= all(select credit from subject);
select sub_name, mark as max_mark
from subject
join mark on subject.sub_id = mark.sub_id
having max_mark >= all(select mark from mark);
select student.student_id,student_name,address,phone,status,
       avg(mark) as DTB
from student
 join mark on student.student_id = mark.student_id
 group by student.student_id, student_name, address, phone, status
order by DTB desc ;
