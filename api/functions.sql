create or replace function store_restaurant(par_restoName text, par_minOrder float, par_deliveryFee float, par_location text)
	returns text as
	$$
		DECLARE
			local_response text;
		BEGIN

			if  par_restoName = '' or
				par_minOrder = '' or
				par_deliveryFee = '' or
				par_location = ''
			
			THEN

				loacal_response = 'Error';
			ELSE	

			insert into Restaurant(id, resto_name, min_order, delivery_fee, location)
			values (par_restoID, par_restoName, par_minOrder, par_deliveryFee);
			
			local_response = "OK";
			
			END IF;

			return local_response;
		END;
	$$
		language 'plpgsql';