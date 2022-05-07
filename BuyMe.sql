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
  CONSTRAINT `alerts_ibfk_2` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts`
--

LOCK TABLES `alerts` WRITE;
/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;
INSERT INTO `alerts` VALUES (43,'You successfully bought ipad pro 12 inch.','hello'),(44,'You successfully bought m2 2024 mack.','hello'),(45,'Your item named home phone was sold.','hello'),(1,'A user bid higher than you on iPhone','khush'),(2,'A user bid higher than you on iPad Pro','khush'),(7,'You successfully bought use this for no initial bid .','khush'),(8,'You successfully bought 3.','khush'),(10,'You successfully bought phone user this .','khush'),(11,'You successfully bought laptop502.','khush'),(12,'You successfully bought hey.','khush'),(13,'You successfully bought manual automatic bid .','khush'),(14,'A user bid higher than your maximum bid cap on the item Tab','khush'),(34,'A phone you\'re interested in named phone test alert was just posted!','khush'),(36,'A phone you\'re interested in named phone was just posted!','khush'),(39,'A laptop you\'re interested in named M1 Macbook Pro was just posted!','khush'),(40,'A phone you\'re interested in named phjone was just posted!','khush'),(42,'A phone you\'re interested in named M1 Mackbook was just posted!','khush'),(44,'A laptop you\'re interested in named m2 2024 mack was just posted!','khush'),(45,'A phone you\'re interested in named home phone was just posted!','khush'),(46,'A phone you\'re interested in named android was just posted!','khush'),(1,'You successfully bought iPhone.','name1'),(42,'You successfully bought M1 Mackbook.','name1'),(1,'Your item named iPhone was sold.','plolla'),(42,'Your item named M1 Mackbook was sold.','plolla'),(43,'Your item named ipad pro 12 inch was sold.','plolla'),(44,'Your item named m2 2024 mack was sold.','plolla'),(45,'You successfully bought home phone.','plolla'),(46,'You successfully bought android.','plolla'),(6,'A user bid higher than you on galaxy','random'),(13,'A user bid higher than you on manual automatic bid ','random'),(14,'A user bid higher than you on Tab','random'),(14,'You successfully bought Tab.','random'),(7,'Your item named use this for no initial bid  was sold.','seller'),(8,'Your item named 3 was sold.','seller'),(10,'Your item named phone user this  was sold.','seller'),(11,'Your item named laptop502 was sold.','seller'),(13,'Your item named manual automatic bid  was sold.','seller'),(14,'Your item named Tab was sold.','seller');
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
INSERT INTO `automatic_bid` VALUES (1,'khush',1200.00,10.00),(1,'hey',1250.00,10.00),(5,'khush',10.00,2.00),(6,'khush',10.00,4.00),(6,'khush',50.00,5.00),(7,'khush',10.00,1.00),(8,'khush',100.00,3.00),(1,'name2',2200.00,30.00),(2,'name1',800.00,40.00),(2,'khush',900.00,10.00),(11,'khush',5.00,1.00),(11,'khush',10000.00,242.00),(12,'khush',10.00,2.00),(12,'random',560.00,6.00),(13,'khush',1000.00,10.00),(14,'khush',5.00,2.00);
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
INSERT INTO `bid_history` VALUES (42,3000.00,'name1'),(43,2000.00,'hello'),(44,4000.00,'hello'),(45,400.00,'plolla'),(46,500.00,'plolla');
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
  CONSTRAINT `bought_items_ibfk_1` FOREIGN KEY (`buyer`) REFERENCES `user` (`username`),
  CONSTRAINT `bought_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bought_items`
--

LOCK TABLES `bought_items` WRITE;
/*!40000 ALTER TABLE `bought_items` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_reps`
--

