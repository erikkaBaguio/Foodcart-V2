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