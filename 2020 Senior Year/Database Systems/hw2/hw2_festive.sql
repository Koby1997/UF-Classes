-- MySQL dump 10.16  Distrib 10.2.12-MariaDB, for osx10.11 (x86_64)
--
-- Host: localhost    Database: hw2_festive
-- ------------------------------------------------------
-- Server version	10.2.12-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Bars`
--

DROP TABLE IF EXISTS `Bars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bars` (
  `name` varchar(25) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `license` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bars`
--

LOCK TABLES `Bars` WRITE;
/*!40000 ALTER TABLE `Bars` DISABLE KEYS */;
INSERT INTO `Bars` VALUES ('Happy Hour','25 N 1st Street','full'),('Joes Place','1234 E Main Street','beer'),('Sue\'s Bar','4321 W University Ave','full');
/*!40000 ALTER TABLE `Bars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Beers`
--

DROP TABLE IF EXISTS `Beers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Beers` (
  `name` varchar(25) NOT NULL,
  `brewer` varchar(25) DEFAULT NULL,
  `calories` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Beers`
--

LOCK TABLES `Beers` WRITE;
/*!40000 ALTER TABLE `Beers` DISABLE KEYS */;
INSERT INTO `Beers` VALUES ('Bud','Anheuser',180),('Bud Light','Anheuser',125),('Busch','Anheuser',200),('Corona','Crown',175),('MGD','Miller',220),('Miller Light','Miller',110),('Modela','Crown',225),('Wicked Ale','Pete\'s',200);
/*!40000 ALTER TABLE `Beers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Drinkers`
--

DROP TABLE IF EXISTS `Drinkers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Drinkers` (
  `name` varchar(25) NOT NULL,
  `address` varchar(25) DEFAULT NULL,
  `phone` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Drinkers`
--

LOCK TABLES `Drinkers` WRITE;
/*!40000 ALTER TABLE `Drinkers` DISABLE KEYS */;
INSERT INTO `Drinkers` VALUES ('Corrie','1551 E Main Street','1511551'),('Jenny','22 N 2nd Place','8675309'),('Joseph','1551 E Main Street','5155115'),('Stephen','4848 W 84th Terrace','8884444'),('Vikki','342 S Spring Way','3333342');
/*!40000 ALTER TABLE `Drinkers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Frequents`
--

DROP TABLE IF EXISTS `Frequents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Frequents` (
  `drinker` varchar(25) NOT NULL,
  `bar` varchar(25) NOT NULL,
  PRIMARY KEY (`drinker`,`bar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Frequents`
--

LOCK TABLES `Frequents` WRITE;
/*!40000 ALTER TABLE `Frequents` DISABLE KEYS */;
INSERT INTO `Frequents` VALUES ('Corrie','Happy Hour'),('Corrie','Joes Place'),('Corrie','Sue\'s Bar'),('Jenny','Happy Hour'),('Joseph','Joes Place'),('Joseph','Sue\'s Bar'),('Stephen','Happy Hour'),('Stephen','Joes Place'),('Vikki','Sue\'s Bar');
/*!40000 ALTER TABLE `Frequents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Likes`
--

DROP TABLE IF EXISTS `Likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Likes` (
  `drinker` varchar(25) NOT NULL,
  `beer` varchar(25) NOT NULL,
  PRIMARY KEY (`drinker`,`beer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Likes`
--

LOCK TABLES `Likes` WRITE;
/*!40000 ALTER TABLE `Likes` DISABLE KEYS */;
INSERT INTO `Likes` VALUES ('Corrie','Bud'),('Corrie','Bud Light'),('Corrie','Corona'),('Corrie','MGD'),('Corrie','Miller Light'),('Corrie','Modela'),('Jenny','Bud'),('Jenny','Busch'),('Joseph','Bud'),('Joseph','Bud Light'),('Joseph','Busch'),('Joseph','Corona'),('Joseph','MGD'),('Joseph','Miller Light'),('Joseph','Modela'),('Joseph','Wicked Ale'),('Stephen','Bud'),('Stephen','Corona'),('Stephen','Miller Light'),('Stephen','Wicked Ale'),('Vikki','Corona'),('Vikki','Modela');
/*!40000 ALTER TABLE `Likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sells`
--

DROP TABLE IF EXISTS `Sells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sells` (
  `bar` varchar(25) NOT NULL,
  `beer` varchar(25) NOT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`bar`,`beer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sells`
--

LOCK TABLES `Sells` WRITE;
/*!40000 ALTER TABLE `Sells` DISABLE KEYS */;
INSERT INTO `Sells` VALUES ('Happy Hour','Bud',NULL),('Happy Hour','Bud Light',2),('Happy Hour','Busch',1.25),('Happy Hour','Corona',2.25),('Happy Hour','MGD',1),('Happy Hour','Miller Light',1.75),('Happy Hour','Modela',2.5),('Joes Place','Bud',2),('Joes Place','Busch',1.5),('Joes Place','Corona',2),('Joes Place','MGD',1.5),('Sue\'s Bar','Bud',1.5),('Sue\'s Bar','Bud Light',1.5),('Sue\'s Bar','Corona',2.5),('Sue\'s Bar','Modela',3),('Sue\'s Bar','Wicked Ale',2);
/*!40000 ALTER TABLE `Sells` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-13  9:28:25
