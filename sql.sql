create table student(
sno varchar2(10) primary key,
sname varchar2(20),
sage number(2),
ssex varchar2(5)
);
create table teacher(
tno varchar2(10) primary key,
tname varchar2(20)
);
create table course(
cno varchar2(10),
cname varchar2(20),
tno varchar2(20),
constraint pk_course primary key (cno,tno)
);
create table sc(
sno varchar2(10),
cno varchar2(10),
score number(4,2),
constraint pk_sc primary key (sno,cno)
);
#/*******初始化学生表的数据******/
insert into student values ('s001','张三',23,'男');
insert into student values ('s002','李四',23,'男');
insert into student values ('s003','吴鹏',25,'男');
insert into student values ('s004','琴沁',20,'女');
insert into student values ('s005','王丽',20,'女');
insert into student values ('s006','李波',21,'男');
insert into student values ('s007','刘玉',21,'男');
insert into student values ('s008','萧蓉',21,'女');
insert into student values ('s009','陈萧晓',23,'女');
insert into student values ('s010','陈美',22,'女');
commit;
#/******************初始化教师表***********************/
insert into teacher values ('t001', '刘阳');
insert into teacher values ('t002', '谌燕');
insert into teacher values ('t003', '胡明星');
commit;
#/***************初始化课程表****************************/
insert into course values ('c001','J2SE','t002');
insert into course values ('c002','Java Web','t002');
insert into course values ('c003','SSH','t001');
insert into course values ('c004','Oracle','t001');
insert into course values ('c005','SQL SERVER 2005','t003');
insert into course values ('c006','C#','t003');
insert into course values ('c007','JavaScript','t002');
insert into course values ('c008','DIV+CSS','t001');
insert into course values ('c009','PHP','t003');
insert into course values ('c010','EJB3.0','t002');
commit;
#/***************初始化成绩表***********************/
insert into sc values ('s001','c001',78.9);
insert into sc values ('s002','c001',80.9);
insert into sc values ('s003','c001',81.9);
insert into sc values ('s004','c001',60.9);
insert into sc values ('s001','c002',82.9);
insert into sc values ('s002','c002',72.9);
insert into sc values ('s003','c002',81.9);
insert into sc values ('s001','c003',59);


  #注意：以下练习中的数据是根据初始化到数据库中的数据来写的SQL 语句，请大家务必注意。
  #
  #
  #1、查询“c001”课程比“c002”课程成绩高的所有学生的学号；
  select *  from sc a, sc b where a.sno=b.sno and a.cno='c001' and b.cno='c002' and a.score>b.score;
  #2、查询平均成绩大于60 分的同学的学号和平均成绩；
  select st.sname,ss.sco from student st,(select sno,avg(score)sco from sc group by sno)ss where st.sno=ss.sno and sco>=60;
  #3、查询所有同学的学号、姓名、选课数、总成绩；
  select st.sname,ss.* from student st,(select sno,count(score)sco,sum(score) from sc group by sno)ss where st.sno=ss.sno;
  #4、查询姓“刘”的老师的个数；
  select count(*) from teacher where tname like '%刘%';
  #5、查询没学过“谌燕”老师课的同学的学号、姓名；
  select sc.sno,acno.* from sc sc,(select co.cno from course co,(select tno from teacher where tname='谌燕')tn where co.tno<>tn.tno)acno where acno.cno=sc.cno;
  #6、查询学过“c001”并且也学过编号“c002”课程的同学的学号、姓名；
  select sa.sname,sc.sno from sc sc,(select st.sname,s.* from student st,(select sno,cno from sc where cno in('c001'))s where st.sno=s.sno)sa where sc.sno=sa.sno and sc.cno='c002';
  #7、查询学过“谌燕”老师所教的所有课的同学的学号、姓名；
  select distinct st.sname from student st,sc sc join (select cno from teacher te join course co on(te.tno=co.tno) where te.tname='谌燕')aca on(sc.cno=aca.cno) where st.sno=sc.sno;
  #9、查询所有课程成绩小于60 分的同学的学号、姓名；
  select st.sname,sc.sno from student st join sc sc on(st.sno=sc.sno)where sc.score<60;
  #10、查询没有学全所有课的同学的学号、姓名；
  select sname,st.sno,scn.cn from student st join (select distinct sno,count(*)cn from sc group by sc.sno)scn on(st.sno=scn.sno) where scn.cn=(select distinct count(cno) from course);
  select st.sname,st.sno from student st join (select sc.sno sn,count(sc.cno) cou from sc group by sc.sno) scs on st.sno=scs.sn where scs.cou <(select count(cno) from course);
  #11、查询至少有一门课与学号为“s001”的同学所学相同的同学的学号和姓名；
  select distinct st.sno, sname
    from student st
    join sc sc on (st.sno = sc.sno)
   where sc.cno in (select cno from sc where sno = 's001') and sc.sno<>'s001';
   #13、把“SC”表中“谌燕”老师教的课的成绩都更改为此课程的平均成绩；
   #update sc sc set sc.score=update sc sc set sc.score=(select tc.cno,round(avg(sc.score),2)av from (select * from teacher te join course co on(te.tno=co.tno) where te.tname='谌燕')tc join sc sc on(tc.cno=sc.cno) group by tc.cno)cnn.score where sc.cno=cnn.av;
   select tc.cno,round(avg(sc.score),2) from (select * from teacher te join course co on(te.tno=co.tno) where te.tname='谌燕')tc join sc sc on(tc.cno=sc.cno) group by tc.cno;
   #14、查询和“s001”号的同学学习的课程完全相同的其他同学学号和姓名；
   select cno from sc where sno='s001';
   #15、删除学习“谌燕”老师课的SC 表记录；
   delete from sc where sc.cno in(select cno from teacher te join course co on(te.tno=co.tno) where te.tname='谌燕')
   #17、查询各科成绩最高和最低的分：以如下形式显示：课程ID，最高分，最低分
   select cno,max(score),min(score) from sc group by cno;
   #18、按各科 平均成绩 从 低到高 和 及格率的百分数 从高到低顺序
   #select count(score) from sc where score>=60 group by cno ;
   select cno,avg(score)acs,savg.cnu,(count(score)-savg.cnu)/count(score)*100 from sc,
   (select count(score)cnu,avg(score)acs2 from sc where score<60 order by acs2 desc)savg
   group by savg.cnu,cno order by acs desc;
   #21、查询各科成绩前三名的记录:(不考虑成绩并列情况)
   select * from (select S.*,rownum rn from (select * from sc order by score desc)S where rownum<=3)where rn>=1;
   #22、查询每门课程被选修的学生数
   select cno,count(cno) from sc group by cno;
   #23、查询出只选修了一门课程的全部学生的学号和姓名
   select st.sname,st.sno from student st join
   (select distinct sc.* from sc sc join (select sno,count(cno)cnum from sc group by sno)ss on(sc.sno=ss.sno) where ss.cnum=1)ssb
   on(st.sno=ssb.sno);
   #24、查询男生、女生人数
   select ssex,count(ssex) from student st group by ssex;
   #25、查询姓“张”的学生名单
   select sname from student where sname like '%张%';
   #26、查询同名同性学生名单，并统计同名人数
   select st.* from student st join (select sname,count(sname)cnum from student group by sname)scomm on(st.sname=scomm.sname) where scomm.cnum>1;
   #27、1981 年出生的学生名单(注：Student 表中Sage 列的类型是number)
   select * from student where to_char(sysdate,'yyyy')-sage ='1981';
   #28、查询每门课程的平均成绩，结果按平均成绩升序排列，平均成绩相同时，按课程号降序排列
   select cno,avg(score)lim from sc group by cno order by lim asc;
   #29、查询平均成绩大于85 的所有学生的学号、姓名和平均成绩
   select st.sname,st.sno,savg.lim from student st join (select sno,avg(score)lim from sc group by sno)savg on(st.sno=savg.sno) where savg.lim>85;
   #30、查询课程名称为“数据库”，且分数低于60 的学生姓名和分数
   select distinct st.sname,cs.score from student st join (select * from course co join sc sc on(co.cno=sc.cno))cs on(st.sno=cs.sno)where cs.score<60 and cs.cname='数据库';
   #31、查询所有学生的选课情况；
   select distinct st.sname,cs.cname from student st join (select * from course co join sc sc on(co.cno=sc.cno))cs on(st.sno=cs.sno);
   #32、查询任何一门课程成绩在70 分以上的姓名、课程名称和分数；
   select distinct st.sname,cs.score,cs.cname from student st join (select * from course co join sc sc on(co.cno=sc.cno))cs on(st.sno=cs.sno)where cs.score>70;
   #33、查询不及格的课程，并按课程号从大到小排列
   select * from sc where score<60 order by sno desc;
   #34、查询课程编号为c001 且课程成绩在80 分以上的学生的学号和姓名；
   select st.sname,st.sno from student st join (select * from sc where cno='c001' and score>80)snum on(st.sno=snum.sno);
   #35、求选了课程的学生人数
   select count(ss.sno) from (select distinct sno from sc)ss;
   #36、查询选修“谌燕”老师所授课程的学生中，成绩最高的学生姓名及其成绩
   select st.sname,cnum.score from student st join
   (select distinct * from sc sc where cno in(select distinct cno from course co join
   (select tno from teacher where tname='谌燕')ten on(co.tno=ten.tno)) order by score desc)cnum on(st.sno=cnum.sno) where rownum=1;
   #37、查询各个课程及相应的选修人数
   #(select cno,count(cno) from sc group by cno);
   select co.cname,cns.cnum from course co join (select cno,count(cno)cnum from sc group by cno)cns on(co.cno=cns.cno);
   #39、查询每门功课成绩最好的前两名
   select cno from sc order by score desc group by cno;
   #40、统计每门课程的学生选修人数（超过10 人的课程才统计）。要求输出课程号和选修人数，查询结果按人数降序排列，若人数相同，按课程号升序排列
   #41、检索至少选修两门课程的学生学号
   select sno from (select sno,count(cno)cnum from sc group by sno) where cnum>=2;
   #42、查询全部学生都选修的课程的课程号和课程名
   #select count(*) from (select distinct sno from sc);
   #select cno,count(cno)cns from sc group by cno;
   #select cno from (select count(*)num from (select distinct sno from sc))cs1,(select cno,count(cno)cns from sc group by cno)cs2 where cs2.cns=cs1.num;
   select cname,scs.cno from course co join
   (select cno from (select count(*)num from (select distinct sno from sc))cs1,
   (select cno,count(cno)cns from sc group by cno)cs2 where cs2.cns=cs1.num)scs on(co.cno=scs.cno);
   #43、查询没学过“谌燕”老师讲授的任一门课程的学生姓名
   #select co.cno from course co join (select tno from teacher where tname='谌燕')tn on(co.tno=tn.tno);
   select sname from student where sno not in
   (select distinct sno from sc where cno in(select co.cno from course co join
   (select tno from teacher where tname='谌燕')tn on(co.tno=tn.tno)));
   #44、查询两门以上不及格课程的同学的学号及其平均成绩
   #select sno,count(sno),avg(score) from sc where score < 60 group by sno;
   select * from (select sno,count(sno)cnum,avg(score) from sc where score < 60 group by sno)avs where avs.cnum>1;
   #45、检索“c004”课程分数小于60，按分数降序排列的同学学号
   select sno from sc where cno='c004' and score<60 order by score desc;
   #46、删除“s002”同学的“c001”课程的成绩
   delete from sc where sno='s002' and cno='c001';
