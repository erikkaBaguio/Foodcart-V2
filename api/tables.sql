CREATE TABLE Food
(	id				SERIAL8 PRIMARY KEY,
	food_name		TEXT NOT NULL,
	description		TEXT NOT NULL,
	unit_cost		FLOAT,
	is_active		BOOLEAN DEFAULT TRUE
);

CREATE TABLE Category
(
	id           	SERIAL8 PRIMARY KEY,
	category_name	TEXT NOT NULL,
	is_active       BOOLEAN DEFAULT TRUE
);

CREATE TABLE Restaurant
(
	id           	SERIAL8 PRIMARY KEY,
	resto_name 		TEXT NOT NULL,
	min_order		FLOAT,
	delivery_fee	FLOAT,
  	is_active       BOOLEAN DEFAULT TRUE
);