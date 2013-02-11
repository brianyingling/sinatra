create table friends (
  id serial4 primary key,
  name varchar(255) not null,
  age int4,
  gender char(1),
  image varchar(255),
  twitter varchar(255),
  github varchar(255),
  description text
);