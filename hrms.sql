-- public.company definition

-- Drop table

-- DROP TABLE public.company;

CREATE TABLE public.company (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	company_name varchar NOT NULL,
	web_site varchar NOT NULL,
	phone varchar NOT NULL,
	CONSTRAINT company_pk PRIMARY KEY (id)
);


-- public.employee definition

-- Drop table

-- DROP TABLE public.employee;

CREATE TABLE public.employee (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	first_name varchar NOT NULL,
	last_name varchar NOT NULL,
	tc_kimlik_no varchar(11) NOT NULL,
	birth_date date NOT NULL,
	CONSTRAINT employee_pk PRIMARY KEY (id)
);


-- public.job_advert definition

-- Drop table

-- DROP TABLE public.job_advert;

CREATE TABLE public.job_advert (
	id int8 NOT NULL,
	title varchar NULL,
	CONSTRAINT job_advert_pk PRIMARY KEY (id)
);
CREATE INDEX job_advert_title_idx ON public.job_advert USING btree (title);


-- public."system_user" definition

-- Drop table

-- DROP TABLE public."system_user";

CREATE TABLE public."system_user" (
	id int8 NOT NULL,
	first_name varchar NOT NULL,
	last_name varchar NOT NULL,
	CONSTRAINT system_user_pk PRIMARY KEY (id)
);


-- public.job_advert_company definition

-- Drop table

-- DROP TABLE public.job_advert_company;

CREATE TABLE public.job_advert_company (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	job_advert_id int8 NOT NULL,
	company_id int8 NOT NULL,
	CONSTRAINT job_advert_company_pk PRIMARY KEY (id),
	CONSTRAINT job_advert_company_fk FOREIGN KEY (id) REFERENCES company(id),
	CONSTRAINT job_advert_company_fk_1 FOREIGN KEY (id) REFERENCES job_advert(id)
);


-- public."user" definition

-- Drop table

-- DROP TABLE public."user";

CREATE TABLE public."user" (
	id int8 NOT NULL GENERATED ALWAYS AS IDENTITY,
	email varchar NULL,
	"password" varchar NULL,
	CONSTRAINT user_pk PRIMARY KEY (id),
	CONSTRAINT user_fk FOREIGN KEY (id) REFERENCES company(id),
	CONSTRAINT user_fk_1 FOREIGN KEY (id) REFERENCES employee(id),
	CONSTRAINT user_fk_2 FOREIGN KEY (id) REFERENCES system_user(id)
);
CREATE INDEX user_email_idx ON public."user" USING btree (email);