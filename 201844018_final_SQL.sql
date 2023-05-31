-- student 테이블 생성
create table student
(
    stu_no    int         not null
        primary key,
    stu_name  varchar(20) not null,
    stu_pw    varchar(50) not null,
    stu_grade int         null,
    stu_dept  varchar(50) null,
    stu_hp    varchar(20) null,
    stu_birth date        null,
    constraint student_stu_no_uindex
        unique (stu_no)
);
-- student 테이블 기본 튜플
insert into jspProject.student (stu_no, stu_name, stu_pw, stu_grade, stu_dept, stu_hp, stu_birth)
values  (2013783, '고인물', 'DC0EDFFD54322B48754687BD0D274AB4', 4, '화학공학', '010-2533-3641', '1995-01-21'),
        (2015024, '권용진', '39EB13C6A4AB23725604E284EDD3B4AB', 4, '전기전자', '010-7322-6141', '1997-08-16'),
        (2018001, '안재민', '770AE5DE5476354F4A2D71ED82A77761', 2, '컴퓨터정보', '010-6650-9876', '2000-02-14'),
        (2018005, '김민규', '7B27F37E7A2BC6FD20225546694BC23F', 2, '컴퓨터정보', '010-5414-7618', '1999-06-23'),
        (2018052, '최홍서', '9D6494F107255E2C1BA8AB51359BA85E', 3, '전기전자', '010-3854-5031', '1999-10-01'),
        (2019001, '차주상', '567777DA2C20E3C22508CC3A933EBBCA', 3, '화학공학', '010-6555-0423', '2000-05-17'),
        (2019077, '이석의', '9C204E2F1D3934A3C2B2808925F3FFE3', 3, '기계', '010-3625-3933', '1999-04-29'),
        (2021055, '유준상', '325210C59CF6EF830B843F1C67C3C8F4', 1, '기계', '010-3278-3616', '2001-12-17');
