CREATE TABLE `registration_state` (
  `id` int NOT NULL AUTO_INCREMENT,
  `registration_state` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `registration_stateindex` (`registration_state`)
) ENGINE=InnoDB   DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `plate_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `plate_type` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `plate_typeindex` (`plate_type`)
) ENGINE=InnoDB   DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `vehicle_body_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vehicle_body_type` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `vehicle_body_typeindex` (`vehicle_body_type`)
) ENGINE=InnoDB   DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `vehicle_make` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vehicle_make` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `vehicle_makeindex` (`vehicle_make`)
) ENGINE=InnoDB   DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `issuing_agency` (
  `id` int NOT NULL AUTO_INCREMENT,
  `issuing_agency` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `issuing_agencyindex` (`issuing_agency`)
) ENGINE=InnoDB   DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `street_name` (
  `id` int NOT NULL AUTO_INCREMENT,
  `street_name` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `street_nameindex` (`street_name`)
) ENGINE=InnoDB   DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `intersecting_street` (
  `id` int NOT NULL AUTO_INCREMENT,
  `intersecting_street` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `intersecting_streetindex` (`intersecting_street`)
) ENGINE=InnoDB   DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `issuer_command` (
  `id` int NOT NULL AUTO_INCREMENT,
  `issuer_command` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `issuer_commandindex` (`issuer_command`)
) ENGINE=InnoDB   DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `issuer_squad` (
  `id` int NOT NULL AUTO_INCREMENT,
  `issuer_squad` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `issuer_squadindex` (`issuer_squad`)
) ENGINE=InnoDB   DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `violation_time` (
  `id` int NOT NULL AUTO_INCREMENT,
  `violation_time` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `violation_timeindex` (`violation_time`)
) ENGINE=InnoDB   DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `violation_county` (
  `id` int NOT NULL AUTO_INCREMENT,
  `violation_county` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `violation_countyindex` (`violation_county`)
) ENGINE=InnoDB   DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `violation_in_front_of_or_opposite` (
  `id` int NOT NULL AUTO_INCREMENT,
  `violation_in_front_of_or_opposite` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `violation_in_front_of_or_oppositeindex` (`violation_in_front_of_or_opposite`)
) ENGINE=InnoDB   DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `sub_division` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sub_division` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `sub_divisionindex` (`sub_division`)
) ENGINE=InnoDB   DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `vehicle_color` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vehicle_color` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `vehicle_colorindex` (`vehicle_color`)
) ENGINE=InnoDB   DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
