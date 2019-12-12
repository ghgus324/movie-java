drop sequence noticeboard_seq;
drop sequence freeboard_seq;
drop sequence musicboard_seq;
drop sequence qnaboard_seq;
drop sequence noticereply_seq;
drop sequence freereply_seq;
drop sequence musicreply_seq;
drop sequence qnareply_seq;
drop sequence music_seq;
drop sequence mbookmark_seq;
drop sequence cbookmark_seq;
drop sequence msg_seq;






drop table noticereply;
drop table freereply;
drop table musicreply;
drop table qnareply;
drop table mbookmark;
drop table cbookmark;
drop table music;
drop table musicboard;
drop table qnaboard;
drop table noticeboard;
drop table freeboard;
drop table chat3;
drop table msg;
drop table customer;

create table customer(custid varchar2(30) primary key
,password varchar2(30) not null
,name varchar2(30) not null
,email varchar2(50) not null
,phone varchar2(30) 
,inputdate varchar2(30) default sysdate
,authority number);



create table noticeboard(
bnum number primary key 
,custid varchar2(30) not null 
,title varchar2(300) not null
,text varchar2(4000) not null
,inputdate date default sysdate
,hits number default 0
, pos number
, depth number
,constraint noticeboard_id_fk foreign key(custid) 
		references customer(custid) on delete cascade );
create sequence noticeboard_seq start with 30;


create table freeboard(
bnum number primary key 
,custid varchar2(30) not null 
,title varchar2(300) not null
,text varchar2(4000) not null
,inputdate date default sysdate
,hits number default 0
, pos number
, depth number
,constraint freeboard_id_fk foreign key(custid) 
		references customer(custid) on delete cascade );
create sequence freeboard_seq start with 30;



create table musicboard(
bnum number primary key 
,custid varchar2(30) not null 
,title varchar2(300) not null
,text varchar2(4000) not null
,inputdate date default sysdate
,music clob  
,hits number default 0
,grade float default 0
, pos number
, depth number
,constraint musicboard_id_fk foreign key(custid) 
		references customer(custid) on delete cascade );
create sequence musicboard_seq start with 30;


create table qnaboard(
bnum number primary key 
,custid varchar2(30) not null 
,title varchar2(300) not null
,text varchar2(4000) not null
,inputdate date default sysdate
,hits number default 0
, pos number
, depth number
,constraint qnaboard_id_fk foreign key(custid) 
		references customer(custid) on delete cascade );
create sequence qnaboard_seq start with 30;


create table noticereply(
rnum number primary key
,bnum number not null
,custid varchar2(30) not null
,text varchar2(1000) not null
,inputdate date default sysdate
, pos number
, depth number
,constraint noticereply_bnum_fk foreign key(bnum) 
		references noticeboard(bnum) on delete cascade
,constraint noticereply_id_fk foreign key(custid) 
		references customer(custid) on delete cascade
);
create sequence noticereply_seq;



create table freereply(
rnum number primary key
,bnum number not null
,custid varchar2(30) not null
,text varchar2(1000) not null
,inputdate date default sysdate
, pos number
, depth number
,constraint freereply_bnum_fk foreign key(bnum) 
		references freeboard(bnum) on delete cascade
,constraint freereply_id_fk foreign key(custid) 
		references customer(custid) on delete cascade
);
create sequence freereply_seq;


create table musicreply(
rnum number primary key
,bnum number not null
,custid varchar2(30) not null
,text varchar2(1000) not null
,inputdate date default sysdate
,grade number default 0
, pos number
, depth number
,constraint musicreply_bnum_fk foreign key(bnum) 
		references musicboard(bnum) on delete cascade
,constraint musicreply_id_fk foreign key(custid) 
		references customer(custid) on delete cascade
);
create sequence musicreply_seq start with 20;


create table qnareply(
rnum number primary key
,bnum number not null
,custid varchar2(30) not null
,text varchar2(1000) not null
,inputdate date default sysdate
, pos number
, depth number
,constraint qnareply_bnum_fk foreign key(bnum) 
		references qnaboard(bnum) on delete cascade
,constraint qnareply_id_fk foreign key(custid) 
		references customer(custid) on delete cascade
);
create sequence qnareply_seq;

 
create table music(mnum number primary key
,music clob not null 
,custid varchar2(30) not null
,title varchar2(100) not null
,inputdate date default sysdate
,note varchar2(4000)
,constraint music_id_fk foreign key(custid) 
		references customer(custid) on delete cascade);
