-- DDL for homework  1 by giorgi gvelesiani

-- 1
create schema homework1;
use homework1;

create table country(
	id int not null auto_increment,
    name_co varchar(50) not null,
    iso char(3) not null,
    
    constraint pk_co primary key(id),
    constraint un_co unique(iso)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
    
create table city(
	id int not null auto_increment,
    country int not null,
    name_ci varchar(100) not null,
    phone varchar(20),
    
    constraint pk_ci primary key(id),
    constraint fk_ci foreign key(country) references country(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table hotel(
	id int not null auto_increment,
    city int not null,
    name_ho varchar(100) not null,
    address varchar(100),
    stars int,
    
    constraint pk_ho primary key(id),
    constraint fk_ho foreign key(city) references city(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table clients(
	id int not null auto_increment,
    idnum varchar(50) not null,
    name_cl varchar(50) not null,
    lastName varchar(50) not null,
    gender char(1) not null,
    birthDate date,
    phone varchar(50),
    email varchar(80) not null,
    
    constraint pk_cl primary key(id),
    constraint un_cl unique(idnum)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table booking(
	hotel int not null,
    guest int not null,
    startDate date not null,
    endDate date not null,
    
    constraint fk_bo_ho foreign key(hotel) references hotel(id),
    constraint fk_bo_gu foreign key(guest) references clients(id)
);