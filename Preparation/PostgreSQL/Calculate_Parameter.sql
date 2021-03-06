-- Calculate important parameters:
    
--Duration in minutes:
ALTER TABLE germany.routes ADD COLUMN duration_min double precision;
UPDATE germany.routes SET duration_min = EXTRACT(epoch FROM (TIMESTAMPEND - TIMESTAMPSTART))/60 ;

-- Create index
DROP INDEX if exists idx_germany_routes_duration_min;
CREATE INDEX idx_germany_routes_duration_min ON germany.routes(duration_min);


--Distance in meters (rounded to two decimal places, column 'geom' have to be LINESTRING
ALTER TABLE germany.routes ADD COLUMN distance_m double precision;
UPDATE germany.routes SET distance_m = ROUND(ST_Length(geom)::numeric,2) ;


--Mean speed in km/h
ALTER TABLE germany.routes ADD COLUMN mean_speed double precision;
UPDATE germany.routes SET mean_speed = CASE
   WHEN duration_min > 0 THEN(distance_m/1000)/(duration_min/60)
   ELSE 99999
END;

DROP INDEX if exists idx_germany_routes_speed;
CREATE INDEX idx_germany_routes_speed ON germany.routes(mean_speed);