create sequence music_seq;
 

create table mbookmark(
bmnum number primary key
,bnum number not null
,title varchar2(1000) not null
,custid varchar2(30) not null
,bcid varchar2(30) not null
,bmcontent varchar2(1000)
,inputdate date default sysdate);
create sequence  mbookmark_seq start with 10;


create table cbookmark(
bcnum number primary key
,custid varchar2(30)        
,bcid varchar2(30)
,name varchar2(30)
,email varchar2(50)
,constraint cbookmark_custid_fk foreign key(custid)
		references customer(custid) on delete cascade
,constraint cbookmark_bcid_fk foreign key(bcid)
		references customer(custid) on delete cascade); 
create sequence cbookmark_seq start with 10;

create table msg(
mnum number primary key
,sendid varchar2(30) not null
,reid varchar2(30) not null
,title varchar2(100) not null
,text varchar2(1000) not null
,inputdate date default sysdate
,read number default 0 
,delsen number default 0 
,delrec number default 0 
,booksen number default 0
,bookrec number default 0
,constraint msg_sendid_fk foreign key(sendid)
		references customer(custid) on delete cascade
,constraint msg_reid_fk foreign key(reid)
		references customer(custid) on delete cascade);	
create sequence msg_seq start with 10;




create table chat3(
chatnum number primary key,
chatname varchar2(100) not null,
chatuser varchar2(30) not null,
chatpw varchar2(100) ,
usernum number default 1,
inputdate date default sysdate
);




더미데이터
insert into customer(custid,password,name,email,authority )values('kimyoon1231','aaaaaaa1','キムユン','kimyoon1231@naver.com',2);
insert into customer(custid,password,name,email,authority )values('aaaaaaaa1','aaa11111','ホヒョン','aaaaaaa1@a.com',2);
insert into customer(custid,password,name,email,authority )values('aaaaaaaa2','aaaaaaa1','ウヨン','gjgjg@a.com',2);
insert into customer(custid,password,name,email,authority )values('aaaaaaaaa1','aaaaaaaa1','ウォン','gjgjga@a.com',2);
insert into customer(custid,password,name,email,authority )values('hyojung1','aaaaaaa1','lee','junshohj@naver.com',2);
insert into customer(custid,password,name,email,authority )values('polyphony233','aaaaaaa1','popo','polyphony233@marumaru.com',2);
insert into customer(custid,password,name,email,authority )values('bach1685','aaaaaaa1','bach','bach1685@marumaru.com',2);
insert into customer(custid,password,name,email,authority )values('tomato2018','aaaaaaa1','love','tomato2018@marumaru.com',2);
insert into customer(custid,password,name,email,authority )values('pianoman77','aaaaaaa1','piano','pianoman77@marumaru.com',2);
insert into customer(custid,password,name,email,authority )values('manager1','aaaaaaa1','manager','marumaru34@naver.com',1);

 


insert into cbookmark(bcnum,custid,bcid,name, email )values(1,'aaaaaaaa1','tomato2018','love', 'tomato2018@marumaru.com');
insert into cbookmark(bcnum,custid,bcid,name, email )values(2,'aaaaaaaa1','polyphony233','popo','polyphony233@marumaru.com');
insert into cbookmark(bcnum,custid,bcid,name, email )values(3,'aaaaaaaa1','hyojung1','lee','marumaru34@naver.com');
insert into cbookmark(bcnum,custid,bcid,name, email )values(4,'aaaaaaaa1','bach1685','bach','marumaru34@naver.com'); 



insert into noticeboard(bnum,custid,title, text, pos, depth )values(1,'manager1','新しいお知らせ','MaruMaruの告知事項をお知らせします。', 0, 0);
insert into noticeboard(bnum,custid,title, text, pos, depth )values(2,'manager1','ホームページがリニュアルされました。','MaruMaruの告知事項をお知らせします。 お知らせを必ず読んでください。', 1, 0);
insert into noticeboard(bnum,custid,title, text, pos, depth )values(3,'manager1','ファイル編集機能を改修しました','MaruMaruの告知事項をお知らせします。 お知らせを必ず読んでください。', 2, 0);
insert into noticeboard(bnum,custid,title, text, pos, depth )values(4,'manager1','ファイルアップロードに関するお知らせ','MaruMaruの告知事項をお知らせします。 お知らせを必ず読んでください。', 3, 0);
insert into noticeboard(bnum,custid,title, text, pos, depth )values(5,'manager1','告知事項があります。','MaruMaruの告知事項をお知らせします。 お知らせを必ず読んでください。', 4, 0);




