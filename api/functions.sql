create or replace function store_role(par_rname VARCHAR)
	returns text as
	$$
		DECLARE
			loc_res TEXT;
		BEGIN
			if par_rname = '' THEN
				loc_res = 'Error';
			ELSE
				INSERT INTO	Roles(role_name) VALUES (par_rname);

				loc_res = 'Role Added!'
			END IF;
			RETURN loc_res;
		END;
	$$
		language 'plpgsql';


create or replace function get_role(OUT INT, OUT VARCHAR)
	RETURNS SETOF RECORD as
	$$
		SELECT id, role_name FROM Roles;
	$$
		language 'sql';


create or replace function show_role(in par_id, OUT VARCHAR)
	RETURNS SETOF RECORD as
	$$
		SELECT role_name FROM Roles WHERE id = par_id;
	$$
		language 'sql';


create or replace function update_role(in par_id, par_rname VARCHAR)
	RETURNS VOID as
	$$
		UPDATE Roles
		SET
			role_name = par_rname
		WHERE id = par_id;
	$$
		language 'sql';
