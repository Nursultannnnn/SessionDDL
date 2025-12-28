create table Author
(
    id            serial primary key,
    names         varchar(50),
    date_of_birth date,
    nationality   varchar
);

alter table Author
    add column email varchar(250);
alter table Author
drop column nationality;

alter table Author
    add constraint author_unique_email UNIQUE (email);
alter table Author
    alter column names set not null;

alter table Author
alter column names type text;
alter table Author
    rename to authors2;

create table books
(
    id             serial primary key,
    name           varchar(100) not null,
    published_year int check ( published_year > 1900 ),
    authors2_id    int references authors2 (id)
);

alter table books
    alter column name set not null;
alter table books
    add constraint books_name_unique unique (name);

INSERT INTO authors2 (names, date_of_birth, email)
VALUES ('Лев Толстой', '1828-09-09', 'tolstoy@example.com'),
       ('Фёдор Достоевский', '1821-11-11', 'dostoevsky@example.com');

INSERT INTO books (name, published_year, authors2_id)
VALUES ('Война и мир', 1969, 1),
       ('Анна Каренина', 1977, 1),
       ('Преступление и наказание', 1966, 2),
       ('Идиот', 1969, 2),
       ('Братья Карамазовы', 1980, 2),
       ('Воскресение', 1999, 1);


