-- MySQL dump 10.13  Distrib 8.0.28, for macos11.6 (x86_64)
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
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alerts` (
  `item_id` int NOT NULL,
  `message` varchar(500) NOT NULL,
  `username` varchar(30) NOT NULL,
  PRIMARY KEY (`item_id`,`message`,`username`),
  KEY `username` (`username`),
  CONSTRAINT `alerts_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  CONSTRAINT `alerts_ibfk_2` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts`
--

LOCK TABLES `alerts` WRITE;
/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;
INSERT INTO `alerts` VALUES (1,'A user bid higher than you on iPhone','khush'),(2,'A user bid higher than you on iPad Pro','khush'),(7,'You successfully bought use this for no initial bid .','khush'),(8,'You successfully bought 3.','khush'),(10,'You successfully bought phone user this .','khush'),(11,'You successfully bought laptop502.','khush'),(12,'You successfully bought hey.','khush'),(13,'You successfully bought manual automatic bid .','khush'),(14,'A user bid higher than your maximum bid cap on the item Tab','khush'),(34,'A phone you\'re interested in named phone test alert was just posted!','khush'),(36,'A phone you\'re interested in named phone was just posted!','khush'),(1,'You successfully bought iPhone.','name1'),(1,'Your item named iPhone was sold.','plolla'),(6,'A user bid higher than you on galaxy','random'),(13,'A user bid higher than you on manual automatic bid ','random'),(14,'A user bid higher than you on Tab','random'),(14,'You successfully bought Tab.','random'),(7,'Your item named use this for no initial bid  was sold.','seller'),(8,'Your item named 3 was sold.','seller'),(10,'Your item named phone user this  was sold.','seller'),(11,'Your item named laptop502 was sold.','seller'),(13,'Your item named manual automatic bid  was sold.','seller'),(14,'Your item named Tab was sold.','seller');
/*!40000 ALTER TABLE `alerts` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `automatic_bid` VALUES (1,'khush',1200.00,10.00),(1,'hey',1250.00,10.00),(5,'khush',10.00,2.00),(6,'khush',10.00,4.00),(6,'khush',50.00,5.00),(7,'khush',10.00,1.00),(8,'khush',100.00,3.00),(1,'name',2200.00,30.00),(2,'name1',800.00,40.00),(2,'khush',900.00,10.00),(11,'khush',5.00,1.00),(11,'khush',10000.00,242.00),(12,'khush',10.00,2.00),(12,'random',560.00,6.00),(13,'khush',1000.00,10.00),(14,'khush',5.00,2.00);
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
INSERT INTO `bid_history` VALUES (2,620.00,'khush'),(5,3.00,'khush'),(6,5.00,'khush'),(6,6.00,'name'),(6,10.00,'khush'),(6,11.00,'khush'),(6,14.00,'name'),(7,2.00,'khush'),(8,2.00,'name'),(8,5.00,'khush'),(8,6.00,'name'),(8,9.00,'khush'),(1,1010.00,'khush'),(1,1200.00,'name1'),(2,660.00,'name1'),(2,680.00,'name'),(2,720.00,'name1'),(10,2.00,'khush'),(11,2.00,'khush'),(12,3.00,'khush'),(13,5.00,'random'),(13,15.00,'khush'),(2,785.00,'khush'),(2,1000.00,'random'),(2,1500.00,'khush'),(6,25.00,'random'),(6,50.00,'khush'),(2,2000.00,'random'),(14,2.00,'random'),(14,4.00,'khush'),(14,1100.00,'random');
/*!40000 ALTER TABLE `bid_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_reps`
--

DROP TABLE IF EXISTS `customer_reps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_reps` (
  `customer_rep_id` int NOT NULL AUTO_INCREMENT,
  `customer_rep_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`customer_rep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_reps`
--

