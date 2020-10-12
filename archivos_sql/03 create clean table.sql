CREATE TABLE parking_clean
SELECT registration_state,
plate_type, issue_date,
vehicle_body_type, vehicle_make,
issuing_agency, street_name,
intersecting_street, street_code1,
street_code2, street_code3,
violation_location, violation_precinct,
issuer_precinct, issuer_code,
issuer_command, issuer_squad,
violation_time, violation_county,
violation_in_front_of_or_opposite, law_section, 
sub_division, vehicle_color, 
unregistered_vehicle, vehicle_year, 
case when length(meter_number)>0 then 1 else 0 end has_meter,
case when violation_code in(21,36,38) then 1 else 0 end as target 
FROM parking;
