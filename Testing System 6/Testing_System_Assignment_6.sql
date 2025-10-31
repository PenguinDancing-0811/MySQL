mysql> USE Testing_System;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> CREATE PROCEDURE info_account_per_department (IN DepartmentName VARCHAR(50))
    -> BEGIN
    -> SELECT d.DepartmentName, a. * FROM Account a JOIN Department d ON a.DepartmentID = d.DepartmentID
    -> WHERE d.DepartmentName = DepartmentName
    -> \c
mysql> DELIMITER $$
mysql> CREATE PROCEDURE info_account_per_department (IN DepartmentName VARCHAR(50)) BEGIN SELECT d.DepartmentName, a. * FROM Account a JOIN Department d ON a.DepartmentID = d.DepartmentID WHERE d.DepartmentName = DepartmentName;
    -> END$$
Query OK, 0 rows affected (0.01 sec)

mysql> DELIMITER;
    -> \c
mysql> CALL info_account_per_department ('music');
    -> \c
mysql> SELECT * FROM Department;
    -> DELIMITER ;
    -> \c
mysql> SELECT * FROM Department;
    -> \c
mysql> DELIMITER ;
mysql> SELECT * FROM Department;
+--------------+----------------+
| DepartmentID | DepartmentName |
+--------------+----------------+
|            1 | Maths          |
|            2 | Physics        |
|            3 | English        |
|            4 | Chemist        |
|            6 | History        |
|            7 | Geography      |
|            8 | Informatics    |
|            9 | PE             |
|           10 | Music          |
|           11 | Art            |
+--------------+----------------+
10 rows in set (0.00 sec)

mysql> CALL info_account_per_department ('Music');
+----------------+-----------+------------+----------+------------+--------------+------------+------------+
| DepartmentName | AccountID | Email      | Username | FullName   | DepartmentID | PositionID | CreateDate |
+----------------+-----------+------------+----------+------------+--------------+------------+------------+
| Music          |        10 | mu@musi.vn | Mu       | Musi Music |           10 |         11 | 2025-10-22 |
+----------------+-----------+------------+----------+------------+--------------+------------+------------+
1 row in set (0.02 sec)

Query OK, 0 rows affected (0.02 sec)

mysql> DELIMITER $$
mysql> CREATE PROCEDURE number_of_account ()
    -> BEGIN
    -> SELECT GroupID, COUNT(*) AS number_of_account FROM GroupAccount GROUP BY GroupID;
    -> END$$
Query OK, 0 rows affected (0.03 sec)

mysql> DELIMITER ;
mysql> CALL number_of_account ();
+---------+-------------------+
| GroupID | number_of_account |
+---------+-------------------+
|       1 |                 2 |
|       2 |                 3 |
|       3 |                 1 |
|       4 |                 1 |
|       6 |                 1 |
|       7 |                 1 |
+---------+-------------------+
6 rows in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> DELIMITER $$
mysql> CREATE PROCEDURE 
    -> count_month_question ()
    -> BEGIN
    -> SELECT CreateDate, COUNT(*) AS number_of_question
    -> FROM Question
    -> GROUP BY CreateDate
    -> HAVING YEAR(CreateDate) = YEAR(NOW()) AND MONTH(CreateDate) = MONTH(NOW());
    -> END$$
Query OK, 0 rows affected (0.01 sec)

mysql> DELIMITER ;
mysql> CALL count_month_question ();
+------------+--------------------+
| CreateDate | number_of_question |
+------------+--------------------+
| 2025-10-22 |                  3 |
+------------+--------------------+
1 row in set (0.02 sec)

Query OK, 0 rows affected (0.02 sec)

mysql> SELECT * FROM Question;
+------------+---------+------------+--------+-----------+------------+
| QuestionID | Content | CategoryID | TypeID | CreatorID | CreateDate |
+------------+---------+------------+--------+-----------+------------+
|          1 | abc     |          2 |      1 |         3 | 2021-03-06 |
|          2 | def     |          6 |      2 |        11 | 2025-10-22 |
|          3 | ghi     |          3 |      2 |         7 | 2025-10-22 |
|          4 | jkl     |          4 |      1 |         5 | 2024-06-07 |
|          5 | mno     |          3 |      2 |         9 | 2020-12-01 |
|          6 | pqr     |          4 |      2 |         2 | 2025-10-22 |
|          7 | stu     |          3 |      1 |         9 | 2023-04-07 |
+------------+---------+------------+--------+-----------+------------+
7 rows in set (0.00 sec)

