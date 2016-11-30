create or replace function store_user(par_fname VARCHAR, par_mname VARCHAR, par_lname VARCHAR, par_address VARCHAR, par_email VARCHAR,
									 par_mobileNum INT, par_password VARCHAR, par_roleID INT, par_points INT)
	returns text as
	$$
		DECLARE
			loc_email TEXT;
			loc_res TEXT;
		BEGIN
			SELECT INTO loc_email email FROM Userinfo WHERE email = par_email;
				if loc_email isnull THEN

			if par_fname = '' or par_mname = '' or par_lname = '' or par_address = '' or par_email = '' or par_mobileNum = '' or par_password = ''
							or par_roleID = '' or par_points = '' THEN
				loc_res = 'Error';
			ELSE
				INSERT INTO Userinfo(fname, mname, lname, address, email, mobile_number, password, role_id, earned_points) VALUES (par_fname, par_mname, 
								par_lname, par_address, par_email, par_mobileNum, par_password, par_roleID, par_points);

				loc_res = 'OK';
			END IF;
			ELSE
				loc_res = 'ID ALREADY EXISTS';
			END IF;

			RETURN loc_res;
		END;
	$$
		language 'plpgsql';