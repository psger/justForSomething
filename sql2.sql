#1、查询“c001”课程比“c002”课程成绩高的所有学生的学号；
select * from sc a,sc b where a.sno = b.sno and a.cno = b.cno and a.score>b.score;
#2、查询平均成绩大于60 分的同学的学号和平均成绩；
select sno,average(score) from sc where average(score)>60;
