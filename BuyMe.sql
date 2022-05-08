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
  CONSTRAINT `alerts_ibfk_2` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts`
--

LOCK TABLES `alerts` WRITE;
/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;
INSERT INTO `alerts` VALUES (48,'You successfully bought iPad Pro.','diff'),(47,'Your item named iPhone 13 was sold.','fady'),(48,'A user bid higher than you on iPad Pro','fady'),(49,'Your item named iPhone 12 was sold.','fady'),(50,'You successfully bought Macbook.','fady'),(47,'You successfully bought iPhone 13.','new'),(48,'Your item named iPad Pro was sold.','new'),(49,'You successfully bought iPhone 12.','new'),(50,'Your item named Macbook was sold.','new'),(58,'A phone you\'re interested in named iPhone 11 was just posted!','new');
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
  CONSTRAINT `automatic_bid_ibfk_2` FOREIGN KEY (`bidder`) REFERENCES `user` (`username`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automatic_bid`
--

LOCK TABLES `automatic_bid` WRITE;
/*!40000 ALTER TABLE `automatic_bid` DISABLE KEYS */;
INSERT INTO `automatic_bid` VALUES (48,'diff',900.00,50.00);
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
  CONSTRAINT `bid_history_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  CONSTRAINT `bid_history_ibfk_2` FOREIGN KEY (`bidder`) REFERENCES `user` (`username`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid_history`
--

LOCK TABLES `bid_history` WRITE;
/*!40000 ALTER TABLE `bid_history` DISABLE KEYS */;
INSERT INTO `bid_history` VALUES (47,600.00,'new'),(48,650.00,'fady'),(48,700.00,'diff'),(48,750.00,'fady'),(48,800.00,'diff'),(49,600.00,'new'),(50,1050.00,'fady'),(51,1100.00,'new'),(52,300.00,'fady');
/*!40000 ALTER TABLE `bid_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bought_items`
--

DROP TABLE IF EXISTS `bought_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bought_items` (
  `item_id` int NOT NULL,
  `category` varchar(30) DEFAULT NULL,
  `price` float(15,2) DEFAULT NULL,
  `buyer` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `buyer` (`buyer`),
  CONSTRAINT `bought_items_ibfk_1` FOREIGN KEY (`buyer`) REFERENCES `user` (`username`) ON UPDATE CASCADE,
  CONSTRAINT `bought_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bought_items`
--

LOCK TABLES `bought_items` WRITE;
/*!40000 ALTER TABLE `bought_items` DISABLE KEYS */;
INSERT INTO `bought_items` VALUES (47,'phone',600.00,'new'),(48,'tablet',800.00,'diff'),(49,'phone',600.00,'new'),(50,'laptop',1050.00,'fady');
/*!40000 ALTER TABLE `bought_items` ENABLE KEYS */;
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
  `customer_rep_password` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`customer_rep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_reps`
--

LOCK TABLES `customer_reps` WRITE;
/*!40000 ALTER TABLE `customer_reps` DISABLE KEYS */;
INSERT INTO `customer_reps` VALUES (1,'rep','rep'),(3,'cusrep','cusrep');
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
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (47,'iPhone 13','phone','Brand New','fady',500.00,10.00,600.00,'2022-05-07 20:43:00',1,NULL),(48,'iPad Pro','tablet','Used, but works well','new',600.00,20.00,800.00,'2022-05-07 20:48:00',1,NULL),(49,'iPhone 12','phone','New','fady',500.00,20.00,600.00,'2022-05-07 20:51:00',1,NULL),(50,'Macbook','laptop','ANything','new',900.00,50.00,1050.00,'2022-05-07 21:18:00',1,NULL),(51,'MacBook Pro Max','laptop','Brand New','fady',1000.00,50.00,1100.00,'2022-05-07 21:35:00',1,1400.00),(52,'iPhone 5','phone','Used','new',200.00,10.00,300.00,'2022-05-07 21:39:00',1,500.00),(55,'MacBook Air','laptop','MacBook Air','fady',600.00,20.00,600.00,'2022-05-25 21:42:00',0,800.00),(57,'iPad 5th Gen','tablet','iPad','new',400.00,20.00,400.00,'2022-05-25 21:44:00',0,700.00),(58,'iPhone 11','phone','iPhone 11','fady',200.00,50.00,200.00,'2022-05-19 12:51:00',0,400.00);
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
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (3,'new','Why is the iPhone bid not working?'),(4,'new','What?');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replys`
--

LOCK TABLES `replys` WRITE;
/*!40000 ALTER TABLE `replys` DISABLE KEYS */;
INSERT INTO `replys` VALUES (7,'What is what',3,4),(8,'What are you talking about?',3,4),(9,'What have you tried so far?',3,3);
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
INSERT INTO `user` VALUES ('admin','admin'),('diff','diff'),('fady','fady'),('new','new');
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
  PRIMARY KEY (`type`,`username`),
  KEY `username` (`username`),
  CONSTRAINT `user_interests_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_interests`
--

LOCK TABLES `user_interests` WRITE;
/*!40000 ALTER TABLE `user_interests` DISABLE KEYS */;
INSERT INTO `user_interests` VALUES ('phone','new'),('tablet','new');
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

-- Dump completed on 2022-05-07 22:31:19