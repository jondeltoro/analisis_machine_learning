ALTER TABLE `parking_clean` 
ADD COLUMN `registration_state_id` INT NULL AFTER `registration_state`; 
ALTER TABLE `parking_clean` 
ADD COLUMN `plate_type_id` INT NULL AFTER `plate_type`; 
ALTER TABLE `parking_clean` 
ADD COLUMN `vehicle_body_type_id` INT NULL AFTER `vehicle_body_type`; 
ALTER TABLE `parking_clean` 
ADD COLUMN `vehicle_make_id` INT NULL AFTER `vehicle_make`; 
ALTER TABLE `parking_clean` 
ADD COLUMN `issuing_agency_id` INT NULL AFTER `issuing_agency`; 
ALTER TABLE `parking_clean` 
ADD COLUMN `street_name_id` INT NULL AFTER `street_name`; 
ALTER TABLE `parking_clean` 
ADD COLUMN `intersecting_street_id` INT NULL AFTER `intersecting_street`; 
ALTER TABLE `parking_clean` 
ADD COLUMN `issuer_command_id` INT NULL AFTER `issuer_command`; 
ALTER TABLE `parking_clean` 
ADD COLUMN `issuer_squad_id` INT NULL AFTER `issuer_squad`;  
ALTER TABLE `parking_clean` 
ADD COLUMN `violation_time_id` INT NULL AFTER `violation_time`;  
ALTER TABLE `parking_clean` 
ADD COLUMN `violation_county_id` INT NULL AFTER `violation_county`;  
ALTER TABLE `parking_clean` 
ADD COLUMN `violation_in_front_of_or_opposite_id` INT NULL AFTER `violation_in_front_of_or_opposite`;  
ALTER TABLE `parking_clean` 
ADD COLUMN `sub_division_id` INT NULL AFTER `sub_division`;  
ALTER TABLE `parking_clean` 
ADD COLUMN `vehicle_color_id` INT NULL AFTER `vehicle_color`;