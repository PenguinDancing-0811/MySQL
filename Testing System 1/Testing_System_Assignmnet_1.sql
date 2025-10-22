mysql> \! rm /home/linh/Documemts/Workspace/MySQL/Assignments/"Testing System 1"/TSA1.sql
mysql> \! rm /home/linh/Documents/Workspace/MySQL/Assignments/Testing System 1/TSA1.sql;
mysql> mysql> \! rm '/home/linh/Documents/Workspace/MySQL/Assignments/Testing System 1/TSA1.sql'
    -> 
    -> \c
mysql> CREATE DATABASE Testing_System;
Query OK, 1 row affected (0.00 sec)

mysql> USE Testing_System;
Database changed
mysql> CREATE TABLE Department (
    -> DepartmentID SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    -> DepartmentName VARCHAR(50) NOT NULL);
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE TABLE Position (
    -> PositionID SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    -> PositionName ENUM('Dev', 'Test', 'Scrum Master', 'PM') NOT NULL);
Query OK, 0 rows affected (0.02 sec)

mysql> CREATE TABLE Account (
    -> AccountID SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    -> Email VARCHAR(80) NOT NULL,
    -> Username VARCHAR(50) NOT NULL,
    -> FullName VARCHAR(50) NOT NULL,
    -> DepartmentID SMALLINT UNSIGNED,
    -> PRIMARY KEY (DepartmentID) REFERENCES Department(DepartmentID),
    -> PositionID SMALLINT UNSIGNED,
    -> PRIMARY KEY (PositionID) REFERENCES Position(PositionID),
    -> CreateDate DATE DEFAULT (NOW()));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'REFERENCES Department(DepartmentID),
PositionID SMALLINT UNSIGNED,
PRIMARY KEY (' at line 7
mysql> CREATE TABLE Account (
    -> AccountID SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    -> Email VARCHAR(80) NOT NULL,
    -> Username VARCHAR(50) NOT NULL,
    -> FullName VARCHAR(50) NOT NULL,
    -> DepartmentID SMALLINT UNSIGNED,
    -> PositionID SMALLINT UNSIGNED,
    -> CreateDate DATE DEFAULT (CURRENT_DATE()),
    -> FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    -> FOREIGN KEY (PositionID) REFERENCES Position(PositionID));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Position(PositionID))' at line 10
mysql> mysql> CREATE TABLE Account (
    ->     -> AccountID SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ->     -> Email VARCHAR(80) NOT NULL,
    ->     -> Username VARCHAR(50) NOT NULL,
    ->     -> FullName VARCHAR(50) NOT NULL,
    ->     -> DepartmentID SMALLINT UNSIGNED,
    ->     -> PositionID SMALLINT UNSIGNED,
    ->     -> CreateDate DATE DEFAULT (CURRENT_DATE()),
    ->     -> FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    ->     -> FOREIGN KEY (PositionID) REFERENCES Position(PositionID));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'mysql> CREATE TABLE Account (
    -> AccountID SMALLINT UNSIGNED AUTO_INCREMENT ' at line 1
mysql> ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Position(PositionID))' at line 10
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ERROR 1064 (42000): You have an error in your SQL syntax' at line 1
    -> /c
    -> 
    -> \c
mysql> CREATE TABLE Account (
    -> AccountID SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    -> Email VARCHAR(50) NOT NULL,
    -> Username VARCHAR(50) NOT NULL,
    -> FullName VARCHAR(50) NOT NULL,
    -> DepartmentID SMALLINT UNSIGNED,
    -> FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    -> PositionID SMALLINT UNSIGNED,
    -> FOREIGN KEY (PositionID) REFERENCES Position(PositionID),
    -> CreateDate DATE DEFAULT (CURRENT_DATE())
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Position(PositionID),
CreateDate DATE DEFAULT (CURRENT_DATE())
)' at line 9
mysql> CREATE TABLE Account (
    -> AccountID SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    -> Email VARCHAR(50) NOT NULL,
    -> Username VARCHAR(50) NOT NULL,
    -> FullName VARCHAR(50) NOT NULL,
    -> DepartmentID SMALLINT UNSIGNED,
    -> CreateDate DATE DEFAULT (CURRENT_DATE()),
    -> FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    -> FOREIGN KEY (PositionID) REFERENCES Position(PositionID));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Position(PositionID))' at line 9
