drop table if exists posts;
create table posts (
  id integer primary key,
  title text,
  body text,
  user_id integer
  created_at,
  updated_at
);


insert into posts(title,body) values ('post1', 'これはtwitterを見本に作成したアプリケーションです。
好きなことをみんなで投稿しましょう。');
insert into posts(title,body) values ('post2', 'これはtwitterを見本に作成したアプリケーションです。
好きなことをみんなで投稿しましょう。');
insert into posts(title,body) values ('post3', 'これはtwitterを見本に作成したアプリケーションです。
好きなことをみんなで投稿しましょう。');
insert into posts(title,body) values ('post4', 'これはtwitterを見本に作成したアプリケーションです。
好きなことをみんなで投稿しましょう。');
insert into posts(title,body) values ('post5', 'これはtwitterを見本に作成したアプリケーションです。
好きなことをみんなで投稿しましょう。');
