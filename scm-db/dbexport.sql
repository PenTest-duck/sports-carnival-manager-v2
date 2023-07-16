-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: db3nf
-- ------------------------------------------------------
-- Server version	8.0.32

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
INSERT INTO `carnivallocation` VALUES (1,'White Oval'),(2,'Doyles'),(3,'Pool');
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
  CONSTRAINT `carnivals_ibfk_1` FOREIGN KEY (`typeID`) REFERENCES `carnivaltype` (`typeID`),
  CONSTRAINT `carnivals_ibfk_2` FOREIGN KEY (`locationID`) REFERENCES `carnivallocation` (`locationID`),
  CONSTRAINT `carnivals_ibfk_3` FOREIGN KEY (`staffID`) REFERENCES `staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carnivals`
--

LOCK TABLES `carnivals` WRITE;
/*!40000 ALTER TABLE `carnivals` DISABLE KEYS */;
INSERT INTO `carnivals` VALUES (15,'TKS Athletics Carnival',1,'2023-08-27','10:00:00','15:00:00',1,'2LNaoUJKESMNyGRQGrUP9CrHHFn1'),(19,'Builders\' Athletics Carnival',1,'2023-07-31','09:30:00','15:00:00',1,'ySRlwnQ7RYQhmCiyPZBc3xsZL2K3'),(20,'TKS Swimming Carnival',2,'2023-07-30','08:30:00','13:00:00',3,'2LNaoUJKESMNyGRQGrUP9CrHHFn1'),(21,'TKS Cross Country',3,'2023-07-29','10:45:00','12:30:00',2,'SGQvN4MeBuPr9MiMd2E3krCJs4s2'),(25,'Sample Carnival #2',1,'2023-07-31','12:00:00','16:00:00',2,'stBLh17oasRYoWpAnkcq8ohtwvr2');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventcategory`
--

LOCK TABLES `eventcategory` WRITE;
/*!40000 ALTER TABLE `eventcategory` DISABLE KEYS */;
INSERT INTO `eventcategory` VALUES (1,'field'),(2,'track'),(3,'relay'),(4,'swim'),(5,'swim relay'),(6,'swim all age relay'),(7,'cross country');
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
  `resultID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ageGroupID` (`ageGroupID`),
  KEY `typeID` (`typeID`),
  KEY `eventrecord_ibfk_4` (`resultID`),
  CONSTRAINT `eventrecord_ibfk_1` FOREIGN KEY (`ageGroupID`) REFERENCES `eventAgeGroup` (`id`),
  CONSTRAINT `eventrecord_ibfk_3` FOREIGN KEY (`typeID`) REFERENCES `eventtype` (`id`),
  CONSTRAINT `eventrecord_ibfk_4` FOREIGN KEY (`resultID`) REFERENCES `results` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventrecord`
--

LOCK TABLES `eventrecord` WRITE;
/*!40000 ALTER TABLE `eventrecord` DISABLE KEYS */;
INSERT INTO `eventrecord` VALUES (45,16,1,57),(46,24,4,58),(47,23,1,59),(48,13,1,60),(62,1,3,52),(68,4,1,37),(135,2,6,62);
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
  PRIMARY KEY (`id`),
  KEY `typeID` (`typeID`),
  KEY `ageGroupID` (`ageGroupID`),
  KEY `divisionID` (`divisionID`),
  KEY `events_ibfk_7` (`carnivalID`),
  CONSTRAINT `events_ibfk_1` FOREIGN KEY (`typeID`) REFERENCES `eventtype` (`id`),
  CONSTRAINT `events_ibfk_2` FOREIGN KEY (`ageGroupID`) REFERENCES `eventAgeGroup` (`id`),
  CONSTRAINT `events_ibfk_3` FOREIGN KEY (`divisionID`) REFERENCES `eventdivision` (`id`),
  CONSTRAINT `events_ibfk_7` FOREIGN KEY (`carnivalID`) REFERENCES `carnivals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (6,15,2,6,6,'10:20:00'),(7,15,2,6,7,'10:15:00'),(8,15,4,1,1,'12:30:00'),(9,15,4,4,1,'12:00:00'),(15,15,3,1,1,'12:19:00'),(17,19,1,3,1,'10:30:00'),(18,19,11,1,1,'11:20:00'),(19,20,16,1,1,'11:20:00'),(20,21,24,4,1,'11:46:00'),(21,21,23,1,1,'11:05:00'),(23,20,16,2,1,'11:39:00'),(24,20,13,1,1,'12:26:00'),(25,20,16,4,4,'10:33:00'),(26,20,20,6,1,'12:47:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventtype`
--

