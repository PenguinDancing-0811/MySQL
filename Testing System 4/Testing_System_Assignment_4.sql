mysql> USE Testing_System;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> SELECT AccountID, DepartmentID FROM Account;
+-----------+--------------+
| AccountID | DepartmentID |
+-----------+--------------+
|         1 |            1 |
|         2 |            2 |
|         4 |            3 |
|         3 |            4 |
|         5 |            7 |
|         6 |            8 |
|         7 |            8 |
|         8 |            9 |
|         9 |            9 |
|        10 |           10 |
|        11 |           11 |
+-----------+--------------+
11 rows in set (0.02 sec)

mysql> SELECT * FROM Accoount WHERE CreateDate > '2015/12/20';
ERROR 1146 (42S02): Table 'Testing_System.Accoount' doesn't exist
mysql> SELECT * FROM Account WHERE CreateDate > '2015/12/20';
+-----------+-------------------------+----------+---------------+--------------+------------+------------+
| AccountID | Email                   | Username | FullName      | DepartmentID | PositionID | CreateDate |
+-----------+-------------------------+----------+---------------+--------------+------------+------------+
|         1 | math@gg.com             | Matha    | Matha Mat     |            1 |          1 | 2025-10-22 |
|         2 | phy@gg.com              | Phy      | Phy Py        |            2 |          2 | 2025-10-22 |
|         3 | che@gg.com              | Chem     | Chem Chem     |            4 |          3 | 2025-10-22 |
|         4 | lin@gg.com              | Lin      | Lin Ling      |            3 |          5 | 2025-10-22 |
|         5 | loc.nguyenba@vti.com.vn | Geo      | Nguyen Ba Loc |            7 |          3 | 2025-10-22 |
|         6 | dev@gg.com              | De       | Devi          |            8 |          8 | 2025-10-22 |
|         7 | Russ@gg.com             | Russ     | Russ Russo    |            8 |          8 | 2025-10-22 |
|         8 | pe@edu.com              | Pepe     | Pepe Pe       |            9 |          9 | 2025-10-22 |
|         9 | ep@edu.com              | Ep       | Epi           |            9 |          3 | 2025-10-22 |
|        10 | mu@musi.vn              | Mu       | Musi Music    |           10 |         11 | 2025-10-22 |
|        11 | art@teach.edu           | Tay      | Tay Yat       |           11 |         10 | 2025-10-22 |
+-----------+-------------------------+----------+---------------+--------------+------------+------------+
11 rows in set, 1 warning (0.00 sec)

mysql> SELECT * FROM Account 
    -> WHERE
    -> \c
mysql> SELECT * FROM Account
    -> GROUP BY DepartmentID
    -> WHERE DepartmentID = (
    -> SELECT DepartmentID FROM Department
    -> WHERE DepartmentName = 'PE');
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'WHERE DepartmentID = (
SELECT DepartmentID FROM Department
WHERE DepartmentName ' at line 3
mysql> SELECT * FROM Account
    -> WHERE DepartmentID = (
    -> SELECT DepartmentID FROM Department
    -> WHERE DepartmentName = 'PE');
+-----------+------------+----------+----------+--------------+------------+------------+
| AccountID | Email      | Username | FullName | DepartmentID | PositionID | CreateDate |
+-----------+------------+----------+----------+--------------+------------+------------+
|         8 | pe@edu.com | Pepe     | Pepe Pe  |            9 |          9 | 2025-10-22 |
|         9 | ep@edu.com | Ep       | Epi      |            9 |          3 | 2025-10-22 |
+-----------+------------+----------+----------+--------------+------------+------------+
2 rows in set (0.02 sec)

mysql> SELECT DepartmentID FROM Account
    -> GROUP BY DepartmentID
    -> HAVING COUNT(*) > 3;
Empty set (0.00 sec)

mysql> SELECT DepartmentID FROM Account GROUP BY DepartmentID HAVING COUNT(*) > 2;
Empty set (0.00 sec)

mysql> SELECT DepartmentID FROM Account GROUP BY DepartmentID HAVING COUNT(*) > 1;
+--------------+
| DepartmentID |
+--------------+
|            8 |
|            9 |
+--------------+
2 rows in set (0.00 sec)