LOCK TABLES `customer_reps` WRITE;
/*!40000 ALTER TABLE `customer_reps` DISABLE KEYS */;
INSERT INTO `customer_reps` VALUES (1,'customer rep 1',NULL),(2,'prathik','hello');
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'iPhone','phone','good iphone','plolla',200.00,10.00,1200.00,'2022-05-02 18:31:00',1,NULL),(2,'iPad Pro','tablet','hello this is good ipad','plolla',555.00,4.00,2000.00,'2022-05-04 18:32:00',1,NULL),(3,'iPhone 2','phone','this is good iphone','plolla',333.00,3.00,333.00,'2022-04-28 19:54:00',1,NULL),(4,'iphone use thies','phone','test',NULL,1.00,1.00,1.00,'2022-05-07 21:02:00',0,NULL),(5,'a','phone','a phone','seller',1.00,1.00,5.00,'2022-05-07 21:03:00',0,NULL),(6,'galaxy','laptop','galaxy','seller',1.00,1.00,50.00,'2022-05-07 21:44:00',0,NULL),(7,'use this for no initial bid ','phone','na','seller',1.00,1.00,2.00,'2022-04-30 21:52:00',1,NULL),(8,'3',NULL,'name first manual, khush auto, name manual','seller',1.00,1.00,9.00,'2022-04-30 21:53:00',1,NULL),(9,'iPhone','phone','this is a good iphone ','plolla',222.00,2.00,222.00,'2022-05-01 22:06:00',1,NULL),(10,'phone user this ','phone','hey','seller',1.00,1.00,2.00,'2022-05-01 22:59:00',1,NULL),(11,'laptop502','laptop','hey buy','seller',1.00,1.00,2.00,'2022-05-03 00:10:00',1,NULL),(12,'hey','tablet','hey','seller',1.00,1.00,3.00,'2022-05-03 12:15:00',1,NULL),(13,'manual automatic bid ','tablet','','seller',1.00,1.00,15.00,'2022-05-02 00:22:00',1,NULL),(14,'Tab','tablet','Manual then Automatic','seller',1.00,1.00,1100.00,'2022-05-02 14:59:00',1,NULL),(16,'hey','laptop','','seller',1.00,1.00,1.00,'2022-05-03 01:56:00',1,NULL),(19,'test',NULL,'','seller',1.00,1.00,1.00,'2022-05-03 01:58:00',1,NULL),(21,'test2',NULL,'','seller',1.00,1.00,1.00,'2022-05-03 01:57:00',1,NULL),(23,'hey','tablet','hey','seller',1.00,1.00,1.00,'2022-05-03 01:03:00',1,NULL),(25,'testing','tablet','','seller',1.00,1.00,1.00,'2022-05-03 02:03:00',1,NULL),(27,'testing','laptop','','seller',1.00,1.00,1.00,'2022-05-03 03:03:00',1,NULL),(28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(29,'testengie','tablet','e','seller',1.00,1.00,1.00,'2022-05-03 04:08:00',1,NULL),(30,'e','tablet','','seller',1.00,1.00,1.00,'2022-05-03 05:09:00',1,NULL),(31,'rgr','tablet','','seller',1.00,1.00,1.00,'2022-05-03 05:10:00',1,NULL),(32,'iphone alert type','phone','','seller',1.00,1.00,1.00,'2022-05-03 04:16:00',1,NULL),(33,'jte','phone','','seller',1.00,1.00,1.00,'2022-05-03 03:15:00',1,NULL),(34,'phone test alert','phone','','seller',1.00,1.00,1.00,'2022-05-03 02:19:00',1,NULL),(35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL),(36,'phone','phone','ddd','plolla',400.00,4.00,400.00,'2022-05-13 17:34:00',0,NULL),(37,NULL,NULL,NULL,'plolla',NULL,NULL,NULL,NULL,0,NULL),(38,'ipad','tablet','dd','plolla',100.00,4.00,150.00,'2022-05-17 17:39:00',0,NULL),(39,'M1 Macbook Pro','laptop','new macbook and very good','plolla',1000.00,50.00,1000.00,'2022-05-02 05:43:00',1,NULL),(40,'phjone','phone','dsdsds','plolla',100.00,10.00,100.00,'2022-05-04 05:45:00',1,NULL),(41,'mike','tablet','mike','plolla',1000.00,10.00,1000.00,'2022-05-11 05:42:00',0,NULL),(42,'M1 Mackbook','phone','ggg','plolla',2000.00,100.00,3000.00,'2022-05-07 05:48:00',1,NULL),(43,'ipad pro 12 inch','tablet','good ipad','plolla',1500.00,10.00,2000.00,'2022-05-07 05:59:00',1,NULL),(44,'m2 2024 mack','laptop','mack','plolla',3000.00,10.00,4000.00,'2022-05-07 06:10:00',1,NULL),(45,'home phone','phone','ggg','hello',300.00,10.00,400.00,'2022-05-07 06:20:00',1,NULL),(46,'android','phone','meh','hello',400.00,10.00,500.00,'2022-05-07 06:27:00',1,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'plolla','What is BuyMe'),(2,'hello','How do I sell an item?');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replys`
--

LOCK TABLES `replys` WRITE;
/*!40000 ALTER TABLE `replys` DISABLE KEYS */;
INSERT INTO `replys` VALUES (1,'Buy Me is a platform like Ebay where you put up items for auction',1,1),(2,'Hello you can sell an item by clicking the sell button on your home page. You can sell phones, tablets, and laptops!',2,2),(3,'hello',2,2),(4,'BuyMe is a great site',2,1),(5,'hello',2,1),(6,'BuyMe is our CS 336 Project',2,1);
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
INSERT INTO `user` VALUES ('admin','admin'),('e','e'),('hello','hello'),('hey','hey'),('khush','khush'),('name1','name1'),('name2','name'),('plolla','hello'),('random','random'),('seller','seller');
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

-- Dump completed on 2022-05-07  6:29:18
