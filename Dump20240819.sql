-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: uni_teste
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `ClassID` int NOT NULL,
  `ClassName` varchar(100) DEFAULT NULL,
  `DepartmentID` int DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `Registrations` int DEFAULT NULL,
  `PreRequisites` varchar(255) DEFAULT NULL,
  `ProfessorID` int DEFAULT NULL,
  PRIMARY KEY (`ClassID`),
  KEY `fk_Department_Class` (`DepartmentID`),
  KEY `fk_ProfessorID` (`ProfessorID`),
  CONSTRAINT `fk_Department_Class` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`DepartmentID`),
  CONSTRAINT `fk_ProfessorID` FOREIGN KEY (`ProfessorID`) REFERENCES `professors` (`ProfessorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (101,'Intro to Computer Science',1,'2024-09-01',30,'None',NULL),(102,'Calculus I',2,'2024-09-15',25,'None',NULL),(103,'General Physics',3,'2024-10-01',20,'None',NULL);
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classesprerequisites`
--

DROP TABLE IF EXISTS `classesprerequisites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classesprerequisites` (
  `ClassID` int NOT NULL,
  `PreRequisiteID` int NOT NULL,
  PRIMARY KEY (`ClassID`,`PreRequisiteID`),
  KEY `PreRequisiteID` (`PreRequisiteID`),
  CONSTRAINT `classesprerequisites_ibfk_1` FOREIGN KEY (`ClassID`) REFERENCES `classes` (`ClassID`),
  CONSTRAINT `classesprerequisites_ibfk_2` FOREIGN KEY (`PreRequisiteID`) REFERENCES `prerequisites` (`PreRequisiteID`),
  CONSTRAINT `fk_ClassID` FOREIGN KEY (`ClassID`) REFERENCES `classes` (`ClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classesprerequisites`
--

LOCK TABLES `classesprerequisites` WRITE;
/*!40000 ALTER TABLE `classesprerequisites` DISABLE KEYS */;
INSERT INTO `classesprerequisites` VALUES (101,1),(102,2),(103,3);
/*!40000 ALTER TABLE `classesprerequisites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseandclass`
--

DROP TABLE IF EXISTS `courseandclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courseandclass` (
  `ClassID` int NOT NULL,
  `CourseID` int NOT NULL,
  PRIMARY KEY (`ClassID`,`CourseID`),
  KEY `fk_CourseID` (`CourseID`),
  CONSTRAINT `courseandclass_ibfk_1` FOREIGN KEY (`ClassID`) REFERENCES `classes` (`ClassID`),
  CONSTRAINT `courseandclass_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`),
  CONSTRAINT `fk_CourseID` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseandclass`
--

LOCK TABLES `courseandclass` WRITE;
/*!40000 ALTER TABLE `courseandclass` DISABLE KEYS */;
INSERT INTO `courseandclass` VALUES (101,201),(102,202),(103,203);
/*!40000 ALTER TABLE `courseandclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `CourseID` int NOT NULL,
  `CourseName` varchar(100) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `PreRequisites` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (201,'Data Structures','2024-09-10','CS101'),(202,'Linear Algebra','2024-09-20','MATH101'),(203,'Electromagnetism','2024-10-10','PHY101');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dates`
--

DROP TABLE IF EXISTS `dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dates` (
  `DateID` int NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT NULL,
  `Year` int DEFAULT NULL,
  `Month` int DEFAULT NULL,
  `Day` int DEFAULT NULL,
  PRIMARY KEY (`DateID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dates`
--

LOCK TABLES `dates` WRITE;
/*!40000 ALTER TABLE `dates` DISABLE KEYS */;
INSERT INTO `dates` VALUES (1,'2024-01-01',2024,1,1),(2,'2024-01-15',2024,1,15),(3,'2024-02-01',2024,2,1);
/*!40000 ALTER TABLE `dates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `DepartmentID` int NOT NULL,
  `DepartmentName` varchar(100) DEFAULT NULL,
  `Campus` varchar(100) DEFAULT NULL,
  `HeadID` int DEFAULT NULL,
  PRIMARY KEY (`DepartmentID`),
  KEY `fk_HeadID` (`HeadID`),
  CONSTRAINT `fk_Head` FOREIGN KEY (`HeadID`) REFERENCES `professors` (`ProfessorID`),
  CONSTRAINT `fk_HeadID` FOREIGN KEY (`HeadID`) REFERENCES `professors` (`ProfessorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Computer Science','Main Campus',1),(2,'Mathematics','West Campus',2),(3,'Physics','East Campus',3);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prerequisites`
--

DROP TABLE IF EXISTS `prerequisites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prerequisites` (
  `PreRequisiteID` int NOT NULL,
  `PreRequisiteName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PreRequisiteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prerequisites`
--

LOCK TABLES `prerequisites` WRITE;
/*!40000 ALTER TABLE `prerequisites` DISABLE KEYS */;
INSERT INTO `prerequisites` VALUES (1,'None'),(2,'CS101'),(3,'MATH101'),(4,'PHY101');
/*!40000 ALTER TABLE `prerequisites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professors`
--

DROP TABLE IF EXISTS `professors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professors` (
  `ProfessorID` int NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `DepartmentID` int DEFAULT NULL,
  `CoursesTaught` varchar(255) DEFAULT NULL,
  `DateID` int DEFAULT NULL,
  PRIMARY KEY (`ProfessorID`),
  KEY `fk_Department` (`DepartmentID`),
  CONSTRAINT `fk_Department` FOREIGN KEY (`DepartmentID`) REFERENCES `departments` (`DepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professors`
--

LOCK TABLES `professors` WRITE;
/*!40000 ALTER TABLE `professors` DISABLE KEYS */;
INSERT INTO `professors` VALUES (1,'Dr. Alice Johnson',1,'CS101, CS202',NULL),(2,'Dr. Bob Smith',2,'MATH101, MATH202',NULL),(3,'Dr. Carol Davis',3,'PHY101, PHY202',NULL);
/*!40000 ALTER TABLE `professors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrations`
--

DROP TABLE IF EXISTS `registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registrations` (
  `RegistrationID` int NOT NULL,
  `StudentID` int DEFAULT NULL,
  `ClassID` int DEFAULT NULL,
  `RegistrationDate` date DEFAULT NULL,
  `DateID` int DEFAULT NULL,
  PRIMARY KEY (`RegistrationID`),
  KEY `fk_StudentID` (`StudentID`),
  KEY `fk_DateID` (`DateID`),
  KEY `fk_newClassID` (`ClassID`),
  CONSTRAINT `fk_DateID` FOREIGN KEY (`DateID`) REFERENCES `dates` (`DateID`),
  CONSTRAINT `fk_newClassID` FOREIGN KEY (`ClassID`) REFERENCES `classes` (`ClassID`),
  CONSTRAINT `fk_StudentID` FOREIGN KEY (`StudentID`) REFERENCES `students` (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrations`
--

LOCK TABLES `registrations` WRITE;
/*!40000 ALTER TABLE `registrations` DISABLE KEYS */;
INSERT INTO `registrations` VALUES (1,1001,101,'2024-08-20',NULL),(2,1002,102,'2024-08-25',NULL),(3,1003,103,'2024-08-30',NULL);
/*!40000 ALTER TABLE `registrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `StudentID` int NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`StudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1001,'Emily Brown'),(1002,'Michael Lee'),(1003,'Sarah Wilson');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-19 18:24:56