mysql> SELECT QuestionID FROM ExamQuestion
    -> GROUP BY ExamID
    -> WHERE COUNT(*) = 
    -> (SELECT MAX(COUNT(*)) From ExamQuestion 
    -> \c
mysql> SELECT QuestionID, MAX(COUNT(*)) AS Most_Common FROM ExamQuestion
    -> GROUP BY QuestionID;
ERROR 1111 (HY000): Invalid use of group function
mysql> SELECT QuestionID, COUNT(*) FROM ExamQuestion
    -> GROUP BY QuestionID
    -> HAVING COUNT(*) =
    -> (SELECT COUNT(*) FROM ExamQuestion
    -> GROUP BY QuestionID
    -> ORDER BY COUNT(*) DESC
    -> LIMIT 1);
+------------+----------+
| QuestionID | COUNT(*) |
+------------+----------+
|          1 |        3 |
|          2 |        3 |
|          3 |        3 |
|          5 |        3 |
|          6 |        3 |
|          7 |        3 |
+------------+----------+
6 rows in set (0.02 sec)

mysql> SELECT CategoryID, COUNT(*) FROM Question
    -> GROUP BY CategoryID;
+------------+----------+
| CategoryID | COUNT(*) |
+------------+----------+
|          2 |        1 |
|          3 |        3 |
|          4 |        2 |
|          6 |        1 |
+------------+----------+
4 rows in set (0.00 sec)

mysql> SELECT QuestionID, COUNT(*) AS count FROM ExamQuestion
    -> GROUP BY QuestionID;
+------------+-------+
| QuestionID | count |
+------------+-------+
|          1 |     3 |
|          2 |     3 |
|          3 |     3 |
|          4 |     2 |
|          5 |     3 |
|          6 |     3 |
|          7 |     3 |
+------------+-------+
7 rows in set (0.00 sec)

mysql> SELECT QuestionID FROM Answer
    -> GROUP BY QuestionID
    -> HAVING COUNT(*) = 
    -> (SELECT COUNT(*) FROM Answer GROUP BY QuestionID ORDER BY COUNT(*) DESC LIMIT 1);
+------------+
| QuestionID |
+------------+
|          2 |
+------------+
1 row in set (0.00 sec)

mysql> SELECT GroupID, COUNT(*) FROM `Group`
    -> GROUP BY GroupID;
+---------+----------+
| GroupID | COUNT(*) |
+---------+----------+
|       1 |        1 |
|       2 |        1 |
|       3 |        1 |
|       4 |        1 |
|       5 |        1 |
|       6 |        1 |
|       7 |        1 |
|       8 |        1 |
+---------+----------+
8 rows in set (0.01 sec)

mysql> SELECT * FROM `GROUP`;
ERROR 1146 (42S02): Table 'Testing_System.GROUP' doesn't exist
mysql> SELECT * FROM `Group`;
+---------+-----------+-----------+------------+
| GroupID | GroupName | CreatorID | CreateDate |
+---------+-----------+-----------+------------+
|       1 | Phy       |         3 | 2025-10-22 |
|       2 | Lyr       |         6 | 2025-10-22 |
|       3 | Art       |         9 | 2025-10-22 |
|       4 | Lin       |         2 | 2025-10-22 |
|       5 | Geo       |        10 | 2025-10-22 |
|       6 | Che1      |         4 | 2025-10-22 |
|       7 | Che2      |         6 | 2025-10-22 |
|       8 | Arty      |         7 | 2025-10-22 |
+---------+-----------+-----------+------------+
8 rows in set (0.00 sec)

mysql> SELECT GroupID, COUNT(*) FROM GroupAccount
    -> GROUP BY GroupID;
+---------+----------+
| GroupID | COUNT(*) |
+---------+----------+
|       1 |        2 |
|       2 |        3 |
|       3 |        1 |
|       4 |        1 |
|       6 |        1 |
|       7 |        1 |
+---------+----------+
6 rows in set (0.01 sec)

mysql> SELECT account.PositionID
    -> FROM acc
    -> \c
mysql> SELECT a.PositionID
    -> FROM Account a
    -> LEFT JOIN Position p ON a.
    -> \c
mysql> SELECT p.PositionID
    -> FROM Position p
    -> LEFT JOIN Account a ON p.PositionID = a.PositionID
    -> GROUP BY Po
    -> \c
mysql> SELECT p.PositionName, COUNT(*)
    -> FROM Position p
    -> LEFT JOIN Account a ON p.PositionID = a.PositionID
    -> GROUP BY p.PositionID
    -> ORDER BY COUNT(*)
    -> LIMIT 1;
+---------------+----------+
| PositionName  | COUNT(*) |
+---------------+----------+
| Mathematician |        1 |
+---------------+----------+
1 row in set (0.02 sec)

mysql> SELECT p.PositionName, COUNT(*)
    -> FROM Position p
    -> LEFTJOIN
    -> \c
mysql> SELECT p.PositionName, COUNT(*)
    -> FROM Position p
    -> RIGHT JOIN Account\
    -> \c
mysql> SELECT d.DepartmentName, p.PositionName, a.COUNT(*) AS number_of_people
    -> FROM a.Account
    -> JOIN d
    -> \c
mysql> SELECT d.DepartmentName, p.PositionName, a.COUNT(*) AS number_of_people
    -> FROM Account a
    -> JOIN Department d ON a.DepartmentID = d.DepartmentID
    -> LEFT JOIN Position p ON p.PositionID = a.PositionID
    -> GROUP BY a.PositionID;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '*) AS number_of_people
FROM Account a
JOIN Department d ON a.DepartmentID = d.De' at line 1
mysql> \c
mysql> ELECT d.DepartmentName, p.PositionName, COUNT(*) AS number_of_people
    -> FROM
    -> \c
mysql> SELECT d.DepartmentName, p.PositionName, COUNT(*) AS number_of_people
    -> FROM Account a
    -> LEFT JOIN Department d ON d.DepartmentID = a.DepartmentID
    -> LEFT JOIN Position p ON a.PositionID = p.PositionID
    -> GROUP BY d.DepartmentID, p.PositionID
    -> 
    -> ;
+----------------+---------------+------------------+
| DepartmentName | PositionName  | number_of_people |
+----------------+---------------+------------------+
| Maths          | Mathematician |                1 |
| Physics        | Physicist     |                1 |
| Chemist        | Teacher       |                1 |
| English        | Linguistician |                1 |
| Geography      | Teacher       |                1 |
| Informatics    | Dev           |                2 |
| PE             | PE teacher    |                1 |
| PE             | Teacher       |                1 |
| Music          | Artist        |                1 |
| Art            | Musician      |                1 |
+----------------+---------------+------------------+
10 rows in set (0.02 sec)

mysql> SELECT c.CategoryName, t.TypeName, a.FullName, q.* FROM
    -> Question q
    -> LEFT JOIN Question q ON q.CategoryID = c.CategoryID
    -> LEFT JOIN Question q ON q.TypeID = t.TypeID
    -> LEFT JOIN Question q ON q.CreatorID = a.Fu
    -> \c
mysql> SELECT c.CategoryName, t.TypeName, a.FullName, q.* FROM
    -> Question q
    -> JOIN CategoryQuestion c on q.CategoryID = c.CategoryID
    -> JOIN TypeQuestion t on q.TypeID = t.TypeID
    -> JOIN Account a on q.CreatorID = a.AccountID;
+--------------+-----------------+---------------+------------+---------+------------+--------+-----------+------------+
| CategoryName | TypeName        | FullName      | QuestionID | Content | CategoryID | TypeID | CreatorID | CreateDate |
+--------------+-----------------+---------------+------------+---------+------------+--------+-----------+------------+
| Net          | Essay           | Chem Chem     |          1 | abc     |          2 |      1 |         3 | 2021-03-06 |
| Ruby         | Multiple-Choice | Tay Yat       |          2 | def     |          6 |      2 |        11 | 2025-10-22 |
| SQL          | Multiple-Choice | Russ Russo    |          3 | ghi     |          3 |      2 |         7 | 2025-10-22 |
| NET          | Essay           | Nguyen Ba Loc |          4 | jkl     |          4 |      1 |         5 | 2024-06-07 |
| SQL          | Multiple-Choice | Epi           |          5 | mno     |          3 |      2 |         9 | 2020-12-01 |
| NET          | Multiple-Choice | Phy Py        |          6 | pqr     |          4 |      2 |         2 | 2025-10-22 |
| SQL          | Essay           | Epi           |          7 | stu     |          3 |      1 |         9 | 2023-04-07 |
+--------------+-----------------+---------------+------------+---------+------------+--------+-----------+------------+
7 rows in set (0.01 sec)

mysql> SELECT t.TypeName, COUNT(*) AS Number_of_Question
    -> FROM Question q
    -> LEFT JOIN TypeQuestion t ON q.TypeID = q.TypeID;
ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'Testing_System.t.TypeName'; this is incompatible with sql_mode=only_full_group_by
mysql> SELECT t.TypeName, COUNT(*) AS Number_of_Question FROM Question q LEFT JOIN TypeQuestion t ON q.TypeID = q.TypeID GROUP BY t.TypeID;
+-----------------+--------------------+
| TypeName        | Number_of_Question |
+-----------------+--------------------+
| Multiple-Choice |                  7 |
| Essay           |                  7 |
+-----------------+--------------------+
2 rows in set (0.00 sec)

mysql> SELECT g.GroupID, g.GroupName FROM `Group` g
    -> LEFT JOIN GroupAccount ga ON g.GroupID = ga.GroupID
    -> GROUP BY g.GroupID
    -> ORDER BY COUNT(*) 
    -> LIMIT 1;
+---------+-----------+
| GroupID | GroupName |
+---------+-----------+
|       8 | Arty      |
+---------+-----------+
1 row in set (0.00 sec)

mysql> SELECT g.GroupID, g.GroupName FROM `Group` g LEFT JOIN GroupAccount ga ON g.GroupID = ga.GroupID GROUP BY g.GroupID ORDER BY COUNT(ga.GroupID) LIMIT 1;
+---------+-----------+
| GroupID | GroupName |
+---------+-----------+
|       5 | Geo       |
+---------+-----------+
1 row in set (0.00 sec)

mysql> SELECT GroupID, COUNT(*) FROM `GroupAccount` GROUP BY GroupID;
+---------+----------+
| GroupID | COUNT(*) |
+---------+----------+
|       1 |        2 |
|       2 |        3 |
|       3 |        1 |
|       4 |        1 |
|       6 |        1 |
|       7 |        1 |
+---------+----------+
6 rows in set (0.00 sec)

mysql> SELECT g.GroupID, g.GroupName FROM `Group` g LEFT JOIN GroupAccount ga ON g.GroupID = ga.GroupID GROUP BY g.GroupID WHERE COUNT(ga.GroupID) = 0;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'WHERE COUNT(ga.GroupID) = 0' at line 1
mysql> SELECT g.GroupID, g.GroupName FROM `Group` g LEFT JOIN GroupAccount ga ON g.GroupID = ga.GroupID GROUP BY g.GroupID HAVING COUNT(ga.GroupID) = 0;
+---------+-----------+
| GroupID | GroupName |
+---------+-----------+
|       5 | Geo       |
|       8 | Arty      |
+---------+-----------+
2 rows in set (0.00 sec)

mysql> SELECT q.QuestionID, COUNT(an.AnswerID) FROM Question q
    -> LEFT JOIN Answer a ON q.QuestionID = an.QuestionID
    -> GROUP BY q.QuestionID
    -> HAVING COUNT(an.AnswerID) = 0;
ERROR 1054 (42S22): Unknown column 'an.AnswerID' in 'field list'
mysql> SELECT q.QuestionID, COUNT(an.AnswerID) FROM Question q
    -> LEFT JOIN Answer an ON q.QuestionID = an.QuestionID
    -> GROUP BY q.QuestionID
    -> HAVING COUNT(an.AnswerID) = 0;
+------------+--------------------+
| QuestionID | COUNT(an.AnswerID) |
+------------+--------------------+
|          5 |                  0 |
|          6 |                  0 |
|          7 |                  0 |
+------------+--------------------+
3 rows in set (0.01 sec)

mysql> SELECT * FROM Answer
    -> GROUP BY AnswerID
    -> \c
mysql> SELECT AccountID FROM Account WHERE AccountID = 1
    -> UNION
    -> SELECT Account
    -> \c
mysql> SELECT AccountID FROM GroupAccount WHERE GroupID = 1
    -> UNION
    -> SELECT AccountID FROM GroupAccount WHERE GroupID = 2;
+-----------+
| AccountID |
+-----------+
|         6 |
|        11 |
|         3 |
|         9 |
+-----------+
4 rows in set (0.00 sec)

mysql> SELECT GroupID FROM GroupAccount GROUP BY GroupID HAVING COUNT(AccountID) > 2
    -> UNION
    -> SELECT GroupID FROM GroupAccount GROUP BY GroupID HAVING COUNT(AccountID
    -> \c
mysql> SELECT GroupID FROM GroupAccount GROUP BY GroupID HAVING COUNT(AccountID) > 2
    -> UNION ALL
    -> SELECT GroupID FROM GroupAccount GROUP BY GroupID HAVING COUNT(AccountID) > 1;
+---------+
| GroupID |
+---------+
|       2 |
|       1 |
|       2 |
+---------+
3 rows in set (0.01 sec)

mysql> EXIT:
    -> EXIT;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'EXIT:
EXIT' at line 1
mysql> EXIT;