LOCK TABLES `eventtype` WRITE;
/*!40000 ALTER TABLE `eventtype` DISABLE KEYS */;
INSERT INTO `eventtype` VALUES (1,1,2,'100m Sprint','s',1),(2,1,2,'200m Sprint','s',1),(3,1,2,'400m Sprint','s',1),(4,1,1,'Long Jump','m',0),(5,1,1,'High Jump','cm',0),(6,1,2,'800m Run','s',1),(7,1,2,'1500m Run','s',1),(8,1,2,'3000m Run','s',1),(9,1,2,'Hurdles','s',1),(10,1,1,'Shot Put','cm',0),(11,1,3,'4x400m Relay','s',1),(12,1,3,'4x100m Relay','s',1),(13,2,4,'50m Freestyle','s',1),(14,2,4,'50m Backstroke','s',1),(15,2,4,'50m Breaststroke','s',1),(16,2,4,'50m Butterfly','s',1),(17,2,4,'100m Freestyle','s',1),(18,2,4,'200m Freestyle','s',1),(19,2,4,'400m Freestyle','s',1),(20,2,4,'200m Medley','s',1),(21,2,5,'4x50m Relay','s',1),(22,2,5,'6x50m All Age Relay','s',1),(23,3,6,'Junior Course','s',1),(24,3,6,'Intermediate Course','s',1),(25,3,6,'Senior Course','s',1),(26,3,6,'Opens Course','s',1);
/*!40000 ALTER TABLE `eventtype` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventweighting2`
--

LOCK TABLES `eventweighting2` WRITE;
/*!40000 ALTER TABLE `eventweighting2` DISABLE KEYS */;
INSERT INTO `eventweighting2` VALUES (1,1,1,1,50),(2,1,1,2,48),(3,1,1,3,46),(4,1,1,4,45),(5,1,1,5,44),(6,1,1,6,43),(7,1,1,7,42),(8,1,1,8,41),(9,1,1,9,40),(10,1,1,10,39),(11,1,1,11,38),(12,1,1,12,37),(13,1,1,13,36),(14,1,1,14,35),(15,1,1,15,34),(16,1,1,16,33),(17,1,1,17,32),(18,1,1,18,31),(19,1,1,19,30),(20,1,1,20,29),(21,1,1,21,28),(22,1,1,22,27),(23,1,1,23,26),(24,1,1,24,25),(25,1,1,25,24),(26,1,1,26,23),(27,1,1,27,22),(28,1,1,28,21),(29,1,1,29,20),(30,1,1,30,19),(31,1,1,31,18),(32,1,1,32,17),(33,2,1,1,50),(34,2,1,2,48),(35,2,1,3,46),(36,2,1,4,45),(37,2,1,5,44),(38,2,1,6,43),(39,2,1,7,42),(40,2,1,8,41),(41,2,1,9,40),(42,2,1,10,39),(43,2,1,11,38),(44,2,1,12,37),(45,2,2,1,36),(46,2,2,2,35),(47,2,2,3,34),(48,2,2,4,33),(49,2,2,5,32),(50,2,2,6,31),(51,2,2,7,30),(52,2,2,8,29),(53,2,2,9,28),(54,2,2,10,27),(55,2,2,11,26),(56,2,2,12,25),(57,2,3,1,24),(58,2,3,2,23),(59,2,3,3,22),(60,2,3,4,21),(61,2,3,5,20),(62,2,3,6,19),(63,2,3,7,18),(64,2,3,8,17),(65,2,3,9,16),(66,2,3,10,15),(67,2,3,11,14),(68,2,3,12,13),(69,2,4,1,12),(70,2,4,2,11),(71,2,4,3,10),(72,2,4,4,9),(73,2,4,5,8),(74,2,4,6,7),(75,2,4,7,6),(76,2,4,8,5),(77,2,4,9,4),(78,2,4,10,3),(79,2,4,11,2),(80,2,4,12,1),(81,3,1,1,50),(82,3,1,2,48),(83,3,1,3,46),(84,3,1,4,45),(85,3,1,5,44),(86,3,1,6,43),(87,3,1,7,42),(88,3,1,8,41),(89,3,1,9,40),(90,3,1,10,39),(91,3,1,11,38),(92,3,1,12,37),(93,4,1,1,18),(94,4,1,2,16),(95,4,1,3,15),(96,4,1,4,14),(97,4,1,5,13),(98,4,1,6,12),(99,4,1,7,11),(100,4,1,8,10),(101,4,2,1,9),(102,4,2,2,7),(103,4,2,3,6),(104,4,2,4,5),(105,4,2,5,4),(106,4,2,6,3),(107,4,2,7,2),(108,4,2,8,1),(109,5,1,1,35),(110,5,1,2,30),(111,5,1,3,27),(112,5,1,4,24),(113,5,1,5,21),(114,5,1,6,18),(115,5,1,7,17),(116,5,1,8,16),(117,5,2,1,15),(118,5,2,2,13),(119,5,2,3,10),(120,5,2,4,7),(121,5,2,5,4),(122,5,2,6,3),(123,5,2,7,2),(124,5,2,8,1),(125,6,1,1,35),(126,6,1,2,30),(127,6,1,3,27),(128,6,1,4,24),(129,6,1,5,21),(130,6,1,6,18),(131,6,1,7,17),(132,6,1,8,16),(133,6,1,9,15),(134,6,1,10,13),(135,7,1,1,1);
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
INSERT INTO `house` VALUES (1,'Baker Hake','BAH',0,2),(2,'Bishop Barker Harris','BBH',0,2),(3,'Britten','BRI',0,2),(4,'Broughton Forrest','BRF',0,2),(5,'Burkitt','BUR',0,2),(6,'Dalmas','DAL',0,2),(7,'Kurrle','KUR',70,1),(8,'Macarthur Waddy','MAW',0,2),(9,'Macquarie','MAQ',0,2),(10,'Wickham','WIC',0,2),(11,'Gowan Brae','GB',0,2);
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
  KEY `results_ibfk_1` (`studentID`),
  KEY `results_ibfk_2` (`eventID`),
  CONSTRAINT `results_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  CONSTRAINT `results_ibfk_2` FOREIGN KEY (`eventID`) REFERENCES `events` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
INSERT INTO `results` VALUES (11,6,3,0,0,12.34,4,9),(13,7,3,0,0,34.88,3,10),(14,6,4,1,0,14.4,99999,0),(15,8,3,0,0,6.54,4,45),(17,8,4,0,0,6.88,3,46),(19,9,1,0,0,1,2,48),(21,8,7,0,0,6,5,44),(22,8,7,0,1,999,99999,0),(23,8,7,1,0,998,99999,0),(24,8,6,0,0,5.88,6,43),(27,6,6,0,0,25.01,5,8),(28,8,6,0,0,4,7,42),(30,8,6,0,0,2,8,41),(31,7,6,0,0,35.01,4,9),(32,9,6,0,0,2,1,50),(33,6,4,0,0,5.12,3,10),(36,8,7,0,0,7.65,2,48),(37,8,7,0,0,7.77,1,50),(42,7,6,0,0,0.4,2,11),(44,6,6,0,0,1,2,11),(52,17,1,0,0,14.1,1,50),(53,17,6,1,1,13.92,99999,0),(57,19,4,0,0,45,1,18),(58,20,6,0,0,1050,1,35),(59,21,6,0,0,32,1,35),(60,24,6,0,0,15,1,18),(61,7,3,0,0,0.3,1,12),(62,6,7,0,0,0.2,1,12),(63,26,6,1,0,52,99999,0);
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
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`roleID`) REFERENCES `staffRole` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES ('2LNaoUJKESMNyGRQGrUP9CrHHFn1','shaunthesheep3@farm.com','Shaun','Sheep',1),('3Kg9dfAoNKSCwSMA6BwgzjZI3Il1','taylor.swift@gmail.com','Taylor','Swift',1),('4xsuwwi7O3NFN4nJtqBOP3UmvJC2','Yoo_Ch@student.kings.edu.au','Chris','Yu',1),('An7bRVnZY1bEFiSwFszxV7kLMc23','patelhariwork@gmail.com','Viraj','Patel',1),('i7y85QRMeZNdGJeXovG3gWZYKft1','test@test.com','test','test',1),('SGQvN4MeBuPr9MiMd2E3krCJs4s2','aadityashankar@gmail.com','Aaditya','Shankar',1),('stBLh17oasRYoWpAnkcq8ohtwvr2','postman@pat.com','Postman','Pat',1),('yJLjW3ntPSSLdC33mRjn39uctgs2','emptiness@email.com',' ',' ',1),('ySRlwnQ7RYQhmCiyPZBc3xsZL2K3','bob@builder.com','Bob','Builder',1);
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
  CONSTRAINT `students_ibfk_1` FOREIGN KEY (`houseID`) REFERENCES `house` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Chris','Yoo',10,1034483),(3,'Dwayne','Johnson',6,1234567),(4,'William','Smith',3,2345678),(6,'Rock','Daw',7,69699634),(7,'Elon','Ma',2,3254123);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db3nf'
--

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
	# Input parameters
	IN inEventID int,
    IN inStudentID int,
    IN inDNF bool,
    IN inDQ bool,
	IN inResult float,
    IN ascending bool
)
addResultLoop: BEGIN
	# Initialise variables
	DECLARE newResultID int DEFAULT 0;

	# Do not update placings / points / record for non-qualifying results
    # Adds non-qualifying result to event then leaves procedure
	IF (inDNF = 1 OR inDQ = 1) THEN
		INSERT INTO results VALUES (NULL, inEventID, inStudentID, inDNF, inDQ, inResult, 99999, 0);
        LEAVE addResultLoop;
	END IF;
    
    # Set up temporary tables
	DROP TEMPORARY TABLE IF EXISTS tmpUnsortedResults;
	DROP TEMPORARY TABLE IF EXISTS tmpSortedResults;
	CREATE TEMPORARY TABLE tmpUnsortedResults (
		id int,
		res float
	);
	CREATE TEMPORARY TABLE tmpSortedResults (
		id int,
		res float,
		placing int
	);
    
    # Load all existing results + new result into tmpUnsortedResults
	INSERT INTO tmpUnsortedResults(id, res) SELECT id, result FROM results WHERE eventID = inEventID AND dnf = 0 AND dq = 0;
	INSERT INTO tmpUnsortedResults(res) VALUES (inResult);
    
    # Sort results by ascending/descending order then store in tmpSortedResults
	IF (ascending = 1) THEN
		INSERT INTO tmpSortedResults(id, res, placing) SELECT id, res, RANK() OVER (ORDER BY res ASC) FROM tmpUnsortedResults;
	ELSE
		INSERT INTO tmpSortedResults(id, res, placing) SELECT id, res, RANK() OVER (ORDER BY res DESC) FROM tmpUnsortedResults;
	END IF;
    
	# Update placings and points in table
	BEGIN
		# Initialise variables
		DECLARE cursor_typeID int DEFAULT 0;
        DECLARE cursor_categoryID int DEFAULT 0;
        DECLARE cursor_divisionID int DEFAULT 0;
        DECLARE cursor_points int DEFAULT 0;
		DECLARE cursor_id int DEFAULT 0;
		DECLARE cursor_placing int DEFAULT 0;
		DECLARE done int DEFAULT FALSE;
		DECLARE cursor_e CURSOR FOR SELECT id, placing FROM tmpSortedResults;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
        
        # Load event division / type / category variables
        SELECT divisionID INTO cursor_divisionID FROM events WHERE events.id = inEventID;
        SELECT typeID INTO cursor_typeID FROM events WHERE events.id = inEventID;
        SELECT categoryID INTO cursor_categoryID FROM eventtype WHERE eventtype.id = cursor_typeID;
		
        # Loop through each result and update points
		OPEN cursor_e;
		updatePoints: LOOP
			# Establishes a 'for loop' through each result
			FETCH cursor_e INTO cursor_id, cursor_placing;
			IF done THEN
				LEAVE updatePoints;
			END IF;
            
            # Athletics field events
            IF (cursor_categoryID = 1) THEN
				# Any below 32nd will receive same points as 32nd place
				IF (cursor_placing > 32) THEN
					SET cursor_placing = 32;
                END IF;
            END IF;
            
            # Athletics track & relay events
            IF (cursor_categoryID = 2 OR cursor_categoryID = 3) THEN
				# Any below 12th will receive same points as 12th place
				IF (cursor_placing > 12) THEN
					SET cursor_placing = 12;
                END IF;
                
                # Any below Division 3 will receive same points scale as Division 3
                # This will only apply to track events
                IF (cursor_divisionID > 4) THEN
					SET cursor_divisionID = 4;
                END IF;
			END IF;
            
            # Swimming individual and relay events
            IF (cursor_categoryID = 4 OR cursor_categoryID = 5) THEN
				# Any below 8th will receive same points as 8th place
				IF (cursor_placing > 8) THEN
					SET cursor_placing = 8;
                END IF;
                
				# All non-championship divisions receive same points scale
				IF (cursor_divisionID > 2) THEN
					SET cursor_divisionID = 2;
                END IF;
            END IF;
            
            # Swimming all-age relay events
            IF (cursor_categoryID = 6) THEN
				# Any below 10th will receive same points as 10th place
				IF (cursor_placing > 10) THEN
					SET cursor_placing = 10;
                END IF;
            END IF;
            
            # Cross country events
            IF (cursor_categoryID = 7) THEN
				# All results get 1 point
				SET cursor_placing = 1;
                SET cursor_divisionID = 1;
            END IF;
            
            # Match corresponding points
            SELECT points INTO cursor_points FROM eventweighting2 WHERE categoryID = cursor_categoryID AND divisionID = cursor_divisionID AND placing = cursor_placing;
            
            # If result is a new row, insert it and save its ID
            # Otherwise, edit the existing row
            IF cursor_id IS NULL THEN
				INSERT INTO results VALUES (NULL, inEventID, inStudentID, inDNF, inDQ, inResult, cursor_placing, cursor_points);
                SELECT last_insert_id() INTO newResultID;
			ELSE 
				UPDATE results SET results.placing = cursor_placing, results.points = cursor_points WHERE results.id = cursor_id;
            END IF;
		END LOOP;
		CLOSE cursor_e;
    END;
    
    #Update event's record
    BEGIN
		# Initialise variables
		DECLARE inTypeID int DEFAULT 0;
        DECLARE inAgeGroupID int DEFAULT 0;
        DECLARE previousResultID int DEFAULT 0;
        DECLARE previousResult float DEFAULT 0;
        
        # Load event type / age group / record
        SELECT typeID, ageGroupID INTO inTypeID, inAgeGroupID FROM events WHERE id = inEventID;
        SELECT eventrecord.resultID INTO previousResultID FROM eventrecord WHERE typeID = inTypeID AND ageGroupID = inAgeGroupID;
        
        IF (previousResultID != 0) THEN
			# Compare new result against record then replace record with new result if necessary
			SELECT result INTO previousResult FROM results WHERE id = previousResultID;
            
			IF ((ascending = 1 AND inResult < previousResult) OR (ascending = 0 AND inResult > previousResult)) THEN
				DELETE FROM eventrecord WHERE typeID = inTypeID AND ageGroupID = inAgeGroupID;
				INSERT INTO eventrecord VALUES (NULL, inTypeID, inAgeGroupID, newResultID);
			END IF;
		ELSE
			# If record doesn't exist, insert new result as record
			INSERT INTO eventrecord VALUES (NULL, inTypeID, inAgeGroupID, newResultID);
        END IF;
    END;
    
    # Clean up temporary tables
    DROP TEMPORARY TABLE IF EXISTS tmpUnsortedResults;
	DROP TEMPORARY TABLE IF EXISTS tmpSortedResults;
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
	#IN carnivalID int
)
BEGIN
	# Set up temporary tables
	DROP TEMPORARY TABLE IF EXISTS tmpUnsortedHouses;
    DROP TEMPORARY TABLE IF EXISTS tmpSortedHouses;
    DROP TEMPORARY TABLE IF EXISTS tmpResultsInCarnival;
    CREATE TEMPORARY TABLE tmpUnsortedHouses (
		id int,
        points int
    );
    CREATE TEMPORARY TABLE tmpSortedHouses (
		id int,
        points int,
        placing int
    );
    CREATE TEMPORARY TABLE tmpResultsInCarnival (
		id int,
        studentID int,
        points int
    );
    
    # Load all houses into tmpUnsortedHouses and reset their points to 0
    INSERT INTO tmpUnsortedHouses(id) SELECT id FROM house;
    UPDATE tmpUnsortedHouses SET points = 0 WHERE 1 = 1;
    
    # Load all results in specified carnival to tmpResultsInCarnival
    INSERT INTO tmpResultsInCarnival (id, studentID, points) SELECT id, studentID, points FROM results WHERE results.eventID IN (
		SELECT id FROM events WHERE events.carnivalID = carnivalID
    );
    
    # Calculate house points and placing
    BEGIN
		# Initialise variables
		DECLARE cursor_houseID int DEFAULT 0;
		DECLARE cursor_studentID int DEFAULT 0;
		DECLARE cursor_points int DEFAULT 0;
		DECLARE done int DEFAULT FALSE;
		DECLARE cursor_e CURSOR FOR SELECT studentID, points FROM results;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

		# Loop through each result then add its points to the corresponding student's house
		OPEN cursor_e;
		updateHousePointsAndPlacings: LOOP
			# Establishes a 'for loop' through each result
			FETCH cursor_e INTO cursor_studentID, cursor_points;
			IF done THEN
				LEAVE updateHousePointsAndPlacings;
			END IF;
            
            # Add points to student's house
            SELECT houseID INTO cursor_houseID FROM students WHERE students.id = cursor_studentID;
            UPDATE tmpUnsortedHouses SET points = points + cursor_points WHERE tmpUnsortedHouses.id = cursor_houseID;
            
		END LOOP;
		CLOSE cursor_e;
        
        # Sort the newly updated houses and insert into tmpSortedHouses
        INSERT INTO tmpSortedHouses(id, points, placing) SELECT id, points, RANK() OVER (ORDER BY points DESC) FROM tmpUnsortedHouses;
    END;
    
    # Insert updated rows back into the house table
    BEGIN
		# Initialise variables
		DECLARE cursor_id int DEFAULT 0;
		DECLARE cursor_points int DEFAULT 0;
        DECLARE cursor_placing int DEFAULT 0;
		DECLARE done int DEFAULT FALSE;
		DECLARE cursor_e CURSOR FOR SELECT id, points, placing FROM tmpSortedHouses;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

		# Loop through each sorted house then update row in the house table
		OPEN cursor_e;
		updateHouseTable: LOOP
			# Establishes a 'for loop' through each house
			FETCH cursor_e INTO cursor_id, cursor_points, cursor_placing;
			IF done THEN
				LEAVE updateHouseTable;
			END IF;
            
            # Update corresponding row in the house table
            UPDATE house SET house.points = cursor_points, house.placing = cursor_placing WHERE house.id = cursor_id;
            
		END LOOP;
		CLOSE cursor_e;
    END;
    
    # Clean up temporary tables
    DROP TEMPORARY TABLE IF EXISTS tmpUnsortedHouses;
    DROP TEMPORARY TABLE IF EXISTS tmpSortedHouses;
    DROP TEMPORARY TABLE IF EXISTS tmpResultsInCarnival;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CalculateRecord` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CalculateRecord`(
	in inTypeID int,
    in inAgeGroupID int
)
calculateRecord: BEGIN
	# Initialise variables
	DECLARE eventExists bool DEFAULT 0;
    DECLARE resultExists bool DEFAULT 0;

	# Set up temporary table
	DROP TEMPORARY TABLE IF EXISTS tmpCandidateEvents;
    CREATE TEMPORARY TABLE tmpCandidateEvents (
		id int
    );

	# Load all events which match the type and age group into tmpCandidateEvents
	INSERT INTO tmpCandidateEvents(id) SELECT id FROM events WHERE typeID = inTypeID AND ageGroupID = inAgeGroupID;
    
    # Check if any events have been loaded
    # If no events were loaded, then leave procedure
	SELECT EXISTS (SELECT 1 FROM tmpCandidateEvents) INTO eventExists;

    IF (eventExists = 0) THEN
		LEAVE calculateRecord;
    END IF;
    
    # Calculate and update new record
    BEGIN
		# Initialise variables
		DECLARE recordID int DEFAULT 0;
        DECLARE record float DEFAULT 0;
        DECLARE currentResultID int DEFAULT 0;
        DECLARE currentResult float DEFAULT 0;
        DECLARE inAscending bool DEFAULT 1;
		DECLARE cursor_id int DEFAULT 0;
		DECLARE done int DEFAULT FALSE;
		DECLARE cursor_e CURSOR FOR SELECT id FROM tmpCandidateEvents;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
        
        # Load whether ascending or descending
        SELECT ascending INTO inAscending FROM eventtype WHERE eventtype.id = inTypeID;

		# Loop through each candidate event and find record
		OPEN cursor_e;
		findRecord: LOOP
			# Establishes a 'for loop' through each candidate event
			FETCH cursor_e INTO cursor_id;
			IF done THEN
				LEAVE findRecord;
			END IF;
            
            IF (recordID = 0) THEN
				# If no records have been loaded, set it as the record
				SELECT id, result INTO recordID, record FROM results WHERE eventID = cursor_id AND placing = 1;
			ELSE 
				# SELECT DISTINCT enables duplicate results to be ignored
				SELECT DISTINCT id, result INTO currentResultID, currentResult FROM results WHERE eventID = cursor_id AND placing = 1;
                
				# Set result as the new record if it is better than current record
                IF (inAscending = 1) THEN
					IF (currentResult < record) THEN
						SET record = currentResult;
						SET recordID = currentResultID;
					END IF;
				ELSE
					IF (currentResult > record) THEN
						SET record = currentResult;
						SET recordID = currentResultID;
					END IF;
				END IF;
            END IF;
		END LOOP;
		CLOSE cursor_e;
         
		# If record exists, then update eventrecord table
		DELETE FROM eventrecord WHERE typeID = inTypeID AND ageGroupID = inAgeGroupID;
        IF (recordID != 0) THEN
			INSERT INTO eventrecord VALUES (NULL, inTypeID, inAgeGroupID, recordID);
        END IF;
    END;

	# Clean up temporary table
	DROP TEMPORARY TABLE IF EXISTS tmpCandidateEvents;
    
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
	# Insert new carnival into carnivals table
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
)
BEGIN
	# Insert new event into events table
    INSERT INTO events VALUES (NULL, carnivalID, typeID, ageGroupID, divisionID, startTime);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EditEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EditEvent`(
	IN id int,
	IN ageGroupID int,
    IN divisionID int,
    IN startTime time
)
BEGIN
	# Initialise variables
	DECLARE eventTypeID int DEFAULT 0;
    DECLARE previousAgeGroupID int DEFAULT 0;
    DECLARE previousRecordResultID int DEFAULT 0;
    
    # Load event type and age group
    SELECT events.typeID INTO eventTypeID FROM events WHERE events.id = id;
    SELECT events.ageGroupID INTO previousAgeGroupID FROM events WHERE events.id = id;
    
    # Update event row
	UPDATE events SET events.ageGroupID = ageGroupID, events.divisionID = divisionID, events.startTime = startTime WHERE events.id = id;
    
    # Update record of new age group
    CALL CalculateRecord (eventTypeID, ageGroupID);
    
    # Update record of previous age group    
    SELECT eventrecord.resultID INTO previousRecordResultID FROM eventrecord WHERE eventrecord.typeID = eventTypeID AND eventrecord.ageGroupID = previousAgeGroupID;
    # Delete if previous event type's record was from this event
    IF (previousRecordResultID IN (SELECT results.id FROM results WHERE results.eventID = id)) THEN
		DELETE FROM eventrecord WHERE eventrecord.typeID = eventTypeID AND eventrecord.ageGroupID = previousAgeGroupID AND eventrecord.resultID = previousRecordResultID;
    END IF;
    
    CALL CalculateRecord (eventTypeID, previousAgeGroupID);
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
	# Fetch all carnivals
    # Translate carnival type / carnival location / staff from foreign keys
    # Order by date, then start time, then end time
	SELECT carnivals.id, carnivals.name, carnivaltype.type, carnivals.date, carnivals.startTime, carnivals.endTime, carnivallocation.location, staff.firstName, staff.lastName
		FROM carnivals
		INNER JOIN carnivaltype ON carnivals.typeID = carnivaltype.typeID
        INNER JOIN carnivallocation ON carnivals.locationID = carnivallocation.locationID
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
	# Fetch all events in carnival
    # Translate carnival / event type / event age group / event division from foreign keys
    # Order by start time
    
	# If carnivalID is specified as 0, get all events 
    # Otherwise, get events in specified carnival
	IF (carnivalID = 0) THEN
		SELECT events.id, eventtype.type, eventAgeGroup.ageGroup, eventdivision.division, events.startTime, eventtype.unit, events.carnivalID
			FROM events
			INNER JOIN carnivals ON events.carnivalID = carnivals.id
			INNER JOIN eventtype ON events.typeID = eventtype.id
			INNER JOIN eventAgeGroup ON events.ageGroupID = eventAgeGroup.id
			INNER JOIN eventdivision ON events.divisionID = eventdivision.id
			ORDER BY events.startTime ASC;
    ELSE 
		SELECT events.id, eventtype.type, eventAgeGroup.ageGroup, eventdivision.division, events.startTime, eventtype.unit, events.carnivalID
			FROM events
			INNER JOIN carnivals ON events.carnivalID = carnivals.id
			INNER JOIN eventtype ON events.typeID = eventtype.id
			INNER JOIN eventAgeGroup ON events.ageGroupID = eventAgeGroup.id
			INNER JOIN eventdivision ON events.divisionID = eventdivision.id
			WHERE events.carnivalID = carnivalID
			ORDER BY events.startTime ASC;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetHouses` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetHouses`()
