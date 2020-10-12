SELECT  'registration_state', 'plate_type', 'issue_date', 
	    'vehicle_body_type', 'vehicle_make', 'issuing_agency', 
        'street_name', 'intersecting_street', 'street_code1', 
        'street_code2', 'street_code3', 'violation_location', 
        'violation_precinct', 'issuer_precinct', 'issuer_code', 
        'issuer_command', 'issuer_squad', 'violation_time',
        'violation_county', 'violation_in_front_of_or_opposite', 
        'law_section', 'sub_division', 'vehicle_color', 
        'unregistered_vehicle', 'vehicle_year', 'has_meter', 'target'
UNION ALL
SELECT 
	registration_state_id as registration_state,
    plate_type_id as plate_type, 
    issue_date,
    vehicle_body_type_id as vehicle_body_type,
    vehicle_make_id as vehicle_make,
    issuing_agency_id as issuing_agency,
    street_name_id as street_name,
    intersecting_street_id as intersecting_street,
    street_code1,
    street_code2,
    street_code3,
    violation_location,
    violation_precinct,
    issuer_precinct,
    issuer_code,
    issuer_command_id as issuer_command,
    issuer_squad_id as issuer_squad,
    violation_time_id as violation_time,
    violation_county_id as violation_county,
    violation_in_front_of_or_opposite_id as violation_in_front_of_or_opposite,
    law_section,
    sub_division_id as sub_division,
    vehicle_color_id as vehicle_color,
    unregistered_vehicle,
    vehicle_year,
    has_meter,
    target
INTO OUTFILE '/tmp/dataset.csv'
  FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
  LINES TERMINATED BY '\n'
  FROM parking_clean;
