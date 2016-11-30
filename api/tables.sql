create table Roles
(
	id 				SERIAL8 PRIMARY KEY,
	role_name		VARCHAR(30) NOT NULL
);

create table Userinfo
(
	id				SERIAL8 PRIMARY KEY,
	fname			VARCHAR(50),
	mname			VARCHAR(50),
	lname			VARCHAR(50),
	address			VARCHAR(100) NOT NULL,
	email			VARCHAR(50),
	mobile_number	INT,
	password		VARCHAR(50),
	role_id			INT REFERENCES Roles(id),
	earned_points	INT
);

create table Order_food
(
	id 					SERIAL8 PRIMARY KEY,
	food_id				INT REFERENCES Food(id),
	quantity			INT
);

create table Transaction
(
	id 						SERIAL8 PRIMARY KEY,
	transaction_number		VARCHAR(20),
	transaction_date		DATE,
	payer_id				INT REFERENCES Userinfo(id),
	payment_id				INT,
	paypal_token			VARCHAR(255) NULL,
	name 					VARCHAR(50),
	contact_number			INT,
	email_address			VARCHAR(50),
	delivery_fee			FLOAT,
	order_id 				INT REFERENCES Orders(id),
	total					FLOAT,
	confirmed				BOOLEAN DEFAULT FALSE,
	is_active				BOOLEAN DEFAULT FALSE
);