insert into musicboard(bnum,custid,title, text ,grade , pos, depth )values(18,'bach1685','カルミラ・カベヨの楽譜','高校三年生ですが、シンガーソングライターが夢です。幼い頃から音楽をやりたかったのですが、事情があってできず、今になってようやく準備をしています。音楽関係の大学にいくには遅いって解ってはいるので再来年に行こうと思います。一年ぐらい音楽を集中して勉強したいのですが、シンガーソングライターは必ずピアノかギターを弾きながら歌わなきゃだめなんですか？自作した曲を録音したものを流しながら歌うのはシンガーソングライターではないのですか？',3.333,0, 0);
insert into musicboard(bnum,custid,title, text,grade, pos, depth )values(17,'hyojung1','Maplestory 楽譜','以前から音楽を、ラップをやりたいと考えてる人です。実力がどうか、可能性はあるのかは知りません。でも何年も前からカラオケや一発芸として歌い、ラップすることよりも音楽を共有しながら作曲したいです。',5, 1, 0);
insert into musicboard(bnum,custid,title, text, pos, depth )values(16,'kimyoon1231','ららランドOST','以前から音楽を、ラップをやりたいと考えてる人です。実力がどうか、可能性はあるのかは知りません。でも何年も前からカラオケや一発芸として歌い、ラップすることよりも音楽を共有しながら作曲したいです。', 2, 0);
insert into musicboard(bnum,custid,title, text,grade , pos, depth )values(15,'aaaaaaaa1','奇跡みたいな話 楽譜 ','以前から音楽を、ラップをやりたいと考えてる人です。実力がどうか、可能性はあるのかは知りません。でも何年も前からカラオケや一発芸として歌い、ラップすることよりも音楽を共有しながら作曲したいです。',3.333, 3, 0);
insert into musicboard(bnum,custid,title, text, pos, depth )values(14,'tomato2018', '[自作] オーガ行列','以前から音楽を、ラップをやりたいと考えてる人です。実力がどうか、可能性はあるのかは知りません。でも何年も前からカラオケや一発芸として歌い、ラップすることよりも音楽を共有しながら作曲したいです。', 4, 0);
insert into musicboard(bnum,custid,title, text, pos, depth )values(13,'kimyoon1231','NoName - 紅蓮 楽譜','以前から音楽を、ラップをやりたいと考えてる人です。実力がどうか、可能性はあるのかは知りません。でも何年も前からカラオケや一発芸として歌い、ラップすることよりも音楽を共有しながら作曲したいです。', 5, 0);
insert into musicboard(bnum,custid,title, text, pos, depth )values(12,'polyphony233','PSY - ガンナムスタイル 楽譜','以前から音楽を、ラップをやりたいと考えてる人です。実力がどうか、可能性はあるのかは知りません。でも何年も前からカラオケや一発芸として歌い、ラップすることよりも音楽を共有しながら作曲したいです。', 6, 0);
insert into musicboard(bnum,custid,title, text, pos, depth )values(11,'tomato2018','M4A1(Abワンキー)','以前から音楽を、ラップをやりたいと考えてる人です。実力がどうか、可能性はあるのかは知りません。でも何年も前からカラオケや一発芸として歌い、ラップすることよりも音楽を共有しながら作曲したいです。', 7, 0);
insert into musicboard(bnum,custid,title, text,grade , pos, depth )values(10,'pianoman77','Bubble (バブル) - Tido Kang','以前から音楽を、ラップをやりたいと考えてる人です。実力がどうか、可能性はあるのかは知りません。でも何年も前からカラオケや一発芸として歌い、ラップすることよりも音楽を共有しながら作曲したいです。',4.666, 8, 0);
insert into musicboard(bnum,custid,title, text, pos, depth )values(9,'polyphony233','ピアノの里- ピアノの森 楽譜','以前から音楽を、ラップをやりたいと考えてる人です。実力がどうか、可能性はあるのかは知りません。でも何年も前からカラオケや一発芸として歌い、ラップすることよりも音楽を共有しながら作曲したいです。', 9, 0);
insert into musicboard(bnum,custid,title, text, pos, depth )values(8,'hyojung1','[楽譜] COCO－OST [Coco, 2017] OST "Remember Me" ','以前から音楽を、ラップをやりたいと考えてる人です。実力がどうか、可能性はあるのかは知りません。でも何年も前からカラオケや一発芸として歌い、ラップすることよりも音楽を共有しながら作曲したいです。', 10, 0);
insert into musicboard(bnum,custid,title, text, grade ,pos, depth )values(7,'kimyoon1231','甘木ブリリアントパーク OST ','以前から音楽を、ラップをやりたいと考えてる人です。実力がどうか、可能性はあるのかは知りません。でも何年も前からカラオケや一発芸として歌い、ラップすることよりも音楽を共有しながら作曲したいです。',2, 11, 0);
insert into musicboard(bnum,custid,title, text, pos, depth )values(6,'tomato2018','[自作] 森の回想 - 銀の雨 (ようつべ) ','以前から音楽を、ラップをやりたいと考えてる人です。実力がどうか、可能性はあるのかは知りません。でも何年も前からカラオケや一発芸として歌い、ラップすることよりも音楽を共有しながら作曲したいです。', 12, 0);
insert into musicboard(bnum,custid,title, text, pos, depth )values(5,'pianoman77','A hisa - Pastel Subliminal','以前から音楽を、ラップをやりたいと考えてる人です。実力がどうか、可能性はあるのかは知りません。でも何年も前からカラオケや一発芸として歌い、ラップすることよりも音楽を共有しながら作曲したいです。', 13, 0);
insert into musicboard(bnum,custid,title, text, pos, depth )values(4,'bach1685','(Oscar Peterson) - Tenderly','以前から音楽を、ラップをやりたいと考えてる人です。実力がどうか、可能性はあるのかは知りません。でも何年も前からカラオケや一発芸として歌い、ラップすることよりも音楽を共有しながら作曲したいです。', 14, 0);
insert into musicboard(bnum,custid,title, text, pos, depth )values(3,'hyojung1','ジョン・シュミット-All of me','以前から音楽を、ラップをやりたいと考えてる人です。実力がどうか、可能性はあるのかは知りません。でも何年も前からカラオケや一発芸として歌い、ラップすることよりも音楽を共有しながら作曲したいです。', 15, 0);
insert into musicboard(bnum,custid,title, text, pos, depth )values(2,'aaaaaaaa1','復習者 4hands piano 楽譜에요!','以前から音楽を、ラップをやりたいと考えてる人です。実力がどうか、可能性はあるのかは知りません。でも何年も前からカラオケや一発芸として歌い、ラップすることよりも音楽を共有しながら作曲したいです。', 16, 0);
insert into musicboard(bnum,custid,title, text, pos, depth )values(1,'polyphony233','Stay With Me ','以前から音楽を、ラップをやりたいと考えてる人です。実力がどうか、可能性はあるのかは知りません。でも何年も前からカラオケや一発芸として歌い、ラップすることよりも音楽を共有しながら作曲したいです。', 17, 0);






