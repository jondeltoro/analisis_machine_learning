update parking_clean t1
inner join registration_state on t1.registration_state  = registration_state.registration_state
set t1.registration_state_id = registration_state.id; 
update parking_clean t1
inner join plate_type on t1.plate_type  = plate_type.plate_type
set t1.plate_type_id = plate_type.id; 
update parking_clean t1
inner join vehicle_body_type on t1.vehicle_body_type  = vehicle_body_type.vehicle_body_type
set t1.vehicle_body_type_id = vehicle_body_type.id; 
update parking_clean t1
inner join vehicle_make on t1.vehicle_make  = vehicle_make.vehicle_make
set t1.vehicle_make_id = vehicle_make.id; 
update parking_clean t1
inner join issuing_agency on t1.issuing_agency  = issuing_agency.issuing_agency
set t1.issuing_agency_id = issuing_agency.id; 
update parking_clean t1
inner join street_name on t1.street_name  = street_name.street_name
set t1.street_name_id = street_name.id; 
update parking_clean t1
inner join intersecting_street on t1.intersecting_street  = intersecting_street.intersecting_street
set t1.intersecting_street_id = intersecting_street.id; 
update parking_clean t1
inner join issuer_command on t1.issuer_command  = issuer_command.issuer_command
set t1.issuer_command_id = issuer_command.id; 
update parking_clean t1
inner join issuer_squad on t1.issuer_squad  = issuer_squad.issuer_squad
set t1.issuer_squad_id = issuer_squad.id; 
update parking_clean t1
inner join violation_time on t1.violation_time  = violation_time.violation_time
set t1.violation_time_id = violation_time.id; 
update parking_clean t1
inner join violation_county on t1.violation_county  = violation_county.violation_county
set t1.violation_county_id = violation_county.id; 
update parking_clean t1
inner join violation_in_front_of_or_opposite on t1.violation_in_front_of_or_opposite  = violation_in_front_of_or_opposite.violation_in_front_of_or_opposite
set t1.violation_in_front_of_or_opposite_id = violation_in_front_of_or_opposite.id; 
update parking_clean t1
inner join sub_division on t1.sub_division  = sub_division.sub_division
set t1.sub_division_id = sub_division.id;
update parking_clean t1
inner join vehicle_color on t1.vehicle_color  = vehicle_color.vehicle_color
set t1.vehicle_color_id = vehicle_color.id;