mysql> CREATE TABLE Account (
    -> AccountID SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    -> Email VARCHAR(50) NOT NULL,
    -> Username VARCHAR(50) NOT NULL,
    -> FullName VARCHAR(50) NOT NULL,
    -> DepartmentID SMALLINT UNSIGNED,
    -> PositionID SMALLINT UNSIGNED,
    -> CreateDate DATE DEFAULT (CURRENT_DATE()),
    -> FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    -> FOREIGN KEY (PositionID) REFERENCES Position(PositionID)
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Position(PositionID)
)' at line 10
mysql> SELECT VERSION()
    -> \c
mysql> SELECT VERSION();
+-------------------------+
| VERSION()               |
+-------------------------+
| 8.0.43-0ubuntu0.22.04.2 |
+-------------------------+
1 row in set (0.00 sec)

mysql> CREATE TABLE Account (
    -> AccountID SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    -> Email VARCHAR(50) NOT NULL,
    -> Username VARCHAR(50) NOT NULL,
    -> FullName VARCHAR(50) NOT NULL,
    -> DepartmentID SMALLINT UNSIGNED,
    -> PositionID SMALLINT UNSIGNED,
    -> CreateDate DATE DEFAULT (CURRENT_DATE()),
    -> FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    -> FOREIGN KEY (PositionID) REFERENCES `Position`(PositionID));
Query OK, 0 rows affected (0.05 sec)

mysql> CREATE TABLE `Group` (
    -> GroupID SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    -> GroupName VARCHAR(50) NOT NULL,
    -> CreatorID SMALLINT UNSIGNED,
    -> FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID),
    -> CreateDate DATE DEFAULT (CURRENT_DATE()));
Query OK, 0 rows affected (0.03 sec)

mysql> CREATE TABLE GroupAccount (
    -> GroupID SMALLINT UNSIGNED,
    -> FOREIGN KEY (GroupID) REFERENCES `Group`(GroupID),
    -> AccountID SMALLINT UNSIGNED,
    -> FOREIGN KEY (AccountID) REFERENCES `Account`(AccountID),
    -> JoinDate DATE);
Query OK, 0 rows affected (0.05 sec)

mysql> CREATE TABLE TypeQuestion (
    -> TypeID SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    -> TypeName ENUM('Essay', 'Multiple-Choice'));
Query OK, 0 rows affected (0.02 sec)

mysql> CREATE CategoryQuestion (
    -> CategoryID SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    -> CategoryName VARCHAR(50));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'CategoryQuestion (
CategoryID SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Cate' at line 1
mysql> CREATE TABLE CategoryQuestion (
    -> CategoryID SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    -> CategoryName VARCHAR(50));
Query OK, 0 rows affected (0.05 sec)

mysql> CREATE TABLE `Question` (
    -> QuestionID SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    -> Content VARCHAR(200),
    -> CategoryID SMALLINT UNSIGNED,
    -> FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
    -> TypeID SMALLINT UNSIGNED,
    -> FOREIGN KEY (TypeID) REFERENCES TypeQuestion(TypeID),
    -> CreatorID SMALLINT UNSIGNED,
    -> FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID),
    -> CreateDate DATE DEFAULT (CURRENT_DATE()));
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE TABLE `Answer` (
    -> AnswerID SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    -> Content VARCHAR(200) NOT NULL,
    -> QuestionID SMALLINT UNSIGNED,
    -> FOREIGN KEY (QuestionID) REFERENCES `Question`(QuestionID),
    -> isCorrect ENUM('Wrong', 'Right'));
Query OK, 0 rows affected (0.03 sec)

mysql> CREATE TABLE Exam (
    -> ExamID SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    -> Code TINYINT UNSIGNED NOT NULL,
    -> Title VARCHAR(80),
    -> CategoryID SMALLINT UNSIGNED,
    -> FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
    -> Duration TIME,
    -> CreatorID SMALLINT UNSIGNED,
    -> FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID),
    -> CreateDate DATE DEAFULT (CURRENT_DATE()));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DEAFULT (CURRENT_DATE()))' at line 10
mysql> CREATE TABLE Exam (
    -> ExamID SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    -> Code TINYINT UNSIGNED NOT NULL,
    -> Title VARCHAR(80),
    -> CategoryID SMALLINT UNSIGNED,
    -> FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
    -> Duration TIME,
    -> CreatorID SMALLINT UNSIGNED,
    -> FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID),
    -> CreateDate DATE DEFAULT (CURRENT_DATE()));
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE TABLE ExamQuestion (
    -> ExamID SMALLINT UNSIGNED,
    -> FOREIGN KEY (ExamID) REFERENCES Exam(ExamID),
    -> QuestionID SMALLINT UNSIGNED,
    -> FOREIGN KEY (QuestionID) REFERENCES `Question`(QuestionID));
Query OK, 0 rows affected (0.04 sec)

mysql> EXIT;