insert into musicreply(rnum, bnum, custid, text, grade, pos, depth )values(1, 18, 'kimyoon1231','いいね!!!', 5 , 2,0);
insert into musicreply(rnum, bnum, custid, text, grade, pos, depth )values(2,18, 'tomato2018','わいのしゅみじゃねーな', 2, 1,0);
insert into musicreply(rnum, bnum, custid, text, grade, pos, depth )values(3,18, 'hyojung1','いい曲です！', 3 , 0,0);
insert into musicreply(rnum, bnum, custid, text, grade, pos, depth )values(4, 17, 'aaaaaaaa1','アヴェンジャーズまた見たい！', 5  , 2,0);
insert into musicreply(rnum, bnum, custid, text, grade, pos, depth )values(5,17, 'tomato2018','まだ見てないけど・・・OSTも良いし、期待して良いよね!?', 5 , 1,0);
insert into musicreply(rnum, bnum, custid, text, grade, pos, depth )values(6, 17, 'kimyoon1231','マーブルヒーローズ！',5  , 0,0);
insert into musicreply(rnum, bnum, custid, text, grade, pos, depth )values(7, 15, 'aaaaaaaa1','名曲！ありがとうございます！',5  , 2,0);
insert into musicreply(rnum, bnum, custid, text, grade, pos, depth )values(8,15, 'kimyoon1231','中々の歌ですな', 3 , 1,0);
insert into musicreply(rnum, bnum, custid, text, grade, pos, depth )values(9, 15, 'hyojung1','無難だな無難なだけ', 2 , 0,0);
insert into musicreply(rnum, bnum, custid, text, grade, pos, depth )values(10,7 , 'kimyoon1231','オリジナルのほうが良いじゃん', 1 , 2,0);
insert into musicreply(rnum, bnum, custid, text, grade, pos, depth )values(11,7, 'hyojung1','オリジナルよりも好き', 3 , 1,0);
insert into musicreply(rnum, bnum, custid, text, grade, pos, depth )values(12, 7, 'aaaaaaaa1','オリジナルの劣化',3  , 0,0);
insert into musicreply(rnum, bnum, custid, text, grade, pos, depth )values(13, 10, 'kimyoon1231','いい曲です、ありがとう',4  , 2,0);
insert into musicreply(rnum, bnum, custid, text, grade, pos, depth )values(14, 10, 'aaaaaaaa1','演奏してみたい',5  , 1,0);
insert into musicreply(rnum, bnum, custid, text, grade, pos, depth )values(15, 10, 'tomato2018','最近この曲練習してます、いいよね！', 5 , 0,0);










