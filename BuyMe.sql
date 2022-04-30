-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: localhost    Database: BuyMe
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `automatic_bid`
--

DROP TABLE IF EXISTS `automatic_bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `automatic_bid` (
  `item_id` int DEFAULT NULL,
  `bidder` varchar(30) DEFAULT NULL,
  `maximum_bid` float(15,2) DEFAULT NULL,
  `bid_increment` float(15,2) DEFAULT NULL,
  KEY `item_id` (`item_id`),
  KEY `bidder` (`bidder`),
  CONSTRAINT `automatic_bid_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  CONSTRAINT `automatic_bid_ibfk_2` FOREIGN KEY (`bidder`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automatic_bid`
--

LOCK TABLES `automatic_bid` WRITE;
/*!40000 ALTER TABLE `automatic_bid` DISABLE KEYS */;
INSERT INTO `automatic_bid` VALUES (1,'khush',1200.00,10.00),(1,'hey',1250.00,10.00),(5,'khush',10.00,2.00),(6,'khush',10.00,4.00),(6,'khush',50.00,5.00),(7,'khush',10.00,1.00),(8,'khush',100.00,3.00);
/*!40000 ALTER TABLE `automatic_bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bid_history`
--

DROP TABLE IF EXISTS `bid_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bid_history` (
  `item_id` int DEFAULT NULL,
  `current_bid` float(15,2) DEFAULT NULL,
  `bidder` varchar(30) DEFAULT NULL,
  KEY `bidder` (`bidder`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `bid_history_ibfk_1` FOREIGN KEY (`bidder`) REFERENCES `user` (`username`),
  CONSTRAINT `bid_history_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid_history`
--

LOCK TABLES `bid_history` WRITE;
/*!40000 ALTER TABLE `bid_history` DISABLE KEYS */;
INSERT INTO `bid_history` VALUES (2,620.00,'khush'),(5,3.00,'khush'),(6,5.00,'khush'),(6,6.00,'name'),(6,10.00,'khush'),(6,11.00,'khush'),(6,14.00,'name'),(7,2.00,'khush'),(8,2.00,'name'),(8,5.00,'khush'),(8,6.00,'name'),(8,9.00,'khush');
/*!40000 ALTER TABLE `bid_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `starting_bid` float(15,2) DEFAULT NULL,
  `bid_increment` float(15,2) DEFAULT NULL,
  `current_price` float(15,2) DEFAULT NULL,
  `sell_by_date` datetime DEFAULT NULL,
  `bought` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`item_id`),
  KEY `username` (`username`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'iPhone','phone','good iphone','plolla',200.00,10.00,1000.00,'2022-05-02 18:31:00',NULL),(2,'iPad Pro','tablet','hello this is good ipad','plolla',555.00,4.00,620.00,'2022-05-04 18:32:00',NULL),(3,'iPhone 2','phone','this is good iphone','plolla',333.00,3.00,333.00,'2022-04-28 19:54:00',1),(4,'iphone use thies','phone','test',NULL,1.00,1.00,1.00,'2022-05-07 21:02:00',0),(5,'a','phone','a phone','seller',1.00,1.00,1.00,'2022-05-07 21:03:00',0),(6,'galaxy','laptop','galaxy','seller',1.00,1.00,14.00,'2022-05-07 21:44:00',0),(7,'use this for no initial bid ','phone','na','seller',1.00,1.00,2.00,'2022-04-30 21:52:00',0),(8,'3',NULL,'name first manual, khush auto, name manual','seller',1.00,1.00,9.00,'2022-04-30 21:53:00',0);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `username` varchar(30) NOT NULL,
  `password` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('e','e'),('hey','hey'),('khush','khush'),('name','name'),('plolla','hello'),('seller','seller');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-29 21:55:36
