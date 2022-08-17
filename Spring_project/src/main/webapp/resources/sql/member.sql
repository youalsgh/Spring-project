create database market;

use market;

create table if not exists member(
	m_id varchar(100) not null primary key,
    m_password varchar(100) not null,
    m_name varchar(100),
    m_email varchar(100),
    adminCk int default 0,
    m_addr1 varchar(300),
    m_addr2 varchar(300),
    m_addr3 varchar(300)
)default charset=utf8mb4;

insert into member(m_id, m_password, m_name, m_email, adminCk) values('admin', '1234', '김민호', 'youalsgh@naver.com', 1);
insert into member(m_id, m_password, m_name, m_email) values('test', '1234', '김민호', 'youalsgh@naver.com');
insert into member(m_id, m_password, m_name, m_email) values('test1', '1234', '김민호', 'youalsgh@naver.com');
insert into member(m_id, m_password, m_name, m_email) values('test2', '1234', '김민호', 'youalsgh@naver.com');
insert into member(m_id, m_password, m_name, m_email) values('test3', '1234', '김민호', 'youalsgh@naver.com');
insert into member(m_id, m_password, m_name, m_email) values('test4', '1234', '김민호', 'youalsgh@naver.com');
select * from member;
select count(*) from member where m_id not in('admin');
drop table member;