insert into qnaboard(bnum,custid,title, text, pos, depth )values(24,'aaaaaaaa1','アホなバンド推薦よろ','ショーが面白ければ良いからとにかくよろ', 0, 0);
insert into qnaboard(bnum,custid,title, text, pos, depth )values(1,'hyojung1','クラシックギターってだせぇよな','とか言いつつ、アンチークショップからビンテージギター買ってるワイ', 1, 0);
insert into qnaboard(bnum,custid,title, text, pos, depth )values(2,'kimyoon1231','著作権について','ちょっとしたつぎはぎで旅行PVみたいなもん作ったんだけど、どうやったら著作権に掛からないんだ？', 2, 0);
insert into qnaboard(bnum,custid,title, text, pos, depth )values(3,'tomato2018','ランニングマンのBGM','韓国バラエティで出てた曲なんですけど、始めがエレキギターなやつのタイトル探してます', 3, 0);
insert into qnaboard(bnum,custid,title, text, pos, depth )values(4,'bach1685','これタイトル何？','これ一度聞いて気に入ってていつも口ずさんでいたんだけど、タイトルだけはわからんのよ、だれかおしえてPLZ ', 4, 0);
insert into qnaboard(bnum,custid,title, text, pos, depth )values(5,'polyphony233','ギターのコード質問', 'ギターの練習をしてるんですがFキーを使う楽譜です. でもコード楽譜だからコードだけあるんですがこれどうするんです？', 5, 0);
insert into qnaboard(bnum,custid,title, text, pos, depth )values(6,'aaaaaaaa1','24ビット',' spekというプログラムはどう扱うの？', 6, 0);
insert into qnaboard(bnum,custid,title, text, pos, depth )values(7,'tomato2018','[求む]音楽ソムリエ','アフリカの草原ドキュメンタリーに似合うような曲を頼む', 7, 0);
insert into qnaboard(bnum,custid,title, text, pos, depth )values(8,'pianoman77','CBRとVBRの違いって何ですか','音源を256AACに変えるましたが256VBRと容量が違いすぎて気になります', 8, 0);
insert into qnaboard(bnum,custid,title, text, pos, depth )values(9,'hyojung1','ソムリエ求む！','ファミレスで聞いた曲を探してるんですが、ジャズみたいな曲で最近のJ-POPみたいですけど、タイトルが分かりません', 9, 0);
insert into qnaboard(bnum,custid,title, text, pos, depth )values(10,'tomato2018','J-Popってどこで探すべきですか？','探している曲があるんですがJ-POPみたいなんです。どこに行けばいいですか？', 10, 0);
insert into qnaboard(bnum,custid,title, text, pos, depth )values(11,'polyphony233','リズミカルなJAZZのおすすめを教えてください','楽器の練習に使いたいのでボーカルが無い曲が望ましいです', 11, 0);
insert into qnaboard(bnum,custid,title, text, pos, depth )values(12,'bach1685','クラシックや弦楽器に詳しい方','B.191 (Op.104) / mov.1 Allegro 3分43秒の弦楽器おしえてくだしあ', 12, 0);
insert into qnaboard(bnum,custid,title, text, pos, depth )values(13,'hyojung1','韓国の女性アルエンビ歌手おしえて','できれば10人くらい', 13, 0);
insert into qnaboard(bnum,custid,title, text, pos, depth )values(14,'aaaaaaaa1','この曲のタイトル知っている方います？','http://naver.me/GN739dp4で知り合いの知り合いがくれた無名のアレンジ曲らしいんですけど、これのオリジナルって', 14, 0);
insert into qnaboard(bnum,custid,title, text, pos, depth )values(15,'hyojung1','とあるアメリカのバンドが出した曲を探してます','PCをフォーマットしたからもう見れないんだけど、2007年にXBANKというバンドが出したやつ探してるんだ、専門家求む', 15, 0);
insert into qnaboard(bnum,custid,title, text, pos, depth )values(16,'bach1685','円盤が不良品なんですかね','音楽再生中に止まるんでイライラする', 16, 0);
insert into qnaboard(bnum,custid,title, text, pos, depth )values(17,'polyphony233','すごく清涼感のある声で歌う女性の歌手を教えてください','できれば代表的な歌も', 17, 0);
insert into qnaboard(bnum,custid,title, text, pos, depth )values(18,'tomato2018','バンドおしえて??','radiohead , oasis , the script , we the kings以外で', 18, 0);
insert into qnaboard(bnum,custid,title, text, pos, depth )values(19,'aaaaaaaa1',' MP3やFLACの音源、どこでDLできますか？','メロン使ってましたが最近利用規約が変更され、一括値上げされて・・・', 19, 0);
insert into qnaboard(bnum,custid,title, text, pos, depth )values(20,'pianoman77','バンバードを作曲した人の名をおしえろください','全裸土下座するから', 20, 0);
insert into qnaboard(bnum,custid,title, text, pos, depth )values(21,'hyojung1','ピアノの練習にいい曲おしえて','ああああああああ', 21, 0);
insert into qnaboard(bnum,custid,title, text, pos, depth )values(22,'polyphony233','そんなことよりゲームやろうぜ！','PUBGやろうぜ！', 22, 0);
insert into qnaboard(bnum,custid,title, text, pos, depth )values(23,'tomato2018','1位取りました','ここで完成させた歌でコンテスト1位取りました。やったぜ', 23, 0);





