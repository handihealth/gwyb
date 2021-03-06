drop table patients;
drop table professionals;
drop table recipients;
drop table actions ;
drop table action_content ;
drop table rules;
drop table char_codes ;
drop table event_logs ;



create table patients (
	id serial not null primary key,
	title varchar (20),
	first_name varchar (255),
	last_name varchar (255),
	nhs_number varchar (10),
	email varchar (255),
	tel_no varchar (20),
	fax_no varchar (20)
);

insert into patients values (DEFAULT, 'Mr', 'John', 'Smith', '7876236676', 'j.smith@someemailhost.com', '01234 567890', NULL);
insert into patients values (DEFAULT, 'Ms', 'Jane', 'Smith', '2536623652', 'j.smith@anothremailhost.com', '01234 567890', NULL);

create table professionals (
	id serial not null primary key,
	title varchar (20),
	first_name varchar (255),
	last_name varchar (255),
	email varchar (255),
	tel_no varchar (20),
	fax_no varchar (20)
);

insert into professionals values (DEFAULT, 'Dr', 'A', 'Jones', 'a.jones@annhsemailaddress.com', '0872872882', NULL);

create table recipients (
	id serial not null primary key,
	patient_id integer,
	professional_id integer
);

insert into recipients values (DEFAULT, 1, NULL);
insert into recipients values (DEFAULT, 2, NULL);
insert into recipients values (DEFAULT, NULL, 1);


create table actions (
	id serial not null primary key,
    rule_id integer not null,
	action_code varchar(8),
    tel_no varchar (20),
    email varchar(255),
    payload text 
);

create table action_content (
	id serial not null primary key,
	action_type varchar(8),
	content text
);
	
create table rules (
	id serial not null primary key,
	nhs_number varchar (10),
	event_code varchar(8)
);

insert into rules values (DEFAULT, '157286255', 'AT007');
insert into rules values (DEFAULT, '157286255', 'AT008');

insert into actions values (DEFAULT, 1, 'EMAIL', '', 'kasjkd@jhjgsd.com', 'This is email to send');
insert into actions values (DEFAULT, 2, 'SMS', '01234 56788', '', 'This is text to send');

create table char_codes (
	domain	varchar(8) not null,
	char_code varchar(8) not null primary key,
	description varchar (255)
);

create table event_logs (
	id serial not null primary key,
	rule_id integer not null,
	reason varchar(255),
	event_time date,
	action_time date
);

insert into char_codes values ('DOM', 'ACTT', 'Action type');
insert into char_codes values ('DOM', 'EVTT', 'Event type');
insert into char_codes values ('EVTT', 'AT007', 'Admission');
insert into char_codes values ('EVTT', 'AT008', 'Ambulance');
insert into char_codes values ('EVTT', 'AT009', 'Lab results');
insert into char_codes values ('ACTT', 'EML', 'Email');
insert into char_codes values ('ACTT', 'FAX', 'Fax');
insert into char_codes values ('ACTT', 'SMS', 'SMS message');
insert into char_codes values ('ACTT', 'LET', 'Letter');


