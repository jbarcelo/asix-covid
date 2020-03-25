create database coviddb;
\c coviddb;

create table symptoms (
    cod_symptoms int primary key,
    name varchar(50),
    details text
);

create table state (
    cod_state int primary key,
    name varchar(50)
);

create table patient (
    cod_patient int primary key,
    name varchar(50),
    surname1 varchar(50),
    surname2 varchar(50),
    birth_date date,
    death_date date,
    cod_state int,
    check (death_date>='2019-12-01'),
    foreign key (cod_state) references state(cod_state)
);

create table has (
    cod_patient int primary key,
    cod_symptoms int,
    symptom_date date,
    severity int,
    check (symptom_date>='2019-12-01'), 
    check (severity between 0 and 5),
    unique (cod_patient, cod_symptoms, symptom_date),
    foreign key (cod_patient) references patient(cod_patient),
    foreign key (cod_symptoms) references symptoms(cod_symptoms)
);

insert into state values (1,'Andalucía');
insert into state values (2,'Aragón');
insert into state values (3,'Principado de Asturias');
insert into state values (4,'Baleares');
insert into state values (5,'Canarias');
insert into state values (6,'Cantabria');
insert into state values (7,'Castilla-La Mancha');
insert into state values (8,'Castilla y León');
insert into state values (9,'Cataluña');
insert into state values (10,'Extremadura');
insert into state values (11,'Galicia');
insert into state values (12,'La Rioja');
insert into state values (13,'Comunidad de Madrid');
insert into state values (14,'Región de Murcia');
insert into state values (15,'Comunidad Foral de Navarra');
insert into state values (16,'País Vasco');
insert into state values (17,'Comunidad Valenciana');