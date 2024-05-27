show tables;

create table webMessage(
	idx				int not null auto_increment, 		/* 메세지 고유번호 */
	title 		varchar(100) not null,					/* 메세지 제목 */
	content 	text not null,									/* 메세지 내용 */
	sendId 		varchar(20) not null,						/* 보내는 사람 아이디 */
	sendSw		char(1) not null default 's',		/* 보낸 메세지(s), 휴지통(g), 휴지통삭제(x) 표시 */
	sendDate	datetime default now(),					/* 메세지 보낸 날짜 */
	receiveId varchar(20) not null,						/* 받는 사람 아이디 */
	receiveSw	char(1) not null default 'n',		/* 받은메세지(n), 읽은메세지(r), 휴지통(g), 휴지통삭제(x) 표시 */
	receiveDate	datetime default now(),				/* 메세지 받은 날짜/읽은 날짜 */
	primary key(idx),
	foreign key(sendId) references member(mid),
	foreign key(receiveId) references member(mid)
);

drop table webMessage;
desc webMessage;
delete from webMessage;

insert into webMessage values (default, '안녕?아톰아~', '이번주 주말에 뭐하나?', 'hkd1234', default,default, 'atom1234', 'r', default);
insert into webMessage values (default, '답장: 방가방가', '이번주는 바쁘다', 'atom1234', default,default, 'hkd1234', 'r', default);
insert into webMessage values (default, '물어볼게 있음', '담에 만나자구', 'hkd1234', default,default, 'atom1234', 'r', default);
insert into webMessage values (default, 'ㅇㅋㅇㅋ', '그래 담에 보자구', 'atom1234', default,default, 'hkd1234', 'r', default);
insert into webMessage values (default, '그래 다음에 보자', '다음에 연락함', 'hkd1234', default,default, 'atom1234', default, default);
insert into webMessage values (default, '안녕?디톰아~', '이번주 주말에 뭐하나?', 'hkd1234', default,default, 'dtom1234', default, default);


select * from webMessage;

/*연습*/
select *,timestampdiff(hour, sendDate, now()) as hour_diff from webMessage where receiveId ="dtom1234" and (receiveSw = "n" or receivesw = "r") order by idx desc;

select * from webMessage;
