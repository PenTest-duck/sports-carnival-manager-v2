-- MySQL dump 10.13  Distrib 8.0.32, for macos11.5 (arm64)
--
-- Host: localhost    Database: db3nf
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carnivallocation`
--

DROP TABLE IF EXISTS `carnivallocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carnivallocation` (
  `locationID` int NOT NULL AUTO_INCREMENT,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`locationID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carnivallocation`
--

LOCK TABLES `carnivallocation` WRITE;
/*!40000 ALTER TABLE `carnivallocation` DISABLE KEYS */;
INSERT INTO `carnivallocation` VALUES (1,'White Oval'),(2,'Doyles'),(3,'Quad');
/*!40000 ALTER TABLE `carnivallocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carnivals`
--

DROP TABLE IF EXISTS `carnivals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carnivals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `typeID` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  `locationID` int DEFAULT NULL,
  `staffID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `typeID` (`typeID`),
  KEY `locationID` (`locationID`),
  KEY `staffID` (`staffID`),
  CONSTRAINT `carnivals_ibfk_1` FOREIGN KEY (`typeID`) REFERENCES `carnivalType` (`typeID`),
  CONSTRAINT `carnivals_ibfk_2` FOREIGN KEY (`locationID`) REFERENCES `carnivalLocation` (`locationID`),
  CONSTRAINT `carnivals_ibfk_3` FOREIGN KEY (`staffID`) REFERENCES `staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carnivals`
--

LOCK TABLES `carnivals` WRITE;
/*!40000 ALTER TABLE `carnivals` DISABLE KEYS */;
INSERT INTO `carnivals` VALUES (14,'abc',1,'2023-03-13','20:32:00','12:29:00',2,'ySRlwnQ7RYQhmCiyPZBc3xsZL2K3'),(15,'TKS Athletics Carnival',1,'2023-03-26','10:00:00','15:00:00',1,'ySRlwnQ7RYQhmCiyPZBc3xsZL2K3'),(16,'chriscomp',1,'2023-10-19','00:30:00','12:30:00',1,'SGQvN4MeBuPr9MiMd2E3krCJs4s2');
/*!40000 ALTER TABLE `carnivals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carnivaltype`
--

DROP TABLE IF EXISTS `carnivaltype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carnivaltype` (
  `typeID` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`typeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carnivaltype`
--

LOCK TABLES `carnivaltype` WRITE;
/*!40000 ALTER TABLE `carnivaltype` DISABLE KEYS */;
INSERT INTO `carnivaltype` VALUES (1,'Athletics'),(2,'Swimming'),(3,'Cross Country');
/*!40000 ALTER TABLE `carnivaltype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventAgeGroup`
--

DROP TABLE IF EXISTS `eventAgeGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventAgeGroup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ageGroup` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventAgeGroup`
--

