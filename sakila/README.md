# Introduction
This is a heavily cut-down version of the Sakila database, a database used for education and training.

For your interest, the original database is located [here](https://dev.mysql.com/doc/index-other.html).

The main reason this database was cut down was to ensure that the naming style matched our "internal organisational style".  NMTAFE students, please use this dataset to work.

## How to run
From your chosen MySQL client, open and run the files in this order:
- 01-sakila-schema.sql
- 02-sakila-data.sql

Running these in the opposite order will not work.  The schema (database form) must be loaded before the data.

## Style notes
This style is what we will use here at TAFE -- it reflects some real-world cases, but not all of them. As always: maintain consistency with your team.

- All fields, tables, and databases are named in snake_case, (no spaces, no capital letters)
- Tables are named in the plural (actors, not actor)
    - Irregular plurals, such as 'inventory' are preserved.
- Join tables are named table_table, such as the join table for films and actors, which is called 'film_actor'
- For tables which have a dedicated primary key (rather than any kind of composite), that primary key is called 'id', consistently.
- Foreign keys are **preferentially** called 'table_id' in the singular (eg: inventory table has a 'film_id' to map to films)
    - There may be irregular foreign keys where 'the business case' requires it.  See films.original_language_id, which is a second foreign key to the languages table.  This represents the 'business case' of wanting to store the language the film is in, while also storing the original language the film is in.
