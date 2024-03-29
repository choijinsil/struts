--reply.sql

drop table reply;
drop sequence reply_seq;
create table reply (
	no number
	,name varchar2(20) 
	,content varchar2(300)
);

alter table reply
add constraint reply_pk primary key(no);

alter table reply
modify name not null;

alter table reply
modify content not null;


create sequence reply_seq
start with 1
increment by 1
nocycle
nocache;

	select * from reply;
	delete from reply where no=24;