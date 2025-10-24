mysql> CREATE DATABASE Fresher;
Query OK, 1 row affected (0.00 sec)

mysql> USE Fresher;
Database changed
mysql> CREATE TABLE Trainee (
    -> TraineeID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    -> Full_Name VARCHAR(50) NOT NULL,
    -> Birth_Date DATE NOT NULL,
    -> Gender ENUM('MALE', 'FEMALE', 'UNKNOWN'),
    -> \c
mysql> CREATE TABLE Trainee (
    -> TraineeID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    -> Full_Name VARCHAR(50) NOT NULL,
    -> Gender ENUM('MALE', 'FEMALE', 'UNKNOWN') NOT NULL,
    -> ET_IQ TINYINT UNSIGNED NOT NULL,
    -> CONSTRAINT chk_et_iq CHECK (ET_IQ >= 0 AND ET_IQ <=20),
    -> ET_Gmath TINYINT UNSIGNED NOT NULL,
    -> CONSTRAINT chk_et_gmath CHECK (ET_Gmath >= 0 AND ET_Gmath <= 20),
    -> ET_English TINYINT UNSIGNED NOT NULL,
    -> CONSTRAINT chk_et_english CHECK (ET_English >= 0 AND ET_English <= 50),
    -> Training Class VARCHAR(30) NOT NULL,
    -> CONSTRAINT chk_class CHECK (Training
    -> \c
mysql> CREATE TABLE Trainee (
    -> TraineeID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    -> Full_Name VARCHAR(50) NOT NULL,
    -> Gender ENUM('MALE', 'FEMALE', 'UNKNOWN') NOT NULL,
    -> ET_IQ TINYINT UNSIGNED NOT NULL,
    -> CONSTRAINT chk_et_iq CHECK (ET_IQ >= 0 AND ET_IQ <=20),
    -> ET_Gmath TINYINT UNSIGNED NOT NULL,
    -> CONSTRAINT chk_et_gmath CHECK (ET_Gmath >= 0 AND ET_Gmath <= 20),
    -> ET_English TINYINT UNSIGNED NOT NULL,
    -> CONSTRAINT chk_et_english CHECK (ET_English >= 0 AND ET_English <= 50),
    -> Training_Class VARCHAR(30) NOT NULL,
    -> CONSTRAINT chk_class CHECK (Training_Class LIKE 'VTI%'),
    -> Evaluation_Notes VARCHAR(30));
Query OK, 0 rows affected (0.03 sec)

mysql> INSERT INTO Trainee (Full_Name, Gender, ET_IQ, ET_Math, ET_English, Training_Class, Evaluation_Notes)
    -> VALUES
    -> ('Nguyen Dieu Linh', 'FEMALE', 10, 5, 30, 'VTI002', 'UADL'),
    -> ('Le Minh Hieu', 'MALE', 15, 20, 47, 'VTI001', 'DHBK'),
    -> ('Vu Ho Dang Khoa', 'MALE', 12, 8, 40, 'VTI002', 'UCL'),
    -> ('Le Ho Khanh Ngan', 'FEMALE', 20, 16, 50, 'VTI001', 'DHBK'),
    -> ('James Swan', 'MALE', 8, 2, 10, 'VTI003', 'UCLA'),
    -> ('Pham Thi Thu Huong', 'FEMALE', 18, 19, 48, 'VTI002', 'FTU'),
    -> ('Nguyen The Van', 'MALE', 20, 10, 43, 'VTI002', 'LAW'),
    -> ('Nguyen Gia Hien', 'MALE', 7, 18, 39, 'VTI001', 'FTU'),
    -> ('Ngo Bach', 'FEMALE', 18, 20, 4, 'VTI003', 'FTU'),
    -> ('Cucumber', 'MALE', 19, 2, 35, 'VTI004', 'UADL');
ERROR 1054 (42S22): Unknown column 'ET_Math' in 'field list'
mysql> INSERT INTO Trainee (Full_Name, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes) 
    -> VALUES
    -> ('Nguyen Dieu Linh', 'FEMALE', 10, 5, 30, 'VTI002', 'UADL'),
    -> ('Le Minh Hieu', 'MALE', 15, 20, 47, 'VTI001', 'DHBK'),
    -> ('Vu Ho Dang Khoa', 'MALE', 12, 8, 40, 'VTI002', 'UCL'),
    -> ('Le Ho Khanh Ngan', 'FEMALE', 20, 16, 50, 'VTI001', 'DHBK'),
    -> ('James Swan', 'MALE', 8, 2, 10, 'VTI003', 'UCLA'),
    -> ('Pham Thi Thu Huong', 'FEMALE', 18, 19, 48, 'VTI002', 'FTU'),
    -> ('Nguyen The Van', 'MALE', 20, 10, 43, 'VTI002', 'LAW'),
    -> ('Nguyen Gia Hien', 'MALE', 7, 18, 39, 'VTI001', 'FTU'),
    -> ('Ngo Bach', 'FEMALE', 18, 20, 4, 'VTI003', 'FTU'),
    -> ('Cucumber', 'MALE', 19, 2, 35, 'VTI004', 'UADL');
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> SELECT Full_Name FROM Trainee
    -> WHERE ET_IQ >= 12 AND ET_Gmath >= 12 AND ET_English >= 20
    -> ORDER BY ET_IQ ASC;
+--------------------+
| Full_Name          |
+--------------------+
| Le Minh Hieu       |
| Pham Thi Thu Huong |
| Le Ho Khanh Ngan   |
+--------------------+
3 rows in set (0.00 sec)

mysql> SELECT Full_Name FROM Trainee
    -> WHERE Full_Name LIKE 'N%C';
Empty set (0.00 sec)

mysql> SELECT Full_Name FROM Trainee
    -> WHERE Full_Name LIKE '_g%';
+------------------+
| Full_Name        |
+------------------+
| Nguyen Dieu Linh |
| Nguyen The Van   |
| Nguyen Gia Hien  |
| Ngo Bach         |
+------------------+
4 rows in set (0.00 sec)

mysql> SELECT Full_Name FROM Trainee
    -> WHERE 
    -> \c
mysql> SELECT * FROM Trainee
    -> WHERE CHAR_LENGTH(Full_Name) = 10 and Full_Name LIKE '%C';
Empty set (0.00 sec)

mysql> 
mysql> 
mysql> 
mysql> 
mysql> 
mysql> 
mysql> 
mysql> 
mysql> 
mysql> 
mysql> 
mysql> SELECT DISTINCT Full_Name FROM Trainee;
+--------------------+
| Full_Name          |
+--------------------+
| Nguyen Dieu Linh   |
| Le Minh Hieu       |
| Vu Ho Dang Khoa    |
| Le Ho Khanh Ngan   |
| James Swan         |
| Pham Thi Thu Huong |
| Nguyen The Van     |
| Nguyen Gia Hien    |
| Ngo Bach           |
| Cucumber           |
+--------------------+
10 rows in set (0.00 sec)

mysql> SELECT Full_Name FROM Trainee ORDER BY Full_Name;
+--------------------+
| Full_Name          |
+--------------------+
| Cucumber           |
| James Swan         |
| Le Ho Khanh Ngan   |
| Le Minh Hieu       |
| Ngo Bach           |
| Nguyen Dieu Linh   |
| Nguyen Gia Hien    |
| Nguyen The Van     |
| Pham Thi Thu Huong |
| Vu Ho Dang Khoa    |
+--------------------+
10 rows in set (0.00 sec)

mysql> SELECT * FROM Trainee
    -> WHERE CHAR_LENGTH(Full_Name) = (
    -> SELECT MAX(CHAR_LENGTH(Full_Name)) FROM Trainee);
+-----------+--------------------+--------+-------+----------+------------+----------------+------------------+
| TraineeID | Full_Name          | Gender | ET_IQ | ET_Gmath | ET_English | Training_Class | Evaluation_Notes |
+-----------+--------------------+--------+-------+----------+------------+----------------+------------------+
|         6 | Pham Thi Thu Huong | FEMALE |    18 |       19 |         48 | VTI002         | FTU              |
+-----------+--------------------+--------+-------+----------+------------+----------------+------------------+
1 row in set (0.00 sec)

mysql> SELECT Full_Name, ET_IQ, ET_Gmath, ET_English FROM Trainee
    -> WHERE CHAR_LENGTH(Full_Name) =
    -> (SELECT MAX(CHAR_LENGTH(Full_Name)) FROM Trainee);
+--------------------+-------+----------+------------+
| Full_Name          | ET_IQ | ET_Gmath | ET_English |
+--------------------+-------+----------+------------+
| Pham Thi Thu Huong |    18 |       19 |         48 |
+--------------------+-------+----------+------------+
1 row in set (0.00 sec)

mysql> SELECT Full_Name FROM Trainee
    -> ORDER BY ET_IQ DESC
    -> LIMIT 5;
+--------------------+
| Full_Name          |
+--------------------+
| Le Ho Khanh Ngan   |
| Nguyen The Van     |
| Cucumber           |
| Pham Thi Thu Huong |
| Ngo Bach           |
+--------------------+
5 rows in set (0.00 sec)

mysql> SELECT Full_Name FROM Trainee
    -> WHERE SUM(ET_IQ, \c
mysql> SELECT Full_Name FROM Trainee
    -> WHERE ET_IQ + ET_Gmath >= 20 AND (ET_IQ, ET_Gmath) >= 8 AND ET_English >= 18;
ERROR 1241 (21000): Operand should contain 2 column(s)
mysql> SELECT Full_Name FROM Trainee
    -> WHERE ET_IQ + ET_Gmath >= 20 AND (ET_IQ, ET_Gmath) >= (8,8) AND ET_English >= 18;
+--------------------+
| Full_Name          |
+--------------------+
| Le Minh Hieu       |
| Vu Ho Dang Khoa    |
| Le Ho Khanh Ngan   |
| Pham Thi Thu Huong |
| Nguyen The Van     |
| Cucumber           |
+--------------------+
6 rows in set (0.00 sec)

mysql> 
mysql> DELETE FROM Trainee WHERE TraineeID = 5;
Query OK, 1 row affected (0.01 sec)

mysql> UPDATE Trainee
    -> SET Training_Class = 'VTI003'
    -> WHERE TraineeID = 3;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE Trainee
    -> SET Full_Name = 'Le Van A', ET_IQ = 10, ET_Gmath = 15, ET_English = 15, ET_English = 30
    -> WHERE TraineeID = 7;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT 1 FROM Trainee;
+---+
| 1 |
+---+
| 1 |
| 1 |
| 1 |
| 1 |
| 1 |
| 1 |
| 1 |
| 1 |
| 1 |
+---+
9 rows in set (0.00 sec)

mysql> SELECT *, 1 FROM Trainee;
+-----------+--------------------+--------+-------+----------+------------+----------------+------------------+---+
| TraineeID | Full_Name          | Gender | ET_IQ | ET_Gmath | ET_English | Training_Class | Evaluation_Notes | 1 |
+-----------+--------------------+--------+-------+----------+------------+----------------+------------------+---+
|         1 | Nguyen Dieu Linh   | FEMALE |    10 |        5 |         30 | VTI002         | UADL             | 1 |
|         2 | Le Minh Hieu       | MALE   |    15 |       20 |         47 | VTI001         | DHBK             | 1 |
|         3 | Vu Ho Dang Khoa    | MALE   |    12 |        8 |         40 | VTI003         | UCL              | 1 |
|         4 | Le Ho Khanh Ngan   | FEMALE |    20 |       16 |         50 | VTI001         | DHBK             | 1 |
|         6 | Pham Thi Thu Huong | FEMALE |    18 |       19 |         48 | VTI002         | FTU              | 1 |
|         7 | Le Van A           | MALE   |    10 |       15 |         30 | VTI002         | LAW              | 1 |
|         8 | Nguyen Gia Hien    | MALE   |     7 |       18 |         39 | VTI001         | FTU              | 1 |
|         9 | Ngo Bach           | FEMALE |    18 |       20 |          4 | VTI003         | FTU              | 1 |
|        10 | Cucumber           | MALE   |    19 |        2 |         35 | VTI004         | UADL             | 1 |
+-----------+--------------------+--------+-------+----------+------------+----------------+------------------+---+
9 rows in set (0.00 sec)

mysql> SELECT COUNT(*) FROM Trainee WHERE Training_Class = 'VTI001';
+----------+
| COUNT(*) |
+----------+
|        3 |
+----------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(*) FROM Trainee WHERE Training_Class = 'VTI001' AND Training_Class = 'VTI003';
+----------+
| COUNT(*) |
+----------+
|        0 |
+----------+
1 row in set (0.00 sec)

mysql> SELECT COUNT(*) FROM Trainee WHERE Training_Class = 'VTI001' AND Training_Class = 'VTI003';
+----------+
| COUNT(*) |
+----------+
|        0 |
+----------+
1 row in set (0.00 sec)

mysql> +----------+
    -> \c
mysql> SELECT COUNT(*) FROM Trainee WHERE Training_Class = 'VTI001' OR Training_Class = 'VTI003';
+----------+
| COUNT(*) |
+----------+
|        5 |
+----------+
1 row in set (0.00 sec)

mysql> SELECT Gender, COUNT(*) AS count FROM Trainee GROUP BY Gender;
+--------+-------+
| Gender | count |
+--------+-------+
| FEMALE |     4 |
| MALE   |     5 |
+--------+-------+
2 rows in set (0.00 sec)

mysql> SELECT Training_Class WHERE 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> 
    -> \c
mysql> SELECT Training_Class FROM Trainee WHERE COUNT(*) > 2 GROUP BY Training_Class;
ERROR 1111 (HY000): Invalid use of group function
mysql> SELECT Training_Class FROM Trainee
    -> GROUP BY Training_Class
    -> HAVING COUNT
    -> \c
mysql> SEELECT Training_Class From Trainee
    -> GROUP BY Training_Class
    -> HAVING COUNT(*)>2;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SEELECT Training_Class From Trainee
GROUP BY Training_Class
HAVING COUNT(*)>2' at line 1
mysql> SEELECT Training_Class From Trainee
    -> GROUP BY Training_Class
    -> HAVING COUNT(*) > 2;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SEELECT Training_Class From Trainee
GROUP BY Training_Class
HAVING COUNT(*) > 2' at line 1
mysql> SELECT Training_Class FROM Trainee
    -> GROUP BY Training_Class
    -> HAVING COUNT(*)>2;
+----------------+
| Training_Class |
+----------------+
| VTI002         |
| VTI001         |
+----------------+
2 rows in set (0.00 sec)

mysql> SELECT Evaluation_Notes FROM Trainee
    -> GROUP BY Evaluation_Notes
    -> HAVING COUNT(*) < 4;
+------------------+
| Evaluation_Notes |
+------------------+
| UADL             |
| DHBK             |
| UCL              |
| FTU              |
| LAW              |
+------------------+
5 rows in set (0.00 sec)

mysql> SELECT TraineeID, Full_Name FROM Trainee WHERE Traing_Class = 'VTI001'
    -> UNION
    -> SELECT TraineeID, Full_Name FROM Trainee WHERE Training_Class = 'VT002';
ERROR 1054 (42S22): Unknown column 'Traing_Class' in 'where clause'
mysql> SELECT TraineeID, Full_Name FROM Trainee WHERE Training_Class = 'VTI001'
    -> UNION
    -> SELECT TraineeID, Full_Name FROM Trainee WHERE Training_Class = 'VT002';
+-----------+------------------+
| TraineeID | Full_Name        |
+-----------+------------------+
|         2 | Le Minh Hieu     |
|         4 | Le Ho Khanh Ngan |
|         8 | Nguyen Gia Hien  |
+-----------+------------------+
3 rows in set (0.00 sec)

mysql> EXIT;
