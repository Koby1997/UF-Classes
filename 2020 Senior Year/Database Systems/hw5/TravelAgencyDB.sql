-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for osx10.13 (x86_64)
--
-- Host: localhost    Database: TravelAgencyDB
-- ------------------------------------------------------
-- Server version	10.4.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Booking`
--

DROP TABLE IF EXISTS `Booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Booking` (
  `agent` varchar(25) NOT NULL,
  `traveler_ssn` int(11) NOT NULL,
  `trip_id` int(11) NOT NULL,
  PRIMARY KEY (`agent`,`traveler_ssn`,`trip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Booking`
--

LOCK TABLES `Booking` WRITE;
/*!40000 ALTER TABLE `Booking` DISABLE KEYS */;
INSERT INTO `Booking` VALUES ('Derek',1,10),('Derek',1,20),('Derek',3,15),('Jaime',1,25),('Jaime',2,30),('Jaime',3,30),('Jaime',3,40),('Jaime',4,50),('Jaime',5,75),('Nathan',3,50),('Nathan',5,75);
/*!40000 ALTER TABLE `Booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Traveler`
--

DROP TABLE IF EXISTS `Traveler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Traveler` (
  `name` varchar(25) NOT NULL,
  `ssn` int(11) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Traveler`
--

LOCK TABLES `Traveler` WRITE;
/*!40000 ALTER TABLE `Traveler` DISABLE KEYS */;
INSERT INTO `Traveler` VALUES ('Bill',4,'2010-07-04'),('Carlene',5,'2005-10-03'),('Jon',2,'2001-02-14'),('Kim',3,'2000-12-12'),('Pete',1,'1999-01-01');
/*!40000 ALTER TABLE `Traveler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Trip`
--

DROP TABLE IF EXISTS `Trip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Trip` (
  `id` int(11) NOT NULL,
  `start_location` varchar(25) DEFAULT NULL,
  `end_location` varchar(25) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Trip`
--

LOCK TABLES `Trip` WRITE;
/*!40000 ALTER TABLE `Trip` DISABLE KEYS */;
INSERT INTO `Trip` VALUES (10,'Gainesville','Atlanta','2020-03-02','2020-03-02'),(15,'San Francisco','Paris','2020-05-25','2020-05-30'),(20,'Atlanta','St. Louis','2020-03-02','2020-03-06'),(25,'Gainesville','New York','2019-06-20','2019-06-29'),(30,'San Francisco','Honolulu','2020-08-27','2020-09-03'),(40,'San Francisco','Dallas','2020-10-31','2020-12-01'),(50,'San Francisco','Los Angelos','2020-12-24','2020-12-30'),(75,'New York','Chicago','2020-02-10','2020-02-14');
/*!40000 ALTER TABLE `Trip` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-04 12:00:25
