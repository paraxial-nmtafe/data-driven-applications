-- Sakila Sample Database Schema
-- Version 1.5.1

-- This copy of the Sakila database has been modified from the original 1.5 version supplied by Oracle in 2026.
-- It has been produced for the use of North Metropolitan TAFE (NMTAFE) students, and is not endorsed by Oracle.
-- It contains a subset of the original Sakila database.

-- The original copyright and guarantee remain below.  NMTAFE likewise provides the scripts "as is".

-- Copyright (c) 2006, 2026, Oracle and/or its affiliates.

-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions are
-- met:

-- * Redistributions of source code must retain the above copyright notice,
--   this list of conditions and the following disclaimer.
-- * Redistributions in binary form must reproduce the above copyright
--   notice, this list of conditions and the following disclaimer in the
--   documentation and/or other materials provided with the distribution.
-- * Neither the name of Oracle nor the names of its contributors may be used
--   to endorse or promote products derived from this software without
--   specific prior written permission.

-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
-- IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
-- PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
-- CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
-- EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
-- PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
-- PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
-- LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
-- NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
-- SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

SET NAMES utf8mb4;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS sakila_tafe;
CREATE SCHEMA sakila_tafe;
USE sakila_tafe;

--
-- Table structure for table `actors`
--

CREATE TABLE actors (
  id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY  (id),
  KEY idx_actor_last_name (last_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `address`
--

CREATE TABLE addresses (
  id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  address VARCHAR(50) NOT NULL,
  address2 VARCHAR(50) DEFAULT NULL,
  district VARCHAR(20) NOT NULL,
  city_id SMALLINT UNSIGNED NOT NULL,
  postal_code VARCHAR(10) DEFAULT NULL,
  phone VARCHAR(20) NOT NULL,
  -- Add GEOMETRY column for MySQL 5.7.5 and higher
  -- Also include SRID attribute for MySQL 8.0.3 and higher
  /*!50705 location GEOMETRY */ /*!80003 SRID 0 */ /*!50705 NOT NULL,*/
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY  (id),
  KEY idx_fk_city_id (city_id),
  /*!50705 SPATIAL KEY `idx_location` (location),*/
  CONSTRAINT `fk_address_city` FOREIGN KEY (city_id) REFERENCES cities (id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `categories`
--

CREATE TABLE categories (
  id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(25) NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `cities`
--

CREATE TABLE cities (
  id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  city VARCHAR(50) NOT NULL,
  country_id SMALLINT UNSIGNED NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY  (id),
  KEY idx_fk_country_id (country_id),
  CONSTRAINT `fk_city_country` FOREIGN KEY (country_id) REFERENCES countries (id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `countries`
--

CREATE TABLE countries (
  id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  country VARCHAR(50) NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `customers`
--

CREATE TABLE customers (
  id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  email VARCHAR(50) DEFAULT NULL,
  address_id SMALLINT UNSIGNED NOT NULL,
  active BOOLEAN NOT NULL DEFAULT TRUE,
  create_date DATETIME NOT NULL,
  last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY idx_fk_address_id (address_id),
  KEY idx_last_name (last_name),
  CONSTRAINT fk_customer_address FOREIGN KEY (address_id) REFERENCES addresses (id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `films`
--

CREATE TABLE films (
  id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  title VARCHAR(128) NOT NULL,
  description TEXT DEFAULT NULL,
  release_year YEAR DEFAULT NULL,
  language_id TINYINT UNSIGNED NOT NULL,
  original_language_id TINYINT UNSIGNED DEFAULT NULL,
  rental_duration TINYINT UNSIGNED NOT NULL DEFAULT 3,
  rental_rate DECIMAL(4,2) NOT NULL DEFAULT 4.99,
  length SMALLINT UNSIGNED DEFAULT NULL,
  replacement_cost DECIMAL(5,2) NOT NULL DEFAULT 19.99,
  rating ENUM('G','PG','PG-13','R','NC-17') DEFAULT 'G',
  special_features SET('Trailers','Commentaries','Deleted Scenes','Behind the Scenes') DEFAULT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY  (id),
  KEY idx_title (title),
  KEY idx_fk_language_id (language_id),
  KEY idx_fk_original_language_id (original_language_id),
  CONSTRAINT fk_film_language FOREIGN KEY (language_id) REFERENCES languages (id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_film_language_original FOREIGN KEY (original_language_id) REFERENCES languages (id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `film_actor`
--

CREATE TABLE film_actor (
  actor_id SMALLINT UNSIGNED NOT NULL,
  film_id SMALLINT UNSIGNED NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY  (actor_id,film_id),
  KEY idx_fk_film_id (`film_id`),
  CONSTRAINT fk_film_actor_actor FOREIGN KEY (actor_id) REFERENCES actors (id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_film_actor_film FOREIGN KEY (film_id) REFERENCES films (id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `film_category`
--

CREATE TABLE film_category (
  film_id SMALLINT UNSIGNED NOT NULL,
  category_id TINYINT UNSIGNED NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (film_id, category_id),
  CONSTRAINT fk_film_category_film FOREIGN KEY (film_id) REFERENCES films (id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_film_category_category FOREIGN KEY (category_id) REFERENCES categories (id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `film_text`
--
-- InnoDB added FULLTEXT support in 5.6.10. If you use an
-- earlier version, then consider upgrading (recommended) or
-- changing InnoDB to MyISAM as the film_text engine
--

-- Use InnoDB for film_text as of 5.6.10, MyISAM prior to 5.6.10.
SET @old_default_storage_engine = @@default_storage_engine;
SET @@default_storage_engine = 'MyISAM';
/*!50610 SET @@default_storage_engine = 'InnoDB'*/;

CREATE TABLE film_text (
  film_id SMALLINT UNSIGNED NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  PRIMARY KEY  (film_id),
  FULLTEXT KEY idx_title_description (title, description)
) DEFAULT CHARSET=utf8mb4;

SET @@default_storage_engine = @old_default_storage_engine;

--
-- Triggers for loading film_text from films
--

DELIMITER ;;
CREATE TRIGGER `ins_film` AFTER INSERT ON `films` FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.id, new.title, new.description);
  END;;


CREATE TRIGGER `upd_film` AFTER UPDATE ON `films` FOR EACH ROW BEGIN
    IF (old.title != new.title) OR (old.description != new.description) OR (old.id != new.id)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.id
        WHERE id=old.id;
    END IF;
  END;;


CREATE TRIGGER `del_film` AFTER DELETE ON `films` FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE id = old.id;
  END;;

DELIMITER ;

--
-- Table structure for table `inventory`
--

CREATE TABLE inventory (
  id MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
  film_id SMALLINT UNSIGNED NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY idx_fk_film_id (film_id),
  CONSTRAINT fk_inventory_film FOREIGN KEY (film_id) REFERENCES films (id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `languages`
--

CREATE TABLE languages (
  id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  name CHAR(20) NOT NULL,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- View structure for view `film_list`
--

CREATE VIEW film_list
AS
SELECT films.id AS FID, films.title AS title, films.description AS description, categories.name AS categories, films.rental_rate AS price,
	films.length AS length, films.rating AS rating, GROUP_CONCAT(CONCAT(actors.first_name, _utf8mb4' ', actors.last_name) SEPARATOR ', ') AS actors
FROM films LEFT JOIN film_category ON film_category.film_id = films.id
LEFT JOIN categories ON categories.id = film_category.category_id LEFT
JOIN film_actor ON films.id = film_actor.film_id LEFT JOIN actors ON
  film_actor.actor_id = actors.id
GROUP BY films.id, categories.name;

--
-- View structure for view `nicer_but_slower_film_list`
--

CREATE VIEW nicer_but_slower_film_list
AS
SELECT films.id AS FID, films.title AS title, films.description AS description, categories.name AS categories, films.rental_rate AS price,
	films.length AS length, films.rating AS rating, GROUP_CONCAT(CONCAT(CONCAT(UCASE(SUBSTR(actors.first_name,1,1)),
	LCASE(SUBSTR(actors.first_name,2,LENGTH(actors.first_name))),_utf8mb4' ',CONCAT(UCASE(SUBSTR(actors.last_name,1,1)),
	LCASE(SUBSTR(actors.last_name,2,LENGTH(actors.last_name)))))) SEPARATOR ', ') AS actors
FROM films LEFT JOIN film_category ON film_category.film_id = films.id
LEFT JOIN categories ON categories.id = film_category.category_id LEFT
JOIN film_actor ON films.id = film_actor.film_id LEFT JOIN actors ON
  film_actor.actor_id = actors.id
GROUP BY films.id, categories.name;

--
-- View structure for view `actor_info`
--

CREATE DEFINER=CURRENT_USER SQL SECURITY INVOKER VIEW actor_info
AS
SELECT
a.id,
a.first_name,
a.last_name,
GROUP_CONCAT(DISTINCT CONCAT(c.name, ': ',
		(SELECT GROUP_CONCAT(f.title ORDER BY f.title SEPARATOR ', ')
                    FROM sakila_tafe.films f
                    INNER JOIN sakila_tafe.film_category fc
                      ON f.id = fc.film_id
                    INNER JOIN sakila_tafe.film_actor fa
                      ON f.id = fa.film_id
                    WHERE fc.category_id = c.id
                    AND fa.actor_id = a.id
                 )
             )
             ORDER BY c.name SEPARATOR '; ')
AS film_info
FROM sakila_tafe.actors a
LEFT JOIN sakila_tafe.film_actor fa
  ON a.id = fa.actor_id
LEFT JOIN sakila_tafe.film_category fc
  ON fa.film_id = fc.film_id
LEFT JOIN sakila_tafe.categories c
  ON fc.category_id = c.id
GROUP BY a.id, a.first_name, a.last_name;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


