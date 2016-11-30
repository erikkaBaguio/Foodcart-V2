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