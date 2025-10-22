mysql> ALTER TABLE Exam
    -> MODIFY Title VARCHAR(50) NOT NULL;
ERROR 1046 (3D000): No database selected
mysql> USE Testing_System;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> ALTER TABLE Exam
    -> MODIFY Title VARCHAR(50) NOT NULL;
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE `Question`
    -> MODIFY Content VARCHAR(200) NOT NULL;
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE CategoryQuestion
    -> MODIFY CategoryName VARCHAR(50) NOT NULL;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Department (DepartmentID, DepartmentName)
    -> \c
mysql> INSERT INTO Department (DepartmentName)
    -> VALUES (Maths),
    -> (Physics),
    -> (English),
    -> (Chemist),
    -> (Literature),
    -> (History),
    -> (Geography),
    -> (Informatics),
    -> (PE),
    -> (Music),
    -> (Art);
ERROR 1054 (42S22): Unknown column 'Maths' in 'field list'
mysql> INSERT INTO Department (DepartmentName)
    -> VALUES ('Maths'),
    -> ('Physics'),
    -> ('English'),
    -> ('Chemist'),
    -> ('Literature'),
    -> ('History'),
    -> ('Geography'),
    -> ('Informatics'),
    -> ('PE'),
    -> ('Music'),
    -> ('Art');
Query OK, 11 rows affected (0.02 sec)
Records: 11  Duplicates: 0  Warnings: 0

mysql> INSERT INTO `Position` (PositionName)
    -> VALUES ('Mathematician'),
    -> ('Physicist'),
    -> ('Teacher'),
    -> ('Chemist'),
    -> ('Linguistician'),
    -> ('Historian'),
    -> ('Geologist'),
    -> ('Dev'),
    -> ('PE teacher'),
    -> ('Musician'),
    -> ('Artist');