insert into freeboard(bnum,custid,title, text, pos, depth )values(1,'hyojung1','一緒にラップやる方います?','以前から音楽を、ラップをやりたいと考えてる人です。実力がどうか、可能性はあるのかは知りません。でも何年も前からカラオケや一発芸として歌い、ラップすることよりも音楽を共有しながら作曲したいです。', 0, 0);
insert into freeboard(bnum,custid,title, text, pos, depth )values(2,'kimyoon1231','最近暑すぎない？','まだ春なのに30度とか夏になると死ぬなこれ', 1, 0);
insert into freeboard(bnum,custid,title, text, pos, depth )values(3,'aaaaaaaa1','このサイトの名前って何が由来？','円？韓国語？', 2, 0);
insert into freeboard(bnum,custid,title, text, pos, depth )values(4,'tomato2018','すごいサイトだな','バグだらけで利用する気も失せるわ', 3, 0);
insert into freeboard(bnum,custid,title, text, pos, depth )values(5,'kimyoon1231','たこ焼きおいしい','げへへ', 4, 0);
insert into freeboard(bnum,custid,title, text, pos, depth )values(6,'polyphony233','オフ会やりたい人募集','親切に音楽について教えますから！',5, 0);
insert into freeboard(bnum,custid,title, text, pos, depth )values(7,'tomato2018','終電逃した','死にたいめう', 6, 0);
insert into freeboard(bnum,custid,title, text, pos, depth )values(8,'pianoman77','不便だなこのサイト','音楽コード編集がめんどくさすぎる', 7, 0);
insert into freeboard(bnum,custid,title, text, pos, depth )values(9,'polyphony233','プログラミングできる方','Cを教えて？', 8, 0);
insert into freeboard(bnum,custid,title, text, pos, depth )values(10,'hyojung1','学校の友達が殴ってきます','たかがパンで煽っただけじゃん', 9, 0);
insert into freeboard(bnum,custid,title, text, pos, depth )values(11,'kimyoon1231','旅行好きな方！','バイクで一人旅できる国内地方のおすすめってどこ？', 10, 0);
insert into freeboard(bnum,custid,title, text, pos, depth )values(12,'tomato2018','天気がいやらしいですね','明日は霰でも降るのかな', 11, 0);
insert into freeboard(bnum,custid,title, text, pos, depth )values(13,'pianoman77','楽譜編集得意な方','ここで扱ってるABC記譜法の詳細plz', 12, 0);
insert into freeboard(bnum,custid,title, text, pos, depth )values(14,'bach1685','おさけはほどほどにしましょう','飲みすぎてつらたん', 13, 0);
insert into freeboard(bnum,custid,title, text, pos, depth )values(15,'hyojung1','最近の映画、面白いのって無いの？','映画の予約しようと思ったらいまいちなのばっかり', 14, 0);
insert into freeboard(bnum,custid,title, text, pos, depth )values(16,'aaaaaaaa1','日曜日には散歩だろ！','ってのはフェイクだ！', 15, 0);
insert into freeboard(bnum,custid,title, text, pos, depth )values(17,'polyphony233','チャット使うとサイトがおかしくなる','チャット使うとフリーズするんだが', 16, 0);
insert into freeboard(bnum,custid,title, text, pos, depth )values(18,'bach1685','ピアノ上手く弾きたい','天才は滅びろ', 17, 0);
insert into freeboard(bnum,custid,title, text, pos, depth )values(19,'tomato2018','ここ、ギターの楽譜はだめなん？','ギター暦5年で他の楽器は無理だからつらい', 18, 0);
insert into freeboard(bnum,custid,title, text, pos, depth )values(20,'aaaaaaaa1','作曲上手なかた裏山','本当にうらやましいな', 19, 0);
insert into freeboard(bnum,custid,title, text, pos, depth )values(21,'kimyoon1231','このサイトに何が不満なの？','どうせ編集プログラム買う金もないやつらの戯言でおｋ？', 20, 0);





