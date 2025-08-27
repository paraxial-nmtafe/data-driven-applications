
USE computer;

INSERT INTO folders
  (`name`, last_accessed_at, last_changed_at, created_at, `owner`)
VALUES
  ('Documents', '2025-08-27', '2025-08-27', '2020-01-21', 'amanda'),
  ('Research Data', '2025-08-27 10:15:00', '2025-08-26 22:00:00', '2025-07-20 14:30:00', 'Ivan'),
  ('Legal Files', '2025-08-12 11:35:00', '2025-08-11 18:45:00', '2025-05-25 13:00:00', 'Julia'),
  ('Mully Bear', '2025-08-27', '2025-08-26','2021-08-26', 'Jasmine'),
  ('Homework','2025-08-27 08:58:00','2025-08-27 08:58:00','2025-08-27 00:00:00','Amanda'),
  ('Tafe Stuff','2025-08-20 08:58:00','2025-07-16 08:58:00','2025-07-16 00:00:00','Mark'),
  ('Recipes', '2025-05-05', '2025-05-04', '1931-10-30', 'dad')
;

SELECT * FROM folders;

INSERT INTO files
 (folder_id, `name`, file_size, last_accessed_at, last_changed_at, created_at, `owner`)
VALUES
 (1, 'unsuspicious.md', 1234556, '2020-01-01', '2019-12-31', '2013-01-31', 'no-one'),
 (1, 'pictures_of_geese.png', 514124, '2020-01-01', '2019-12-31', '2013-01-31', 'no-one'),
 (7,'Spaghetti.doc',203,'2000-01-08 17:48:00','2000-01-08 17:48:00','2000-01-08 17:48:00','dad'),
 (3,'Case124325.doc',203,'2010-06-03 09:48:00','2010-06-03 09:48:00','2010-06-03 09:48:00','John'),
 (4, 'Vet Information.pdf', 5684736, '2025-03-29', '2025-03-29', '2024-04-09', 'Poppy'),
 (2, 'q3_budget.xlsx', 65536, '2025-08-10 16:45:00', '2025-08-08 12:30:00', '2025-06-18 08:30:00', 'Bob'),
 (3, 'contract_renewal.pdf', 512000, '2025-08-20 09:20:00', '2025-08-19 17:50:00', '2025-04-22 13:15:00', 'Charlie'),
 (2, 'secret files.tif',345654, '2024-05-15','2022-05-13','2019-01-10', 'spywork'),
 (7, 'The Best Cheesecake.xlsx', 12349876, '2025-08-25', '2001-04-07', '2001-12-31', 'aunty may'),
 (5, 'very_cool_assessment.docx', 2314, '2020-01-01', '2019-12-31', '2013-01-31', 'para');


SELECT * FROM files;

