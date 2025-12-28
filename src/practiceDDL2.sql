
create table companies(
                          id serial primary key ,
                          name varchar(100) not null,
                          industry varchar (200)
);

create table employees(
                          id serial primary key,
                          first_name varchar(50) ,
                          last_name varchar(50),
                          position varchar (100),
                          salary decimal(10,2) not null check ( salary > 0 ),
                          company_id int references companies (id)
);

alter table companies add column foundation_date date;
alter table companies  rename column industry to business_area;

alter table employees add column date_of_birth date;
alter table employees rename column position to position_ru;