-- subject 테이블 생성
create table subject
(
    sub_no        varchar(10) not null
        primary key,
    sub_name      varchar(50) not null,
    sub_grade     int         null,
    sub_dept      varchar(50) null,
    sub_personnel int         not null,
    sub_proposer  int         null,
    sub_score     int         not null,
    constraint subject_sub_no_uindex
        unique (sub_no)
);
-- subject 테이블 기본 튜플
insert into jspProject.subject (sub_no, sub_name, sub_grade, sub_dept, sub_personnel, sub_proposer, sub_score)
values  ('A01', 'C프로그래밍', 1, '컴퓨터정보', 30, 1, 3),
        ('A02', '컴퓨터구조', 1, '컴퓨터정보', 30, 0, 3),
        ('A03', '운영체제', 2, '컴퓨터정보', 35, 1, 3),
        ('A04', 'JSP', 2, '컴퓨터정보', 30, 1, 3),
        ('A05', '데이터베이스', 2, '컴퓨터정보', 25, 2, 3),
        ('A06', 'AI프로그래밍', 3, '컴퓨터정보', 25, 0, 3),
        ('A07', '피지컬컴퓨팅', 3, '컴퓨터정보', 25, 0, 3),
        ('A08', '정보통신개론', 1, '컴퓨터정보', 35, 1, 3),
        ('A09', '시스템분석설계', 2, '컴퓨터정보', 30, 0, 3),
        ('A10', '자바프로그래밍', 2, '컴퓨터정보', 25, 0, 3),
        ('A11', '스크래치', 1, '컴퓨터정보', 50, 0, 2),
        ('A12', '소프트웨어활용', 1, '컴퓨터정보', 50, 0, 2),
        ('A13', '모스마스터', 3, '컴퓨터정보', 50, 0, 2),
        ('B01', '기계제작법', 3, '기계', 30, 0, 3),
        ('B02', '기계설계', 1, '기계', 30, 0, 3),
        ('B03', '열역학', 2, '기계', 30, 0, 3),
        ('B04', '동역학', 2, '기계', 30, 0, 3),
        ('B05', '유체역학', 2, '기계', 30, 0, 3),
        ('B06', '고체역학', 2, '기계', 30, 0, 3),
        ('B07', '수치해석', 3, '기계', 30, 0, 3),
        ('B08', '응용전자공학', 4, '기계', 30, 0, 3),
        ('B09', '공학수학', 3, '기계', 50, 0, 2),
        ('B10', '미분적분학', 1, '기계', 50, 0, 2),
        ('C01', '전기시스템기초', 1, '전기전자', 30, 0, 3),
        ('C02', '전력공학', 1, '전기전자', 30, 1, 3),
        ('C03', '회로이론', 1, '전기전자', 30, 0, 3),
        ('C04', '임베디드시스템', 2, '전기전자', 30, 0, 3),
        ('C05', '제어공학', 2, '전기전자', 30, 0, 3),
        ('C06', '로봇공학', 3, '전기전자', 30, 0, 3),
        ('C07', '전자파공학', 2, '전기전자', 30, 1, 3),
        ('C08', '디지털제어이론', 3, '전기전자', 30, 0, 3),
        ('C09', '일반물리', 1, '전기전자', 50, 0, 2),
        ('C10', '일반물리실험', 2, '전기전자', 50, 0, 2),
        ('D01', '화공기초설계', 1, '화학공학', 30, 1, 3),
        ('D02', '화공유체역학', 2, '화학공학', 30, 1, 3),
        ('D03', '고분자개론', 1, '화학공학', 30, 1, 3),
        ('D04', '화학반응공학', 1, '화학공학', 30, 1, 3),
        ('D05', '생물화학공학', 2, '화학공학', 30, 0, 3),
        ('D06', '공정제어', 3, '화학공학', 30, 0, 3),
        ('D07', '화공수학', 3, '화학공학', 30, 0, 3),
        ('D08', '미분적분학', 1, '화학공학', 40, 1, 2),
        ('D09', '화학및실험', 1, '화학공학', 50, 1, 2),
        ('D10', '공업생물학', 2, '화학공학', 50, 0, 2),
        ('G01', '프로그래밍언어', 1, '공통교양', 50, 1, 2),
        ('G02', '통계학', 1, '공통교양', 50, 0, 2),
        ('G03', '의사소통능력', 1, '공통교양', 50, 2, 2),
        ('G04', '서비스마인드', 2, '공통교양', 50, 1, 2),
        ('G05', '영어회화', 2, '공통교양', 50, 0, 2),
        ('O01', '참인성과진로', 3, '온라인', 70, 0, 1),
        ('O02', '문제해결능력', 1, '온라인', 70, 0, 1),
        ('O03', '정보해결', 2, '온라인', 70, 1, 1),
        ('O04', '직업윤리', 1, '온라인', 70, 1, 1),
        ('O05', '토익영어', 2, '온라인', 70, 0, 1);
-- enrol 테이블 생성
create table enrol
(
    stu_no int         not null,
    sub_no varchar(10) not null,
    primary key (stu_no, sub_no),
    constraint enrol_stu_no_fk
        foreign key (stu_no) references student (stu_no)
            on update cascade on delete cascade,
    constraint enrol_sub_no_fk
        foreign key (sub_no) references subject (sub_no)
            on update cascade on delete cascade
);
-- dept 테이블 생성
create table dept
(
    dept_no        varchar(5)  not null
        primary key,
    dept_name      varchar(50) not null,
    dept_proposer  int         not null,
    dept_personnel int         not null,
    constraint dept_dept_no_uindex
        unique (dept_no),
    constraint dept_no
        unique (dept_no, dept_name)
);
-- dept 테이블 기본 튜플
insert into jspProject.dept (dept_no, dept_name, dept_personnel, dept_proposer)
values  ('DP01', '컴퓨터정보', 120, 2),
        ('DP02', '전기전자', 120, 2),
        ('DP03', '기계', 120, 2),
        ('DP04', '화학공학', 120, 1);