BEGIN
	# Set up temporary tables
    DROP TEMPORARY TABLE IF EXISTS tmpCarnivals;
	DROP TEMPORARY TABLE IF EXISTS tmpHouseScoreboard;
    CREATE TEMPORARY TABLE tmpCarnivals (
		id int
    );
    CREATE TEMPORARY TABLE tmpHouseScoreboard (
		id int,
        house varchar(255),
        initials varchar(255),
        points int,
        placing int,
        carnivalID int
    );
    
    # Load ID of all carnivals into tmpCarnivals
    INSERT INTO tmpCarnivals (id) SELECT id FROM carnivals;
    
    BEGIN
		# Initialise variables
		DECLARE cursor_id int DEFAULT 0;
		DECLARE done int DEFAULT FALSE;
		DECLARE cursor_e CURSOR FOR SELECT id FROM tmpCarnivals;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
		
        # Loop through each carnival ID and update house placing
		OPEN cursor_e;
		updateHouses: LOOP
			# Establishes a 'for loop' through each carnival ID
			FETCH cursor_e INTO cursor_id;
			IF done THEN
				LEAVE updateHouses;
			END IF;
            
            CALL UpdateHousesForOneCarnival (cursor_id);
            
            INSERT INTO tmpHouseScoreboard (id, house, initials, points, placing) SELECT * FROM house ORDER BY placing;
            UPDATE tmpHouseScoreboard SET carnivalID = cursor_id WHERE carnivalID IS NULL;
		END LOOP;
		CLOSE cursor_e;
    END;
    
    SELECT * FROM tmpHouseScoreboard;
    
    # Clean up temporary tables
    DROP TEMPORARY TABLE IF EXISTS tmpCarnivals;
    DROP TEMPORARY TABLE IF EXISTS tmpHouseScoreboard;
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
	# Fetch specified carnival
    # Translate carnival type / carnival location / staff from foreign keys
	SELECT carnivals.id, carnivals.name, carnivals.typeID, carnivaltype.type, carnivals.date, carnivals.startTime, carnivals.endTime, carnivallocation.location, staff.firstName, staff.lastName, carnivals.staffID, carnivals.locationID
		FROM carnivals
		INNER JOIN carnivaltype ON carnivals.typeID = carnivaltype.typeID
        INNER JOIN carnivallocation ON carnivals.locationID = carnivallocation.locationID
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
	# Fetch specified event
    # Translate carnival / event type / event age group / event division / event record from foreign keys
	SELECT events.id, events.carnivalID, eventtype.type, eventAgeGroup.ageGroup, eventdivision.division, events.startTime, eventtype.unit, events.typeID, events.ageGroupID, events.divisionID
		FROM events
		INNER JOIN carnivals ON events.carnivalID = carnivals.id
        INNER JOIN eventtype ON events.typeID = eventtype.id
        INNER JOIN eventAgeGroup ON events.ageGroupID = eventAgeGroup.id
        INNER JOIN eventdivision ON events.divisionID = eventdivision.id
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
	# Fetch specified student
    # Translate house from foreign keys
	SELECT students.id, students.firstName, students.lastName, house.house, students.number, students.houseID
		FROM students
        INNER JOIN house ON students.houseID = house.id
        WHERE students.id = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetRecords` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetRecords`(
	IN inCarnivalTypeID int
)
BEGIN
	# Set up temporary table
    DROP TEMPORARY TABLE IF EXISTS tmpEventTypes;
    CREATE TEMPORARY TABLE tmpEventTypes (
		id int
    );
    
    # Load event types within specified carnival type
    INSERT INTO tmpEventTypes(id) SELECT id FROM eventtype WHERE eventtype.carnivalTypeID = inCarnivalTypeID;
    
    # Fetch all records
	# Translate event type / event age group / result / student from foreign keys
    # Check record belongs to carnival type
    # Order by type name then age group
    SELECT eventrecord.id, eventtype.type, eventAgeGroup.ageGroup, students.firstName, students.lastName, results.result, results.studentID, eventtype.unit, results.eventID, events.carnivalID
		FROM eventrecord 
		INNER JOIN eventtype ON eventrecord.typeID = eventtype.id
        INNER JOIN eventAgeGroup ON eventrecord.ageGroupID = eventAgeGroup.id
        INNER JOIN results ON eventrecord.resultID = results.id
        INNER JOIN students ON results.studentID = students.id
        INNER JOIN events ON results.eventID = events.id
		WHERE EXISTS (SELECT 1 FROM tmpEventTypes WHERE eventrecord.typeID=tmpEventTypes.id)
        ORDER BY eventrecord.typeID, eventrecord.ageGroupID;
    
    # Clean up temporary table
    DROP TEMPORARY TABLE IF EXISTS tmpEventTypes;
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
	# Fetch all results for specified event
    # Translate house name from foreign key
    # Order by placing
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
	# Fetch all students
    # Translate house from foreign keys
    # Order by house name, then last name, then first name
	SELECT students.id, students.firstName, students.lastName, house.house, students.number
		FROM students
        INNER JOIN house ON students.houseID = house.id
        ORDER BY house.house, students.lastName, students.firstName ASC;
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
	# Fetch all students
    # Translate house from foreign keys
    # Order by student's last name
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
	IN carnivalID int
)
BEGIN
	# Set up temporary table
	DROP TEMPORARY TABLE IF EXISTS tmpCarnivalEvents;
    CREATE TEMPORARY TABLE tmpCarnivalEvents (
		id int
	);
    
    # Load events within specified carnival
    INSERT INTO tmpCarnivalEvents (id) SELECT id FROM events WHERE events.carnivalID = carnivalID;
    
    BEGIN
		# Initialise variables
		DECLARE cursor_id int DEFAULT 0;
        DECLARE done int DEFAULT FALSE;
		DECLARE cursor_e CURSOR FOR SELECT id FROM tmpCarnivalEvents;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
        
        # Loop through each event and remove them
        OPEN cursor_e;
        deleteEvents: LOOP
			# Establishes a 'for loop' through each event in carnival
			FETCH cursor_e INTO cursor_id;
            IF done THEN
				LEAVE deleteEvents;
            END IF;
            
            CALL RemoveEvent (cursor_id);
        END LOOP;
        CLOSE cursor_e;
    END;
    
    # Finally, delete carnival from carnivals table
    DELETE FROM carnivals WHERE carnivals.id = carnivalID;
    
	# Clean up temporary table
    DROP TEMPORARY TABLE IF EXISTS tmpCarnivalEvents;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveEvent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RemoveEvent`(
	IN eventID int
)
BEGIN
	# Set up temporary table
	DROP TEMPORARY TABLE IF EXISTS tmpeventresults;
    CREATE TEMPORARY TABLE tmpeventresults (
		id int
	);
    
    # Load results within specified event
    INSERT INTO tmpeventresults (id) SELECT id FROM results WHERE results.eventID = eventID;
    
    BEGIN
		# Initialise variable
		DECLARE cursor_id int DEFAULT 0;
        DECLARE done int DEFAULT FALSE;
		DECLARE cursor_e CURSOR FOR SELECT id FROM tmpeventresults;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
        
        # Loop through each result and delete them
        OPEN cursor_e;
        deleteResults: LOOP
			# Establishes a 'for loop' through each result in event
			FETCH cursor_e INTO cursor_id;
            IF done THEN
				LEAVE deleteResults;
            END IF;
            
            CALL RemoveResult (cursor_id);
        END LOOP;
        CLOSE cursor_e;
    END;
    
    # Finally, delete event from the events table
    DELETE FROM events WHERE events.id = eventID;
    
	# Clean up temporary table
    DROP TEMPORARY TABLE IF EXISTS tmpeventresults;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveResult` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RemoveResult`(
	IN resultID int
)
BEGIN
	# Initialise variable
	DECLARE inEventID int DEFAULT 0;
    DECLARE inAscending bool DEFAULT 1;
    DECLARE inTypeID int DEFAULT 0;
    DECLARE inAgeGroupID int DEFAULT 0;
    
    # Load event / event type / event age group / ascending
    SELECT eventID INTO inEventID FROM results WHERE results.id = resultID;
    SELECT typeID, ageGroupID INTO inTypeID, inAgeGroupID FROM events WHERE events.id = inEventID;
    SELECT ascending INTO inAscending FROM eventtype WHERE eventtype.id = inTypeID;
	
    # Delete result from table
    DELETE FROM results WHERE results.id = resultID;
    
    # Set up temporary tables
    DROP TEMPORARY TABLE IF EXISTS tmpUnsortedResults;
	DROP TEMPORARY TABLE IF EXISTS tmpSortedResults;
	CREATE TEMPORARY TABLE tmpUnsortedResults (
		id int,
		res float
	);
	CREATE TEMPORARY TABLE tmpSortedResults (
		id int,
		res float,
		placing int
	);
    
    # Load all existing results into tmpUnsortedResults
	INSERT INTO tmpUnsortedResults(id, res) SELECT id, result FROM results WHERE eventID = inEventID AND dnf = 0 AND dq = 0;
	
    # Sort results by ascending/descending order then store in tmpSortedResults
    IF (inAscending = 1) THEN
		INSERT INTO tmpSortedResults(id, res, placing) SELECT id, res, RANK() OVER (ORDER BY res ASC) FROM tmpUnsortedResults;
	ELSE
		INSERT INTO tmpSortedResults(id, res, placing) SELECT id, res, RANK() OVER (ORDER BY res DESC) FROM tmpUnsortedResults;
	END IF;
    
	# Update placings and points in table
	BEGIN
		# Initialise variables
		DECLARE cursor_typeID int DEFAULT 0;
        DECLARE cursor_categoryID int DEFAULT 0;
        DECLARE cursor_divisionID int DEFAULT 0;
        DECLARE cursor_points int DEFAULT 0;
		DECLARE cursor_id int DEFAULT 0;
		DECLARE cursor_placing int DEFAULT 0;
		DECLARE done int DEFAULT FALSE;
		DECLARE cursor_e CURSOR FOR SELECT id, placing FROM tmpSortedResults;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
        
        # Load event division / type / category variables
        SELECT divisionID INTO cursor_divisionID FROM events WHERE events.id = inEventID;
        SELECT typeID INTO cursor_typeID FROM events WHERE events.id = inEventID;
        SELECT categoryID INTO cursor_categoryID FROM eventtype WHERE eventtype.id = cursor_typeID;
		
         # Loop through each result and update points
		OPEN cursor_e;
		updatePoints: LOOP
			# Establishes a 'for loop' through each result
			FETCH cursor_e INTO cursor_id, cursor_placing;
			IF done THEN
				LEAVE updatePoints;
			END IF;
            
            # Athletics field events
            IF (cursor_categoryID = 1) THEN
				# Any below 32nd will receive same points as 32nd place
				IF (cursor_placing > 32) THEN
					SET cursor_placing = 32;
                END IF;
            END IF;
            
            # Athletics track & relay events
            IF (cursor_categoryID = 2 OR cursor_categoryID = 3) THEN
				# Any below 12th will receive same points as 12th place
				IF (cursor_placing > 12) THEN
					SET cursor_placing = 12;
                END IF;
                
                # Any below Division 3 will receive same points scale as Division 3
                # This will only apply to track events
                IF (cursor_divisionID > 4) THEN
					SET cursor_divisionID = 4;
                END IF;
			END IF;
            
            # Swimming individual and relay events
            IF (cursor_categoryID = 4 OR cursor_categoryID = 5) THEN
				# Any below 8th will receive same points as 8th place
				IF (cursor_placing > 8) THEN
					SET cursor_placing = 8;
                END IF;
                
				# All non-championship divisions receive same points scale
				IF (cursor_divisionID > 2) THEN
					SET cursor_divisionID = 2;
                END IF;
            END IF;
            
            # Swimming all-age relay events
            IF (cursor_categoryID = 6) THEN
				# Any below 10th will receive same points as 10th place
				IF (cursor_placing > 10) THEN
					SET cursor_placing = 10;
                END IF;
            END IF;
            
            # Cross country events
            IF (cursor_categoryID = 7) THEN
				# All results get 1 point
				SET cursor_placing = 1;
                SET cursor_divisionID = 1;
            END IF;
            
            # Match corresponding points
            SELECT points INTO cursor_points FROM eventweighting2 WHERE categoryID = cursor_categoryID AND divisionID = cursor_divisionID AND placing = cursor_placing;
            
            # Update results row with new placing and points
            UPDATE results SET results.placing = cursor_placing, results.points = cursor_points WHERE results.id = cursor_id;
		END LOOP;
		CLOSE cursor_e;
    END;
    
    # Update event record
    CALL CalculateRecord (inTypeID, inAgeGroupID);
    
    # Clean up temporary tables
    DROP TEMPORARY TABLE IF EXISTS tmpUnsortedResults;
	DROP TEMPORARY TABLE IF EXISTS tmpSortedResults;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveStudent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RemoveStudent`(
	IN studentID int
)
BEGIN
	# Set up temporary table
	DROP TEMPORARY TABLE IF EXISTS tmpStudentResults;
    CREATE TEMPORARY TABLE tmpStudentResults (
		id int
    );

	# Load all results of student into tmpStudentResults
	INSERT INTO tmpStudentResults (id) SELECT id FROM results WHERE results.studentID = studentID;
    
    BEGIN
		# Initialise variables
		DECLARE cursor_id int DEFAULT 0;
        DECLARE done int DEFAULT FALSE;
		DECLARE cursor_e CURSOR FOR SELECT id FROM tmpStudentResults;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
        
		# Loop through each result and delete them
        OPEN cursor_e;
        deleteStudentResults: LOOP
			# Establishes a 'for loop' through each result of student
			FETCH cursor_e INTO cursor_id;
            IF done THEN
				LEAVE deleteStudentResults;
            END IF;
            
            CALL RemoveResult (cursor_id);
        END LOOP;
        CLOSE cursor_e;
    END;

	# Finally, delete student from the students table
	DELETE FROM students WHERE students.id = studentID;
	
    # Clean up temporary table
    DROP TEMPORARY TABLE IF EXISTS tmpStudentResults;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateHousesForOneCarnival` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateHousesForOneCarnival`(
	IN carnivalID int
)
BEGIN
	# Set up temporary tables
	DROP TEMPORARY TABLE IF EXISTS tmpUnsortedHouses;
    DROP TEMPORARY TABLE IF EXISTS tmpSortedHouses;
    DROP TEMPORARY TABLE IF EXISTS tmpResultsInCarnival;
    CREATE TEMPORARY TABLE tmpUnsortedHouses (
		id int,
        points int
    );
    CREATE TEMPORARY TABLE tmpSortedHouses (
		id int,
        points int,
        placing int
    );
    CREATE TEMPORARY TABLE tmpResultsInCarnival (
		id int,
        studentID int,
        points int
    );
    
    # Load all houses into tmpUnsortedHouses and reset their points to 0
    INSERT INTO tmpUnsortedHouses(id) SELECT id FROM house;
    UPDATE tmpUnsortedHouses SET points = 0 WHERE 1 = 1;
    
    # Load all results in specified carnival to tmpResultsInCarnival
    INSERT INTO tmpResultsInCarnival (id, studentID, points) SELECT id, studentID, points FROM results WHERE results.eventID IN (
		SELECT id FROM events WHERE events.carnivalID = carnivalID
    );
    
    # Calculate house points and placing
    BEGIN
		# Initialise variables
		DECLARE cursor_houseID int DEFAULT 0;
		DECLARE cursor_studentID int DEFAULT 0;
		DECLARE cursor_points int DEFAULT 0;
		DECLARE done int DEFAULT FALSE;
		DECLARE cursor_e CURSOR FOR SELECT studentID, points FROM tmpResultsInCarnival;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

		# Loop through each result then add its points to the corresponding student's house
		OPEN cursor_e;
		updateHousePointsAndPlacings: LOOP
			# Establishes a 'for loop' through each result
			FETCH cursor_e INTO cursor_studentID, cursor_points;
			IF done THEN
				LEAVE updateHousePointsAndPlacings;
			END IF;
            
            # Add points to student's house
            SELECT houseID INTO cursor_houseID FROM students WHERE students.id = cursor_studentID;
            UPDATE tmpUnsortedHouses SET points = points + cursor_points WHERE tmpUnsortedHouses.id = cursor_houseID;
            
		END LOOP;
		CLOSE cursor_e;
        
        # Sort the newly updated houses and insert into tmpSortedHouses
        INSERT INTO tmpSortedHouses(id, points, placing) SELECT id, points, RANK() OVER (ORDER BY points DESC) FROM tmpUnsortedHouses;
    END;
    
    # Insert updated rows back into the house table
    BEGIN
		# Initialise variables
		DECLARE cursor_id int DEFAULT 0;
		DECLARE cursor_points int DEFAULT 0;
        DECLARE cursor_placing int DEFAULT 0;
		DECLARE done int DEFAULT FALSE;
		DECLARE cursor_e CURSOR FOR SELECT id, points, placing FROM tmpSortedHouses;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

		# Loop through each sorted house then update row in the house table
		OPEN cursor_e;
		updateHouseTable: LOOP
			# Establishes a 'for loop' through each house
			FETCH cursor_e INTO cursor_id, cursor_points, cursor_placing;
			IF done THEN
				LEAVE updateHouseTable;
			END IF;
            
            # Update corresponding row in the house table
            UPDATE house SET house.points = cursor_points, house.placing = cursor_placing WHERE house.id = cursor_id;
            
		END LOOP;
		CLOSE cursor_e;
    END;
    
    # Clean up temporary tables
    DROP TEMPORARY TABLE IF EXISTS tmpUnsortedHouses;
    DROP TEMPORARY TABLE IF EXISTS tmpSortedHouses;
    DROP TEMPORARY TABLE IF EXISTS tmpResultsInCarnival;
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

-- Dump completed on 2023-07-16 16:37:50
