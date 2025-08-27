DROP DATABASE if EXISTS computer;
CREATE database computer;

USE computer;

CREATE TABLE if NOT EXISTS folders (
	id	BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(255),
	last_accessed_at DATETIME,
	last_changed_at DATETIME,
	created_at DATETIME,
	`owner` VARCHAR(255)
);

DESCRIBE folders;

CREATE TABLE if NOT EXISTS files (
	id	BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(255),
	last_accessed_at DATETIME,
	last_changed_at DATETIME,
	created_at DATETIME,
	`owner` VARCHAR(255),
	file_size BIGINT,
	folder_id BIGINT UNSIGNED,
	FOREIGN KEY (folder_id) REFERENCES folders(id)
);

DESCRIBE files;