CREATE DATABASE  IF NOT EXISTS `db_test` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_test`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_test
-- ------------------------------------------------------
-- Server version	9.3.0

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
-- Table structure for table `tb_carts`
--

DROP TABLE IF EXISTS `tb_carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_carts` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `user_ID` int unsigned NOT NULL,
  `status` bit(1) DEFAULT b'1',
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uk_cart_user` (`user_ID`),
  CONSTRAINT `fk_cart_user` FOREIGN KEY (`user_ID`) REFERENCES `tb_users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_carts`
--

LOCK TABLES `tb_carts` WRITE;
/*!40000 ALTER TABLE `tb_carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_carts` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_carts_after_insert` AFTER INSERT ON `tb_carts` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_carts', 'Create', USER(), CONCAT('Nuevo registro insertado en tb_carts. Clave Primaria -> ID: ', NEW.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_carts_after_update` AFTER UPDATE ON `tb_carts` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_carts', 'Update', USER(), CONCAT('Registro actualizado en tb_carts. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_carts_after_delete` AFTER DELETE ON `tb_carts` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_carts', 'Delete', USER(), CONCAT('Registro eliminado de tb_carts. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_logs`
--

DROP TABLE IF EXISTS `tb_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_logs` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `table_name` varchar(100) NOT NULL,
  `operation` enum('Create','Read','Update','Delete') NOT NULL,
  `db_users` varchar(80) NOT NULL,
  `description` text NOT NULL,
  `operation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `operation_status` bit(1) DEFAULT b'1',
  PRIMARY KEY (`ID`),
  KEY `idx_logs_table_operation_date` (`table_name`,`operation`,`operation_date`)
) ENGINE=InnoDB AUTO_INCREMENT=78291 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_logs`
--

LOCK TABLES `tb_logs` WRITE;
/*!40000 ALTER TABLE `tb_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_order_cancellations`
--

DROP TABLE IF EXISTS `tb_order_cancellations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_order_cancellations` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `order_ID` int unsigned DEFAULT NULL,
  `buyer_order_ID` int unsigned DEFAULT NULL,
  `requested_by_user_ID` int unsigned DEFAULT NULL,
  `cancellation_scope` enum('WholeOrder','SellerOrder','Items') NOT NULL DEFAULT 'WholeOrder',
  `reason_code` varchar(60) DEFAULT NULL,
  `reason_detail` varchar(1000) DEFAULT NULL,
  `cancellation_status` enum('Requested','Approved','Rejected','Completed') NOT NULL DEFAULT 'Requested',
  `requested_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reviewed_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `internal_notes` varchar(1000) DEFAULT NULL,
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `idx_cancellations_order` (`order_ID`),
  KEY `idx_cancellations_buyer_order` (`buyer_order_ID`),
  KEY `idx_cancellations_requester` (`requested_by_user_ID`),
  CONSTRAINT `fk_cancellations_buyer_order` FOREIGN KEY (`buyer_order_ID`) REFERENCES `tbd_buyer_orders` (`ID`),
  CONSTRAINT `fk_cancellations_order` FOREIGN KEY (`order_ID`) REFERENCES `tb_orders` (`ID`),
  CONSTRAINT `fk_cancellations_requester` FOREIGN KEY (`requested_by_user_ID`) REFERENCES `tb_users` (`ID`),
  CONSTRAINT `chk_cancellations_target` CHECK ((((`cancellation_scope` = _utf8mb4'WholeOrder') and (`order_ID` is not null) and (`buyer_order_ID` is null)) or ((`cancellation_scope` in (_utf8mb4'SellerOrder',_utf8mb4'Items')) and (`buyer_order_ID` is not null))))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_order_cancellations`
--

LOCK TABLES `tb_order_cancellations` WRITE;
/*!40000 ALTER TABLE `tb_order_cancellations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_order_cancellations` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_order_cancellations_after_insert` AFTER INSERT ON `tb_order_cancellations` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_order_cancellations', 'Create', USER(), CONCAT('Nuevo registro insertado en tb_order_cancellations. Clave Primaria -> ID: ', NEW.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_order_cancellations_after_update` AFTER UPDATE ON `tb_order_cancellations` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_order_cancellations', 'Update', USER(), CONCAT('Registro actualizado en tb_order_cancellations. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_order_cancellations_after_delete` AFTER DELETE ON `tb_order_cancellations` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_order_cancellations', 'Delete', USER(), CONCAT('Registro eliminado de tb_order_cancellations. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_orders`
--

DROP TABLE IF EXISTS `tb_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_orders` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(40) NOT NULL,
  `User_ID` int unsigned NOT NULL,
  `total_products` int NOT NULL,
  `total_cost` decimal(10,3) NOT NULL DEFAULT '0.000',
  `status_string` enum('Registered','Payed','Canceled','Delivered','Devolved','Attended','Sended') NOT NULL DEFAULT 'Registered',
  `status` bit(1) DEFAULT b'1',
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_user_2_idx` (`User_ID`),
  CONSTRAINT `fk_user_2` FOREIGN KEY (`User_ID`) REFERENCES `tb_users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_orders`
--

LOCK TABLES `tb_orders` WRITE;
/*!40000 ALTER TABLE `tb_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_orders_after_insert` AFTER INSERT ON `tb_orders` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_orders', 'Create', USER(), CONCAT('Nuevo registro insertado en tb_orders. Clave Primaria -> ID: ', NEW.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_orders_after_update` AFTER UPDATE ON `tb_orders` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_orders', 'Update', USER(), CONCAT('Registro actualizado en tb_orders. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_orders_after_delete` AFTER DELETE ON `tb_orders` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_orders', 'Delete', USER(), CONCAT('Registro eliminado de tb_orders. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_payment_methods`
--

DROP TABLE IF EXISTS `tb_payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_payment_methods` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uk_payment_method_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_payment_methods`
--

LOCK TABLES `tb_payment_methods` WRITE;
/*!40000 ALTER TABLE `tb_payment_methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_payment_methods` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_payment_methods_after_insert` AFTER INSERT ON `tb_payment_methods` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_payment_methods', 'Create', USER(), CONCAT('Nuevo registro insertado en tb_payment_methods. Clave Primaria -> ID: ', NEW.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_payment_methods_after_update` AFTER UPDATE ON `tb_payment_methods` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_payment_methods', 'Update', USER(), CONCAT('Registro actualizado en tb_payment_methods. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_payment_methods_after_delete` AFTER DELETE ON `tb_payment_methods` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_payment_methods', 'Delete', USER(), CONCAT('Registro eliminado de tb_payment_methods. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_payment_transaction`
--

DROP TABLE IF EXISTS `tb_payment_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_payment_transaction` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `payment_ID` int unsigned NOT NULL,
  `refund_ID` int unsigned DEFAULT NULL,
  `transaction_type` enum('Authorization','Capture','Charge','Void','Refund','Chargeback','Adjustment') NOT NULL,
  `transaction_status` enum('Pending','Succeeded','Failed') NOT NULL DEFAULT 'Pending',
  `amount` decimal(10,2) NOT NULL,
  `currency` char(3) NOT NULL DEFAULT 'MXN',
  `provider` varchar(60) DEFAULT NULL,
  `provider_transaction_id` varchar(150) DEFAULT NULL,
  `idempotency_key` varchar(100) DEFAULT NULL,
  `response_code` varchar(100) DEFAULT NULL,
  `response_message` varchar(500) DEFAULT NULL,
  `request_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `response_date` datetime DEFAULT NULL,
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uk_payment_transaction_provider_ref` (`provider`,`provider_transaction_id`),
  UNIQUE KEY `uk_payment_transaction_idempotency` (`provider`,`idempotency_key`),
  KEY `idx_payment_transaction_payment` (`payment_ID`),
  KEY `idx_payment_transaction_refund` (`refund_ID`),
  KEY `fk_payment_transaction_refund_payment` (`refund_ID`,`payment_ID`),
  CONSTRAINT `fk_payment_transaction_payment` FOREIGN KEY (`payment_ID`) REFERENCES `tb_payments` (`ID`),
  CONSTRAINT `fk_payment_transaction_refund_payment` FOREIGN KEY (`refund_ID`, `payment_ID`) REFERENCES `tb_refunds` (`ID`, `payment_ID`),
  CONSTRAINT `chk_payment_transaction_amount` CHECK ((`amount` > 0)),
  CONSTRAINT `chk_payment_transaction_refund` CHECK (((`transaction_type` <> _utf8mb4'Refund') or (`refund_ID` is not null)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_payment_transaction`
--

LOCK TABLES `tb_payment_transaction` WRITE;
/*!40000 ALTER TABLE `tb_payment_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_payment_transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_payment_transaction_after_insert` AFTER INSERT ON `tb_payment_transaction` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_payment_transaction', 'Create', USER(), CONCAT('Nuevo registro insertado en tb_payment_transaction. Clave Primaria -> ID: ', NEW.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_payment_transaction_after_update` AFTER UPDATE ON `tb_payment_transaction` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_payment_transaction', 'Update', USER(), CONCAT('Registro actualizado en tb_payment_transaction. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_payment_transaction_after_delete` AFTER DELETE ON `tb_payment_transaction` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_payment_transaction', 'Delete', USER(), CONCAT('Registro eliminado de tb_payment_transaction. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_payments`
--

DROP TABLE IF EXISTS `tb_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_payments` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `order_ID` int unsigned NOT NULL,
  `payment_method_ID` int unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` char(3) NOT NULL DEFAULT 'MXN',
  `payment_status` enum('Pending','Authorized','Paid','Failed','Refunded','PartiallyRefunded') NOT NULL DEFAULT 'Pending',
  `provider` varchar(60) DEFAULT NULL,
  `provider_reference` varchar(150) DEFAULT NULL,
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `paid_date` datetime DEFAULT NULL,
  `last_update` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uk_payment_provider_reference` (`provider`,`provider_reference`),
  KEY `idx_payment_order` (`order_ID`),
  KEY `fk_payment_method` (`payment_method_ID`),
  CONSTRAINT `fk_payment_method` FOREIGN KEY (`payment_method_ID`) REFERENCES `tb_payment_methods` (`ID`),
  CONSTRAINT `fk_payment_order` FOREIGN KEY (`order_ID`) REFERENCES `tb_orders` (`ID`),
  CONSTRAINT `chk_payment_amount` CHECK ((`amount` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_payments`
--

LOCK TABLES `tb_payments` WRITE;
/*!40000 ALTER TABLE `tb_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_payments` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_payments_after_insert` AFTER INSERT ON `tb_payments` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_payments', 'Create', USER(), CONCAT('Nuevo registro insertado en tb_payments. Clave Primaria -> ID: ', NEW.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_payments_after_update` AFTER UPDATE ON `tb_payments` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_payments', 'Update', USER(), CONCAT('Registro actualizado en tb_payments. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_payments_after_delete` AFTER DELETE ON `tb_payments` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_payments', 'Delete', USER(), CONCAT('Registro eliminado de tb_payments. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_people`
--

DROP TABLE IF EXISTS `tb_people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_people` (
  `person_ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_ID` int unsigned NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `given_names` varchar(150) NOT NULL,
  `family_names` varchar(150) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `gender_ID` enum('H','M','Prefiero no decirlo') DEFAULT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `country_code` char(2) DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`person_ID`),
  KEY `idx_people_user_ID` (`user_ID`),
  CONSTRAINT `fk_people_user` FOREIGN KEY (`user_ID`) REFERENCES `tb_users` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16386 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_people`
--

LOCK TABLES `tb_people` WRITE;
/*!40000 ALTER TABLE `tb_people` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_people` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_people_after_insert` AFTER INSERT ON `tb_people` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_people', 'Create', USER(), CONCAT('Nuevo registro insertado en tb_people. Clave Primaria -> person_ID: ', NEW.`person_ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_people_after_update` AFTER UPDATE ON `tb_people` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_people', 'Update', USER(), CONCAT('Registro actualizado en tb_people. Clave Primaria -> person_ID: ', OLD.`person_ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_people_after_delete` AFTER DELETE ON `tb_people` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_people', 'Delete', USER(), CONCAT('Registro eliminado de tb_people. Clave Primaria -> person_ID: ', OLD.`person_ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_products`
--

DROP TABLE IF EXISTS `tb_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_products` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `SKU` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text,
  `current_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `current_stock` int unsigned NOT NULL DEFAULT '0',
  `status` bit(1) DEFAULT b'1',
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SKU` (`SKU`)
) ENGINE=InnoDB AUTO_INCREMENT=24977 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_products`
--

LOCK TABLES `tb_products` WRITE;
/*!40000 ALTER TABLE `tb_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_products` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_products_after_insert` AFTER INSERT ON `tb_products` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_products', 'Create', USER(), CONCAT('Nuevo registro insertado en tb_products. Clave Primaria -> ID: ', NEW.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_products_after_update` AFTER UPDATE ON `tb_products` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_products', 'Update', USER(), CONCAT('Registro actualizado en tb_products. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_products_after_delete` AFTER DELETE ON `tb_products` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_products', 'Delete', USER(), CONCAT('Registro eliminado de tb_products. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_refunds`
--

DROP TABLE IF EXISTS `tb_refunds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_refunds` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `payment_ID` int unsigned NOT NULL,
  `cancellation_ID` int unsigned DEFAULT NULL,
  `return_ID` int unsigned DEFAULT NULL,
  `reason` enum('Cancellation','Return','Adjustment','Goodwill') NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` char(3) NOT NULL DEFAULT 'MXN',
  `refund_status` enum('Pending','Submitted','Succeeded','Failed','Canceled') NOT NULL DEFAULT 'Pending',
  `provider` varchar(60) DEFAULT NULL,
  `provider_reference` varchar(150) DEFAULT NULL,
  `requested_by_user_ID` int unsigned DEFAULT NULL,
  `reason_detail` varchar(1000) DEFAULT NULL,
  `requested_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `processed_at` datetime DEFAULT NULL,
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uk_refunds_id_payment` (`ID`,`payment_ID`),
  UNIQUE KEY `uk_refunds_provider_reference` (`provider`,`provider_reference`),
  KEY `idx_refunds_payment` (`payment_ID`),
  KEY `idx_refunds_cancellation` (`cancellation_ID`),
  KEY `idx_refunds_return` (`return_ID`),
  KEY `idx_refunds_requester` (`requested_by_user_ID`),
  CONSTRAINT `fk_refunds_cancellation` FOREIGN KEY (`cancellation_ID`) REFERENCES `tb_order_cancellations` (`ID`),
  CONSTRAINT `fk_refunds_payment` FOREIGN KEY (`payment_ID`) REFERENCES `tb_payments` (`ID`),
  CONSTRAINT `fk_refunds_requester` FOREIGN KEY (`requested_by_user_ID`) REFERENCES `tb_users` (`ID`),
  CONSTRAINT `fk_refunds_return` FOREIGN KEY (`return_ID`) REFERENCES `tb_returns` (`ID`),
  CONSTRAINT `chk_refunds_amount` CHECK ((`amount` > 0)),
  CONSTRAINT `chk_refunds_source` CHECK ((((`reason` = _utf8mb4'Cancellation') and (`cancellation_ID` is not null) and (`return_ID` is null)) or ((`reason` = _utf8mb4'Return') and (`return_ID` is not null) and (`cancellation_ID` is null)) or ((`reason` in (_utf8mb4'Adjustment',_utf8mb4'Goodwill')) and (`cancellation_ID` is null) and (`return_ID` is null))))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_refunds`
--

LOCK TABLES `tb_refunds` WRITE;
/*!40000 ALTER TABLE `tb_refunds` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_refunds` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_refunds_after_insert` AFTER INSERT ON `tb_refunds` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_refunds', 'Create', USER(), CONCAT('Nuevo registro insertado en tb_refunds. Clave Primaria -> ID: ', NEW.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_refunds_after_update` AFTER UPDATE ON `tb_refunds` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_refunds', 'Update', USER(), CONCAT('Registro actualizado en tb_refunds. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_refunds_after_delete` AFTER DELETE ON `tb_refunds` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_refunds', 'Delete', USER(), CONCAT('Registro eliminado de tb_refunds. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_returns`
--

DROP TABLE IF EXISTS `tb_returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_returns` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `buyer_order_ID` int unsigned NOT NULL,
  `requested_by_user_ID` int unsigned DEFAULT NULL,
  `reason_code` varchar(60) DEFAULT NULL,
  `reason_detail` varchar(1000) DEFAULT NULL,
  `return_status` enum('Requested','Authorized','Rejected','LabelCreated','InTransit','Received','Inspected','Approved','PartiallyApproved','Refunded','Closed') NOT NULL DEFAULT 'Requested',
  `return_carrier` varchar(100) DEFAULT NULL,
  `return_tracking_number` varchar(150) DEFAULT NULL,
  `requested_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `authorized_at` datetime DEFAULT NULL,
  `received_at` datetime DEFAULT NULL,
  `closed_at` datetime DEFAULT NULL,
  `internal_notes` varchar(1000) DEFAULT NULL,
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `idx_returns_buyer_order` (`buyer_order_ID`),
  KEY `idx_returns_requester` (`requested_by_user_ID`),
  KEY `idx_returns_tracking` (`return_carrier`,`return_tracking_number`),
  CONSTRAINT `fk_returns_buyer_order` FOREIGN KEY (`buyer_order_ID`) REFERENCES `tbd_buyer_orders` (`ID`),
  CONSTRAINT `fk_returns_requester` FOREIGN KEY (`requested_by_user_ID`) REFERENCES `tb_users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_returns`
--

LOCK TABLES `tb_returns` WRITE;
/*!40000 ALTER TABLE `tb_returns` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_returns` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_returns_after_insert` AFTER INSERT ON `tb_returns` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_returns', 'Create', USER(), CONCAT('Nuevo registro insertado en tb_returns. Clave Primaria -> ID: ', NEW.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_returns_after_update` AFTER UPDATE ON `tb_returns` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_returns', 'Update', USER(), CONCAT('Registro actualizado en tb_returns. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_returns_after_delete` AFTER DELETE ON `tb_returns` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_returns', 'Delete', USER(), CONCAT('Registro eliminado de tb_returns. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_shipments`
--

DROP TABLE IF EXISTS `tb_shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_shipments` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `buyer_order_ID` int unsigned NOT NULL,
  `address_ID` bigint unsigned DEFAULT NULL,
  `recipient_name` varchar(150) DEFAULT NULL,
  `recipient_phone` varchar(25) DEFAULT NULL,
  `address_line_1` varchar(255) DEFAULT NULL,
  `address_line_2` varchar(255) DEFAULT NULL,
  `city` varchar(120) DEFAULT NULL,
  `state_region` varchar(120) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `country_code` char(2) DEFAULT NULL,
  `carrier` varchar(100) DEFAULT NULL,
  `service_level` varchar(100) DEFAULT NULL,
  `tracking_number` varchar(150) DEFAULT NULL,
  `tracking_url` varchar(500) DEFAULT NULL,
  `shipment_status` enum('Pending','LabelCreated','ReadyToShip','InTransit','OutForDelivery','Delivered','DeliveryFailed','Lost','Returned') NOT NULL DEFAULT 'Pending',
  `shipping_cost` decimal(12,2) NOT NULL DEFAULT '0.00',
  `shipped_at` datetime DEFAULT NULL,
  `estimated_delivery_at` datetime DEFAULT NULL,
  `delivered_at` datetime DEFAULT NULL,
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `idx_shipments_buyer_order` (`buyer_order_ID`),
  KEY `idx_shipments_address` (`address_ID`),
  KEY `idx_shipments_tracking` (`carrier`,`tracking_number`),
  CONSTRAINT `fk_shipments_address` FOREIGN KEY (`address_ID`) REFERENCES `tb_user_addresses` (`ID`),
  CONSTRAINT `fk_shipments_buyer_order` FOREIGN KEY (`buyer_order_ID`) REFERENCES `tbd_buyer_orders` (`ID`),
  CONSTRAINT `chk_shipments_shipping_cost` CHECK ((`shipping_cost` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_shipments`
--

LOCK TABLES `tb_shipments` WRITE;
/*!40000 ALTER TABLE `tb_shipments` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_shipments` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_shipments_after_insert` AFTER INSERT ON `tb_shipments` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_shipments', 'Create', USER(), CONCAT('Nuevo registro insertado en tb_shipments. Clave Primaria -> ID: ', NEW.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_shipments_after_update` AFTER UPDATE ON `tb_shipments` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_shipments', 'Update', USER(), CONCAT('Registro actualizado en tb_shipments. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_shipments_after_delete` AFTER DELETE ON `tb_shipments` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_shipments', 'Delete', USER(), CONCAT('Registro eliminado de tb_shipments. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_user_addresses`
--

DROP TABLE IF EXISTS `tb_user_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user_addresses` (
  `ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_ID` int unsigned NOT NULL,
  `address_label` varchar(100) NOT NULL,
  `recipient_name` varchar(150) DEFAULT NULL,
  `recipient_phone` varchar(25) DEFAULT NULL,
  `delivery_instructions` varchar(500) DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `status` bit(1) NOT NULL DEFAULT b'1',
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `idx_user_addresses` (`user_ID`),
  CONSTRAINT `fk_addresses_users` FOREIGN KEY (`user_ID`) REFERENCES `tb_users` (`ID`),
  CONSTRAINT `chk_coordinates` CHECK ((((`latitude` is null) and (`longitude` is null)) or ((`latitude` is not null) and (`longitude` is not null)))),
  CONSTRAINT `chk_latitude` CHECK ((`latitude` between -(90) and 90)),
  CONSTRAINT `chk_longitude` CHECK ((`longitude` between -(180) and 180))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_addresses`
--

LOCK TABLES `tb_user_addresses` WRITE;
/*!40000 ALTER TABLE `tb_user_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_user_addresses` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_user_addresses_after_insert` AFTER INSERT ON `tb_user_addresses` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_user_addresses', 'Create', USER(), CONCAT('Nuevo registro insertado en tb_user_addresses. Clave Primaria -> ID: ', NEW.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_user_addresses_after_update` AFTER UPDATE ON `tb_user_addresses` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_user_addresses', 'Update', USER(), CONCAT('Registro actualizado en tb_user_addresses. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_user_addresses_after_delete` AFTER DELETE ON `tb_user_addresses` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_user_addresses', 'Delete', USER(), CONCAT('Registro eliminado de tb_user_addresses. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_users`
--

DROP TABLE IF EXISTS `tb_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_users` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(80) NOT NULL,
  `nickname` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_login` datetime DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `nickname` (`nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=16405 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_users`
--

LOCK TABLES `tb_users` WRITE;
/*!40000 ALTER TABLE `tb_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_users_after_insert` AFTER INSERT ON `tb_users` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_users', 'Create', USER(), CONCAT('Nuevo registro insertado en tb_users. Clave Primaria -> ID: ', NEW.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_users_after_update` AFTER UPDATE ON `tb_users` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_users', 'Update', USER(), CONCAT('Registro actualizado en tb_users. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tb_users_after_delete` AFTER DELETE ON `tb_users` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tb_users', 'Delete', USER(), CONCAT('Registro eliminado de tb_users. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbc_categories`
--

DROP TABLE IF EXISTS `tbc_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_categories` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `description` text,
  `sup_id_category` int unsigned DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `name` (`name`),
  KEY `fk_superior_category` (`sup_id_category`),
  CONSTRAINT `fk_superior_category` FOREIGN KEY (`sup_id_category`) REFERENCES `tbc_categories` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_categories`
--

LOCK TABLES `tbc_categories` WRITE;
/*!40000 ALTER TABLE `tbc_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbc_categories_after_insert` AFTER INSERT ON `tbc_categories` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbc_categories', 'Create', USER(), CONCAT('Nuevo registro insertado en tbc_categories. Clave Primaria -> ID: ', NEW.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbc_categories_after_update` AFTER UPDATE ON `tbc_categories` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbc_categories', 'Update', USER(), CONCAT('Registro actualizado en tbc_categories. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbc_categories_after_delete` AFTER DELETE ON `tbc_categories` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbc_categories', 'Delete', USER(), CONCAT('Registro eliminado de tbc_categories. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbc_payment_methods_types`
--

DROP TABLE IF EXISTS `tbc_payment_methods_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_payment_methods_types` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL,
  `description` text NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_payment_methods_types`
--

LOCK TABLES `tbc_payment_methods_types` WRITE;
/*!40000 ALTER TABLE `tbc_payment_methods_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_payment_methods_types` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbc_payment_methods_types_after_insert` AFTER INSERT ON `tbc_payment_methods_types` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbc_payment_methods_types', 'Create', USER(), CONCAT('Nuevo registro insertado en tbc_payment_methods_types. Clave Primaria -> ID: ', NEW.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbc_payment_methods_types_after_update` AFTER UPDATE ON `tbc_payment_methods_types` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbc_payment_methods_types', 'Update', USER(), CONCAT('Registro actualizado en tbc_payment_methods_types. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbc_payment_methods_types_after_delete` AFTER DELETE ON `tbc_payment_methods_types` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbc_payment_methods_types', 'Delete', USER(), CONCAT('Registro eliminado de tbc_payment_methods_types. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbd_address_components`
--

DROP TABLE IF EXISTS `tbd_address_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_address_components` (
  `ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `address_ID` bigint unsigned NOT NULL,
  `value` varchar(255) NOT NULL,
  `component_type` varchar(50) NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `address_sup_ID` bigint unsigned DEFAULT NULL,
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uk_address_component` (`address_ID`,`ID`),
  KEY `idx_address_parent` (`address_ID`,`address_sup_ID`),
  CONSTRAINT `fk_component_address` FOREIGN KEY (`address_ID`) REFERENCES `tb_user_addresses` (`ID`) ON DELETE RESTRICT,
  CONSTRAINT `fk_component_parent` FOREIGN KEY (`address_ID`, `address_sup_ID`) REFERENCES `tbd_address_components` (`address_ID`, `ID`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_address_components`
--

LOCK TABLES `tbd_address_components` WRITE;
/*!40000 ALTER TABLE `tbd_address_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_address_components` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbd_address_components_after_insert` AFTER INSERT ON `tbd_address_components` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbd_address_components', 'Create', USER(), CONCAT('Nuevo registro insertado en tbd_address_components. Clave Primaria -> ID: ', NEW.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbd_address_components_after_update` AFTER UPDATE ON `tbd_address_components` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbd_address_components', 'Update', USER(), CONCAT('Registro actualizado en tbd_address_components. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbd_address_components_after_delete` AFTER DELETE ON `tbd_address_components` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbd_address_components', 'Delete', USER(), CONCAT('Registro eliminado de tbd_address_components. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbd_buyer_orders`
--

DROP TABLE IF EXISTS `tbd_buyer_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_buyer_orders` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `seller_ID` int unsigned NOT NULL,
  `subtotal` decimal(12,2) NOT NULL DEFAULT '0.00',
  `shipping_cost` decimal(12,2) NOT NULL DEFAULT '0.00',
  `fulfillment_status` enum('Pending','Accepted','Preparing','Sent','Delivered','Canceled','Returned') NOT NULL DEFAULT 'Pending',
  `status` bit(1) NOT NULL DEFAULT b'1',
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `seller_ID` (`seller_ID`),
  CONSTRAINT `tbd_buyer_orders_ibfk_1` FOREIGN KEY (`seller_ID`) REFERENCES `tb_users` (`ID`),
  CONSTRAINT `tbd_buyer_orders_chk_1` CHECK ((`subtotal` >= 0)),
  CONSTRAINT `tbd_buyer_orders_chk_2` CHECK ((`shipping_cost` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_buyer_orders`
--

LOCK TABLES `tbd_buyer_orders` WRITE;
/*!40000 ALTER TABLE `tbd_buyer_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_buyer_orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbd_buyer_orders_after_insert` AFTER INSERT ON `tbd_buyer_orders` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbd_buyer_orders', 'Create', USER(), CONCAT('Nuevo registro insertado en tbd_buyer_orders. Clave Primaria -> ID: ', NEW.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbd_buyer_orders_after_update` AFTER UPDATE ON `tbd_buyer_orders` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbd_buyer_orders', 'Update', USER(), CONCAT('Registro actualizado en tbd_buyer_orders. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbd_buyer_orders_after_delete` AFTER DELETE ON `tbd_buyer_orders` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbd_buyer_orders', 'Delete', USER(), CONCAT('Registro eliminado de tbd_buyer_orders. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbd_cancellation_items`
--

DROP TABLE IF EXISTS `tbd_cancellation_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_cancellation_items` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `cancellation_ID` int unsigned NOT NULL,
  `order_item_ID` int unsigned NOT NULL,
  `quantity` int unsigned NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uk_cancellation_order_item` (`cancellation_ID`,`order_item_ID`),
  KEY `idx_cancellation_items_order_item` (`order_item_ID`),
  CONSTRAINT `fk_cancellation_items_cancellation` FOREIGN KEY (`cancellation_ID`) REFERENCES `tb_order_cancellations` (`ID`),
  CONSTRAINT `fk_cancellation_items_order_item` FOREIGN KEY (`order_item_ID`) REFERENCES `tbd_order_items` (`ID`),
  CONSTRAINT `chk_cancellation_items_quantity` CHECK ((`quantity` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_cancellation_items`
--

LOCK TABLES `tbd_cancellation_items` WRITE;
/*!40000 ALTER TABLE `tbd_cancellation_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_cancellation_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbd_cancellation_items_after_insert` AFTER INSERT ON `tbd_cancellation_items` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbd_cancellation_items', 'Create', USER(), CONCAT('Nuevo registro insertado en tbd_cancellation_items. Clave Primaria -> ID: ', NEW.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbd_cancellation_items_after_update` AFTER UPDATE ON `tbd_cancellation_items` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbd_cancellation_items', 'Update', USER(), CONCAT('Registro actualizado en tbd_cancellation_items. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbd_cancellation_items_after_delete` AFTER DELETE ON `tbd_cancellation_items` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbd_cancellation_items', 'Delete', USER(), CONCAT('Registro eliminado de tbd_cancellation_items. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbd_cart_items`
--

DROP TABLE IF EXISTS `tbd_cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_cart_items` (
  `cart_ID` int unsigned NOT NULL,
  `provider_ID` int unsigned NOT NULL,
  `product_ID` int unsigned NOT NULL,
  `quantity` int unsigned NOT NULL DEFAULT '1',
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_ID`,`provider_ID`,`product_ID`),
  KEY `provider_ID` (`provider_ID`),
  KEY `product_ID` (`product_ID`),
  CONSTRAINT `tbd_cart_items_ibfk_1` FOREIGN KEY (`cart_ID`) REFERENCES `tb_carts` (`ID`),
  CONSTRAINT `tbd_cart_items_ibfk_2` FOREIGN KEY (`provider_ID`) REFERENCES `tbd_products_users_providers` (`user_id`),
  CONSTRAINT `tbd_cart_items_ibfk_3` FOREIGN KEY (`product_ID`) REFERENCES `tbd_products_users_providers` (`product_id`),
  CONSTRAINT `chk_cart_quantity` CHECK ((`quantity` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_cart_items`
--

LOCK TABLES `tbd_cart_items` WRITE;
/*!40000 ALTER TABLE `tbd_cart_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_cart_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbd_cart_items_after_insert` AFTER INSERT ON `tbd_cart_items` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbd_cart_items', 'Create', USER(), CONCAT('Nuevo registro insertado en tbd_cart_items. Clave Primaria -> ', CONCAT_WS(', ', 'cart_ID: ', NEW.`cart_ID`, 'provider_ID: ', NEW.`provider_ID`, 'product_ID: ', NEW.`product_ID`)));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbd_cart_items_after_update` AFTER UPDATE ON `tbd_cart_items` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbd_cart_items', 'Update', USER(), CONCAT('Registro actualizado en tbd_cart_items. Clave Primaria -> ', CONCAT_WS(', ', 'cart_ID: ', OLD.`cart_ID`, 'provider_ID: ', OLD.`provider_ID`, 'product_ID: ', OLD.`product_ID`)));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbd_cart_items_after_delete` AFTER DELETE ON `tbd_cart_items` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbd_cart_items', 'Delete', USER(), CONCAT('Registro eliminado de tbd_cart_items. Clave Primaria -> ', CONCAT_WS(', ', 'cart_ID: ', OLD.`cart_ID`, 'provider_ID: ', OLD.`provider_ID`, 'product_ID: ', OLD.`product_ID`)));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbd_order_items`
--

DROP TABLE IF EXISTS `tbd_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_order_items` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `buyer_order_ID` int unsigned NOT NULL,
  `product_ID` int unsigned NOT NULL,
  `provider_ID` int unsigned NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` int unsigned NOT NULL,
  `unit_price` decimal(12,2) NOT NULL,
  `subtotal` decimal(12,2) GENERATED ALWAYS AS ((`quantity` * `unit_price`)) STORED,
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `fk_order_items_product` (`product_ID`),
  KEY `fk_order_items_provider` (`provider_ID`),
  KEY `fk_order_items_buyer_order` (`buyer_order_ID`),
  CONSTRAINT `fk_order_items_buyer_order` FOREIGN KEY (`buyer_order_ID`) REFERENCES `tbd_buyer_orders` (`ID`),
  CONSTRAINT `fk_order_items_product` FOREIGN KEY (`product_ID`) REFERENCES `tbd_products_users_providers` (`product_id`),
  CONSTRAINT `fk_order_items_provider` FOREIGN KEY (`provider_ID`) REFERENCES `tbd_products_users_providers` (`user_id`),
  CONSTRAINT `chk_order_items_quantity` CHECK ((`quantity` > 0)),
  CONSTRAINT `chk_order_items_unit_price` CHECK ((`unit_price` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_order_items`
--

LOCK TABLES `tbd_order_items` WRITE;
/*!40000 ALTER TABLE `tbd_order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_order_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbd_order_items_after_insert` AFTER INSERT ON `tbd_order_items` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbd_order_items', 'Create', USER(), CONCAT('Nuevo registro insertado en tbd_order_items. Clave Primaria -> ID: ', NEW.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbd_order_items_after_update` AFTER UPDATE ON `tbd_order_items` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbd_order_items', 'Update', USER(), CONCAT('Registro actualizado en tbd_order_items. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbd_order_items_after_delete` AFTER DELETE ON `tbd_order_items` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbd_order_items', 'Delete', USER(), CONCAT('Registro eliminado de tbd_order_items. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbd_products_categories`
--

DROP TABLE IF EXISTS `tbd_products_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_products_categories` (
  `category_ID` int unsigned NOT NULL,
  `product_ID` int unsigned NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_ID`,`product_ID`),
  KEY `fk_product` (`product_ID`),
  CONSTRAINT `fk_category` FOREIGN KEY (`category_ID`) REFERENCES `tbc_categories` (`ID`),
  CONSTRAINT `fk_product` FOREIGN KEY (`product_ID`) REFERENCES `tb_products` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_products_categories`
--

LOCK TABLES `tbd_products_categories` WRITE;
/*!40000 ALTER TABLE `tbd_products_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_products_categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbd_products_categories_after_insert` AFTER INSERT ON `tbd_products_categories` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbd_products_categories', 'Create', USER(), CONCAT('Nuevo registro insertado en tbd_products_categories. Clave Primaria -> ', CONCAT_WS(', ', 'category_ID: ', NEW.`category_ID`, 'product_ID: ', NEW.`product_ID`)));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbd_products_categories_after_update` AFTER UPDATE ON `tbd_products_categories` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbd_products_categories', 'Update', USER(), CONCAT('Registro actualizado en tbd_products_categories. Clave Primaria -> ', CONCAT_WS(', ', 'category_ID: ', OLD.`category_ID`, 'product_ID: ', OLD.`product_ID`)));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbd_products_categories_after_delete` AFTER DELETE ON `tbd_products_categories` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbd_products_categories', 'Delete', USER(), CONCAT('Registro eliminado de tbd_products_categories. Clave Primaria -> ', CONCAT_WS(', ', 'category_ID: ', OLD.`category_ID`, 'product_ID: ', OLD.`product_ID`)));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbd_products_users_providers`
--

DROP TABLE IF EXISTS `tbd_products_users_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_products_users_providers` (
  `user_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `type_ownership` enum('Owner','Reseller','Distributor') DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `avalaible_date` datetime NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`product_id`),
  UNIQUE KEY `uk_provider_user` (`user_id`),
  UNIQUE KEY `uk_provider_product` (`product_id`),
  KEY `fk_products2` (`product_id`),
  CONSTRAINT `fk_products2` FOREIGN KEY (`product_id`) REFERENCES `tb_products` (`ID`),
  CONSTRAINT `fk_user1` FOREIGN KEY (`user_id`) REFERENCES `tb_users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_products_users_providers`
--

LOCK TABLES `tbd_products_users_providers` WRITE;
/*!40000 ALTER TABLE `tbd_products_users_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_products_users_providers` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbd_products_users_providers_after_insert` AFTER INSERT ON `tbd_products_users_providers` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbd_products_users_providers', 'Create', USER(), CONCAT('Nuevo registro insertado en tbd_products_users_providers. Clave Primaria -> ', CONCAT_WS(', ', 'user_id: ', NEW.`user_id`, 'product_id: ', NEW.`product_id`)));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbd_products_users_providers_after_update` AFTER UPDATE ON `tbd_products_users_providers` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbd_products_users_providers', 'Update', USER(), CONCAT('Registro actualizado en tbd_products_users_providers. Clave Primaria -> ', CONCAT_WS(', ', 'user_id: ', OLD.`user_id`, 'product_id: ', OLD.`product_id`)));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbd_products_users_providers_after_delete` AFTER DELETE ON `tbd_products_users_providers` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbd_products_users_providers', 'Delete', USER(), CONCAT('Registro eliminado de tbd_products_users_providers. Clave Primaria -> ', CONCAT_WS(', ', 'user_id: ', OLD.`user_id`, 'product_id: ', OLD.`product_id`)));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbd_return_items`
--

DROP TABLE IF EXISTS `tbd_return_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_return_items` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `return_ID` int unsigned NOT NULL,
  `order_item_ID` int unsigned NOT NULL,
  `quantity` int unsigned NOT NULL,
  `item_condition` enum('Unopened','Unused','Used','Damaged','Defective','Other') DEFAULT NULL,
  `disposition` enum('Pending','Restock','Repair','Dispose','SupplierReturn') NOT NULL DEFAULT 'Pending',
  `approved_refund_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `item_status` enum('Requested','Approved','Rejected','Received','Refunded') NOT NULL DEFAULT 'Requested',
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uk_return_order_item` (`return_ID`,`order_item_ID`),
  KEY `idx_return_items_order_item` (`order_item_ID`),
  CONSTRAINT `fk_return_items_order_item` FOREIGN KEY (`order_item_ID`) REFERENCES `tbd_order_items` (`ID`),
  CONSTRAINT `fk_return_items_return` FOREIGN KEY (`return_ID`) REFERENCES `tb_returns` (`ID`),
  CONSTRAINT `chk_return_items_quantity` CHECK ((`quantity` > 0)),
  CONSTRAINT `chk_return_items_refund_amount` CHECK ((`approved_refund_amount` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_return_items`
--

LOCK TABLES `tbd_return_items` WRITE;
/*!40000 ALTER TABLE `tbd_return_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_return_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbd_return_items_after_insert` AFTER INSERT ON `tbd_return_items` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbd_return_items', 'Create', USER(), CONCAT('Nuevo registro insertado en tbd_return_items. Clave Primaria -> ID: ', NEW.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbd_return_items_after_update` AFTER UPDATE ON `tbd_return_items` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbd_return_items', 'Update', USER(), CONCAT('Registro actualizado en tbd_return_items. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbd_return_items_after_delete` AFTER DELETE ON `tbd_return_items` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbd_return_items', 'Delete', USER(), CONCAT('Registro eliminado de tbd_return_items. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbd_user_payment_methods`
--

DROP TABLE IF EXISTS `tbd_user_payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_user_payment_methods` (
  `ID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_ID` int unsigned NOT NULL,
  `payment_method_type_ID` int unsigned NOT NULL,
  `provider` varchar(60) NOT NULL,
  `provider_method_ref` varchar(255) NOT NULL,
  `label` varchar(100) DEFAULT NULL,
  `last_four` char(4) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `status` bit(1) NOT NULL DEFAULT b'1',
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `uk_provider_method` (`provider`,`provider_method_ref`),
  KEY `user_ID` (`user_ID`),
  KEY `payment_method_type_ID` (`payment_method_type_ID`),
  CONSTRAINT `tbd_user_payment_methods_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `tb_users` (`ID`),
  CONSTRAINT `tbd_user_payment_methods_ibfk_2` FOREIGN KEY (`payment_method_type_ID`) REFERENCES `tbc_payment_methods_types` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_user_payment_methods`
--

LOCK TABLES `tbd_user_payment_methods` WRITE;
/*!40000 ALTER TABLE `tbd_user_payment_methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_user_payment_methods` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbd_user_payment_methods_after_insert` AFTER INSERT ON `tbd_user_payment_methods` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbd_user_payment_methods', 'Create', USER(), CONCAT('Nuevo registro insertado en tbd_user_payment_methods. Clave Primaria -> ID: ', NEW.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbd_user_payment_methods_after_update` AFTER UPDATE ON `tbd_user_payment_methods` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbd_user_payment_methods', 'Update', USER(), CONCAT('Registro actualizado en tbd_user_payment_methods. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbd_user_payment_methods_after_delete` AFTER DELETE ON `tbd_user_payment_methods` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbd_user_payment_methods', 'Delete', USER(), CONCAT('Registro eliminado de tbd_user_payment_methods. Clave Primaria -> ID: ', OLD.`ID`));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbd_users_wishlist_products`
--

DROP TABLE IF EXISTS `tbd_users_wishlist_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_users_wishlist_products` (
  `user_ID` int unsigned NOT NULL,
  `product_ID` int unsigned NOT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_ID`,`product_ID`),
  KEY `fk_wishlist_product` (`product_ID`),
  CONSTRAINT `fk_wishlist_product` FOREIGN KEY (`product_ID`) REFERENCES `tb_products` (`ID`),
  CONSTRAINT `fk_wishlist_user` FOREIGN KEY (`user_ID`) REFERENCES `tb_users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_users_wishlist_products`
--

LOCK TABLES `tbd_users_wishlist_products` WRITE;
/*!40000 ALTER TABLE `tbd_users_wishlist_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_users_wishlist_products` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbd_users_wishlist_products_after_insert` AFTER INSERT ON `tbd_users_wishlist_products` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbd_users_wishlist_products', 'Create', USER(), CONCAT('Nuevo registro insertado en tbd_users_wishlist_products. Clave Primaria -> ', CONCAT_WS(', ', 'user_ID: ', NEW.`user_ID`, 'product_ID: ', NEW.`product_ID`)));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbd_users_wishlist_products_after_update` AFTER UPDATE ON `tbd_users_wishlist_products` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbd_users_wishlist_products', 'Update', USER(), CONCAT('Registro actualizado en tbd_users_wishlist_products. Clave Primaria -> ', CONCAT_WS(', ', 'user_ID: ', OLD.`user_ID`, 'product_ID: ', OLD.`product_ID`)));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_tbd_users_wishlist_products_after_delete` AFTER DELETE ON `tbd_users_wishlist_products` FOR EACH ROW BEGIN
    INSERT INTO `tb_logs` (`table_name`, `operation`, `db_users`, `description`)
    VALUES ('tbd_users_wishlist_products', 'Delete', USER(), CONCAT('Registro eliminado de tbd_users_wishlist_products. Clave Primaria -> ', CONCAT_WS(', ', 'user_ID: ', OLD.`user_ID`, 'product_ID: ', OLD.`product_ID`)));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `vw_productos_por_categoria`
--

DROP TABLE IF EXISTS `vw_productos_por_categoria`;
/*!50001 DROP VIEW IF EXISTS `vw_productos_por_categoria`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_productos_por_categoria` AS SELECT 
 1 AS `producto_id`,
 1 AS `producto_sku`,
 1 AS `producto_nombre`,
 1 AS `producto_descripcion`,
 1 AS `precio_actual`,
 1 AS `stock_actual`,
 1 AS `categoria_principal`,
 1 AS `subcategoria`,
 1 AS `categoria_id`,
 1 AS `estado_producto_bit`,
 1 AS `estado_disponibilidad`,
 1 AS `fecha_disponibilidad_proveedor`,
 1 AS `tipo_proveedor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_trazabilidad_tb_carts`
--

DROP TABLE IF EXISTS `vw_trazabilidad_tb_carts`;
/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tb_carts`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_trazabilidad_tb_carts` AS SELECT 
 1 AS `ID`,
 1 AS `user_ID`,
 1 AS `status`,
 1 AS `creation_date`,
 1 AS `last_update`,
 1 AS `log_id`,
 1 AS `log_operacion`,
 1 AS `log_usuario_remoto`,
 1 AS `log_fecha_operacion`,
 1 AS `log_descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_trazabilidad_tb_order_cancellations`
--

DROP TABLE IF EXISTS `vw_trazabilidad_tb_order_cancellations`;
/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tb_order_cancellations`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_trazabilidad_tb_order_cancellations` AS SELECT 
 1 AS `ID`,
 1 AS `order_ID`,
 1 AS `buyer_order_ID`,
 1 AS `requested_by_user_ID`,
 1 AS `cancellation_scope`,
 1 AS `reason_code`,
 1 AS `reason_detail`,
 1 AS `cancellation_status`,
 1 AS `requested_at`,
 1 AS `reviewed_at`,
 1 AS `completed_at`,
 1 AS `internal_notes`,
 1 AS `creation_date`,
 1 AS `last_update`,
 1 AS `log_id`,
 1 AS `log_operacion`,
 1 AS `log_usuario_remoto`,
 1 AS `log_fecha_operacion`,
 1 AS `log_descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_trazabilidad_tb_orders`
--

DROP TABLE IF EXISTS `vw_trazabilidad_tb_orders`;
/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tb_orders`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_trazabilidad_tb_orders` AS SELECT 
 1 AS `ID`,
 1 AS `key`,
 1 AS `User_ID`,
 1 AS `total_products`,
 1 AS `total_cost`,
 1 AS `status_string`,
 1 AS `status`,
 1 AS `creation_date`,
 1 AS `last_update`,
 1 AS `log_id`,
 1 AS `log_operacion`,
 1 AS `log_usuario_remoto`,
 1 AS `log_fecha_operacion`,
 1 AS `log_descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_trazabilidad_tb_payment_methods`
--

DROP TABLE IF EXISTS `vw_trazabilidad_tb_payment_methods`;
/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tb_payment_methods`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_trazabilidad_tb_payment_methods` AS SELECT 
 1 AS `ID`,
 1 AS `name`,
 1 AS `description`,
 1 AS `status`,
 1 AS `creation_date`,
 1 AS `last_update`,
 1 AS `log_id`,
 1 AS `log_operacion`,
 1 AS `log_usuario_remoto`,
 1 AS `log_fecha_operacion`,
 1 AS `log_descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_trazabilidad_tb_payment_transaction`
--

DROP TABLE IF EXISTS `vw_trazabilidad_tb_payment_transaction`;
/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tb_payment_transaction`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_trazabilidad_tb_payment_transaction` AS SELECT 
 1 AS `ID`,
 1 AS `payment_ID`,
 1 AS `refund_ID`,
 1 AS `transaction_type`,
 1 AS `transaction_status`,
 1 AS `amount`,
 1 AS `currency`,
 1 AS `provider`,
 1 AS `provider_transaction_id`,
 1 AS `idempotency_key`,
 1 AS `response_code`,
 1 AS `response_message`,
 1 AS `request_date`,
 1 AS `response_date`,
 1 AS `creation_date`,
 1 AS `last_update`,
 1 AS `log_id`,
 1 AS `log_operacion`,
 1 AS `log_usuario_remoto`,
 1 AS `log_fecha_operacion`,
 1 AS `log_descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_trazabilidad_tb_payments`
--

DROP TABLE IF EXISTS `vw_trazabilidad_tb_payments`;
/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tb_payments`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_trazabilidad_tb_payments` AS SELECT 
 1 AS `ID`,
 1 AS `order_ID`,
 1 AS `payment_method_ID`,
 1 AS `amount`,
 1 AS `currency`,
 1 AS `payment_status`,
 1 AS `provider`,
 1 AS `provider_reference`,
 1 AS `creation_date`,
 1 AS `paid_date`,
 1 AS `last_update`,
 1 AS `log_id`,
 1 AS `log_operacion`,
 1 AS `log_usuario_remoto`,
 1 AS `log_fecha_operacion`,
 1 AS `log_descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_trazabilidad_tb_people`
--

DROP TABLE IF EXISTS `vw_trazabilidad_tb_people`;
/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tb_people`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_trazabilidad_tb_people` AS SELECT 
 1 AS `person_ID`,
 1 AS `user_ID`,
 1 AS `title`,
 1 AS `given_names`,
 1 AS `family_names`,
 1 AS `birth_date`,
 1 AS `gender_ID`,
 1 AS `phone`,
 1 AS `country_code`,
 1 AS `status`,
 1 AS `creation_date`,
 1 AS `last_update`,
 1 AS `log_id`,
 1 AS `log_operacion`,
 1 AS `log_usuario_remoto`,
 1 AS `log_fecha_operacion`,
 1 AS `log_descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_trazabilidad_tb_products`
--

DROP TABLE IF EXISTS `vw_trazabilidad_tb_products`;
/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tb_products`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_trazabilidad_tb_products` AS SELECT 
 1 AS `ID`,
 1 AS `SKU`,
 1 AS `name`,
 1 AS `description`,
 1 AS `current_price`,
 1 AS `current_stock`,
 1 AS `status`,
 1 AS `creation_date`,
 1 AS `last_update`,
 1 AS `log_id`,
 1 AS `log_operacion`,
 1 AS `log_usuario_remoto`,
 1 AS `log_fecha_operacion`,
 1 AS `log_descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_trazabilidad_tb_refunds`
--

DROP TABLE IF EXISTS `vw_trazabilidad_tb_refunds`;
/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tb_refunds`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_trazabilidad_tb_refunds` AS SELECT 
 1 AS `ID`,
 1 AS `payment_ID`,
 1 AS `cancellation_ID`,
 1 AS `return_ID`,
 1 AS `reason`,
 1 AS `amount`,
 1 AS `currency`,
 1 AS `refund_status`,
 1 AS `provider`,
 1 AS `provider_reference`,
 1 AS `requested_by_user_ID`,
 1 AS `reason_detail`,
 1 AS `requested_at`,
 1 AS `processed_at`,
 1 AS `creation_date`,
 1 AS `last_update`,
 1 AS `log_id`,
 1 AS `log_operacion`,
 1 AS `log_usuario_remoto`,
 1 AS `log_fecha_operacion`,
 1 AS `log_descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_trazabilidad_tb_returns`
--

DROP TABLE IF EXISTS `vw_trazabilidad_tb_returns`;
/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tb_returns`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_trazabilidad_tb_returns` AS SELECT 
 1 AS `ID`,
 1 AS `buyer_order_ID`,
 1 AS `requested_by_user_ID`,
 1 AS `reason_code`,
 1 AS `reason_detail`,
 1 AS `return_status`,
 1 AS `return_carrier`,
 1 AS `return_tracking_number`,
 1 AS `requested_at`,
 1 AS `authorized_at`,
 1 AS `received_at`,
 1 AS `closed_at`,
 1 AS `internal_notes`,
 1 AS `creation_date`,
 1 AS `last_update`,
 1 AS `log_id`,
 1 AS `log_operacion`,
 1 AS `log_usuario_remoto`,
 1 AS `log_fecha_operacion`,
 1 AS `log_descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_trazabilidad_tb_shipments`
--

DROP TABLE IF EXISTS `vw_trazabilidad_tb_shipments`;
/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tb_shipments`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_trazabilidad_tb_shipments` AS SELECT 
 1 AS `ID`,
 1 AS `buyer_order_ID`,
 1 AS `address_ID`,
 1 AS `recipient_name`,
 1 AS `recipient_phone`,
 1 AS `address_line_1`,
 1 AS `address_line_2`,
 1 AS `city`,
 1 AS `state_region`,
 1 AS `postal_code`,
 1 AS `country_code`,
 1 AS `carrier`,
 1 AS `service_level`,
 1 AS `tracking_number`,
 1 AS `tracking_url`,
 1 AS `shipment_status`,
 1 AS `shipping_cost`,
 1 AS `shipped_at`,
 1 AS `estimated_delivery_at`,
 1 AS `delivered_at`,
 1 AS `creation_date`,
 1 AS `last_update`,
 1 AS `log_id`,
 1 AS `log_operacion`,
 1 AS `log_usuario_remoto`,
 1 AS `log_fecha_operacion`,
 1 AS `log_descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_trazabilidad_tb_user_addresses`
--

DROP TABLE IF EXISTS `vw_trazabilidad_tb_user_addresses`;
/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tb_user_addresses`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_trazabilidad_tb_user_addresses` AS SELECT 
 1 AS `ID`,
 1 AS `user_ID`,
 1 AS `address_label`,
 1 AS `recipient_name`,
 1 AS `recipient_phone`,
 1 AS `delivery_instructions`,
 1 AS `latitude`,
 1 AS `longitude`,
 1 AS `is_default`,
 1 AS `status`,
 1 AS `creation_date`,
 1 AS `last_update`,
 1 AS `log_id`,
 1 AS `log_operacion`,
 1 AS `log_usuario_remoto`,
 1 AS `log_fecha_operacion`,
 1 AS `log_descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_trazabilidad_tb_users`
--

DROP TABLE IF EXISTS `vw_trazabilidad_tb_users`;
/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tb_users`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_trazabilidad_tb_users` AS SELECT 
 1 AS `ID`,
 1 AS `email`,
 1 AS `nickname`,
 1 AS `password`,
 1 AS `creation_date`,
 1 AS `last_update`,
 1 AS `last_login`,
 1 AS `status`,
 1 AS `log_id`,
 1 AS `log_operacion`,
 1 AS `log_usuario_remoto`,
 1 AS `log_fecha_operacion`,
 1 AS `log_descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_trazabilidad_tbc_categories`
--

DROP TABLE IF EXISTS `vw_trazabilidad_tbc_categories`;
/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tbc_categories`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_trazabilidad_tbc_categories` AS SELECT 
 1 AS `ID`,
 1 AS `name`,
 1 AS `description`,
 1 AS `sup_id_category`,
 1 AS `status`,
 1 AS `creation_date`,
 1 AS `last_update`,
 1 AS `log_id`,
 1 AS `log_operacion`,
 1 AS `log_usuario_remoto`,
 1 AS `log_fecha_operacion`,
 1 AS `log_descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_trazabilidad_tbc_payment_methods_types`
--

DROP TABLE IF EXISTS `vw_trazabilidad_tbc_payment_methods_types`;
/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tbc_payment_methods_types`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_trazabilidad_tbc_payment_methods_types` AS SELECT 
 1 AS `ID`,
 1 AS `code`,
 1 AS `description`,
 1 AS `status`,
 1 AS `creation_date`,
 1 AS `last_update`,
 1 AS `log_id`,
 1 AS `log_operacion`,
 1 AS `log_usuario_remoto`,
 1 AS `log_fecha_operacion`,
 1 AS `log_descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_trazabilidad_tbd_address_components`
--

DROP TABLE IF EXISTS `vw_trazabilidad_tbd_address_components`;
/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tbd_address_components`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_trazabilidad_tbd_address_components` AS SELECT 
 1 AS `ID`,
 1 AS `address_ID`,
 1 AS `value`,
 1 AS `component_type`,
 1 AS `status`,
 1 AS `address_sup_ID`,
 1 AS `creation_date`,
 1 AS `last_update`,
 1 AS `log_id`,
 1 AS `log_operacion`,
 1 AS `log_usuario_remoto`,
 1 AS `log_fecha_operacion`,
 1 AS `log_descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_trazabilidad_tbd_buyer_orders`
--

DROP TABLE IF EXISTS `vw_trazabilidad_tbd_buyer_orders`;
/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tbd_buyer_orders`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_trazabilidad_tbd_buyer_orders` AS SELECT 
 1 AS `ID`,
 1 AS `seller_ID`,
 1 AS `subtotal`,
 1 AS `shipping_cost`,
 1 AS `fulfillment_status`,
 1 AS `status`,
 1 AS `creation_date`,
 1 AS `last_update`,
 1 AS `log_id`,
 1 AS `log_operacion`,
 1 AS `log_usuario_remoto`,
 1 AS `log_fecha_operacion`,
 1 AS `log_descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_trazabilidad_tbd_cancellation_items`
--

DROP TABLE IF EXISTS `vw_trazabilidad_tbd_cancellation_items`;
/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tbd_cancellation_items`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_trazabilidad_tbd_cancellation_items` AS SELECT 
 1 AS `ID`,
 1 AS `cancellation_ID`,
 1 AS `order_item_ID`,
 1 AS `quantity`,
 1 AS `creation_date`,
 1 AS `log_id`,
 1 AS `log_operacion`,
 1 AS `log_usuario_remoto`,
 1 AS `log_fecha_operacion`,
 1 AS `log_descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_trazabilidad_tbd_cart_items`
--

DROP TABLE IF EXISTS `vw_trazabilidad_tbd_cart_items`;
/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tbd_cart_items`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_trazabilidad_tbd_cart_items` AS SELECT 
 1 AS `cart_ID`,
 1 AS `provider_ID`,
 1 AS `product_ID`,
 1 AS `quantity`,
 1 AS `creation_date`,
 1 AS `log_id`,
 1 AS `log_operacion`,
 1 AS `log_usuario_remoto`,
 1 AS `log_fecha_operacion`,
 1 AS `log_descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_trazabilidad_tbd_order_items`
--

DROP TABLE IF EXISTS `vw_trazabilidad_tbd_order_items`;
/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tbd_order_items`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_trazabilidad_tbd_order_items` AS SELECT 
 1 AS `ID`,
 1 AS `buyer_order_ID`,
 1 AS `product_ID`,
 1 AS `provider_ID`,
 1 AS `product_name`,
 1 AS `quantity`,
 1 AS `unit_price`,
 1 AS `subtotal`,
 1 AS `creation_date`,
 1 AS `log_id`,
 1 AS `log_operacion`,
 1 AS `log_usuario_remoto`,
 1 AS `log_fecha_operacion`,
 1 AS `log_descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_trazabilidad_tbd_products_categories`
--

DROP TABLE IF EXISTS `vw_trazabilidad_tbd_products_categories`;
/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tbd_products_categories`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_trazabilidad_tbd_products_categories` AS SELECT 
 1 AS `category_ID`,
 1 AS `product_ID`,
 1 AS `status`,
 1 AS `creation_date`,
 1 AS `last_update`,
 1 AS `log_id`,
 1 AS `log_operacion`,
 1 AS `log_usuario_remoto`,
 1 AS `log_fecha_operacion`,
 1 AS `log_descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_trazabilidad_tbd_products_users_providers`
--

DROP TABLE IF EXISTS `vw_trazabilidad_tbd_products_users_providers`;
/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tbd_products_users_providers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_trazabilidad_tbd_products_users_providers` AS SELECT 
 1 AS `user_id`,
 1 AS `product_id`,
 1 AS `type_ownership`,
 1 AS `status`,
 1 AS `avalaible_date`,
 1 AS `creation_date`,
 1 AS `last_update`,
 1 AS `log_id`,
 1 AS `log_operacion`,
 1 AS `log_usuario_remoto`,
 1 AS `log_fecha_operacion`,
 1 AS `log_descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_trazabilidad_tbd_return_items`
--

DROP TABLE IF EXISTS `vw_trazabilidad_tbd_return_items`;
/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tbd_return_items`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_trazabilidad_tbd_return_items` AS SELECT 
 1 AS `ID`,
 1 AS `return_ID`,
 1 AS `order_item_ID`,
 1 AS `quantity`,
 1 AS `item_condition`,
 1 AS `disposition`,
 1 AS `approved_refund_amount`,
 1 AS `item_status`,
 1 AS `creation_date`,
 1 AS `last_update`,
 1 AS `log_id`,
 1 AS `log_operacion`,
 1 AS `log_usuario_remoto`,
 1 AS `log_fecha_operacion`,
 1 AS `log_descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_trazabilidad_tbd_user_payment_methods`
--

DROP TABLE IF EXISTS `vw_trazabilidad_tbd_user_payment_methods`;
/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tbd_user_payment_methods`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_trazabilidad_tbd_user_payment_methods` AS SELECT 
 1 AS `ID`,
 1 AS `user_ID`,
 1 AS `payment_method_type_ID`,
 1 AS `provider`,
 1 AS `provider_method_ref`,
 1 AS `label`,
 1 AS `last_four`,
 1 AS `is_default`,
 1 AS `status`,
 1 AS `creation_date`,
 1 AS `last_update`,
 1 AS `log_id`,
 1 AS `log_operacion`,
 1 AS `log_usuario_remoto`,
 1 AS `log_fecha_operacion`,
 1 AS `log_descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_trazabilidad_tbd_users_wishlist_products`
--

DROP TABLE IF EXISTS `vw_trazabilidad_tbd_users_wishlist_products`;
/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tbd_users_wishlist_products`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_trazabilidad_tbd_users_wishlist_products` AS SELECT 
 1 AS `user_ID`,
 1 AS `product_ID`,
 1 AS `status`,
 1 AS `creation_date`,
 1 AS `last_update`,
 1 AS `log_id`,
 1 AS `log_operacion`,
 1 AS `log_usuario_remoto`,
 1 AS `log_fecha_operacion`,
 1 AS `log_descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'db_test'
--

--
-- Dumping routines for database 'db_test'
--

--
-- Final view structure for view `vw_productos_por_categoria`
--

/*!50001 DROP VIEW IF EXISTS `vw_productos_por_categoria`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_productos_por_categoria` AS select `p`.`ID` AS `producto_id`,`p`.`SKU` AS `producto_sku`,`p`.`name` AS `producto_nombre`,`p`.`description` AS `producto_descripcion`,`p`.`current_price` AS `precio_actual`,`p`.`current_stock` AS `stock_actual`,coalesce(`cat_padre`.`name`,`c`.`name`) AS `categoria_principal`,(case when (`cat_padre`.`ID` is not null) then `c`.`name` else 'N/A (Categoría Raíz)' end) AS `subcategoria`,`c`.`ID` AS `categoria_id`,`p`.`status` AS `estado_producto_bit`,(case when ((`p`.`status` = 0x01) and (`p`.`current_stock` > 0)) then 'Disponible' when ((`p`.`status` = 0x01) and (`p`.`current_stock` = 0)) then 'Agotado' else 'Inactivo / No Disponible' end) AS `estado_disponibilidad`,`pup`.`avalaible_date` AS `fecha_disponibilidad_proveedor`,`pup`.`type_ownership` AS `tipo_proveedor` from ((((`tb_products` `p` left join `tbd_products_categories` `pc` on((`p`.`ID` = `pc`.`product_ID`))) left join `tbc_categories` `c` on((`pc`.`category_ID` = `c`.`ID`))) left join `tbc_categories` `cat_padre` on((`c`.`sup_id_category` = `cat_padre`.`ID`))) left join `tbd_products_users_providers` `pup` on((`p`.`ID` = `pup`.`product_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_trazabilidad_tb_carts`
--

/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tb_carts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_trazabilidad_tb_carts` AS select `t`.`ID` AS `ID`,`t`.`user_ID` AS `user_ID`,`t`.`status` AS `status`,`t`.`creation_date` AS `creation_date`,`t`.`last_update` AS `last_update`,`l`.`ID` AS `log_id`,`l`.`operation` AS `log_operacion`,`l`.`db_users` AS `log_usuario_remoto`,`l`.`operation_date` AS `log_fecha_operacion`,`l`.`description` AS `log_descripcion` from (`tb_carts` `t` left join `tb_logs` `l` on(((`l`.`table_name` = 'tb_carts') and (`l`.`description` like concat('%ID: ',`t`.`ID`,'%'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_trazabilidad_tb_order_cancellations`
--

/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tb_order_cancellations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_trazabilidad_tb_order_cancellations` AS select `t`.`ID` AS `ID`,`t`.`order_ID` AS `order_ID`,`t`.`buyer_order_ID` AS `buyer_order_ID`,`t`.`requested_by_user_ID` AS `requested_by_user_ID`,`t`.`cancellation_scope` AS `cancellation_scope`,`t`.`reason_code` AS `reason_code`,`t`.`reason_detail` AS `reason_detail`,`t`.`cancellation_status` AS `cancellation_status`,`t`.`requested_at` AS `requested_at`,`t`.`reviewed_at` AS `reviewed_at`,`t`.`completed_at` AS `completed_at`,`t`.`internal_notes` AS `internal_notes`,`t`.`creation_date` AS `creation_date`,`t`.`last_update` AS `last_update`,`l`.`ID` AS `log_id`,`l`.`operation` AS `log_operacion`,`l`.`db_users` AS `log_usuario_remoto`,`l`.`operation_date` AS `log_fecha_operacion`,`l`.`description` AS `log_descripcion` from (`tb_order_cancellations` `t` left join `tb_logs` `l` on(((`l`.`table_name` = 'tb_order_cancellations') and (`l`.`description` like concat('%ID: ',`t`.`ID`,'%'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_trazabilidad_tb_orders`
--

/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tb_orders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_trazabilidad_tb_orders` AS select `t`.`ID` AS `ID`,`t`.`key` AS `key`,`t`.`User_ID` AS `User_ID`,`t`.`total_products` AS `total_products`,`t`.`total_cost` AS `total_cost`,`t`.`status_string` AS `status_string`,`t`.`status` AS `status`,`t`.`creation_date` AS `creation_date`,`t`.`last_update` AS `last_update`,`l`.`ID` AS `log_id`,`l`.`operation` AS `log_operacion`,`l`.`db_users` AS `log_usuario_remoto`,`l`.`operation_date` AS `log_fecha_operacion`,`l`.`description` AS `log_descripcion` from (`tb_orders` `t` left join `tb_logs` `l` on(((`l`.`table_name` = 'tb_orders') and (`l`.`description` like concat('%ID: ',`t`.`ID`,'%'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_trazabilidad_tb_payment_methods`
--

/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tb_payment_methods`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_trazabilidad_tb_payment_methods` AS select `t`.`ID` AS `ID`,`t`.`name` AS `name`,`t`.`description` AS `description`,`t`.`status` AS `status`,`t`.`creation_date` AS `creation_date`,`t`.`last_update` AS `last_update`,`l`.`ID` AS `log_id`,`l`.`operation` AS `log_operacion`,`l`.`db_users` AS `log_usuario_remoto`,`l`.`operation_date` AS `log_fecha_operacion`,`l`.`description` AS `log_descripcion` from (`tb_payment_methods` `t` left join `tb_logs` `l` on(((`l`.`table_name` = 'tb_payment_methods') and (`l`.`description` like concat('%ID: ',`t`.`ID`,'%'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_trazabilidad_tb_payment_transaction`
--

/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tb_payment_transaction`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_trazabilidad_tb_payment_transaction` AS select `t`.`ID` AS `ID`,`t`.`payment_ID` AS `payment_ID`,`t`.`refund_ID` AS `refund_ID`,`t`.`transaction_type` AS `transaction_type`,`t`.`transaction_status` AS `transaction_status`,`t`.`amount` AS `amount`,`t`.`currency` AS `currency`,`t`.`provider` AS `provider`,`t`.`provider_transaction_id` AS `provider_transaction_id`,`t`.`idempotency_key` AS `idempotency_key`,`t`.`response_code` AS `response_code`,`t`.`response_message` AS `response_message`,`t`.`request_date` AS `request_date`,`t`.`response_date` AS `response_date`,`t`.`creation_date` AS `creation_date`,`t`.`last_update` AS `last_update`,`l`.`ID` AS `log_id`,`l`.`operation` AS `log_operacion`,`l`.`db_users` AS `log_usuario_remoto`,`l`.`operation_date` AS `log_fecha_operacion`,`l`.`description` AS `log_descripcion` from (`tb_payment_transaction` `t` left join `tb_logs` `l` on(((`l`.`table_name` = 'tb_payment_transaction') and (`l`.`description` like concat('%ID: ',`t`.`ID`,'%'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_trazabilidad_tb_payments`
--

/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tb_payments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_trazabilidad_tb_payments` AS select `t`.`ID` AS `ID`,`t`.`order_ID` AS `order_ID`,`t`.`payment_method_ID` AS `payment_method_ID`,`t`.`amount` AS `amount`,`t`.`currency` AS `currency`,`t`.`payment_status` AS `payment_status`,`t`.`provider` AS `provider`,`t`.`provider_reference` AS `provider_reference`,`t`.`creation_date` AS `creation_date`,`t`.`paid_date` AS `paid_date`,`t`.`last_update` AS `last_update`,`l`.`ID` AS `log_id`,`l`.`operation` AS `log_operacion`,`l`.`db_users` AS `log_usuario_remoto`,`l`.`operation_date` AS `log_fecha_operacion`,`l`.`description` AS `log_descripcion` from (`tb_payments` `t` left join `tb_logs` `l` on(((`l`.`table_name` = 'tb_payments') and (`l`.`description` like concat('%ID: ',`t`.`ID`,'%'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_trazabilidad_tb_people`
--

/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tb_people`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_trazabilidad_tb_people` AS select `t`.`person_ID` AS `person_ID`,`t`.`user_ID` AS `user_ID`,`t`.`title` AS `title`,`t`.`given_names` AS `given_names`,`t`.`family_names` AS `family_names`,`t`.`birth_date` AS `birth_date`,`t`.`gender_ID` AS `gender_ID`,`t`.`phone` AS `phone`,`t`.`country_code` AS `country_code`,`t`.`status` AS `status`,`t`.`creation_date` AS `creation_date`,`t`.`last_update` AS `last_update`,`l`.`ID` AS `log_id`,`l`.`operation` AS `log_operacion`,`l`.`db_users` AS `log_usuario_remoto`,`l`.`operation_date` AS `log_fecha_operacion`,`l`.`description` AS `log_descripcion` from (`tb_people` `t` left join `tb_logs` `l` on(((`l`.`table_name` = 'tb_people') and (`l`.`description` like concat('%person_ID: ',`t`.`person_ID`,'%'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_trazabilidad_tb_products`
--

/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tb_products`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_trazabilidad_tb_products` AS select `t`.`ID` AS `ID`,`t`.`SKU` AS `SKU`,`t`.`name` AS `name`,`t`.`description` AS `description`,`t`.`current_price` AS `current_price`,`t`.`current_stock` AS `current_stock`,`t`.`status` AS `status`,`t`.`creation_date` AS `creation_date`,`t`.`last_update` AS `last_update`,`l`.`ID` AS `log_id`,`l`.`operation` AS `log_operacion`,`l`.`db_users` AS `log_usuario_remoto`,`l`.`operation_date` AS `log_fecha_operacion`,`l`.`description` AS `log_descripcion` from (`tb_products` `t` left join `tb_logs` `l` on(((`l`.`table_name` = 'tb_products') and (`l`.`description` like concat('%ID: ',`t`.`ID`,'%'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_trazabilidad_tb_refunds`
--

/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tb_refunds`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_trazabilidad_tb_refunds` AS select `t`.`ID` AS `ID`,`t`.`payment_ID` AS `payment_ID`,`t`.`cancellation_ID` AS `cancellation_ID`,`t`.`return_ID` AS `return_ID`,`t`.`reason` AS `reason`,`t`.`amount` AS `amount`,`t`.`currency` AS `currency`,`t`.`refund_status` AS `refund_status`,`t`.`provider` AS `provider`,`t`.`provider_reference` AS `provider_reference`,`t`.`requested_by_user_ID` AS `requested_by_user_ID`,`t`.`reason_detail` AS `reason_detail`,`t`.`requested_at` AS `requested_at`,`t`.`processed_at` AS `processed_at`,`t`.`creation_date` AS `creation_date`,`t`.`last_update` AS `last_update`,`l`.`ID` AS `log_id`,`l`.`operation` AS `log_operacion`,`l`.`db_users` AS `log_usuario_remoto`,`l`.`operation_date` AS `log_fecha_operacion`,`l`.`description` AS `log_descripcion` from (`tb_refunds` `t` left join `tb_logs` `l` on(((`l`.`table_name` = 'tb_refunds') and (`l`.`description` like concat('%ID: ',`t`.`ID`,'%'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_trazabilidad_tb_returns`
--

/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tb_returns`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_trazabilidad_tb_returns` AS select `t`.`ID` AS `ID`,`t`.`buyer_order_ID` AS `buyer_order_ID`,`t`.`requested_by_user_ID` AS `requested_by_user_ID`,`t`.`reason_code` AS `reason_code`,`t`.`reason_detail` AS `reason_detail`,`t`.`return_status` AS `return_status`,`t`.`return_carrier` AS `return_carrier`,`t`.`return_tracking_number` AS `return_tracking_number`,`t`.`requested_at` AS `requested_at`,`t`.`authorized_at` AS `authorized_at`,`t`.`received_at` AS `received_at`,`t`.`closed_at` AS `closed_at`,`t`.`internal_notes` AS `internal_notes`,`t`.`creation_date` AS `creation_date`,`t`.`last_update` AS `last_update`,`l`.`ID` AS `log_id`,`l`.`operation` AS `log_operacion`,`l`.`db_users` AS `log_usuario_remoto`,`l`.`operation_date` AS `log_fecha_operacion`,`l`.`description` AS `log_descripcion` from (`tb_returns` `t` left join `tb_logs` `l` on(((`l`.`table_name` = 'tb_returns') and (`l`.`description` like concat('%ID: ',`t`.`ID`,'%'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_trazabilidad_tb_shipments`
--

/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tb_shipments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_trazabilidad_tb_shipments` AS select `t`.`ID` AS `ID`,`t`.`buyer_order_ID` AS `buyer_order_ID`,`t`.`address_ID` AS `address_ID`,`t`.`recipient_name` AS `recipient_name`,`t`.`recipient_phone` AS `recipient_phone`,`t`.`address_line_1` AS `address_line_1`,`t`.`address_line_2` AS `address_line_2`,`t`.`city` AS `city`,`t`.`state_region` AS `state_region`,`t`.`postal_code` AS `postal_code`,`t`.`country_code` AS `country_code`,`t`.`carrier` AS `carrier`,`t`.`service_level` AS `service_level`,`t`.`tracking_number` AS `tracking_number`,`t`.`tracking_url` AS `tracking_url`,`t`.`shipment_status` AS `shipment_status`,`t`.`shipping_cost` AS `shipping_cost`,`t`.`shipped_at` AS `shipped_at`,`t`.`estimated_delivery_at` AS `estimated_delivery_at`,`t`.`delivered_at` AS `delivered_at`,`t`.`creation_date` AS `creation_date`,`t`.`last_update` AS `last_update`,`l`.`ID` AS `log_id`,`l`.`operation` AS `log_operacion`,`l`.`db_users` AS `log_usuario_remoto`,`l`.`operation_date` AS `log_fecha_operacion`,`l`.`description` AS `log_descripcion` from (`tb_shipments` `t` left join `tb_logs` `l` on(((`l`.`table_name` = 'tb_shipments') and (`l`.`description` like concat('%ID: ',`t`.`ID`,'%'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_trazabilidad_tb_user_addresses`
--

/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tb_user_addresses`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_trazabilidad_tb_user_addresses` AS select `t`.`ID` AS `ID`,`t`.`user_ID` AS `user_ID`,`t`.`address_label` AS `address_label`,`t`.`recipient_name` AS `recipient_name`,`t`.`recipient_phone` AS `recipient_phone`,`t`.`delivery_instructions` AS `delivery_instructions`,`t`.`latitude` AS `latitude`,`t`.`longitude` AS `longitude`,`t`.`is_default` AS `is_default`,`t`.`status` AS `status`,`t`.`creation_date` AS `creation_date`,`t`.`last_update` AS `last_update`,`l`.`ID` AS `log_id`,`l`.`operation` AS `log_operacion`,`l`.`db_users` AS `log_usuario_remoto`,`l`.`operation_date` AS `log_fecha_operacion`,`l`.`description` AS `log_descripcion` from (`tb_user_addresses` `t` left join `tb_logs` `l` on(((`l`.`table_name` = 'tb_user_addresses') and (`l`.`description` like concat('%ID: ',`t`.`ID`,'%'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_trazabilidad_tb_users`
--

/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tb_users`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_trazabilidad_tb_users` AS select `t`.`ID` AS `ID`,`t`.`email` AS `email`,`t`.`nickname` AS `nickname`,`t`.`password` AS `password`,`t`.`creation_date` AS `creation_date`,`t`.`last_update` AS `last_update`,`t`.`last_login` AS `last_login`,`t`.`status` AS `status`,`l`.`ID` AS `log_id`,`l`.`operation` AS `log_operacion`,`l`.`db_users` AS `log_usuario_remoto`,`l`.`operation_date` AS `log_fecha_operacion`,`l`.`description` AS `log_descripcion` from (`tb_users` `t` left join `tb_logs` `l` on(((`l`.`table_name` = 'tb_users') and (`l`.`description` like concat('%ID: ',`t`.`ID`,'%'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_trazabilidad_tbc_categories`
--

/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tbc_categories`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_trazabilidad_tbc_categories` AS select `t`.`ID` AS `ID`,`t`.`name` AS `name`,`t`.`description` AS `description`,`t`.`sup_id_category` AS `sup_id_category`,`t`.`status` AS `status`,`t`.`creation_date` AS `creation_date`,`t`.`last_update` AS `last_update`,`l`.`ID` AS `log_id`,`l`.`operation` AS `log_operacion`,`l`.`db_users` AS `log_usuario_remoto`,`l`.`operation_date` AS `log_fecha_operacion`,`l`.`description` AS `log_descripcion` from (`tbc_categories` `t` left join `tb_logs` `l` on(((`l`.`table_name` = 'tbc_categories') and (`l`.`description` like concat('%ID: ',`t`.`ID`,'%'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_trazabilidad_tbc_payment_methods_types`
--

/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tbc_payment_methods_types`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_trazabilidad_tbc_payment_methods_types` AS select `t`.`ID` AS `ID`,`t`.`code` AS `code`,`t`.`description` AS `description`,`t`.`status` AS `status`,`t`.`creation_date` AS `creation_date`,`t`.`last_update` AS `last_update`,`l`.`ID` AS `log_id`,`l`.`operation` AS `log_operacion`,`l`.`db_users` AS `log_usuario_remoto`,`l`.`operation_date` AS `log_fecha_operacion`,`l`.`description` AS `log_descripcion` from (`tbc_payment_methods_types` `t` left join `tb_logs` `l` on(((`l`.`table_name` = 'tbc_payment_methods_types') and (`l`.`description` like concat('%ID: ',`t`.`ID`,'%'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_trazabilidad_tbd_address_components`
--

/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tbd_address_components`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_trazabilidad_tbd_address_components` AS select `t`.`ID` AS `ID`,`t`.`address_ID` AS `address_ID`,`t`.`value` AS `value`,`t`.`component_type` AS `component_type`,`t`.`status` AS `status`,`t`.`address_sup_ID` AS `address_sup_ID`,`t`.`creation_date` AS `creation_date`,`t`.`last_update` AS `last_update`,`l`.`ID` AS `log_id`,`l`.`operation` AS `log_operacion`,`l`.`db_users` AS `log_usuario_remoto`,`l`.`operation_date` AS `log_fecha_operacion`,`l`.`description` AS `log_descripcion` from (`tbd_address_components` `t` left join `tb_logs` `l` on(((`l`.`table_name` = 'tbd_address_components') and (`l`.`description` like concat('%ID: ',`t`.`ID`,'%'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_trazabilidad_tbd_buyer_orders`
--

/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tbd_buyer_orders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_trazabilidad_tbd_buyer_orders` AS select `t`.`ID` AS `ID`,`t`.`seller_ID` AS `seller_ID`,`t`.`subtotal` AS `subtotal`,`t`.`shipping_cost` AS `shipping_cost`,`t`.`fulfillment_status` AS `fulfillment_status`,`t`.`status` AS `status`,`t`.`creation_date` AS `creation_date`,`t`.`last_update` AS `last_update`,`l`.`ID` AS `log_id`,`l`.`operation` AS `log_operacion`,`l`.`db_users` AS `log_usuario_remoto`,`l`.`operation_date` AS `log_fecha_operacion`,`l`.`description` AS `log_descripcion` from (`tbd_buyer_orders` `t` left join `tb_logs` `l` on(((`l`.`table_name` = 'tbd_buyer_orders') and (`l`.`description` like concat('%ID: ',`t`.`ID`,'%'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_trazabilidad_tbd_cancellation_items`
--

/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tbd_cancellation_items`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_trazabilidad_tbd_cancellation_items` AS select `t`.`ID` AS `ID`,`t`.`cancellation_ID` AS `cancellation_ID`,`t`.`order_item_ID` AS `order_item_ID`,`t`.`quantity` AS `quantity`,`t`.`creation_date` AS `creation_date`,`l`.`ID` AS `log_id`,`l`.`operation` AS `log_operacion`,`l`.`db_users` AS `log_usuario_remoto`,`l`.`operation_date` AS `log_fecha_operacion`,`l`.`description` AS `log_descripcion` from (`tbd_cancellation_items` `t` left join `tb_logs` `l` on(((`l`.`table_name` = 'tbd_cancellation_items') and (`l`.`description` like concat('%ID: ',`t`.`ID`,'%'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_trazabilidad_tbd_cart_items`
--

/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tbd_cart_items`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_trazabilidad_tbd_cart_items` AS select `t`.`cart_ID` AS `cart_ID`,`t`.`provider_ID` AS `provider_ID`,`t`.`product_ID` AS `product_ID`,`t`.`quantity` AS `quantity`,`t`.`creation_date` AS `creation_date`,`l`.`ID` AS `log_id`,`l`.`operation` AS `log_operacion`,`l`.`db_users` AS `log_usuario_remoto`,`l`.`operation_date` AS `log_fecha_operacion`,`l`.`description` AS `log_descripcion` from (`tbd_cart_items` `t` left join `tb_logs` `l` on(((`l`.`table_name` = 'tbd_cart_items') and (`l`.`description` like concat('%cart_ID: ',`t`.`cart_ID`,'%')) and (`l`.`description` like concat('%provider_ID: ',`t`.`provider_ID`,'%')) and (`l`.`description` like concat('%product_ID: ',`t`.`product_ID`,'%'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_trazabilidad_tbd_order_items`
--

/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tbd_order_items`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_trazabilidad_tbd_order_items` AS select `t`.`ID` AS `ID`,`t`.`buyer_order_ID` AS `buyer_order_ID`,`t`.`product_ID` AS `product_ID`,`t`.`provider_ID` AS `provider_ID`,`t`.`product_name` AS `product_name`,`t`.`quantity` AS `quantity`,`t`.`unit_price` AS `unit_price`,`t`.`subtotal` AS `subtotal`,`t`.`creation_date` AS `creation_date`,`l`.`ID` AS `log_id`,`l`.`operation` AS `log_operacion`,`l`.`db_users` AS `log_usuario_remoto`,`l`.`operation_date` AS `log_fecha_operacion`,`l`.`description` AS `log_descripcion` from (`tbd_order_items` `t` left join `tb_logs` `l` on(((`l`.`table_name` = 'tbd_order_items') and (`l`.`description` like concat('%ID: ',`t`.`ID`,'%'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_trazabilidad_tbd_products_categories`
--

/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tbd_products_categories`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_trazabilidad_tbd_products_categories` AS select `t`.`category_ID` AS `category_ID`,`t`.`product_ID` AS `product_ID`,`t`.`status` AS `status`,`t`.`creation_date` AS `creation_date`,`t`.`last_update` AS `last_update`,`l`.`ID` AS `log_id`,`l`.`operation` AS `log_operacion`,`l`.`db_users` AS `log_usuario_remoto`,`l`.`operation_date` AS `log_fecha_operacion`,`l`.`description` AS `log_descripcion` from (`tbd_products_categories` `t` left join `tb_logs` `l` on(((`l`.`table_name` = 'tbd_products_categories') and (`l`.`description` like concat('%category_ID: ',`t`.`category_ID`,'%')) and (`l`.`description` like concat('%product_ID: ',`t`.`product_ID`,'%'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_trazabilidad_tbd_products_users_providers`
--

/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tbd_products_users_providers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_trazabilidad_tbd_products_users_providers` AS select `t`.`user_id` AS `user_id`,`t`.`product_id` AS `product_id`,`t`.`type_ownership` AS `type_ownership`,`t`.`status` AS `status`,`t`.`avalaible_date` AS `avalaible_date`,`t`.`creation_date` AS `creation_date`,`t`.`last_update` AS `last_update`,`l`.`ID` AS `log_id`,`l`.`operation` AS `log_operacion`,`l`.`db_users` AS `log_usuario_remoto`,`l`.`operation_date` AS `log_fecha_operacion`,`l`.`description` AS `log_descripcion` from (`tbd_products_users_providers` `t` left join `tb_logs` `l` on(((`l`.`table_name` = 'tbd_products_users_providers') and (`l`.`description` like concat('%user_id: ',`t`.`user_id`,'%')) and (`l`.`description` like concat('%product_id: ',`t`.`product_id`,'%'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_trazabilidad_tbd_return_items`
--

/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tbd_return_items`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_trazabilidad_tbd_return_items` AS select `t`.`ID` AS `ID`,`t`.`return_ID` AS `return_ID`,`t`.`order_item_ID` AS `order_item_ID`,`t`.`quantity` AS `quantity`,`t`.`item_condition` AS `item_condition`,`t`.`disposition` AS `disposition`,`t`.`approved_refund_amount` AS `approved_refund_amount`,`t`.`item_status` AS `item_status`,`t`.`creation_date` AS `creation_date`,`t`.`last_update` AS `last_update`,`l`.`ID` AS `log_id`,`l`.`operation` AS `log_operacion`,`l`.`db_users` AS `log_usuario_remoto`,`l`.`operation_date` AS `log_fecha_operacion`,`l`.`description` AS `log_descripcion` from (`tbd_return_items` `t` left join `tb_logs` `l` on(((`l`.`table_name` = 'tbd_return_items') and (`l`.`description` like concat('%ID: ',`t`.`ID`,'%'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_trazabilidad_tbd_user_payment_methods`
--

/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tbd_user_payment_methods`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_trazabilidad_tbd_user_payment_methods` AS select `t`.`ID` AS `ID`,`t`.`user_ID` AS `user_ID`,`t`.`payment_method_type_ID` AS `payment_method_type_ID`,`t`.`provider` AS `provider`,`t`.`provider_method_ref` AS `provider_method_ref`,`t`.`label` AS `label`,`t`.`last_four` AS `last_four`,`t`.`is_default` AS `is_default`,`t`.`status` AS `status`,`t`.`creation_date` AS `creation_date`,`t`.`last_update` AS `last_update`,`l`.`ID` AS `log_id`,`l`.`operation` AS `log_operacion`,`l`.`db_users` AS `log_usuario_remoto`,`l`.`operation_date` AS `log_fecha_operacion`,`l`.`description` AS `log_descripcion` from (`tbd_user_payment_methods` `t` left join `tb_logs` `l` on(((`l`.`table_name` = 'tbd_user_payment_methods') and (`l`.`description` like concat('%ID: ',`t`.`ID`,'%'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_trazabilidad_tbd_users_wishlist_products`
--

/*!50001 DROP VIEW IF EXISTS `vw_trazabilidad_tbd_users_wishlist_products`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_trazabilidad_tbd_users_wishlist_products` AS select `t`.`user_ID` AS `user_ID`,`t`.`product_ID` AS `product_ID`,`t`.`status` AS `status`,`t`.`creation_date` AS `creation_date`,`t`.`last_update` AS `last_update`,`l`.`ID` AS `log_id`,`l`.`operation` AS `log_operacion`,`l`.`db_users` AS `log_usuario_remoto`,`l`.`operation_date` AS `log_fecha_operacion`,`l`.`description` AS `log_descripcion` from (`tbd_users_wishlist_products` `t` left join `tb_logs` `l` on(((`l`.`table_name` = 'tbd_users_wishlist_products') and (`l`.`description` like concat('%user_ID: ',`t`.`user_ID`,'%')) and (`l`.`description` like concat('%product_ID: ',`t`.`product_ID`,'%'))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-01 21:18:08
