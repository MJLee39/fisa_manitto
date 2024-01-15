DROP TABLE student;

CREATE TABLE student (
    id int PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    pw VARCHAR(20) NOT NULL,
    targetId int DEFAULT NULL
);

insert into student(id, name, pw) values(0, 'admin', '0000');

insert into student(id, name, pw) values(1, '권성준', '1111');
insert into student(id, name, pw) values(2, '김민석', '1111');
insert into student(id, name, pw) values(3, '김수', '1111');
insert into student(id, name, pw) values(4, '김어진', '1111');
insert into student(id, name, pw) values(5, '김영현', '1111');

insert into student(id, name, pw) values(6, '김윤진', '1111');
insert into student(id, name, pw) values(7, '김은지', '1111');
insert into student(id, name, pw) values(8, '박선진', '1111');
insert into student(id, name, pw) values(9, '박예린', '1111');
insert into student(id, name, pw) values(10, '서강원', '1111');

insert into student(id, name, pw) values(11, '서희주', '1111');
insert into student(id, name, pw) values(12, '송봉섭', '1111');
insert into student(id, name, pw) values(13, '염휘주', '1111');
insert into student(id, name, pw) values(14, '오지영', '1111');
insert into student(id, name, pw) values(15, '이강륜', '1111');

insert into student(id, name, pw) values(16, '이대원', '1111');
insert into student(id, name, pw) values(17, '이명진', '1111');
insert into student(id, name, pw) values(18, '이유경', '1111');
insert into student(id, name, pw) values(19, '임유리', '1111');
insert into student(id, name, pw) values(20, '장지은', '1111');

insert into student(id, name, pw) values(21, '조승빈', '1111');
insert into student(id, name, pw) values(22, '진민호', '1111');
insert into student(id, name, pw) values(23, '한상우', '1111');
insert into student(id, name, pw) values(24, '황현수', '1111');

