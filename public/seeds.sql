drop table if exists posts;
create table posts (
  id integer primary key,
  title text,
  body text,
  user_id integer,
  created_at,
  updated_at
);

drop table if exists users;
create table users (
  id integer primary key,
  name text,
  password text,
  created_at,
  updated_at
);


insert into posts(title,body,user_id) values ('post1', 'これはtwitterを見本に作成したアプリケーションです。
好きなことをみんなで投稿しましょう。',1);
insert into posts(title,body,user_id) values ('post2', 'これはtwitterを見本に作成したアプリケーションです。
好きなことをみんなで投稿しましょう。',1);
insert into posts(title,body,user_id) values ('post3', 'これはtwitterを見本に作成したアプリケーションです。
好きなことをみんなで投稿しましょう。',1);
insert into posts(title,body,user_id) values ('post4', 'これはtwitterを見本に作成したアプリケーションです。
好きなことをみんなで投稿しましょう。',1);
insert into posts(title,body,user_id) values ('post5', 'これはtwitterを見本に作成したアプリケーションです。
好きなことをみんなで投稿しましょう。',1);
