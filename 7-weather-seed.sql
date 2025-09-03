CREATE DATABASE meteorology;

USE meteorology;

CREATE TABLE weather (
	`date` DATE PRIMARY KEY,
	rainfall_in_mm INT,
	min_temp INT,
	max_temp int
);

DESCRIBE weather;

INSERT INTO weather
(DATE, rainfall_in_mm, min_temp, max_temp)
VALUES
('2025-09-03', 0, 5, 18),
('2025-09-04', 0, 5, 12),
('2025-09-05', 2, 3, 19),
('2025-09-06', 2, 3, 45),
('2025-09-07', 5, 9, 42),
('2025-09-08', 5, 9, 42),
('2025-09-09', 200, 9, 10),
('2025-09-22', 0, 14, 29),
('2025-09-28', 9, 15, 27);