LOCK TABLES `eventAgeGroup` WRITE;
/*!40000 ALTER TABLE `eventAgeGroup` DISABLE KEYS */;
INSERT INTO `eventAgeGroup` VALUES (1,'U13'),(2,'U14'),(3,'U15'),(4,'U16'),(5,'U17'),(6,'Opens');
/*!40000 ALTER TABLE `eventAgeGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventcategory`
--

DROP TABLE IF EXISTS `eventcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventcategory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventcategory`
--

LOCK TABLES `eventcategory` WRITE;
/*!40000 ALTER TABLE `eventcategory` DISABLE KEYS */;
INSERT INTO `eventcategory` VALUES (1,'field'),(2,'track'),(3,'relay');
/*!40000 ALTER TABLE `eventcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventdivision`
--

DROP TABLE IF EXISTS `eventdivision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventdivision` (
  `id` int NOT NULL AUTO_INCREMENT,
  `division` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventdivision`
--

LOCK TABLES `eventdivision` WRITE;
/*!40000 ALTER TABLE `eventdivision` DISABLE KEYS */;
INSERT INTO `eventdivision` VALUES (1,'Championships'),(2,'Division 1'),(3,'Division 2'),(4,'Division 3'),(5,'Division 4'),(6,'Division 5'),(7,'Division 6'),(8,'Division 7'),(9,'Division 8'),(10,'Division 9');
/*!40000 ALTER TABLE `eventdivision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventrecord`
--

DROP TABLE IF EXISTS `eventrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventrecord` (
  `id` int NOT NULL AUTO_INCREMENT,
  `typeID` int DEFAULT NULL,
  `ageGroupID` int DEFAULT NULL,
  `divisionID` int DEFAULT NULL,
  `record` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ageGroupID` (`ageGroupID`),
  KEY `divisionID` (`divisionID`),
  KEY `typeID` (`typeID`),
  CONSTRAINT `eventrecord_ibfk_1` FOREIGN KEY (`ageGroupID`) REFERENCES `eventAgeGroup` (`id`),
  CONSTRAINT `eventrecord_ibfk_2` FOREIGN KEY (`divisionID`) REFERENCES `eventDivision` (`id`),
  CONSTRAINT `eventrecord_ibfk_3` FOREIGN KEY (`typeID`) REFERENCES `eventType` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventrecord`
--

LOCK TABLES `eventrecord` WRITE;
/*!40000 ALTER TABLE `eventrecord` DISABLE KEYS */;
INSERT INTO `eventrecord` VALUES (1,1,1,1,12.34);
/*!40000 ALTER TABLE `eventrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `carnivalID` int DEFAULT NULL,
  `typeID` int DEFAULT NULL,
  `ageGroupID` int DEFAULT NULL,
  `divisionID` int DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `recordID` int DEFAULT NULL,
  `weightingID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `typeID` (`typeID`),
  KEY `ageGroupID` (`ageGroupID`),
  KEY `divisionID` (`divisionID`),
  KEY `recordID` (`recordID`),
  KEY `carnivalID` (`carnivalID`),
  KEY `weightingID` (`weightingID`),
  CONSTRAINT `events_ibfk_1` FOREIGN KEY (`typeID`) REFERENCES `eventType` (`id`),
  CONSTRAINT `events_ibfk_2` FOREIGN KEY (`ageGroupID`) REFERENCES `eventAgeGroup` (`id`),
  CONSTRAINT `events_ibfk_3` FOREIGN KEY (`divisionID`) REFERENCES `eventDivision` (`id`),
  CONSTRAINT `events_ibfk_5` FOREIGN KEY (`recordID`) REFERENCES `eventRecord` (`id`),
  CONSTRAINT `events_ibfk_7` FOREIGN KEY (`carnivalID`) REFERENCES `carnivals` (`id`),
  CONSTRAINT `events_ibfk_8` FOREIGN KEY (`weightingID`) REFERENCES `eventweighting` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (6,15,2,2,6,'09:20:00',NULL,NULL),(7,15,2,1,7,'09:15:00',NULL,NULL),(8,15,4,4,1,'12:30:00',NULL,NULL),(9,15,4,1,1,'00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventtype`
--

DROP TABLE IF EXISTS `eventtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventtype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `carnivalTypeID` int DEFAULT NULL,
  `categoryID` int DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `ascending` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carnivalTypeID` (`carnivalTypeID`),
  KEY `categoryID` (`categoryID`),
  CONSTRAINT `eventtype_ibfk_1` FOREIGN KEY (`carnivalTypeID`) REFERENCES `carnivaltype` (`typeID`),
  CONSTRAINT `eventtype_ibfk_2` FOREIGN KEY (`categoryID`) REFERENCES `eventcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventtype`
--

LOCK TABLES `eventtype` WRITE;
/*!40000 ALTER TABLE `eventtype` DISABLE KEYS */;
INSERT INTO `eventtype` VALUES (1,1,2,'100m Sprint','s',1),(2,1,2,'200m Sprint','s',1),(3,1,2,'400m Sprint','s',1),(4,1,1,'Long Jump','m',0),(5,1,1,'High Jump','cm',0),(6,1,2,'800m Run','s',1),(7,1,2,'1500m Run','s',1),(8,1,2,'3000m Run','s',1),(9,1,2,'Hurdles','s',1),(10,1,1,'Shot Put','cm',0),(11,1,3,'4x400m Relay','s',1),(12,1,3,'4x100m Relay','s',1),(13,2,NULL,'100m Freestyle','s',1);
/*!40000 ALTER TABLE `eventtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventweighting`
--

DROP TABLE IF EXISTS `eventweighting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventweighting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `typeID` int NOT NULL,
  `divisionID` int NOT NULL,
  `placing` int NOT NULL,
  `points` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `typeID` (`typeID`),
  KEY `divisionID` (`divisionID`),
  CONSTRAINT `eventweighting_ibfk_1` FOREIGN KEY (`typeID`) REFERENCES `eventtype` (`id`),
  CONSTRAINT `eventweighting_ibfk_2` FOREIGN KEY (`divisionID`) REFERENCES `eventdivision` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventweighting`
--

LOCK TABLES `eventweighting` WRITE;
/*!40000 ALTER TABLE `eventweighting` DISABLE KEYS */;
/*!40000 ALTER TABLE `eventweighting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventweighting2`
--

DROP TABLE IF EXISTS `eventweighting2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventweighting2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `categoryID` int DEFAULT NULL,
  `divisionID` int DEFAULT NULL,
  `placing` int DEFAULT NULL,
  `points` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoryID` (`categoryID`),
  KEY `divisionID` (`divisionID`),
  CONSTRAINT `eventweighting2_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `eventcategory` (`id`),
  CONSTRAINT `eventweighting2_ibfk_2` FOREIGN KEY (`divisionID`) REFERENCES `eventdivision` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventweighting2`
--

LOCK TABLES `eventweighting2` WRITE;
/*!40000 ALTER TABLE `eventweighting2` DISABLE KEYS */;
INSERT INTO `eventweighting2` VALUES (1,1,1,1,50),(2,1,1,2,48),(3,1,1,3,46),(4,1,1,4,45),(5,1,1,5,44),(6,1,1,6,43),(7,1,1,7,42),(8,1,1,8,41),(9,1,1,9,40),(10,1,1,10,39),(11,1,1,11,38),(12,1,1,12,37),(13,1,1,13,36),(14,1,1,14,35),(15,1,1,15,34),(16,1,1,16,33),(17,1,1,17,32),(18,1,1,18,31),(19,1,1,19,30),(20,1,1,20,29),(21,1,1,21,28),(22,1,1,22,27),(23,1,1,23,26),(24,1,1,24,25),(25,1,1,25,24),(26,1,1,26,23),(27,1,1,27,22),(28,1,1,28,21),(29,1,1,29,20),(30,1,1,30,19),(31,1,1,31,18),(32,1,1,32,17),(33,2,1,1,50),(34,2,1,2,48),(35,2,1,3,46),(36,2,1,4,45),(37,2,1,5,44),(38,2,1,6,43),(39,2,1,7,42),(40,2,1,8,41),(41,2,1,9,40),(42,2,1,10,39),(43,2,1,11,38),(44,2,1,12,37),(45,2,2,1,36),(46,2,2,2,35),(47,2,2,3,34),(48,2,2,4,33),(49,2,2,5,32),(50,2,2,6,31),(51,2,2,7,30),(52,2,2,8,29),(53,2,2,9,28),(54,2,2,10,27),(55,2,2,11,26),(56,2,2,12,25),(57,2,3,1,24),(58,2,3,2,23),(59,2,3,3,22),(60,2,3,4,21),(61,2,3,5,20),(62,2,3,6,19),(63,2,3,7,18),(64,2,3,8,17),(65,2,3,9,16),(66,2,3,10,15),(67,2,3,11,14),(68,2,3,12,13),(69,2,4,1,12),(70,2,4,2,11),(71,2,4,3,10),(72,2,4,4,9),(73,2,4,5,8),(74,2,4,6,7),(75,2,4,7,6),(76,2,4,8,5),(77,2,4,9,4),(78,2,4,10,3),(79,2,4,11,2),(80,2,4,12,1),(81,3,1,1,50),(82,3,1,2,48),(83,3,1,3,46),(84,3,1,4,45),(85,3,1,5,44),(86,3,1,6,43),(87,3,1,7,42),(88,3,1,8,41),(89,3,1,9,40),(90,3,1,10,39),(91,3,1,11,38),(92,3,1,12,37);
/*!40000 ALTER TABLE `eventweighting2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house`
--

DROP TABLE IF EXISTS `house`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `house` (
  `id` int NOT NULL AUTO_INCREMENT,
  `house` varchar(255) NOT NULL,
  `initials` varchar(45) NOT NULL DEFAULT 'AAA',
  `points` int DEFAULT NULL,
  `placing` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house`
--

LOCK TABLES `house` WRITE;
/*!40000 ALTER TABLE `house` DISABLE KEYS */;
INSERT INTO `house` VALUES (1,'Baker Hake','BAH',46,5),(2,'Bishop Barker Harris','BBH',0,7),(3,'Britten','BRI',61,4),(4,'Broughton Forrest','BRF',0,7),(5,'Burkitt','BUR',0,7),(6,'Dalmas','DAL',70,3),(7,'Kurrle','KUR',251,1),(8,'Macarthur Waddy','MAW',0,7),(9,'Macquarie','MAQ',94,2),(10,'Wickham','WIC',46,5),(11,'Gowan Brae','GB',0,7);
/*!40000 ALTER TABLE `house` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `results` (
  `id` int NOT NULL AUTO_INCREMENT,
  `eventID` int DEFAULT NULL,
  `studentID` int DEFAULT NULL,
  `dnf` tinyint(1) DEFAULT NULL,
  `dq` tinyint(1) DEFAULT NULL,
  `result` float DEFAULT NULL,
  `placing` int DEFAULT NULL,
  `points` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `studentID` (`studentID`),
  KEY `eventID` (`eventID`),
  CONSTRAINT `results_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `students` (`id`),
  CONSTRAINT `results_ibfk_2` FOREIGN KEY (`eventID`) REFERENCES `events` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
INSERT INTO `results` VALUES (11,6,3,0,0,12.34,3,10),(13,7,3,0,0,34.88,1,12),(14,6,4,1,0,14.4,99999,0),(15,8,3,0,0,6.54,2,48),(16,8,5,0,0,5.78,5,44),(17,8,4,0,0,6.88,1,50),(18,9,5,0,1,1234,99999,0),(19,9,1,0,0,1,3,46),(20,9,5,0,0,3,1,50),(21,8,7,0,0,6,3,46),(22,8,7,0,1,999,99999,0),(23,8,7,1,0,998,99999,0),(24,8,6,0,0,5.88,4,45),(25,6,6,0,0,4.66,1,12),(26,6,6,1,0,1,99999,0),(27,6,6,0,0,25.01,4,9),(28,8,6,0,0,4,6,43),(29,8,6,0,0,3,7,42),(30,8,6,0,0,2,8,41),(31,7,6,0,0,35.01,2,11),(32,9,6,0,0,2,2,48),(33,6,4,0,0,5.12,2,11);
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `id` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `roleID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roleID` (`roleID`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`roleID`) REFERENCES `staffrole` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES ('3Kg9dfAoNKSCwSMA6BwgzjZI3Il1','taylor.swift@gmail.com','Taylor','Swift',1),('An7bRVnZY1bEFiSwFszxV7kLMc23','patelhariwork@gmail.com','Viraj','Patel',1),('SGQvN4MeBuPr9MiMd2E3krCJs4s2','aadityashankar@gmail.com','Aaditya','Shankar',1),('stBLh17oasRYoWpAnkcq8ohtwvr2','postman@pat.com','Postman','Pat',1),('ySRlwnQ7RYQhmCiyPZBc3xsZL2K3','bob@builder.com','Bob','Builder',1);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staffRole`
--

DROP TABLE IF EXISTS `staffRole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staffRole` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staffRole`
--

LOCK TABLES `staffRole` WRITE;
/*!40000 ALTER TABLE `staffRole` DISABLE KEYS */;
INSERT INTO `staffRole` VALUES (1,'Staff'),(2,'Manager');
/*!40000 ALTER TABLE `staffRole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) NOT NULL DEFAULT '',
  `lastName` varchar(255) NOT NULL DEFAULT '',
  `houseID` int DEFAULT NULL,
  `number` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `houseID` (`houseID`),
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`houseID`) REFERENCES `House` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Chris','Yoo',10,1034483),(3,'Dwayne','Johnson',6,1234567),(4,'Will','Smith',3,2345678),(5,'Chris','Rock',9,3456789),(6,'Rock','Daw',7,69699634),(7,'Elon','Ma',1,3254123);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentsandevents`
--

DROP TABLE IF EXISTS `studentsandevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studentsandevents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `studentID` int DEFAULT NULL,
  `eventID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `studentID` (`studentID`),
  KEY `eventID` (`eventID`),
  CONSTRAINT `studentsandevents_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `students` (`id`),
  CONSTRAINT `studentsandevents_ibfk_2` FOREIGN KEY (`eventID`) REFERENCES `events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentsandevents`
--

LOCK TABLES `studentsandevents` WRITE;
/*!40000 ALTER TABLE `studentsandevents` DISABLE KEYS */;
/*!40000 ALTER TABLE `studentsandevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db3nf'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddResult` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddResult`(
	IN inEventID int,
    IN inStudentID int,
    IN inDnf bool,
    IN inDq bool,
	IN inResult float,
    IN ascending bool
)
ar: BEGIN

	# Deal with DNF / DQ 
	IF (inDnf = 1 OR inDq = 1) THEN
		INSERT INTO results VALUES (NULL, inEventID, inStudentID, inDnf, inDq, inResult, 99999, 0);
        LEAVE ar;
	END IF;
    
    # Set up temporary tables
	DROP TEMPORARY TABLE IF EXISTS tmpres1;
	DROP TEMPORARY TABLE IF EXISTS tmpres2;
	CREATE TEMPORARY TABLE tmpres1 (
		id int,
		res float
	);
	CREATE TEMPORARY TABLE tmpres2 (
		id int,
		res float,
		placing int
	);
    
    # Load temporary tables
	INSERT INTO tmpres1(id, res) SELECT id, result FROM results WHERE eventID = inEventID AND dnf = 0 AND dq = 0;
	INSERT INTO tmpres1(res) VALUES (inResult);
	IF (ascending = 1) THEN
		INSERT INTO tmpres2(id, res, placing) SELECT id, res, RANK() OVER (ORDER BY res ASC) FROM tmpres1;
	ELSE
		INSERT INTO tmpres2(id, res, placing) SELECT id, res, RANK() OVER (ORDER BY res DESC) FROM tmpres1;
	END IF;
    
    
	# Update placings and points in table
	BEGIN
		DECLARE cursor_typeID int DEFAULT 0;
        DECLARE cursor_categoryID int DEFAULT 0;
        DECLARE cursor_divisionID int DEFAULT 0;
        DECLARE cursor_points int DEFAULT 0;
        
		DECLARE cursor_id int DEFAULT 0;
		DECLARE cursor_placing int DEFAULT 0;
		DECLARE done int DEFAULT FALSE;
		DECLARE cursor_e CURSOR FOR SELECT id, placing FROM tmpres2;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
        
        SELECT divisionID INTO cursor_divisionID FROM events WHERE events.id = inEventID;
        SELECT typeID INTO cursor_typeID FROM events WHERE events.id = inEventID;
        SELECT categoryID INTO cursor_categoryID FROM eventtype WHERE eventtype.id = cursor_typeID;
		
		OPEN cursor_e;
		read_loop: LOOP
			FETCH cursor_e INTO cursor_id, cursor_placing;
			IF done THEN
				LEAVE read_loop;
			END IF;
            
            IF (cursor_divisionID = 1 OR cursor_divisionID = 2 OR cursor_divisionID = 3 OR cursor_divisionID = 4) THEN
				SELECT points INTO cursor_points FROM eventweighting2 WHERE categoryID = cursor_categoryID AND divisionID = cursor_divisionID AND placing = cursor_placing;
            ELSE 
				SELECT points INTO cursor_points FROM eventweighting2 WHERE categoryID = cursor_categoryID AND divisionID = 4 AND placing = cursor_placing;
            END IF;
            
            IF cursor_id IS NULL THEN
				INSERT INTO results VALUES (NULL, inEventID, inStudentID, inDnf, inDq, inResult, cursor_placing, cursor_points);
			ELSE 
				UPDATE results SET results.placing = cursor_placing, results.points = cursor_points WHERE results.id = cursor_id;
            END IF;
		END LOOP;
		CLOSE cursor_e;
    END;
    DROP TEMPORARY TABLE IF EXISTS tmpres1;
	DROP TEMPORARY TABLE IF EXISTS tmpres2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CalculateHousePlacings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CalculateHousePlacings`(
)
BEGIN
	# Set up temporary tables
	DROP TEMPORARY TABLE IF EXISTS tmphouse1;
    DROP TEMPORARY TABLE IF EXISTS tmphouse2;
    CREATE TEMPORARY TABLE tmphouse1 (
		id int,
        points int
    );
    CREATE TEMPORARY TABLE tmphouse2 (
		id int,
        points int,
        placing int
    );
    
    # Load temporary table
    INSERT INTO tmphouse1(id) SELECT id FROM house;
    UPDATE tmphouse1 SET points = 0 WHERE 1 = 1;
    
    # Calculate points and placing
    BEGIN
		DECLARE cursor_houseID int DEFAULT 0;
    
		DECLARE cursor_studentID int DEFAULT 0;
		DECLARE cursor_points int DEFAULT 0;
		DECLARE done int DEFAULT FALSE;
		DECLARE cursor_e CURSOR FOR SELECT studentID, points FROM results;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

		OPEN cursor_e;
		read_loop: LOOP
			FETCH cursor_e INTO cursor_studentID, cursor_points;
			IF done THEN
				LEAVE read_loop;
			END IF;
            
            SELECT houseID INTO cursor_houseID FROM students WHERE students.id = cursor_studentID;
            UPDATE tmphouse1 SET points = points + cursor_points WHERE tmphouse1.id = cursor_houseID;
            
		END LOOP;
		CLOSE cursor_e;
        
        INSERT INTO tmphouse2(id, points, placing) SELECT id, points, RANK() OVER (ORDER BY points DESC) FROM tmphouse1;
    END;
    
    # Insert back into house table
    BEGIN
		DECLARE cursor_id int DEFAULT 0;
		DECLARE cursor_points int DEFAULT 0;
        DECLARE cursor_placing int DEFAULT 0;
		DECLARE done int DEFAULT FALSE;
		DECLARE cursor_e CURSOR FOR SELECT id, points, placing FROM tmphouse2;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

		OPEN cursor_e;
		read_loop: LOOP
			FETCH cursor_e INTO cursor_id, cursor_points, cursor_placing;
			IF done THEN
				LEAVE read_loop;
			END IF;
            
            UPDATE house SET house.points = cursor_points, house.placing = cursor_placing WHERE house.id = cursor_id;
            
		END LOOP;
		CLOSE cursor_e;
    END;
    
    DROP TEMPORARY TABLE IF EXISTS tmphouse1;
    DROP TEMPORARY TABLE IF EXISTS tmphouse2;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateCarnival` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateCarnival`(
	IN name varchar(255),
    IN typeID varchar(255),
    IN date DATE,
    IN startTime TIME,
    IN endTime TIME,
    IN locationID int,
    IN staffID varchar(255)
)
BEGIN
    INSERT INTO carnivals VALUES (NULL, name, typeID, date, startTime, endTime, locationID, staffID);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateEvent`(
	IN carnivalID int,
    IN typeID int,
    IN ageGroupID int,
    IN divisionID int,
    IN startTime TIME
    -- IN record FLOAT
    -- Weighting
)
BEGIN
    -- DECLARE recordID int;
    -- DECLARE weightingID int;
    
    -- INSERT INTO eventRecord VALUES (NULL, record);
    -- SELECT recordID INTO recordID FROM eventRecord WHERE eventRecord.record = record;

    INSERT INTO events VALUES (NULL, carnivalID, typeID, ageGroupID, divisionID, startTime, NULL, NULL);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCarnivals` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCarnivals`()
BEGIN
	SELECT carnivals.id, carnivals.name, carnivalType.type, carnivals.date, carnivals.startTime, carnivals.endTime, carnivalLocation.location, staff.firstName, staff.lastName
		FROM carnivals
		INNER JOIN carnivalType ON carnivals.typeID = carnivalType.typeID
        INNER JOIN carnivalLocation ON carnivals.locationID = carnivalLocation.locationID
        INNER JOIN staff ON carnivals.staffID = staff.id
        ORDER BY carnivals.date, carnivals.startTime, carnivals.endTime ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetEvents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetEvents`(
	IN carnivalID int
)
BEGIN
	IF (carnivalID = 0) THEN
		SELECT events.id, eventType.type, eventAgeGroup.ageGroup, eventDivision.division, events.startTime, eventType.unit
			FROM events
			INNER JOIN carnivals ON events.carnivalID = carnivals.id
			INNER JOIN eventType ON events.typeID = eventType.id
			INNER JOIN eventAgeGroup ON events.ageGroupID = eventAgeGroup.id
			INNER JOIN eventDivision ON events.divisionID = eventDivision.id
			ORDER BY events.startTime ASC;
    ELSE 
		SELECT events.id, eventType.type, eventAgeGroup.ageGroup, eventDivision.division, events.startTime, eventType.unit
			FROM events
			INNER JOIN carnivals ON events.carnivalID = carnivals.id
			INNER JOIN eventType ON events.typeID = eventType.id
			INNER JOIN eventAgeGroup ON events.ageGroupID = eventAgeGroup.id
			INNER JOIN eventDivision ON events.divisionID = eventDivision.id
			WHERE events.carnivalID = carnivalID
			ORDER BY events.startTime ASC;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetOneCarnival` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetOneCarnival`(
	IN id varchar(255)
)
BEGIN
	SELECT carnivals.id, carnivals.name, carnivals.typeID, carnivalType.type, carnivals.date, carnivals.startTime, carnivals.endTime, carnivalLocation.location, staff.firstName, staff.lastName
		FROM carnivals
		INNER JOIN carnivalType ON carnivals.typeID = carnivalType.typeID
        INNER JOIN carnivalLocation ON carnivals.locationID = carnivalLocation.locationID
        INNER JOIN staff ON carnivals.staffID = staff.id
        WHERE carnivals.id = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetOneEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetOneEvent`(
	IN id int
)
BEGIN
	SELECT events.id, events.carnivalID, eventType.type, eventAgeGroup.ageGroup, eventDivision.division, events.startTime, eventType.unit
		FROM events
		INNER JOIN carnivals ON events.carnivalID = carnivals.id
        INNER JOIN eventType ON events.typeID = eventType.id
        INNER JOIN eventAgeGroup ON events.ageGroupID = eventAgeGroup.id
        INNER JOIN eventDivision ON events.divisionID = eventDivision.id
        WHERE events.id = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetOneStudent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetOneStudent`(
	IN id int
)
BEGIN
	SELECT students.id, students.firstName, students.lastName, house.house, students.number
		FROM students
        INNER JOIN house ON students.houseID = house.id
        WHERE students.id = id
        ORDER BY house.house ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetResultsForEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetResultsForEvent`(
	IN eventID int
)
BEGIN
	SELECT results.id, students.firstName, students.lastName, house.house, results.dnf, results.dq, results.result, results.placing, results.points
		FROM results
		INNER JOIN (students INNER JOIN house ON students.houseID = house.id) ON results.studentID = students.id
        WHERE results.eventID = eventID
        ORDER BY results.placing ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetResultsForStudent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetResultsForStudent`(
	IN studentID int
)
BEGIN
	DECLARE eid int;
    -- SELECT eventID INTO eid FROM studentsandevents WHERE studentsandevents.studentID = studentID;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetStudents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetStudents`()
BEGIN
	SELECT students.id, students.firstName, students.lastName, house.house, students.number
		FROM students
        INNER JOIN house ON students.houseID = house.id
        ORDER BY house.house ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetStudentsForEventResults` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetStudentsForEventResults`()
BEGIN
	SELECT students.id, students.firstName, students.lastName, house.initials, students.number
		FROM students
        INNER JOIN house ON students.houseID = house.id
        ORDER BY students.lastName ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetStudentsWithHouseInitials` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetStudentsWithHouseInitials`()
BEGIN

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveCarnival` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RemoveCarnival`(
	IN id int
)
BEGIN
	DECLARE length int DEFAULT 0;
    DECLARE counter int DEFAULT 0;
    DECLARE eventID int;
    
	DROP TEMPORARY TABLE IF EXISTS tmp;
	CREATE TEMPORARY TABLE tmp
		SELECT id FROM events WHERE events.carnivalID = id;
    
    SELECT COUNT(*) FROM tmp INTO length;
    
    SET counter=0;
    WHILE counter<length DO
		SELECT id FROM tmp LIMIT counter,1 INTO eventID;
		DELETE FROM results WHERE results.eventID = eventID;
        SET counter=counter+1;
	END WHILE;
    
	DELETE FROM events WHERE events.carnivalID = id;
	DELETE FROM carnivals WHERE carnivals.id = id;
    
    DROP TEMPORARY TABLE IF EXISTS tmp;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-24 14:35:25
