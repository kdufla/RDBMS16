
create schema homework2;
use homework2;

create table persons(
  id int not null auto_increment,
  idnumber varchar(100),
  first_name varchar(100),
  last_name varchar(100),
  birth_date date,

  constraint pk_pe primary key(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table person_addresses(
  id int not null auto_increment,
  settlement_type varchar(100),
  settlement_name varchar(100),
  address varchar(150),
  person_id int,

  constraint pk_pa primary key(id),
  constraint fk_pa foreign key(person_id) references persons(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table phone_numbers(
  phone_number_id int not null auto_increment,
  number_prefix varchar(3),
  number_base varchar(6),
  active varchar(5),
  person_id int,

  constraint pk_pn primary key(phone_number_id),
  constraint fk_pn foreign key(person_id) references persons(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table call_logs(
  id int not null auto_increment,
  call_log_type varchar(3),
  phone_number_id int,
  other_phone_number varchar(9),
  call_date datetime,
  call_duration int,
  call_cost int,

  constraint pk_cl primary key(id),
  constraint fk_cl foreign key(phone_number_id) references phone_numbers(phone_number_id)
);

create table phone_number_balances(
  id int not null auto_increment,
  balance_total int,
  balance_used int,
  balance_fill_date datetime,
  phone_number_id int,

  constraint pk_pnb primary key(id),
  constraint fk_pnb foreign key(phone_number_id) references phone_numbers(phone_number_id)
);