insert into mbookmark(bmnum, bnum, title, custid, bcid, bmcontent)values(1,4,'奇跡めいた話','aaaaaaaa1', 'polyphony233', '奇跡めいた話練習');
insert into mbookmark(bmnum, bnum, title, custid, bcid, bmcontent)values(2,9,'Bubble (シャボン玉) - Tido Kang','aaaaaaaa1', 'pianoman77', '気に入った');
insert into mbookmark(bmnum, bnum, title, custid, bcid, bmcontent)values(3,12,'Amelie(アーメリエ) OST - 楽譜/Solo/Duo ver.映像参照','aaaaaaaa1', 'kimyoon1231', 'いい歌');
insert into mbookmark(bmnum, bnum, title, custid, bcid, bmcontent)values(4,14,'A hisa - Pastel Subliminal','aaaaaaaa1', 'pianoman77',  '俺の趣味');


insert into msg(mnum, sendid, reid, title, text, delsen, delrec, booksen, bookrec)values(1 , 'tomato2018' , 'aaaaaaaa1', '一緒に練習しますか？' , '曲はくそで、見ていられないが' , 0  ,0 ,1 , 1  );
insert into msg(mnum, sendid, reid, title, text, delsen, delrec, booksen, bookrec)values(2 , 'aaaaaaaa1' , 'tomato2018', '良いですね！いつでも！', 'だが殺す、表でろや！！！' , 0 , 0, 1, 1 );
insert into msg(mnum, sendid, reid, title, text, delsen, delrec, booksen, bookrec)values(3 , 'aaaaaaaa1' , 'pianoman77', 'いい局です', 'これからも音楽奴隷よろ' ,0  , 0,0 ,1  );
insert into msg(mnum, sendid, reid, title, text, delsen, delrec, booksen, bookrec)values(4 , 'hyojung1' , 'aaaaaaaa1', '曲の作り方勉強しましょう', '今週末でどうでしょう' , 0 ,0 ,0 ,1  );
insert into msg(mnum, sendid, reid, title, text, delsen, delrec, booksen, bookrec)values(5 , 'bach1685' , 'aaaaaaaa1', '私と趣味が同じな気がする' , 'うｐする曲が同じ趣味だ' ,0  ,0 ,0 , 0 );
insert into msg(mnum, sendid, reid, title, text, delsen, delrec, booksen, bookrec)values(6 , 'aaaaaaaa1' , 'kimyoon1231', '[現役プロバンド]ベース担当探してます' , 'フリー掲示板に動画リンクしてください、面接代わりです' , 0 , 0 ,0 ,0 );




commit;