LOCK TABLES `customer_reps` WRITE;
/*!40000 ALTER TABLE `customer_reps` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_reps` ENABLE KEYS */;
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
  `reserve_price` float(15,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `username` (`username`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'iPhone','phone','good iphone','plolla',200.00,10.00,1200.00,'2022-05-02 18:31:00',1,NULL),(2,'iPad Pro','tablet','hello this is good ipad','plolla',555.00,4.00,2000.00,'2022-05-04 18:32:00',1,NULL),(3,'iPhone 2','phone','this is good iphone','plolla',333.00,3.00,333.00,'2022-04-28 19:54:00',1,NULL),(4,'iphone use thies','phone','test',NULL,1.00,1.00,1.00,'2022-05-07 21:02:00',0,NULL),(5,'a','phone','a phone','seller',1.00,1.00,1.00,'2022-05-07 21:03:00',0,NULL),(6,'galaxy','laptop','galaxy','seller',1.00,1.00,50.00,'2022-05-07 21:44:00',0,NULL),(7,'use this for no initial bid ','phone','na','seller',1.00,1.00,2.00,'2022-04-30 21:52:00',1,NULL),(8,'3',NULL,'name first manual, khush auto, name manual','seller',1.00,1.00,9.00,'2022-04-30 21:53:00',1,NULL),(9,'iPhone','phone','this is a good iphone ','plolla',222.00,2.00,222.00,'2022-05-01 22:06:00',1,NULL),(10,'phone user this ','phone','hey','seller',1.00,1.00,2.00,'2022-05-01 22:59:00',1,NULL),(11,'laptop502','laptop','hey buy','seller',1.00,1.00,2.00,'2022-05-03 00:10:00',1,NULL),(12,'hey','tablet','hey','seller',1.00,1.00,3.00,'2022-05-03 12:15:00',1,NULL),(13,'manual automatic bid ','tablet','','seller',1.00,1.00,15.00,'2022-05-02 00:22:00',1,NULL),(14,'Tab','tablet','Manual then Automatic','seller',1.00,1.00,1100.00,'2022-05-02 14:59:00',1,NULL),(16,'hey','laptop','','seller',1.00,1.00,1.00,'2022-05-03 01:56:00',1,NULL),(19,'test',NULL,'','seller',1.00,1.00,1.00,'2022-05-03 01:58:00',1,NULL),(21,'test2',NULL,'','seller',1.00,1.00,1.00,'2022-05-03 01:57:00',1,NULL),(23,'hey','tablet','hey','seller',1.00,1.00,1.00,'2022-05-03 01:03:00',1,NULL),(25,'testing','tablet','','seller',1.00,1.00,1.00,'2022-05-03 02:03:00',1,NULL),(27,'testing','laptop','','seller',1.00,1.00,1.00,'2022-05-03 03:03:00',1,NULL),(28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(29,'testengie','tablet','e','seller',1.00,1.00,1.00,'2022-05-03 04:08:00',1,NULL),(30,'e','tablet','','seller',1.00,1.00,1.00,'2022-05-03 05:09:00',1,NULL),(31,'rgr','tablet','','seller',1.00,1.00,1.00,'2022-05-03 05:10:00',1,NULL),(32,'iphone alert type','phone','','seller',1.00,1.00,1.00,'2022-05-03 04:16:00',1,NULL),(33,'jte','phone','','seller',1.00,1.00,1.00,'2022-05-03 03:15:00',1,NULL),(34,'phone test alert','phone','','seller',1.00,1.00,1.00,'2022-05-03 02:19:00',1,NULL),(35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(36,'phone','phone','ddd','plolla',400.00,4.00,400.00,'2022-05-13 17:34:00',0,NULL),(37,NULL,NULL,NULL,'plolla',NULL,NULL,NULL,NULL,0,NULL),(38,'ipad','tablet','dd','plolla',100.00,4.00,100.00,'2022-05-17 17:39:00',0,NULL);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `question_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `question` varchar(600) DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  KEY `username` (`username`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'plolla','What is BuyMe');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replys`
--

DROP TABLE IF EXISTS `replys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `replys` (
  `reply_id` int NOT NULL AUTO_INCREMENT,
  `reply` varchar(600) DEFAULT NULL,
  `customer_rep_id` int DEFAULT NULL,
  `question_id` int DEFAULT NULL,
  PRIMARY KEY (`reply_id`),
  KEY `customer_rep_id` (`customer_rep_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `replys_ibfk_1` FOREIGN KEY (`customer_rep_id`) REFERENCES `customer_reps` (`customer_rep_id`),
  CONSTRAINT `replys_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replys`
--

LOCK TABLES `replys` WRITE;
/*!40000 ALTER TABLE `replys` DISABLE KEYS */;
/*!40000 ALTER TABLE `replys` ENABLE KEYS */;
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
INSERT INTO `user` VALUES ('e','e'),('hey','hey'),('khush','khush'),('name','name'),('name1','name1'),('plolla','hello'),('random','random'),('seller','seller');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_interests`
--

DROP TABLE IF EXISTS `user_interests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_interests` (
  `type` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  PRIMARY KEY (`type`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_interests`
--

LOCK TABLES `user_interests` WRITE;
/*!40000 ALTER TABLE `user_interests` DISABLE KEYS */;
INSERT INTO `user_interests` VALUES ('laptop','khush'),('phone','khush');
/*!40000 ALTER TABLE `user_interests` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-04 20:58:00
