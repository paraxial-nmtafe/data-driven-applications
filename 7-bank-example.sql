DROP DATABASE if EXISTS bank;
CREATE DATABASE bank;

USE bank;

CREATE TABLE accounts (
	id BIGINT unsigned PRIMARY KEY AUTO_INCREMENT,
	user_id BIGINT UNSIGNED,
	balance BIGINT NOT NULL DEFAULT 0,
	created_at DATETIME not null DEFAULT current_timestamp,
	updated_at DATETIME not null default current_timestamp ON update CURRENT_TIMESTAMP
);

CREATE TABLE users (
id BIGINT unsigned PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(255),
last_names VARCHAR(255)
);

ALTER TABLE accounts ADD FOREIGN KEY(user_id) REFERENCES users(id);

INSERT INTO users
	(first_name, last_names)
VALUES
	("Mark", "Liu"),
	("Colette", "Smith");


-- Setting our original balances
-- They aren't rich, I'm giving them their balances in cents.  Any ideas why I'm doing that?
-- (Based on your answers to KBA 1 and KBA 2)
-- ((Yes, there is a money datatype, but this was a convenient workaround in companies I worked in))
INSERT INTO accounts
	(user_id, balance)
VALUES
	((SELECT id FROM users WHERE first_name = "Mark" LIMIT 1), 20000),
	((SELECT id FROM users WHERE first_name = "Colette" LIMIT 1), 10000);

SELECT *
FROM accounts
JOIN users ON users.id = accounts.user_id;


-- Those of you who are accountants are probably more familiar with double entry than I am.
/*
-- Start transaction;
UPDATE accounts
SET balance = balance - 10000
WHERE accounts.user_id = (SELECT id FROM users WHERE first_name = 'Mark' LIMIT 1);
SELECT * FROM accounts;
-- rollback; -- Example
UPDATE accounts
SET balance = balance + 10000
WHERE accounts.user_id = (SELECT id FROM users WHERE first_name = 'Colette' LIMIT 1);
SELECT * FROM accounts;
-- commit;

SELECT *
FROM accounts
JOIN users ON users.id = accounts.user_id;

*/