ERROR 1265 (01000): Data truncated for column 'PositionName' at row 1
mysql> ALTER TABLE `Position` MODIFY PositionName VARCHAR(50) NOT NULL;
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> INSERT INTO `Position` (PositionName) VALUES ('Mathematician'), ('Physicist'), ('Teacher'), ('Chemist'), ('Linguistician'), ('Historian'), ('Geologist'), ('Dev'), ('PE teacher'), ('Musician'), ('Artist');
Query OK, 11 rows affected (0.00 sec)
Records: 11  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Account (Email, Username, Fullname, DepartmentID, PositionID, CreateDate)
    -> VALUES ('math@gg.com', 'Matha', 'Matha Mat', 1, 1,
    -> \c
mysql> INSERT INTO Account (Email, Username, Fullname, DepartmentID, PositionID)
    -> VALUES ('math@gg.com', 'Matha', 'Matha Mat', 1, 1),
    -> ('phy@gg.com', 'Phy', 'Phy Py', 2, 2),
    -> ('che@gg.com', 'Chem', 'Chem Chem', 4, 3),
    -> ('lin@gg.com', 'Lin', 'Lin Ling', 3, 5),
    -> ('geo@gg.com', 'Geo', 'Geoff', 7, 3),
    -> ('dev@gg.com', 'De', 'Devi', 8, 8),
    -> ('Russ@gg.com', 'Russ', 'Russ Russo', 8, 8),
    -> ('pe@edu.com', 'Pepe', 'Pepe Pe', 9, 9),
    -> ('ep@edu.com', 'Ep', 'Epi', 9, 3),
    -> ('mu@musi.vn', 'Mu', 'Musi Music', 10, 11),
    -> ('art@teach.edu', 'Tay', 'Tay Yat', 11, 10);
Query OK, 11 rows affected (0.01 sec)
Records: 11  Duplicates: 0  Warnings: 0

mysql> INSERT INTO `Group` (GroupName, CreatorID) VALUES ('Phy', 3), ('Lyr', 6), ('Art', 9), ('Lin', 2), ('Geo', 10), ('Che1', 4), ('Che2', 6), ('Arty', 7);
Query OK, 8 rows affected (0.01 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> INSERT INTO GroupAccount (GroupID, AccountID, JoinDate)
    -> VALUES (2, 11, '08/11/2014'),
    -> (1, 10);
ERROR 1136 (21S01): Column count doesn't match value count at row 2
mysql> INSERT INTO GroupAccount (GroupID, AccountID, JoinDate)
    -> VALUES (2, 11, '01/11/2012'),
    -> (3, 10, '02/11/2020'),
    -> (4, 6, '03/11/2025'),
    -> (7, 9 '04/11/2006'),
    -> (2, 3, '05/11/2005),
    '> (2, 9, '06/11/2001'),
    '> (1, 6, '09/12/2021'),
    '> \c
    '> /c
    '> '
    -> \c
mysql> INSERT INTO GroupAccount (GroupID, AccountID, JoinDate) VALUES (2, 11, '01/11/2012'), (3, 10, '02/11/2020'),(4, 6, '03/11/2025'),(7, 9 '04/11/2006'), (2, 3, '05/11/2005'), (2, 9, '06/11/2001'), (1, 6, '09/12/2021'), (1, 11, '07/11/2009'), (6, 9, '08/11/2001');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ''04/11/2006'), (2, 3, '05/11/2005'), (2, 9, '06/11/2001'), (1, 6, '09/12/2021'),' at line 1
mysql> INSERT INTO GroupAccount (GroupID, AccountID, JoinDate) 
    -> VALUES 
    ->     (2, 11, '2012-11-01'),
    ->     (3, 10, '2020-11-02'),
    ->     (4, 6, '2025-11-03'),
    ->     (7, 9, '2006-11-04'),
    ->     (2, 3, '2005-11-05'),
    ->     (2, 9, '2001-11-06'),
    ->     (1, 6, '2021-12-09'),
    ->     (1, 11, '2009-11-07'),
    ->     (6, 9, '2001-11-08');
Query OK, 9 rows affected (0.02 sec)
Records: 9  Duplicates: 0  Warnings: 0

mysql> INSERT INTO TypeQuestion (TypeName) VALUES ('Essay', 'Multiple-Choice');
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> INSERT INTO TypeQuestion (TypeName) VALUES ('Essay', 'Multiple-Choice');
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> INSERT INTO TypeQuestion (TypeName) VALUES ('Essay'), ('Multiple-Choice');
Query OK, 2 rows affected (0.02 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> INSERT INTO CategoryQuestion (CategoryName) VALUES ('Java'), ('Net'), ('SQL'), ('NET'), ('Postman'), ('Ruby);
    '> '
    -> \c
mysql> INSERT INTO CategoryQuestion (CategoryName) VALUES ('Java'), ('Net'), ('SQL'), ('NET'), ('Postman'), ('Ruby');
Query OK, 6 rows affected (0.01 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Question (Content, CategoryID, TypeID, CreatorID, CreateDate)
    -> VALUES
    -> ('abc', 2,1,3,'2021/03/06'),
    -> ('def', 6, 2, 11);
ERROR 1136 (21S01): Column count doesn't match value count at row 2
mysql> INSERT INTO Question (Content, CategoryID, TypeID, CreatorID, CreateDate) 
    ->     -> VALUES
    ->     -> ('abc', 2,1,3,'2021/03/06'),
    -> \c
mysql> INSERT INTO Question (Content, CategoryID, TypeID, CreatorID, CreateDate)
    -> VALUES
    -> ('abc', 2,1,3,'2021/03/06'),
    -> ('def', 6, 2, DEFAULT),
    -> ('ghi', 3, 2, DEFAULT),
    -> ('jkl', 4, 1, '2024/06/07'),
    -> ('mno', 3, 2, '2020/12/01'),
    -> ('pqr', 4, 2, DEFAULT);
ERROR 1136 (21S01): Column count doesn't match value count at row 2
mysql> INSERT INTO Question (Content, CategoryID, TypeID, CreatorID, CreateDate)
    -> VALUES
    ->     ('abc', 2, 1, 3, '2021-03-06'),
    ->     ('def', 6, 2, 11, DEFAULT),
    -> ('ghi', 3, 2, 7, DEFAULT),
    ->     ('jkl', 4, 1, 5, '2024-06-07'),
    ->     ('mno', 3, 2, 9, '2020-12-01'),
    ->     ('pqr', 4, 2, 2, DEFAULT),
    -> ('stu', 3, 1, 9, '2023/04/07');
Query OK, 7 rows affected, 1 warning (0.01 sec)
Records: 7  Duplicates: 0  Warnings: 1

mysql> INSERT INTO Answer (Content, QuestionID, isCorrect)
    -> VALUES
    -> ('def', 1, 'Right'),
    -> ('def', 2, 'Wrong'),
    -> ('ghi', 2, 'Wrong'),
    -> ('ghi', 3, 'Right'),
    -> ('jkl', 4, 'Right'),
    -> ('mno', 2, 'Right');
Query OK, 6 rows affected (0.00 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Exam (Code, Title, CategoryID, Duration, CraetorID, CreateDate)\
    -> \c
mysql> INSERT INTO Exam (Code, Title, CategoryID, Duration, CraetorID, CreateDate)
    -> VALUES
    -> ('EXM001', 'Algebra Basics Quiz', 2, 45, 5),
    ->     ('EXM002', 'World War II Test', 6, 60, 9),
    ->     ('EXM003', 'English Grammar Check', 5, 30, 3),
    ->     ('EXM004', 'Functions & Graphs', 2, 75, 11),
    ->     ('EXM005', 'Ancient Civilizations', 6, 45, 1),
    ->     ('EXM006', 'Essay Writing Midterm', 5, 90, 7),
    ->     ('EXM007', 'Number Theory', 2, 60, 4),
    ->     ('EXM008', 'European Geography', 6, 45, 10),
    ->     ('EXM009', 'Poetry Analysis', 5, 60, 2),
    ->     ('EXM010', 'Linear Equations', 2, 45, 8);
ERROR 1054 (42S22): Unknown column 'CraetorID' in 'field list'
mysql> INSERT INTO Exam (Code, Title, CategoryID, Duration, CreatorID, CreateDate)
    -> VALUES
    ->     ('EXAM001', 'Algebra Basics', 2, 45, 5, DEFAULT),
    ->     ('EXAM002', 'World War II Test', 6, 60, 9, '2023-11-15'),
    ->     ('EXAM003', 'English Grammar', 5, 30, 3, DEFAULT),
    ->     ('EXAM004', 'Functions Exam', 2, 75, 11, '2024-02-20'),
    ->     ('EXAM005', 'Ancient Egypt', 6, 45, 1, DEFAULT),
    ->     ('EXAM006', 'Poetry Analysis', 5, 60, 7, '2022-12-10'),
    ->     ('EXAM007', 'Atomic Structure', 4, 45, 4, DEFAULT),
    ->     ('EXAM008', 'European Capitals', 6, 30, 10, '2025-01-18'),
    ->     ('EXAM009', 'Quadratic Equations', 2, 60, 2, DEFAULT),
    ->     ('EXAM010', 'Music Theory', 10, 45, 8, '2023-08-05');
ERROR 1366 (HY000): Incorrect integer value: 'EXAM001' for column 'Code' at row 1
mysql> INSERT INTO Exam (Code, Title, CategoryID, Duration, CreatorID, CreateDate)
    -> VALUES
    ->     (101, 'Algebra Basics', 2, 45, 5, DEFAULT),
    ->     (102, 'World War II Test', 6, 60, 9, '2023-11-15'),
    ->     (103, 'English Grammar', 5, 30, 3, DEFAULT),
    ->     (104, 'Functions Exam', 2, 75, 11, '2024-02-20'),
    ->     (105, 'Ancient Egypt', 6, 45, 1, DEFAULT),
    ->     (106, 'Poetry Analysis', 5, 60, 7, '2022-12-10'),
    ->     (107, 'Atomic Structure', 4, 45, 4, DEFAULT),
    ->     (108, 'European Capitals', 6, 30, 10, '2025-01-18'),
    ->     (109, 'Quadratic Equations', 2, 60, 2, DEFAULT),
    ->     (110, 'Music Appreciation', 1, 45, 8, '2023-08-05');
ERROR 1292 (22007): Incorrect time value: '60' for column 'Duration' at row 2
mysql> INSERT INTO Exam (Code, Title, CategoryID, Duration, CreatorID, CreateDate)
    -> VALUES
    ->     (101, 'Algebra Basics', 2, '00:45:00', 5, DEFAULT),
    ->     (102, 'World War II Test', 6, '01:00:00', 9, '2023-11-15'),
    ->     (103, 'English Grammar', 5, '00:30:00', 3, DEFAULT),
    ->     (104, 'Functions Exam', 2, '01:15:00', 11, '2024-02-20'),
    ->     (105, 'Ancient Egypt', 6, '00:45:00', 1, DEFAULT),
    ->     (106, 'Poetry Analysis', 5, '01:00:00', 7, '2022-12-10'),
    ->     (107, 'Atomic Structure', 4, '00:45:00', 4, DEFAULT),
    ->     (108, 'European Capitals', 6, '00:30:00', 10, '2025-01-18'),
    ->     (109, 'Quadratic Equations', 2, '01:00:00', 2, DEFAULT),
    ->     (110, 'Music Appreciation', 1, '00:45:00', 8, '2023-08-05');
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> INSERT INTO ExamQuestion (ExamID, QuestionID)
    -> VALUES
    -> 
    -> (101, 3),
    ->     (101, 5),
    ->     (102, 1),
    ->     (102, 6),
    ->     (102, 7),
    ->     (103, 2),
    ->     (103, 4),
    ->     (104, 1),
    ->     (104, 3),
    ->     (104, 5),
    ->     (105, 6),
    ->     (106, 2),
    ->     (106, 7),
    ->     (107, 4),
    ->     (108, 1),
    ->     (108, 5),
    ->     (109, 3),
    ->     (109, 6),
    ->     (110, 2),
    ->     (110, 7);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`Testing_System`.`ExamQuestion`, CONSTRAINT `ExamQuestion_ibfk_1` FOREIGN KEY (`ExamID`) REFERENCES `Exam` (`ExamID`))
mysql> INSERT INTO ExamQuestion (ExamID, QuestionID)
    -> VALUES
    ->     (1, 3),
    ->     (1, 5),
    ->     (2, 1),
    ->     (2, 6),
    ->     (2, 7),
    ->     (3, 2),
    ->     (3, 4),
    ->     (4, 1),
    ->     (4, 3),
    ->     (4, 5),
    ->     (5, 6),
    ->     (6, 2),
    ->     (6, 7),
    ->     (7, 4),
    ->     (8, 1),
    ->     (8, 5),
    ->     (9, 3),
    ->     (9, 6),
    ->     (10, 2),
    ->     (10, 7);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`Testing_System`.`ExamQuestion`, CONSTRAINT `ExamQuestion_ibfk_1` FOREIGN KEY (`ExamID`) REFERENCES `Exam` (`ExamID`))
mysql> SELECT ExamID, Code FROM Exam;
+--------+------+
| ExamID | Code |
+--------+------+
|     11 |  101 |
|     12 |  102 |
|     13 |  103 |
|     14 |  104 |
|     15 |  105 |
|     16 |  106 |
|     17 |  107 |
|     18 |  108 |
|     19 |  109 |
|     20 |  110 |
+--------+------+
10 rows in set (0.00 sec)

mysql> INSERT INTO ExamQuestion (ExamID, QuestionID)
    -> VALUES
    ->     (11, 3),
    ->     (11, 5),
    ->     (12, 1),
    ->     (12, 6),
    ->     (12, 7),
    ->     (13, 2),
    ->     (13, 4),
    ->     (14, 1),
    ->     (14, 3),
    ->     (14, 5),
    ->     (15, 6),
    ->     (16, 2),
    ->     (16, 7),
    ->     (17, 4),
    ->     (18, 1),
    ->     (18, 5),
    ->     (19, 3),
    ->     (19, 6),
    ->     (20, 2),
    ->     (20, 7);
Query OK, 20 rows affected (0.00 sec)
Records: 20  Duplicates: 0  Warnings: 0

mysql> EXIT;
