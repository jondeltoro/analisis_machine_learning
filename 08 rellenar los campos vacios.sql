UPDATE parking_clean SET 
issue_date = replace(issue_date,'/',''), 
unregistered_vehicle = case when unregistered_vehicle = '' then 2 else unregistered_vehicle end,
violation_location = case when violation_location = '' then 0 else violation_location end;