mysql> DELIMITER $$
mysql> CREATE PROCEDURE most_typequestion ()
    -> BEGIN
    -> SELECT t.TypeID, t.TypeName, COUNT(a.*)
    -> FROM Question a JOIN TypeQuestion t ON a.TypeID = t.TypeID
    -> GROUP BY a.TypeID
    -> WHERE COUNT(a.*) = (SELECT 
    -> \c
mysql> DELIMITER ;
mysql> DELIMITER $$
mysql> CREATE PROCEDURE most_typeques ()
    -> BEGIN
    -> WITH count_question_per_type AS (
    -> SELECT TypeID, COUNT(*) AS number_of_ques
    -> FROM Question),
    -> max_count AS (
    -> SELECT MAX(number_of_ques) AS max_count 
    -> FROM count_question_per_type)
    -> SELECT 
    -> c.TypeID, c.number_of_ques 
    -> FROM count_question_per_type c
    -> JOIN max_count m ON m.max_count = c.number_of_ques;
    -> END$$
Query OK, 0 rows affected (0.03 sec)

mysql> DELIMITER ;
mysql> CALL most_typeques ();
ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'Testing_System.Question.TypeID'; this is incompatible with sql_mode=only_full_group_by
mysql> DROP PROCEDURE IF EXISTS most_typeques;
Query OK, 0 rows affected (0.01 sec)

mysql> DELIMITER $$
mysql> CREATE PROCEDURE most_typeques ()
    -> BEGIN
    -> WITH count_question_per_type AS (
    -> SELECT TypeID, COUNT(*) AS number_of_ques
    -> FROM Question
    -> GROUP BY TypeID),
    -> max_count AS (
    -> SELECT MAX(number_of_ques) AS max_count
    -> FROM count_question_per_type)
    -> SELECT
    -> c.TypeID, c.number_of_ques
    -> FROM count_question_per_type c
    -> JOIN max_count m ON m.max_count = c.number_of_ques;
    -> END$$
Query OK, 0 rows affected (0.03 sec)

mysql> DELIMITER ;
mysql> CALL most_typeques ();
+--------+----------------+
| TypeID | number_of_ques |
+--------+----------------+
|      2 |              4 |
+--------+----------------+
1 row in set (0.01 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> DELIMITER $$
mysql> CREATE PROCEDURE matching_character (IN character_search VARCHAR(50), OUT result VARCHAR(50))
    -> BEGIN
    -> SELECT
    -> \c
mysql> DELIMITER ;
mysql> DELIMITER $$
mysql> CREATE PROCEDURE matching_character (IN character_search VARCHAR(50))
    -> BEGIN
    -> SELECT GroupID, GroupName FROM `Group`
    -> UNION ALL
    -> SELECT AccountID, FullName FROM Account
    -> WHERE 
    -> \c
mysql> DELIMITER ;
mysql> DELIMITER $$
mysql> CREATE PROCEDURE matching_character (IN character_search VARCHAR(50))
    -> BEGIN
    -> SELECT GroupID, GroupName FROM `Group`
    -> WHERE GroupName LIKE '%character_search%'
    -> UNION ALL
    -> SELECT AccountID, FullName FROM Account
    -> WHERE FullName LIKE '%character_search%';
    -> END$$
Query OK, 0 rows affected (0.02 sec)

mysql> DELIMITER ;
mysql> DELIMITER $$
mysql> CREATE PROCEDURE auto_input (IN fullName VARCHAR(50), IN email VARCHAR(50))
    -> BEGIN
    -> INSERT INTO Account (Email, Username, FullName, DepartmentID, PositionID)
    -> VALUES
    -> (email, SUBSTRING_INDEX(email, '@', 1), fullName, 6, 5);
    -> END$$
Query OK, 0 rows affected (0.01 sec)

mysql> DELIMITER ;
mysql> DELIMITER $$
mysql> CREATE PROCEDURE longest_content (IN question_type ENUM('Essay', 'Multiple-Choice'))
    -> BEGIN
    -> WITH count_char AS (
    -> SELECT TypeID, CHAR_LENGTH(Content) as count_char
    -> FROM Question
    -> GROUP BY TypeID),
    -> max_count AS (
    -> SELECT MAX(count_char) AS max_count
    -> \c
mysql> DELIMITER ;
mysql> DELIMITER$$
    -> CREATE PROCEDURE longest_content (IN question_type ENUM('Essay', 'Multiple-Choice')) BEGIN WITH count_char AS ( SELECT TypeID, CHAR_LENGTH(Content) AS count_char FROM Question GROUP BY TypeID), max_count AS ( SELECT MAX(count_char) AS max_count FROM count_char)
    -> SELECT qt.TypeID, qt.count_char
    -> FROM count_char qt
    -> JOIN TypeQuestion tq ON tq.TypeID = qt.TypeID
    -> JOIN max_count m ON m.max_count = qt.count_char
    -> \c
mysql> DELIMITER ;
mysql> DELIMITER$$
    -> DELIMITER
    -> \c
mysql> DELIMITER ;
mysql> SELECT * FROM TypeQuestion;
+--------+-----------------+
| TypeID | TypeName        |
+--------+-----------------+
|      1 | Essay           |
|      2 | Multiple-Choice |
+--------+-----------------+
2 rows in set (0.00 sec)

mysql> DELIMITER $$
mysql> CREATE PROCEDURE longest_content (IN type ENUM ('Essay', 'Multiple_Choice'))
    -> BEGIN
    -> WITH max_len AS
    -> (SELECT MAX(CHAR_LENGTH(Content)) AS max_len FROM Question)
    -> SELECT tq.TypeName, q.QuestionID, m.max_len
    -> FROM Question q 
    -> JOIN TypeQuestion tq ON q.TypeID = tq.TypeID
    -> JOIN max_len m ON m.max_len 
    -> \c\
mysql> DELIMITER ;
mysql> DELIMITER $$
mysql> CREATE PROCEDURE longest_content (IN type ENUM ('Essay', 'Multiple_Choice')) BEGIN WITH max_len AS (SELECT MAX(CHAR_LENGTH(Content)) AS max_len FROM Question GROUP BY TypeID ) SELECT tq.TypeName, q.QuestionID, CHAR_LENGTH(q.Content), m.max_len FROM Question q  JOIN TypeQuestion tq ON q.TypeID = tq.TypeID JOIN max_len m ON m.max_len = CHAR_LENGTH(q.Content) WHERE tq.TypeName = typemysql> DELIMITER $$ 
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> mysql> CREATE PROCEDURE longest_content (IN type ENUM ('Essay', 'Multiple_Choice')) BEGIN WITH max_len AS (SELECT MAX(CHAR_LENGTH(Content)) AS max_len FROM Question) SELECT tq.TypeName, q.QuestionID, CHAR_LENGTH(q.Content), m.max_len FROM Question q  JOIN TypeQuestion tq ON q.TypeID = tq.TypeID JOIN max_l
    -> en m ON m.max_len = CHAR_LENGTH(q.Content) GROUP BY tq.TypeName HAVING tq.TypeName = type
    -> 
    -> \c
mysql> DELITER ;
    -> \c
mysql> DELIMITER ;
mysql> DELIMITER $$
mysql> CREATE PROCEDURE longest_content (IN type ENUM('Essay', 'Multiple-Choice'))
    -> BEGIN
    -> WITH max_len AS (
    -> SELECT TypeID, MAX(CHAR_LENGTH(Content))
    -> FROM Question
    -> GROUP BY TypeID)
    -> SELECT 
    -> \c\
mysql> DELIMITER ;
mysql> DELIMITER $$
mysql> CREATE PROCEDURE longest_content (IN type ENUM('Essay', 'Multiple-Choice'))
    -> BEGIN
    -> WITH max_len AS (
    -> SELECT TypeID, MAX(CHAR_LENGTH(Content)) AS max_count
    -> FROM Question
    -> GROUP BY TypeID)
    -> SELECT q.QuestionID, q.TypeID, tq.TypeName, m.max_count
    -> FROM
    -> Question q
    -> JOIN TypeQuestion tq ON tq.TypeID = q.TypeID
    -> JOIN max_len m ON m.max_count = CHAR_LENGTH(q.Content)
    -> WHERE tq.TypeQuestion = type;
    -> END$$
Query OK, 0 rows affected (0.03 sec)

mysql> DELIMITER ;
mysql> CALL longest_content ('Essay');
ERROR 1054 (42S22): Unknown column 'tq.TypeQuestion' in 'where clause'
mysql> DROP PROCEDURE IF EXISTS longest_content;
Query OK, 0 rows affected (0.03 sec)

mysql> DELIMITER $$
mysql> CREATE PROCEDURE longest_content (IN type ENUM('Essay', 'Multiple-Choice')) BEGIN WITH max_len AS ( SELECT TypeID, MAX(CHAR_LENGTH(Content)) AS max_count FROM Question GROUP BY TypeID) SELECT q.QuestionID, q.TypeID, tq.TypeName, m.max_count FROM Question q JOIN TypeQuestion tq ON tq.TypeID = q.TypeID JOIN max_len m ON m.max_count = CHAR_LENGTH(q.Content) WHERE tq.TypeName = type; END$$
Query OK, 0 rows affected (0.01 sec)

mysql> DELIMITER ;
mysql> CALL longest_content ('Essay');
+------------+--------+----------+-----------+
| QuestionID | TypeID | TypeName | max_count |
+------------+--------+----------+-----------+
|          1 |      1 | Essay    |         3 |
|          1 |      1 | Essay    |         3 |
|          4 |      1 | Essay    |         3 |
|          4 |      1 | Essay    |         3 |
|          7 |      1 | Essay    |         3 |
|          7 |      1 | Essay    |         3 |
+------------+--------+----------+-----------+
6 rows in set (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> 
mysql> DELIMITER $$
mysql> CREATE PROCEDURE delete_exam (IN exam_id INT)
    -> BEGIN
    -> DELETE FROM Exam 
    -> WHERE ExamID = exam_id;
    -> END$$
Query OK, 0 rows affected (0.03 sec)

mysql> DELIMITER ;
mysql> DELIMITER $$
mysql> CREATE PROCEDURE delete_exam_for_3_years ()
    -> BEGIN
    -> SELECT ExamID FROM Exam 
    -> WHERE CreateDate < NOW() - INTERVAL 3 YEAR
    -> \c
mysql> DELIMITER ;
mysql> DELIMITER $$
mysql> CREATE PROCEDURE delete_exam_3_year ()
    -> BEGIN
    -> DECLARE done BOOL DEFAULT FALSE;
    -> DECLARE exam_id TINYINT;
    -> DECLARE exam_cursor CURSOR FOR
    -> SELECT ExamID
    -> FROM Exam
    -> WHERE CreateDate < NOW() - INTERVAL 3 YEAR;
    -> DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    -> OPEN exam_cursor;
    -> read_loop: LOOP
    -> FETCH exam_cursor INTO exam_id;
    -> IF done THEN
    -> LEAVE read_loop;
    -> END IF;
    -> CALL delete_exam (exam_id);
    -> END LOOP;
    -> CLOSE exam_cursor;
    -> END$$
Query OK, 0 rows affected (0.01 sec)

mysql> DELIMITER ;
mysql> DELIMITER $$
mysql> CREATE PROCEDURE del_department (IN department_name VARCHAR(50))
    -> BEGIN
    -> UPDATE Account
    -> SET DepartmentID = 1
    -> WHERE DepartmentID = 
    -> (SELECT d.DepartmentID
    -> FROM Department d 
    -> JOIN Account a ON a.DepartmentID = d.DepartmentID
    -> WHERE d.DepartmentName = department_name);
    -> \c
mysql> DELIMITER ;
mysql> DELIMITER $$
mysql> 
mysql> CREATE PROCEDURE del_department(IN department_name VARCHAR(50))
    -> BEGIN
    ->     UPDATE Account
    ->     SET DepartmentID = 1
    ->     WHERE DepartmentID = (
    ->         SELECT DepartmentID
    ->         FROM (SELECT DepartmentID FROM Department WHERE DepartmentName = department_name) AS tmp
    ->     );
    -> END$$
Query OK, 0 rows affected (0.00 sec)

mysql> 
mysql> DELIMITER ;
mysql> DELIMITER $$
mysql> CREATE PROCEDURE monthly_ques ()
    -> BEGIN
    -> SELECT COUNT(*) FROM Question
    -> GROUP BY MONTH(CreateDate)
    -> HAVING YEAR(CreateDate) = YEAR(NOW())
    -> \c
mysql> DELIMITER ;
mysql> Terminal close -- exit!
Aborted
