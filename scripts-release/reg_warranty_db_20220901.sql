-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.24-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for rdbsmsdev
CREATE DATABASE IF NOT EXISTS `rdbsmsdev` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `rdbsmsdev`;

-- Dumping structure for table rdbsmsdev.common_passwordparam
CREATE TABLE IF NOT EXISTS `common_passwordparam` (
  `PARAMCODE` varchar(16) NOT NULL,
  `DESCRIPTION` varchar(64) DEFAULT NULL,
  `UNIT` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`PARAMCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table rdbsmsdev.common_passwordparam: ~5 rows (approximately)
INSERT INTO `common_passwordparam` (`PARAMCODE`, `DESCRIPTION`, `UNIT`) VALUES
	('IDLEXP', 'Idle Account Expiry Period', 'Day(s)'),
	('INLATT', 'No of Invalid Login Attempts', 'Attempt(s)'),
	('NOHPWD', 'No of History Password', 'Count'),
	('PASEXP', 'Password Expiy Period', 'Day(s)'),
	('PWEXNP', 'Password Expiry Notification Period', 'Day(s)');

-- Dumping structure for table rdbsmsdev.deliverystatus
CREATE TABLE IF NOT EXISTS `deliverystatus` (
  `STATUSCODE` varchar(20) NOT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`STATUSCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table rdbsmsdev.deliverystatus: ~5 rows (approximately)
INSERT INTO `deliverystatus` (`STATUSCODE`, `DESCRIPTION`) VALUES
	('DELIVRD', 'Delivered'),
	('EXPIRED', 'Expired'),
	('REJECTD', 'Rejected'),
	('UNDELIVERABLE', 'Undeliverable'),
	('UNKNOWN', 'Unknown');

-- Dumping structure for table rdbsmsdev.passwordparam
CREATE TABLE IF NOT EXISTS `passwordparam` (
  `PASSWORDPARAM` varchar(16) NOT NULL,
  `USERROLETYPE` varchar(16) NOT NULL,
  `VALUE` varchar(16) DEFAULT NULL,
  `CREATEDTIME` datetime DEFAULT current_timestamp(),
  `LASTUPDATEDTIME` datetime DEFAULT current_timestamp(),
  `LASTUPDATEDUSER` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`PASSWORDPARAM`,`USERROLETYPE`),
  KEY `PASSWORDPARAM_FK2` (`USERROLETYPE`),
  CONSTRAINT `PASSWORDPARAM_FK1` FOREIGN KEY (`PASSWORDPARAM`) REFERENCES `common_passwordparam` (`PARAMCODE`),
  CONSTRAINT `PASSWORDPARAM_FK2` FOREIGN KEY (`USERROLETYPE`) REFERENCES `userroletype` (`USERROLETYPECODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table rdbsmsdev.passwordparam: ~5 rows (approximately)
INSERT INTO `passwordparam` (`PASSWORDPARAM`, `USERROLETYPE`, `VALUE`, `CREATEDTIME`, `LASTUPDATEDTIME`, `LASTUPDATEDUSER`) VALUES
	('IDLEXP', 'WEB', '5', '2021-01-13 00:00:00', '2021-01-13 00:00:00', 'admin'),
	('INLATT', 'WEB', '3', '2021-01-13 00:00:00', '2021-01-13 00:00:00', 'admin'),
	('NOHPWD', 'WEB', '2', '2021-01-13 00:00:00', '2021-01-13 00:00:00', 'admin'),
	('PASEXP', 'WEB', '3', '2021-01-13 00:00:00', '2021-01-13 00:00:00', 'admin'),
	('PWEXNP', 'WEB', '10', '2021-01-13 00:00:00', '2021-01-13 00:00:00', 'admin');

-- Dumping structure for table rdbsmsdev.reg_dealership
CREATE TABLE IF NOT EXISTS `reg_dealership` (
  `dealership_code` varchar(20) NOT NULL,
  `dealership_name` varchar(100) DEFAULT NULL,
  `dealership_email` varchar(100) DEFAULT NULL,
  `dealership_phone` varchar(100) DEFAULT NULL,
  `dealership_address` varchar(100) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `lastupdateduser` varchar(100) DEFAULT NULL,
  `lastupdatedtime` datetime DEFAULT NULL,
  `createduser` varchar(100) DEFAULT NULL,
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`dealership_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Page required. Controlled by price packages.';

-- Dumping data for table rdbsmsdev.reg_dealership: ~7 rows (approximately)
INSERT INTO `reg_dealership` (`dealership_code`, `dealership_name`, `dealership_email`, `dealership_phone`, `dealership_address`, `status`, `lastupdateduser`, `lastupdatedtime`, `createduser`, `createdtime`) VALUES
	('DEAL-0001', 'Bandigo Caravan', 'info@bandigo.com', '97865384', 'Matara', 'ACT', 'admin', '2022-06-27 22:48:55', 'admin', '2022-06-27 22:48:55'),
	('DEAL-0002', 'Auto Leasure & Marline Group', 'info@marline.com', '09234686', 'Jaffna', 'ACT', 'admin', '2022-06-27 22:48:55', 'admin', '2022-06-27 22:48:55'),
	('DEAL-0003', 'Carlions', 'info@carlions.com', '80043834', 'Galle', 'ACT', 'admin', '2022-06-27 22:48:55', 'admin', '2022-06-27 22:48:55'),
	('DEAL-0004', 'Harvey Bay Caravans', 'info@harvey.com', '76512001', 'Winterfell', 'ACT', 'admin', '2022-06-27 22:48:55', 'admin', '2022-06-27 22:48:55'),
	('DEAL-0005', 'Crusader Newcastle', 'info@crusader.new', '23984563', 'Kingslanding', 'ACT', 'admin', '2022-06-27 22:48:55', 'admin', '2022-06-27 22:48:55'),
	('DEAL-0006', 'Crusaders', 'info@crus.com', '96320002', 'Dorne', 'ACT', 'admin', '2022-06-27 22:48:55', 'admin', '2022-06-27 22:48:55'),
	('SUP-16563536790', 'Jays Delership', 'info@jays.deal', '981234123', 'Kegalle', 'CHA', 'john', '2022-07-02 15:43:42', 'jayana', '2022-06-27 23:44:39');

-- Dumping structure for table rdbsmsdev.reg_failure_area
CREATE TABLE IF NOT EXISTS `reg_failure_area` (
  `CODE` varchar(16) NOT NULL,
  `DESCRIPTION` varchar(64) DEFAULT NULL,
  `STATUS` varchar(16) CHARACTER SET latin1 DEFAULT NULL,
  `LASTUPDATEDUSER` varchar(64) DEFAULT NULL,
  `LASTUPDATEDTIME` datetime DEFAULT current_timestamp(),
  `CREATEDTIME` datetime DEFAULT current_timestamp(),
  `CREATEDUSER` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`CODE`),
  KEY `reg_failure_area_FK` (`STATUS`),
  CONSTRAINT `reg_failure_area_FK` FOREIGN KEY (`STATUS`) REFERENCES `status` (`STATUSCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table rdbsmsdev.reg_failure_area: ~3 rows (approximately)
INSERT INTO `reg_failure_area` (`CODE`, `DESCRIPTION`, `STATUS`, `LASTUPDATEDUSER`, `LASTUPDATEDTIME`, `CREATEDTIME`, `CREATEDUSER`) VALUES
	('1', 'R F AREA 1', 'ACT', 'admin', '2022-08-31 17:07:16', '2022-08-31 17:07:16', 'admin'),
	('2', 'R F AREA 2', 'ACT', 'admin', '2022-08-31 17:07:16', '2022-08-31 17:07:16', 'admin'),
	('3', 'R F AREA 3', 'ACT', 'admin', '2022-08-31 17:07:16', '2022-08-31 17:07:16', 'admin');

-- Dumping structure for table rdbsmsdev.reg_failure_type
CREATE TABLE IF NOT EXISTS `reg_failure_type` (
  `CODE` varchar(16) NOT NULL,
  `DESCRIPTION` varchar(64) DEFAULT NULL,
  `STATUS` varchar(16) CHARACTER SET latin1 DEFAULT NULL,
  `LASTUPDATEDUSER` varchar(64) DEFAULT NULL,
  `LASTUPDATEDTIME` datetime DEFAULT current_timestamp(),
  `CREATEDTIME` datetime DEFAULT current_timestamp(),
  `CREATEDUSER` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`CODE`),
  KEY `reg_failure_type_FK` (`STATUS`),
  CONSTRAINT `reg_failure_type_FK` FOREIGN KEY (`STATUS`) REFERENCES `status` (`STATUSCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table rdbsmsdev.reg_failure_type: ~3 rows (approximately)
INSERT INTO `reg_failure_type` (`CODE`, `DESCRIPTION`, `STATUS`, `LASTUPDATEDUSER`, `LASTUPDATEDTIME`, `CREATEDTIME`, `CREATEDUSER`) VALUES
	('1', 'F TYPE 1', 'ACT', 'admin', '2022-08-31 17:05:03', '2022-08-31 17:05:04', 'admin'),
	('2', 'F TYPE 2', 'ACT', 'admin', '2022-08-31 17:05:03', '2022-08-31 17:05:04', 'admin'),
	('3', 'F TYPE 3', 'ACT', 'admin', '2022-08-31 17:05:03', '2022-08-31 17:05:04', 'admin');

-- Dumping structure for table rdbsmsdev.reg_failure_type_repair
CREATE TABLE IF NOT EXISTS `reg_failure_type_repair` (
  `CODE` varchar(16) NOT NULL,
  `DESCRIPTION` varchar(64) DEFAULT NULL,
  `STATUS` varchar(16) CHARACTER SET latin1 DEFAULT NULL,
  `LASTUPDATEDUSER` varchar(64) DEFAULT NULL,
  `LASTUPDATEDTIME` datetime DEFAULT current_timestamp(),
  `CREATEDTIME` datetime DEFAULT current_timestamp(),
  `CREATEDUSER` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`CODE`),
  KEY `reg_failure_type_repair_FK` (`STATUS`),
  CONSTRAINT `reg_failure_type_repair_FK` FOREIGN KEY (`STATUS`) REFERENCES `status` (`STATUSCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table rdbsmsdev.reg_failure_type_repair: ~3 rows (approximately)
INSERT INTO `reg_failure_type_repair` (`CODE`, `DESCRIPTION`, `STATUS`, `LASTUPDATEDUSER`, `LASTUPDATEDTIME`, `CREATEDTIME`, `CREATEDUSER`) VALUES
	('1', 'F R TYPE 1', 'ACT', 'admin', '2022-08-31 17:06:24', '2022-08-31 17:06:24', 'admin'),
	('2', 'F R TYPE 2', 'ACT', 'admin', '2022-08-31 17:06:24', '2022-08-31 17:06:24', 'admin'),
	('3', 'F R TYPE 3', 'ACT', 'admin', '2022-08-31 17:06:24', '2022-08-31 17:06:24', 'admin');

-- Dumping structure for table rdbsmsdev.reg_model
CREATE TABLE IF NOT EXISTS `reg_model` (
  `id` varchar(10) NOT NULL,
  `model` varchar(100) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='No page needed. One time data';

-- Dumping data for table rdbsmsdev.reg_model: ~6 rows (approximately)
INSERT INTO `reg_model` (`id`, `model`, `status`) VALUES
	('MOD-0001', 'Duke', 'ACT'),
	('MOD-0002', 'Prince', 'ACT'),
	('MOD-0003', 'Extreame', 'ACT'),
	('MOD-0004', 'Palace', 'ACT'),
	('MOD-0005', 'Warrior', 'ACT'),
	('MOD-0006', 'Chameleon', 'ACT');

-- Dumping structure for table rdbsmsdev.reg_spare_part
CREATE TABLE IF NOT EXISTS `reg_spare_part` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `warranty_id` varchar(50) DEFAULT NULL,
  `supplier_id` varchar(50) DEFAULT NULL,
  `token` varchar(50) DEFAULT NULL COMMENT 'Use for loginlees popup',
  `spare_part_type` varchar(20) DEFAULT NULL COMMENT 'For Analysing',
  `spare_part_name` varchar(50) DEFAULT NULL,
  `customer` varchar(50) DEFAULT NULL COMMENT 'First & Last Name',
  `qty` int(11) DEFAULT NULL,
  `tracking_no_supplier` varchar(50) DEFAULT NULL,
  `tracking_no_in_house` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='No page needed. Related table';

-- Dumping data for table rdbsmsdev.reg_spare_part: ~6 rows (approximately)
INSERT INTO `reg_spare_part` (`id`, `warranty_id`, `supplier_id`, `token`, `spare_part_type`, `spare_part_name`, `customer`, `qty`, `tracking_no_supplier`, `tracking_no_in_house`) VALUES
	(1, 'WAR-00001', 'SUP-16562644670', '9b1deb4d-3b7d-4bad-9bdd-2b0d7b3dcb00', 'PART-0001', 'AAA', 'Jack Moe', 1, NULL, NULL),
	(2, 'WAR-00001', 'SUP-16562730368', '9b1deb4d-3b7d-4bad-9bdd-2b0d7b3dcb01', 'PART-0005', 'BB', 'Jack Moe', 1, NULL, NULL),
	(3, 'WAR-00001', 'SUP-16562730368', '9b1deb4d-3b7d-4bad-9bdd-2b0d7b3dcb02', 'PART-0002', 'CC', 'Jack Moe', 1, NULL, NULL),
	(4, 'WAR-00001', 'SUP-16562644670', '9b1deb4d-3b7d-4bad-9bdd-2b0d7b3dcb00', 'PART-0009', 'DD', 'Jack Moe', 1, NULL, NULL),
	(5, 'WAR-00002', 'SUP-16562644670', '9b1deb4d-3b7d-4bad-9bdd-2b0d7b3dcb04', 'PART-0003', 'EE', 'David Hustler', 1, NULL, NULL),
	(6, 'WAR-00002', 'SUP-16562730368', '9b1deb4d-3b7d-4bad-9bdd-2b0d7b3dcb05', 'PART-0004', 'FF', 'David Hustler', 1, NULL, NULL);

-- Dumping structure for table rdbsmsdev.reg_spare_part_type
CREATE TABLE IF NOT EXISTS `reg_spare_part_type` (
  `id` varchar(20) NOT NULL,
  `part_type` varchar(100) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='No page needed. One time data';

-- Dumping data for table rdbsmsdev.reg_spare_part_type: ~10 rows (approximately)
INSERT INTO `reg_spare_part_type` (`id`, `part_type`, `status`) VALUES
	('PART-0001', 'Door-Front-Left', 'ACT'),
	('PART-0002', 'Door-Front-Right', 'ACT'),
	('PART-0003', 'Door-Back-Left', 'ACT'),
	('PART-0004', 'Door-Back-Right', 'ACT'),
	('PART-0005', 'Engine', 'ACT'),
	('PART-0006', 'Radiator', 'ACT'),
	('PART-0007', 'Seat-Front', 'ACT'),
	('PART-0008', 'Seat-Back', 'ACT'),
	('PART-0009', 'Stearing Wheel', 'ACT'),
	('PART-0010', 'Clutch Pad', 'ACT');

-- Dumping structure for table rdbsmsdev.reg_supplier
CREATE TABLE IF NOT EXISTS `reg_supplier` (
  `supplier_code` varchar(15) NOT NULL,
  `supplier_name` varchar(50) DEFAULT NULL,
  `supplier_phone` varchar(15) DEFAULT NULL,
  `supplier_email` varchar(200) DEFAULT NULL,
  `supplier_address` varchar(200) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `lastupdateduser` varchar(50) DEFAULT NULL,
  `lastupdatedtime` datetime DEFAULT NULL,
  `createduser` varchar(50) DEFAULT NULL,
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`supplier_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Page required. Controlled by price packages.';

-- Dumping data for table rdbsmsdev.reg_supplier: ~5 rows (approximately)
INSERT INTO `reg_supplier` (`supplier_code`, `supplier_name`, `supplier_phone`, `supplier_email`, `supplier_address`, `status`, `lastupdateduser`, `lastupdatedtime`, `createduser`, `createdtime`) VALUES
	('SUP-16562644670', 'Kokalson', '782346759', 'managet@kokalson.com', 'Perth', 'ACT', 'admin', '2022-06-27 14:04:02', 'dilanka', '2022-06-26 22:57:47'),
	('SUP-16562730368', 'Tank Mas', '78675356', 'sddsf@ds', 'Queensla', 'ACT', 'dilanka', '2022-06-27 01:20:36', 'dilanka', '2022-06-27 01:20:36'),
	('SUP-16562738117', 'BodyKit', '90536743', 'body@k.i', 'Roland', 'ACT', 'dilanka', '2022-06-27 01:33:31', 'dilanka', '2022-06-27 01:33:31'),
	('SUP-16563127137', 'Dias Industries', '78563492', 'info@dias.com', 'Colombia', 'CHA', 'admin', '2022-06-27 14:02:39', 'dilanka', '2022-06-27 12:21:53'),
	('SUP1656', 'Light Yearss', '91871231', 'info@lightyear.com', 'Rockhampton', 'ACT', 'dilanka', '2022-06-27 09:05:48', 'jayana', '2022-06-26 22:57:11');

-- Dumping structure for table rdbsmsdev.reg_warranty_attachments
CREATE TABLE IF NOT EXISTS `reg_warranty_attachments` (
  `attachment_id` int(11) NOT NULL AUTO_INCREMENT,
  `warranty_id` varchar(50) NOT NULL,
  `file_name` varchar(20) DEFAULT NULL,
  `file_format` varchar(10) DEFAULT NULL,
  `attachment_file` longblob DEFAULT NULL,
  `createdtime` datetime DEFAULT NULL,
  PRIMARY KEY (`attachment_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table rdbsmsdev.reg_warranty_attachments: ~19 rows (approximately)

-- Dumping structure for table rdbsmsdev.reg_warranty_claim
CREATE TABLE IF NOT EXISTS `reg_warranty_claim` (
  `id` varchar(50) NOT NULL,
  `chassis` varchar(20) DEFAULT NULL COMMENT 'Chassis Number',
  `model` varchar(10) DEFAULT NULL COMMENT 'Model',
  `first_name` varchar(20) DEFAULT NULL COMMENT 'Customer First Name',
  `last_name` varchar(30) DEFAULT NULL COMMENT 'Customer Last Name',
  `phone` varchar(15) DEFAULT NULL COMMENT 'Customer Phone Number',
  `email` varchar(50) DEFAULT NULL COMMENT 'Customer Email',
  `address` varchar(50) DEFAULT NULL COMMENT 'Customer Address',
  `surburb` varchar(20) DEFAULT NULL COMMENT 'Customer Surburb',
  `state` varchar(20) DEFAULT NULL COMMENT 'Customer State',
  `postcode` varchar(10) DEFAULT NULL COMMENT 'Customer Postcode',
  `dealership` varchar(10) DEFAULT NULL COMMENT 'Dealership',
  `claim_type` varchar(10) DEFAULT NULL COMMENT 'Stock Van, To be Delivered,Warranty Start Date',
  `purchasing_date` datetime DEFAULT NULL COMMENT 'Purchasing Date',
  `purchasing_attachment_id` varchar(40) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL COMMENT 'Description',
  `spareparts_id` varchar(40) DEFAULT NULL COMMENT 'Sparepart Request Id/Not Needed?',
  `failiure_type` varchar(10) DEFAULT NULL COMMENT 'Type of Failiure',
  `failiure_area` varchar(10) DEFAULT NULL COMMENT 'Area of Failiure',
  `repair_type` varchar(10) DEFAULT NULL COMMENT 'Type of Repair',
  `repair_description` varchar(50) DEFAULT NULL COMMENT 'Description of Repair',
  `attachments_id` varchar(50) DEFAULT NULL COMMENT 'Attachments Id/How?',
  `cost_type` varchar(50) DEFAULT NULL COMMENT 'Type of Cost',
  `hours` varchar(50) DEFAULT NULL COMMENT 'Hours',
  `labour_rate` varchar(50) DEFAULT NULL COMMENT 'Labour Rate',
  `total_cost` decimal(10,0) DEFAULT NULL COMMENT 'Total Cost estimated by Dealership',
  `cost_description` varchar(50) DEFAULT NULL COMMENT 'Description of Cost',
  `asignee` varchar(50) DEFAULT NULL,
  `supplier` varchar(50) DEFAULT NULL,
  `status` varchar(16) DEFAULT NULL,
  `is_in_house` tinyint(1) DEFAULT NULL,
  `in_house_status` varchar(16) DEFAULT NULL,
  `claim_on_supplier` decimal(10,0) DEFAULT NULL COMMENT 'Total Cost claimed by Headoffice',
  `supplier_url_token` varchar(50) DEFAULT NULL,
  `supplier_auth_amount` decimal(10,0) DEFAULT NULL COMMENT 'Total Cost authorized by Supplier',
  `supplier_tracking_num` varchar(50) DEFAULT NULL,
  `supplier_comment` varchar(50) DEFAULT NULL,
  `supplier_invoice` varchar(50) DEFAULT NULL,
  `acknowledged_date` datetime DEFAULT NULL,
  `last_reminded_date` datetime DEFAULT NULL,
  `is_critical` tinyint(1) DEFAULT 0,
  `createdtime` datetime DEFAULT NULL,
  `createduser` varchar(64) DEFAULT NULL,
  `lastupdatedtime` datetime DEFAULT NULL,
  `lastupdateduser` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `supplier_url_token` (`supplier_url_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Page required. Controlled by price packages.';

-- Dumping data for table rdbsmsdev.reg_warranty_claim: ~6 rows (approximately)
INSERT INTO `reg_warranty_claim` (`id`, `chassis`, `model`, `first_name`, `last_name`, `phone`, `email`, `address`, `surburb`, `state`, `postcode`, `dealership`, `claim_type`, `purchasing_date`, `purchasing_attachment_id`, `description`, `spareparts_id`, `failiure_type`, `failiure_area`, `repair_type`, `repair_description`, `attachments_id`, `cost_type`, `hours`, `labour_rate`, `total_cost`, `cost_description`, `asignee`, `supplier`, `status`, `is_in_house`, `in_house_status`, `claim_on_supplier`, `supplier_url_token`, `supplier_auth_amount`, `supplier_tracking_num`, `supplier_comment`, `supplier_invoice`, `acknowledged_date`, `last_reminded_date`, `is_critical`, `createdtime`, `createduser`, `lastupdatedtime`, `lastupdateduser`) VALUES
	('WAR-00001', '1134533', 'MOD-0001', 'Jayana', 'Illuwkatte', '875676766', 'jayana@gmail.com', 'Kegalle', 'testsub', 'test sate', 'testpostco', 'DEAL-0002', NULL, '2022-07-03 00:00:00', NULL, NULL, '111', 'CRASH', 'DOOR', 'REPLACE', 'Replace new Door', NULL, NULL, '4', '2.5', 12, 'Labour cost + handle fee', 'Mark', 'SUP-16562738117', 'WAR_APPROVE', 0, NULL, 10, '9b1deb4d-3b7d-4bad-9bdd-2b0d7b3dcb00', 8, 'JDFHUL-9056417', 'HA HA - WAR_ACKNOW', 'HA HA - WAR_ACKNOW', NULL, '2022-07-01 00:00:00', NULL, '2022-09-01 11:04:09', 'admin', '2022-09-01 11:04:13', 'yasas'),
	('WDC-00001', '1134533', 'MOD-0001', 'Jayana', 'Illuwkatte', '875676766', 'jayana@gmail.com', 'Kegalle', NULL, NULL, NULL, 'DEAL-0002', NULL, '2022-07-03 00:00:00', NULL, NULL, '111', 'CRASH', 'DOOR', 'REPLACE', 'Replace new Door', NULL, NULL, '4', '2.5', 12, 'Labour cost + handle fee', 'Mark', 'SUP-16562738117', 'WAR_ACKNOW', 0, NULL, 10, '11111111111', 8, NULL, 'Yeet', 'HA HA - WAR_ACKNOW', '2022-06-01 00:00:00', '2022-07-03 00:00:00', NULL, '2022-09-01 11:04:09', 'admin', '2022-09-01 11:04:09', 'yasas'),
	('WDC-00002', '1134533', 'MOD-0001', 'Jayana', 'Illuwkatte', '875676766', 'jayana@gmail.com', 'Kegalle', NULL, NULL, NULL, 'DEAL-0002', NULL, '2022-07-20 00:00:00', NULL, NULL, '222', 'CRASH', 'DOOR', 'MODIFY', 'Modify damaged door', NULL, NULL, '6', '2.5', 18, 'Labour cost + handle fee', NULL, NULL, 'PEND', 1, NULL, NULL, '11111111112', NULL, NULL, NULL, 'HA HA - WAR_ACKNOW', NULL, '2022-07-02 00:00:00', NULL, '2022-09-01 11:04:09', 'admin', '2022-09-01 11:04:09', 'yasas'),
	('WDC-00003', '1134533', 'MOD-0001', 'Jayana', 'Illuwkatte', '875676766', 'jayana@gmail.com', 'Kegalle', NULL, NULL, NULL, 'DEAL-0002', NULL, '2022-07-03 00:00:00', NULL, NULL, '111', 'CRASH', 'DOOR', 'REPLACE', 'Replace new Door', NULL, NULL, '4', '2.5', 12, 'Labour cost + handle fee', 'Mark', 'SUP-16562738117', 'WAR_APPROVE', 0, NULL, 10, '11111111114', 8, NULL, NULL, 'HA HA - WAR_ACKNOW', NULL, '2022-07-04 00:00:00', NULL, '2022-09-01 11:04:09', 'admin', '2022-09-01 11:04:09', 'yasas'),
	('WDC-00004', '1134533', 'MOD-0001', 'Jayana', 'Illuwkatte', '875676766', 'jayana@gmail.com', 'Kegalle', NULL, NULL, NULL, 'DEAL-0002', NULL, '2022-07-03 00:00:00', NULL, NULL, '111', 'CRASH', 'DOOR', 'REPLACE', 'Replace new Door', NULL, NULL, '4', '2.5', 12, 'Labour cost + handle fee', 'Mark', 'SUP-16562738117', 'PEND', 0, NULL, 10, '11111111113', 8, NULL, NULL, 'HA HA - WAR_ACKNOW', NULL, '2022-07-03 00:00:00', NULL, '2022-09-01 11:04:09', 'admin', '2022-09-01 11:04:09', 'yasas'),
	('WDC-00005', '1134533', 'MOD-0001', 'Jayana', 'Illuwkatte', '875676766', 'jayana@gmail.com', 'Kegalle', NULL, NULL, NULL, 'DEAL-0002', NULL, '2022-07-03 00:00:00', NULL, NULL, '111', 'CRASH', 'DOOR', 'REPACE', 'Replace new Door', NULL, NULL, '4', '2.5', 12, 'Labour cost + handle fee', 'Mark', 'SUP-16562738117', 'WAR_REJECTED_SU', 0, NULL, 14, '11111111115', 0, NULL, 'HA HA - WAR_ACKNOW', NULL, '2022-07-07 00:00:00', '2022-07-20 00:00:00', NULL, '2022-09-01 11:04:09', 'admin', '2022-09-01 11:04:09', 'yasas');

-- Dumping structure for table rdbsmsdev.rule_package
CREATE TABLE IF NOT EXISTS `rule_package` (
  `package_code` varchar(10) DEFAULT NULL,
  `description` varchar(10) DEFAULT NULL,
  `suppliers_active` int(11) DEFAULT NULL,
  `suppliers_all` int(11) DEFAULT NULL,
  `dealership_active` int(11) DEFAULT NULL,
  `dealership_all` int(11) DEFAULT NULL,
  `dealership_users_active` int(11) DEFAULT NULL,
  `dealership_users_all` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table rdbsmsdev.rule_package: ~4 rows (approximately)
INSERT INTO `rule_package` (`package_code`, `description`, `suppliers_active`, `suppliers_all`, `dealership_active`, `dealership_all`, `dealership_users_active`, `dealership_users_all`) VALUES
	('TRIAL', 'Trial', 3, 3, 3, 3, 1, 1),
	('SMALL', 'Small', 5, 7, 5, 7, 2, 2),
	('MEDIUM', 'Medium', 7, 10, 7, 10, 3, 5),
	('LARGE', 'Large', 15, 20, 15, 20, 10, 10);

-- Dumping structure for table rdbsmsdev.state
CREATE TABLE IF NOT EXISTS `state` (
  `state_id` varchar(10) NOT NULL,
  `state_name` varchar(100) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`state_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='No page needed. One time data';

-- Dumping data for table rdbsmsdev.state: ~6 rows (approximately)
INSERT INTO `state` (`state_id`, `state_name`, `status`) VALUES
	('NSW', 'New South Wales', 'ACT'),
	('QLD', 'Queensland', 'ACT'),
	('SAU', 'South Australia', 'ACT'),
	('TSM', 'Tasmania', 'ACT'),
	('VIC', '	Victoria', 'ACT'),
	('WAU', 'Western Australia', 'ACT');

-- Dumping structure for table rdbsmsdev.status
CREATE TABLE IF NOT EXISTS `status` (
  `STATUSCODE` varchar(16) NOT NULL,
  `DESCRIPTION` varchar(32) DEFAULT NULL,
  `STATUSCATEGORY` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`STATUSCODE`),
  KEY `STATUS_STATUSCATEGORY_FK` (`STATUSCATEGORY`),
  CONSTRAINT `STATUS_STATUSCATEGORY_FK` FOREIGN KEY (`STATUSCATEGORY`) REFERENCES `statuscategory` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table rdbsmsdev.status: ~18 rows (approximately)
INSERT INTO `status` (`STATUSCODE`, `DESCRIPTION`, `STATUSCATEGORY`) VALUES
	('ACT', 'Active', 'DFLT'),
	('CHA', 'Changed', 'DFLT'),
	('DEACT', 'Inactive', 'DFLT'),
	('INH_COMPLETED', 'Completed', 'INHOUSE'),
	('INH_NOTED', 'Noted', 'INHOUSE'),
	('INH_REQUESTED', 'Requested', 'INHOUSE'),
	('NEW', 'New', 'DFLT'),
	('PAPR', 'Request Approved', 'PEND'),
	('PEND', 'Pending', 'PEND'),
	('PREJ', 'Request Rejected', 'PEND'),
	('RES', 'Reset', 'DFLT'),
	('SENT', 'Sent', 'COMP'),
	('UNSENT', 'Unsent', 'COMP'),
	('WAR_ACKNOW', 'Ackonwledged', 'WARRANTY'),
	('WAR_APPROVE', 'Approved', 'WARRANTY'),
	('WAR_PEND', 'Pending', 'WARRANTY'),
	('WAR_REJECTED_HO', 'Head Office Rejected', 'WARRANTY'),
	('WAR_REJECTED_SU', 'Supplier Rejected', 'WARRANTY');

-- Dumping structure for table rdbsmsdev.statuscategory
CREATE TABLE IF NOT EXISTS `statuscategory` (
  `CODE` varchar(16) NOT NULL,
  `DESCRIPTION` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table rdbsmsdev.statuscategory: ~8 rows (approximately)
INSERT INTO `statuscategory` (`CODE`, `DESCRIPTION`) VALUES
	('AUTH', 'Authentication'),
	('COMP', 'Completed'),
	('DFLT', 'Default'),
	('INHOUSE', 'In House'),
	('PEND', 'Pending'),
	('SENT', 'Sucessfuly sent'),
	('UNSENT', 'Unsuccessfully Sent'),
	('WARRANTY', 'Warranty');

-- Dumping structure for table rdbsmsdev.userparam
CREATE TABLE IF NOT EXISTS `userparam` (
  `PARAMCODE` varchar(16) NOT NULL,
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  `CATEGORY` varchar(16) NOT NULL,
  `STATUS` varchar(16) DEFAULT NULL,
  `LASTUPDATEDUSER` varchar(64) DEFAULT NULL,
  `LASTUPDATEDTIME` datetime DEFAULT current_timestamp(),
  `CREATEDTIME` datetime DEFAULT current_timestamp(),
  `CREATEDUSER` varchar(64) DEFAULT NULL,
  `VALUE` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`PARAMCODE`,`CATEGORY`),
  KEY `USERPARAM_STATUS_FK` (`STATUS`),
  KEY `USERPARAM_CATEGORY_FK` (`CATEGORY`),
  CONSTRAINT `USERPARAM_CATEGORY_FK` FOREIGN KEY (`CATEGORY`) REFERENCES `userparamcategory` (`CODE`),
  CONSTRAINT `USERPARAM_STATUS_FK` FOREIGN KEY (`STATUS`) REFERENCES `status` (`STATUSCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table rdbsmsdev.userparam: ~8 rows (approximately)
INSERT INTO `userparam` (`PARAMCODE`, `DESCRIPTION`, `CATEGORY`, `STATUS`, `LASTUPDATEDUSER`, `LASTUPDATEDTIME`, `CREATEDTIME`, `CREATEDUSER`, `VALUE`) VALUES
	('BBB', 'f', 'gg', 'ACT', 'admin', '2021-03-26 00:00:00', '2021-03-26 00:00:00', NULL, '3'),
	('CHECK', 'test', 'gg', 'ACT', 'admin', '2021-06-07 00:00:00', '2021-06-07 00:00:00', NULL, NULL),
	('ggg', 'updated', 'ak', 'ACT', 'admin', '2021-04-30 00:00:00', '2021-04-30 00:00:00', NULL, NULL),
	('HHh', 'rgfhrkfhhhfdshhlkjdxh122', 'gg', 'ACT', 'admin', '2021-03-26 00:00:00', '2021-03-26 00:00:00', NULL, '4'),
	('INFORM', 'sending email to inform about emoji', 'gg', 'ACT', 'admin', '2021-08-29 00:00:00', '2021-08-29 00:00:00', NULL, 'lak.dev94@gmail.com'),
	('MASK_CHAR', 'Masking Character', 'gg', 'ACT', 'jayana', '2019-02-13 00:00:00', '2019-02-13 00:00:00', NULL, 'X'),
	('MASK_LENGTH', 'Number of length show', 'gg', 'ACT', 'jayana', '2019-02-13 00:00:00', '2019-02-13 00:00:00', NULL, '4'),
	('TEST', 'TEST1', 'ak', 'ACT', 'dilanka', '2021-04-30 00:00:00', '2021-04-30 00:00:00', NULL, NULL);

-- Dumping structure for table rdbsmsdev.userparamcategory
CREATE TABLE IF NOT EXISTS `userparamcategory` (
  `CODE` varchar(16) NOT NULL,
  `DESCRIPTION` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table rdbsmsdev.userparamcategory: ~3 rows (approximately)
INSERT INTO `userparamcategory` (`CODE`, `DESCRIPTION`) VALUES
	('ak', 'vfvbf'),
	('gg', 'but'),
	('INFORM', 'sending email');

-- Dumping structure for table rdbsmsdev.userrole
CREATE TABLE IF NOT EXISTS `userrole` (
  `USERROLECODE` varchar(16) NOT NULL,
  `DESCRIPTION` varchar(64) DEFAULT NULL,
  `STATUS` varchar(16) DEFAULT NULL,
  `LASTUPDATEDUSER` varchar(64) DEFAULT NULL,
  `LASTUPDATEDTIME` datetime DEFAULT current_timestamp(),
  `CREATEDTIME` datetime DEFAULT current_timestamp(),
  `USERROLETYPE` varchar(16) DEFAULT NULL,
  `CREATEDUSER` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`USERROLECODE`),
  KEY `USERROLE_STATUS_FK` (`STATUS`),
  KEY `USERROLE_USERROLETYPE_FK` (`USERROLETYPE`),
  CONSTRAINT `USERROLE_STATUS_FK` FOREIGN KEY (`STATUS`) REFERENCES `status` (`STATUSCODE`),
  CONSTRAINT `USERROLE_USERROLETYPE_FK` FOREIGN KEY (`USERROLETYPE`) REFERENCES `userroletype` (`USERROLETYPECODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table rdbsmsdev.userrole: ~4 rows (approximately)
INSERT INTO `userrole` (`USERROLECODE`, `DESCRIPTION`, `STATUS`, `LASTUPDATEDUSER`, `LASTUPDATEDTIME`, `CREATEDTIME`, `USERROLETYPE`, `CREATEDUSER`) VALUES
	('322', '23232', 'ACT', 'admin', '2021-09-29 00:00:00', '2021-09-29 00:00:00', 'WEB', 'admin'),
	('ADMIN', 'Admin', 'ACT', 'admin', '2021-03-31 00:00:00', '2021-01-15 00:00:00', 'WEB', 'admin'),
	('DEALER', 'Dealer Shop', 'ACT', 'admin', '2021-03-31 00:00:00', '2021-01-15 00:00:00', 'WEB', 'admin'),
	('HEADOFFICE', 'Head Office', 'ACT', 'admin', '2021-03-31 00:00:00', '2021-01-15 00:00:00', 'WEB', 'admin');

-- Dumping structure for table rdbsmsdev.userroletype
CREATE TABLE IF NOT EXISTS `userroletype` (
  `USERROLETYPECODE` varchar(16) NOT NULL,
  `DESCRIPTION` varchar(64) DEFAULT NULL,
  `STATUS` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`USERROLETYPECODE`),
  KEY `USERROLETYPE_STATUS_FK` (`STATUS`),
  CONSTRAINT `USERROLETYPE_STATUS_FK` FOREIGN KEY (`STATUS`) REFERENCES `status` (`STATUSCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table rdbsmsdev.userroletype: ~2 rows (approximately)
INSERT INTO `userroletype` (`USERROLETYPECODE`, `DESCRIPTION`, `STATUS`) VALUES
	('TAB', 'Tab', 'ACT'),
	('WEB', 'Web', 'ACT');

-- Dumping structure for table rdbsmsdev.web_page
CREATE TABLE IF NOT EXISTS `web_page` (
  `PAGECODE` varchar(16) NOT NULL,
  `DESCRIPTION` varchar(64) DEFAULT NULL,
  `URL` varchar(32) DEFAULT NULL,
  `SORTKEY` smallint(6) DEFAULT NULL,
  `AFLAG` int(11) DEFAULT 0 COMMENT 'Actual dual auth flag',
  `CFLAG` int(11) DEFAULT 0 COMMENT 'Current dual auth flag',
  `STATUS` varchar(16) DEFAULT NULL,
  `LASTUPDATEDUSER` varchar(64) DEFAULT NULL,
  `LASTUPDATEDTIME` datetime DEFAULT current_timestamp(),
  `CREATEDTIME` datetime DEFAULT current_timestamp(),
  `CREATEDUSER` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`PAGECODE`),
  KEY `WEB_PAGE_STATUS_FK` (`STATUS`),
  CONSTRAINT `WEB_PAGE_STATUS_FK` FOREIGN KEY (`STATUS`) REFERENCES `status` (`STATUSCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table rdbsmsdev.web_page: ~13 rows (approximately)
INSERT INTO `web_page` (`PAGECODE`, `DESCRIPTION`, `URL`, `SORTKEY`, `AFLAG`, `CFLAG`, `STATUS`, `LASTUPDATEDUSER`, `LASTUPDATEDTIME`, `CREATEDTIME`, `CREATEDUSER`) VALUES
	('ATMT', 'System Audit', 'viewAudit.htm', 4, 0, 0, 'ACT', 'admin', '2021-02-03 00:00:00', '2021-01-22 00:00:00', 'admin'),
	('CLAIMS', 'Warrenty Claims', 'viewWarrantyClaims.htm', 21, 0, 0, 'ACT', 'admin', '2021-03-16 00:00:00', '2021-03-16 00:00:00', 'admin'),
	('DEALERSHIP', 'Dealerships', 'viewDealership.htm', 23, 0, 0, 'ACT', 'admin', '2021-03-16 00:00:00', '2021-03-16 00:00:00', 'admin'),
	('LGIN', 'Login', 'login', 5, 0, 0, 'ACT', 'admin', '2021-01-22 00:00:00', '2021-01-22 00:00:00', 'admin'),
	('PGMT', 'Pages', 'viewPage.htm', 6, 0, 0, 'ACT', 'admin', '2021-02-03 00:00:00', '2021-02-01 00:00:00', 'admin'),
	('PWCM', 'Password Change Management', 'viewPasswordChange.htm', 3, 0, 0, 'ACT', 'admin', '2021-01-19 00:00:00', '2021-01-19 00:00:00', 'admin'),
	('PWPM', 'Password Policy', 'viewPasswordPolicy.htm', 3, 0, 0, 'ACT', 'admin', '2021-01-19 00:00:00', '2021-01-19 00:00:00', 'admin'),
	('SCMT', 'Sections', 'viewSection.htm', 7, 0, 0, 'ACT', 'admin', '2021-01-22 00:00:00', '2021-01-22 00:00:00', 'admin'),
	('SUPPLIER', 'Suppliers', 'viewSupplier.htm', 22, 0, 0, 'ACT', 'admin', '2021-03-16 00:00:00', '2021-03-16 00:00:00', 'admin'),
	('TSMT', 'Tasks', 'viewTask.htm', 1, 0, 0, 'ACT', 'admin', '2021-01-18 00:00:00', '2021-01-18 00:00:00', 'admin'),
	('UPMT', 'User parameter Management', 'viewUserParam.htm', 15, 0, 0, 'ACT', 'admin', '2021-03-16 00:00:00', '2021-03-16 00:00:00', 'admin'),
	('URMT', 'User Roles', 'viewUserRole.htm', 2, 0, 0, 'ACT', 'admin', '2021-11-30 12:54:22', '2021-01-18 00:00:00', 'admin'),
	('USMT', 'Users', 'viewSystemUser.htm', 8, 0, 0, 'ACT', 'admin', '2021-02-08 00:00:00', '2021-02-08 00:00:00', 'admin');

-- Dumping structure for table rdbsmsdev.web_pagetask
CREATE TABLE IF NOT EXISTS `web_pagetask` (
  `USERROLE` varchar(16) NOT NULL,
  `PAGE` varchar(16) NOT NULL,
  `TASK` varchar(16) NOT NULL,
  `LASTUPDATEDUSER` varchar(64) DEFAULT NULL,
  `LASTUPDATEDTIME` datetime DEFAULT current_timestamp(),
  `CREATETIME` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`USERROLE`,`PAGE`,`TASK`),
  KEY `WEB_PAGETASK_PAGE_FK` (`PAGE`),
  KEY `WEB_PAGETASK_TASK_FK` (`TASK`),
  CONSTRAINT `WEB_PAGETASK_PAGE_FK` FOREIGN KEY (`PAGE`) REFERENCES `web_page` (`PAGECODE`),
  CONSTRAINT `WEB_PAGETASK_TASK_FK` FOREIGN KEY (`TASK`) REFERENCES `web_task` (`TASKCODE`),
  CONSTRAINT `WEB_PAGETASK_USERROLE_FK` FOREIGN KEY (`USERROLE`) REFERENCES `userrole` (`USERROLECODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table rdbsmsdev.web_pagetask: ~67 rows (approximately)
INSERT INTO `web_pagetask` (`USERROLE`, `PAGE`, `TASK`, `LASTUPDATEDUSER`, `LASTUPDATEDTIME`, `CREATETIME`) VALUES
	('ADMIN', 'ATMT', 'ADD', 'admin', '2021-02-22 00:00:00', '2021-02-22 00:00:00'),
	('ADMIN', 'ATMT', 'SRCH', 'admin', '2021-02-22 00:00:00', '2021-02-22 00:00:00'),
	('ADMIN', 'ATMT', 'VIEW', 'admin', '2021-02-22 00:00:00', '2021-02-22 00:00:00'),
	('ADMIN', 'CLAIMS', 'ADD', 'dilanka', '2022-06-25 19:26:37', '2022-06-25 19:26:37'),
	('ADMIN', 'CLAIMS', 'DEL', 'dilanka', '2022-06-25 19:26:37', '2022-06-25 19:26:37'),
	('ADMIN', 'CLAIMS', 'UPDATE', 'dilanka', '2022-06-25 19:26:37', '2022-06-25 19:26:37'),
	('ADMIN', 'CLAIMS', 'VIEW', 'dilanka', '2022-06-25 19:26:37', '2022-06-25 19:26:37'),
	('ADMIN', 'DEALERSHIP', 'ADD', 'admin', '2022-06-27 23:43:40', '2022-06-27 23:43:40'),
	('ADMIN', 'DEALERSHIP', 'DEL', 'admin', '2022-06-27 23:43:40', '2022-06-27 23:43:40'),
	('ADMIN', 'DEALERSHIP', 'SRCH', 'admin', '2022-06-27 23:43:40', '2022-06-27 23:43:40'),
	('ADMIN', 'DEALERSHIP', 'UPDATE', 'admin', '2022-06-27 23:43:40', '2022-06-27 23:43:40'),
	('ADMIN', 'DEALERSHIP', 'VIEW', 'admin', '2022-06-27 23:43:40', '2022-06-27 23:43:40'),
	('ADMIN', 'PGMT', 'CONF', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('ADMIN', 'PGMT', 'REJT', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('ADMIN', 'PGMT', 'UPDATE', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('ADMIN', 'PGMT', 'VIEW', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('ADMIN', 'PWPM', 'ADD', 'admin', '2021-02-22 00:00:00', '2021-02-22 00:00:00'),
	('ADMIN', 'PWPM', 'CONF', 'admin', '2021-02-22 00:00:00', '2021-02-22 00:00:00'),
	('ADMIN', 'PWPM', 'DEL', 'admin', '2021-02-22 00:00:00', '2021-02-22 00:00:00'),
	('ADMIN', 'PWPM', 'REJT', 'admin', '2021-02-22 00:00:00', '2021-02-22 00:00:00'),
	('ADMIN', 'PWPM', 'UPDATE', 'admin', '2021-02-22 00:00:00', '2021-02-22 00:00:00'),
	('ADMIN', 'PWPM', 'VIEW', 'admin', '2021-02-22 00:00:00', '2021-02-22 00:00:00'),
	('ADMIN', 'SCMT', 'ADD', 'admin', '2021-02-01 00:00:00', '2021-02-01 00:00:00'),
	('ADMIN', 'SCMT', 'CONF', 'admin', '2021-02-01 00:00:00', '2021-02-01 00:00:00'),
	('ADMIN', 'SCMT', 'DEL', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('ADMIN', 'SCMT', 'REJT', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('ADMIN', 'SCMT', 'UPDATE', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('ADMIN', 'SCMT', 'VIEW', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('ADMIN', 'SUPPLIER', 'ADD', 'jayana', '2022-06-26 00:54:01', '2022-06-26 00:54:01'),
	('ADMIN', 'SUPPLIER', 'DEL', 'jayana', '2022-06-26 00:54:01', '2022-06-26 00:54:01'),
	('ADMIN', 'SUPPLIER', 'UPDATE', 'jayana', '2022-06-26 00:54:01', '2022-06-26 00:54:01'),
	('ADMIN', 'SUPPLIER', 'VIEW', 'jayana', '2022-06-26 00:54:01', '2022-06-26 00:54:01'),
	('ADMIN', 'TSMT', 'ADD', 'admin', '2021-02-01 00:00:00', '2021-02-01 00:00:00'),
	('ADMIN', 'TSMT', 'CONF', 'admin', '2021-02-01 00:00:00', '2021-02-01 00:00:00'),
	('ADMIN', 'TSMT', 'DEL', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('ADMIN', 'TSMT', 'REJT', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('ADMIN', 'TSMT', 'UPDATE', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('ADMIN', 'TSMT', 'VIEW', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('ADMIN', 'UPMT', 'ADD', 'admin', '2021-02-22 00:00:00', '2021-02-22 00:00:00'),
	('ADMIN', 'UPMT', 'CONF', 'admin', '2021-02-22 00:00:00', '2021-02-22 00:00:00'),
	('ADMIN', 'UPMT', 'DEL', 'admin', '2021-02-22 00:00:00', '2021-02-22 00:00:00'),
	('ADMIN', 'UPMT', 'REJT', 'admin', '2021-02-22 00:00:00', '2021-02-22 00:00:00'),
	('ADMIN', 'UPMT', 'UPDATE', 'admin', '2021-02-22 00:00:00', '2021-02-22 00:00:00'),
	('ADMIN', 'UPMT', 'VIEW', 'admin', '2021-02-22 00:00:00', '2021-02-22 00:00:00'),
	('ADMIN', 'URMT', 'ADD', 'admin', '2021-02-01 00:00:00', '2021-02-01 00:00:00'),
	('ADMIN', 'URMT', 'ASGNPAGE', 'admin', '2021-02-08 00:00:00', '2021-02-08 00:00:00'),
	('ADMIN', 'URMT', 'ASGNTASK', 'admin', '2021-02-08 00:00:00', '2021-02-08 00:00:00'),
	('ADMIN', 'URMT', 'CONF', 'admin', '2021-02-01 00:00:00', '2021-02-01 00:00:00'),
	('ADMIN', 'URMT', 'DEL', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('ADMIN', 'URMT', 'REJT', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('ADMIN', 'URMT', 'UPDATE', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('ADMIN', 'URMT', 'VIEW', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('ADMIN', 'USMT', 'ADD', 'admin', '2021-02-08 00:00:00', '2021-02-08 00:00:00'),
	('ADMIN', 'USMT', 'CONF', 'admin', '2021-02-08 00:00:00', '2021-02-08 00:00:00'),
	('ADMIN', 'USMT', 'DEL', 'admin', '2021-02-08 00:00:00', '2021-02-08 00:00:00'),
	('ADMIN', 'USMT', 'REJT', 'admin', '2021-02-08 00:00:00', '2021-02-08 00:00:00'),
	('ADMIN', 'USMT', 'UPDATE', 'admin', '2021-02-08 00:00:00', '2021-02-08 00:00:00'),
	('ADMIN', 'USMT', 'VIEW', 'admin', '2021-02-08 00:00:00', '2021-02-08 00:00:00'),
	('HEADOFFICE', 'DEALERSHIP', 'ADD', 'jayana', '2022-06-27 23:51:21', '2022-06-27 23:51:21'),
	('HEADOFFICE', 'DEALERSHIP', 'DEL', 'jayana', '2022-06-27 23:51:21', '2022-06-27 23:51:21'),
	('HEADOFFICE', 'DEALERSHIP', 'SRCH', 'jayana', '2022-06-27 23:51:21', '2022-06-27 23:51:21'),
	('HEADOFFICE', 'DEALERSHIP', 'UPDATE', 'jayana', '2022-06-27 23:51:21', '2022-06-27 23:51:21'),
	('HEADOFFICE', 'DEALERSHIP', 'VIEW', 'jayana', '2022-06-27 23:51:21', '2022-06-27 23:51:21'),
	('HEADOFFICE', 'SUPPLIER', 'ADD', 'jayana', '2022-06-27 23:51:26', '2022-06-27 23:51:26'),
	('HEADOFFICE', 'SUPPLIER', 'DEL', 'jayana', '2022-06-27 23:51:26', '2022-06-27 23:51:26'),
	('HEADOFFICE', 'SUPPLIER', 'UPDATE', 'jayana', '2022-06-27 23:51:26', '2022-06-27 23:51:26'),
	('HEADOFFICE', 'SUPPLIER', 'VIEW', 'jayana', '2022-06-27 23:51:26', '2022-06-27 23:51:26');

-- Dumping structure for table rdbsmsdev.web_pagetask_template
CREATE TABLE IF NOT EXISTS `web_pagetask_template` (
  `PAGE` varchar(16) NOT NULL,
  `TASK` varchar(16) NOT NULL,
  `LASTUPDATEDUSER` varchar(64) NOT NULL,
  `LASTUPDATEDTIME` datetime NOT NULL DEFAULT current_timestamp(),
  `CREATETIME` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`PAGE`,`TASK`),
  KEY `WEB_PAGETASK_TEMPLATE_TASK` (`TASK`),
  CONSTRAINT `WEB_PAGETASK_TEMPLATE_PAGE_FK` FOREIGN KEY (`PAGE`) REFERENCES `web_page` (`PAGECODE`),
  CONSTRAINT `WEB_PAGETASK_TEMPLATE_TASK` FOREIGN KEY (`TASK`) REFERENCES `web_task` (`TASKCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table rdbsmsdev.web_pagetask_template: ~49 rows (approximately)
INSERT INTO `web_pagetask_template` (`PAGE`, `TASK`, `LASTUPDATEDUSER`, `LASTUPDATEDTIME`, `CREATETIME`) VALUES
	('CLAIMS', 'ADD', 'admin', '2022-06-25 19:25:07', '2022-06-25 19:25:07'),
	('CLAIMS', 'DEL', 'admin', '2022-06-25 19:25:07', '2022-06-25 19:25:07'),
	('CLAIMS', 'UPDATE', 'admin', '2022-06-25 19:25:07', '2022-06-25 19:25:07'),
	('CLAIMS', 'VIEW', 'admin', '2022-06-25 19:25:07', '2022-06-25 19:25:07'),
	('DEALERSHIP', 'ADD', 'admin', '2022-06-25 19:25:07', '2022-06-25 19:25:07'),
	('DEALERSHIP', 'DEL', 'admin', '2022-06-25 19:25:07', '2022-06-25 19:25:07'),
	('DEALERSHIP', 'SRCH', 'admin', '2022-06-25 19:25:07', '2022-06-25 19:25:07'),
	('DEALERSHIP', 'UPDATE', 'admin', '2022-06-25 19:25:07', '2022-06-25 19:25:07'),
	('DEALERSHIP', 'VIEW', 'admin', '2022-06-25 19:25:07', '2022-06-25 19:25:07'),
	('PGMT', 'CONF', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('PGMT', 'REJT', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('PGMT', 'UPDATE', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('PGMT', 'VIEW', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('PWPM', 'ADD', 'admin', '2021-02-22 00:00:00', '2021-02-22 00:00:00'),
	('PWPM', 'CONF', 'admin', '2021-02-22 00:00:00', '2021-02-22 00:00:00'),
	('PWPM', 'DEL', 'admin', '2021-02-22 00:00:00', '2021-02-22 00:00:00'),
	('PWPM', 'REJT', 'admin', '2021-02-22 00:00:00', '2021-02-22 00:00:00'),
	('PWPM', 'UPDATE', 'admin', '2021-02-22 00:00:00', '2021-02-22 00:00:00'),
	('PWPM', 'VIEW', 'admin', '2021-02-22 00:00:00', '2021-02-22 00:00:00'),
	('SCMT', 'ADD', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('SCMT', 'CONF', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('SCMT', 'DEL', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('SCMT', 'REJT', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('SCMT', 'UPDATE', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('SCMT', 'VIEW', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('SUPPLIER', 'ADD', 'admin', '2022-06-25 19:25:07', '2022-06-25 19:25:07'),
	('SUPPLIER', 'DEL', 'admin', '2022-06-25 19:25:07', '2022-06-25 19:25:07'),
	('SUPPLIER', 'UPDATE', 'admin', '2022-06-25 19:25:07', '2022-06-25 19:25:07'),
	('SUPPLIER', 'VIEW', 'admin', '2022-06-25 19:25:07', '2022-06-25 19:25:07'),
	('TSMT', 'ADD', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('TSMT', 'CONF', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('TSMT', 'DEL', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('TSMT', 'REJT', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('TSMT', 'UPDATE', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('TSMT', 'VIEW', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('UPMT', 'ADD', 'admin', '2021-02-22 00:00:00', '2021-02-22 00:00:00'),
	('UPMT', 'CONF', 'admin', '2021-02-22 00:00:00', '2021-02-22 00:00:00'),
	('UPMT', 'DEL', 'admin', '2021-02-22 00:00:00', '2021-02-22 00:00:00'),
	('UPMT', 'REJT', 'admin', '2021-02-22 00:00:00', '2021-02-22 00:00:00'),
	('UPMT', 'UPDATE', 'admin', '2021-02-22 00:00:00', '2021-02-22 00:00:00'),
	('UPMT', 'VIEW', 'admin', '2021-02-22 00:00:00', '2021-02-22 00:00:00'),
	('URMT', 'ADD', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('URMT', 'ASGNPAGE', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('URMT', 'ASGNTASK', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('URMT', 'CONF', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('URMT', 'DEL', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('URMT', 'REJT', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('URMT', 'UPDATE', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00'),
	('URMT', 'VIEW', 'admin', '2021-01-20 00:00:00', '2021-01-20 00:00:00');

-- Dumping structure for table rdbsmsdev.web_passwordhistory
CREATE TABLE IF NOT EXISTS `web_passwordhistory` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(64) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `LASTUPDATEDUSER` varchar(64) DEFAULT NULL,
  `LASTUPDATEDTIME` datetime DEFAULT current_timestamp(),
  `CREATEDTIME` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=latin1;

-- Dumping data for table rdbsmsdev.web_passwordhistory: ~73 rows (approximately)
INSERT INTO `web_passwordhistory` (`ID`, `USERNAME`, `PASSWORD`, `LASTUPDATEDUSER`, `LASTUPDATEDTIME`, `CREATEDTIME`) VALUES
	(12, 'admin', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'admin', '2021-11-11 08:35:23', '2021-11-11 08:35:23'),
	(13, 'admin', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'admin', '2021-11-11 08:35:23', '2021-11-11 08:35:23'),
	(14, 'admin', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'admin', '2021-11-11 08:35:23', '2021-11-11 08:35:23'),
	(15, 'admin', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'admin', '2021-11-11 08:35:23', '2021-11-11 08:35:23'),
	(16, 'admin', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'admin', '2021-11-11 08:35:23', '2021-11-11 08:35:23'),
	(17, 'admin', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'admin', '2021-11-11 08:35:23', '2021-11-11 08:35:23'),
	(18, 'admin', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'admin', '2021-11-11 08:35:24', '2021-11-11 08:35:24'),
	(21, 'admin', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'admin', '2021-11-11 08:35:24', '2021-11-11 08:35:24'),
	(41, 'rahul', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'rahul', '2021-11-11 08:35:22', '2021-11-11 08:35:22'),
	(61, 'abcd', '3e23e8160039594a33894f6564e1b1348bbd7a0088d42c4acb73eeaed59c009d', 'abcd', '2021-11-11 08:35:22', '2021-11-11 08:35:22'),
	(62, 'milie', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'milie', '2021-11-11 08:35:23', '2021-11-11 08:35:23'),
	(81, 'qa1', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'qa1', '2021-11-11 08:35:24', '2021-11-11 08:35:24'),
	(82, 'qa2', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'qa2', '2021-11-11 08:35:24', '2021-11-11 08:35:24'),
	(83, 'admin', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'admin', '2021-11-30 13:00:33', '2021-11-30 13:00:33'),
	(84, 'dilanka', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'dilanka', '2021-11-30 13:24:19', '2021-11-30 13:24:19'),
	(85, 'admin', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'admin', '2021-11-30 13:36:38', '2021-11-30 13:36:38'),
	(86, 'ad1', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'ad1', '2021-12-01 18:05:25', '2021-12-01 18:05:25'),
	(87, 'ad', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'ad', '2021-12-01 18:14:45', '2021-12-01 18:14:45'),
	(88, 'ad', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'ad', '2021-12-01 18:15:08', '2021-12-01 18:15:08'),
	(89, 'admin', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'admin', '2021-12-01 18:27:29', '2021-12-01 18:27:29'),
	(90, 'admin', '6b51d431df5d7f141cbececcf79edf3dd861c3b4069f0b11661a3eefacbba918', 'admin', '2021-12-01 19:18:35', '2021-12-01 19:18:35'),
	(91, 'admin', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'admin', '2021-12-02 09:12:53', '2021-12-02 09:12:53'),
	(92, 'dilanka', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'dilanka', '2021-12-02 13:40:16', '2021-12-02 13:40:16'),
	(93, 'ad1', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'ad1', '2021-12-02 16:29:44', '2021-12-02 16:29:44'),
	(94, 'ad', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'ad', '2021-12-06 12:08:10', '2021-12-06 12:08:10'),
	(95, 'ad', 'fb8e20fc2e4c3f248c60c39bd652f3c1347298bb977b8b4d5903b85055620603', 'ad', '2021-12-06 12:09:03', '2021-12-06 12:09:03'),
	(96, 'ad', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'ad', '2021-12-06 12:15:45', '2021-12-06 12:15:45'),
	(97, 'ad', 'fb8e20fc2e4c3f248c60c39bd652f3c1347298bb977b8b4d5903b85055620603', 'ad', '2021-12-06 12:16:08', '2021-12-06 12:16:08'),
	(98, 'ad', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'ad', '2021-12-06 12:16:41', '2021-12-06 12:16:41'),
	(99, 'ad', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'ad', '2021-12-06 12:17:54', '2021-12-06 12:17:54'),
	(100, 'dilanka', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'dilanka', '2021-12-06 12:36:01', '2021-12-06 12:36:01'),
	(101, 'qa1', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'qa1', '2021-12-06 13:06:03', '2021-12-06 13:06:03'),
	(102, 'qa1', '961b6dd3ede3cb8ecbaacbd68de040cd78eb2ed5889130cceb4c49268ea4d506', 'qa1', '2021-12-06 13:10:30', '2021-12-06 13:10:30'),
	(103, 'qa2', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'qa2', '2021-12-06 13:26:10', '2021-12-06 13:26:10'),
	(104, 'admin', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'admin', '2021-12-06 13:35:53', '2021-12-06 13:35:53'),
	(105, 'kasun', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'kasun', '2021-12-06 13:38:28', '2021-12-06 13:38:28'),
	(106, 'kasun', 'fb8e20fc2e4c3f248c60c39bd652f3c1347298bb977b8b4d5903b85055620603', 'kasun', '2021-12-06 13:47:02', '2021-12-06 13:47:02'),
	(107, 'admin', 'fb8e20fc2e4c3f248c60c39bd652f3c1347298bb977b8b4d5903b85055620603', 'admin', '2021-12-06 13:54:39', '2021-12-06 13:54:39'),
	(108, 'admin', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'admin', '2021-12-07 09:35:07', '2021-12-07 09:35:07'),
	(109, 'admin', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 'admin', '2021-12-07 10:08:07', '2021-12-07 10:08:07'),
	(110, 'admin', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'admin', '2021-12-07 12:52:38', '2021-12-07 12:52:38'),
	(111, 'admin', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 'admin', '2021-12-07 12:53:18', '2021-12-07 12:53:18'),
	(112, 'admin', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'admin', '2021-12-07 12:56:55', '2021-12-07 12:56:55'),
	(113, 'admin', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 'admin', '2021-12-07 13:09:54', '2021-12-07 13:09:54'),
	(114, 'admin', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'admin', '2021-12-07 13:10:26', '2021-12-07 13:10:26'),
	(115, 'admin', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 'admin', '2021-12-07 13:11:38', '2021-12-07 13:11:38'),
	(116, 'admin', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'admin', '2021-12-07 13:12:52', '2021-12-07 13:12:52'),
	(117, 'admin', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 'admin', '2021-12-07 13:14:42', '2021-12-07 13:14:42'),
	(118, 'admin', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'admin', '2021-12-07 13:15:23', '2021-12-07 13:15:23'),
	(119, 'admin', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 'admin', '2021-12-07 13:20:58', '2021-12-07 13:20:58'),
	(120, 'admin', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'admin', '2021-12-07 13:30:29', '2021-12-07 13:30:29'),
	(121, 'admin', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'admin', '2021-12-07 14:05:01', '2021-12-07 14:05:01'),
	(122, 'admin', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 'admin', '2021-12-07 14:08:01', '2021-12-07 14:08:01'),
	(123, 'admin', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'admin', '2021-12-07 15:08:02', '2021-12-07 15:08:02'),
	(124, 'admin', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 'admin', '2021-12-07 15:52:40', '2021-12-07 15:52:40'),
	(125, 'admin', 'c9b67c05980707d31bf0eb14d300b7fd3d2bfe69387cf3a31e1e77716e7dd66f', 'admin', '2021-12-07 17:21:13', '2021-12-07 17:21:13'),
	(126, 'admin', 'c9b67c05980707d31bf0eb14d300b7fd3d2bfe69387cf3a31e1e77716e7dd66f', 'admin', '2021-12-07 17:24:24', '2021-12-07 17:24:24'),
	(127, 'admin', 'c9b67c05980707d31bf0eb14d300b7fd3d2bfe69387cf3a31e1e77716e7dd66f', 'admin', '2021-12-07 17:26:20', '2021-12-07 17:26:20'),
	(128, 'admin', 'c9b67c05980707d31bf0eb14d300b7fd3d2bfe69387cf3a31e1e77716e7dd66f', 'admin', '2021-12-07 17:28:46', '2021-12-07 17:28:46'),
	(129, 'kasun', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'kasun', '2021-12-09 10:26:10', '2021-12-09 10:26:10'),
	(130, 'kasun', 'cd436ecb0165a8220d7209adb0881967b8b7c07502661f7665dc1060be5cbacf', 'kasun', '2021-12-09 11:10:32', '2021-12-09 11:10:32'),
	(131, 'kasun', '4b656e708a67767cdfce3e9fc5cb10b199453910537400cf66112450d05501f9', 'kasun', '2021-12-09 11:11:08', '2021-12-09 11:11:08'),
	(132, 'kasun', '2d111bdbc8506184535e5460c9e64ced16412db25f1d2c4a8cdff253dd1fdd77', 'kasun', '2021-12-09 11:15:08', '2021-12-09 11:15:08'),
	(133, 'kasun', '5d1e6446026e1f15519370ded163c020cc441c928cd15fb5d39a70f73ce0397c', 'kasun', '2021-12-09 11:15:48', '2021-12-09 11:15:48'),
	(134, 'kasun', 'cd436ecb0165a8220d7209adb0881967b8b7c07502661f7665dc1060be5cbacf', 'kasun', '2021-12-09 11:18:50', '2021-12-09 11:18:50'),
	(135, 'kasun', '8683d2640fb858da5394f7d8089462fee0747c7ef15fa18a103b6d2d00df232f', 'kasun', '2021-12-09 11:19:34', '2021-12-09 11:19:34'),
	(136, 'kasun', 'e0c4b4e3c86403ce3a1ad1059afd6239b3a038f8cbb058d7b6bbcc8abcc0cc8a', 'kasun', '2021-12-09 11:24:00', '2021-12-09 11:24:00'),
	(137, 'kasun', '23e556b29042efeeed876949b4e78aa1d9061bd5ae91803b7db1c0d947c33eaf', 'kasun', '2021-12-09 11:24:28', '2021-12-09 11:24:28'),
	(138, 'kasun', '3e6e6bbb7e38ff6b0c083159439b0ef9743cc5ef868040d6e7597cfad3c570cc', 'kasun', '2021-12-09 11:26:41', '2021-12-09 11:26:41'),
	(139, 'kasun', '4b656e708a67767cdfce3e9fc5cb10b199453910537400cf66112450d05501f9', 'kasun', '2021-12-09 11:55:02', '2021-12-09 11:55:02'),
	(140, 'qan', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'qan', '2021-12-09 15:23:51', '2021-12-09 15:23:51'),
	(141, 'di1', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'di1', '2021-12-10 09:59:18', '2021-12-10 09:59:18'),
	(142, 'jayana', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'jayana', '2022-06-25 15:11:08', '2022-06-25 15:11:08');

-- Dumping structure for table rdbsmsdev.web_passwordpolicy
CREATE TABLE IF NOT EXISTS `web_passwordpolicy` (
  `PASSWORDPOLICYID` int(11) NOT NULL,
  `MINIMUMLENGTH` bigint(20) DEFAULT NULL,
  `MAXIMUMLENGTH` bigint(20) DEFAULT NULL,
  `MINIMUMSPECIALCHARACTERS` bigint(20) DEFAULT NULL,
  `MINIMUMUPPERCASECHARACTERS` bigint(20) DEFAULT NULL,
  `MINIMUMNUMERICALCHARACTERS` bigint(20) DEFAULT NULL,
  `MINIMUMLOWERCASECHARACTERS` bigint(20) DEFAULT NULL,
  `LASTUPDATEDUSER` varchar(32) DEFAULT NULL,
  `LASTUPDATEDTIME` datetime DEFAULT current_timestamp(),
  `CREATETIME` datetime DEFAULT current_timestamp(),
  `NOOFINVALIDLOGINATTEMPT` bigint(20) DEFAULT NULL,
  `REPEATCHARACTERSALLOW` bigint(20) DEFAULT NULL,
  `INITIALPASSWORDEXPIRYSTATUS` bigint(20) DEFAULT NULL,
  `PASSWORDEXPIRYPERIOD` bigint(20) DEFAULT NULL,
  `NOOFHISTORYPASSWORD` bigint(20) DEFAULT NULL,
  `MINIMUMPASSWORDCHANGEPERIOD` bigint(20) DEFAULT NULL,
  `IDLEACCOUNTEXPIRYPERIOD` bigint(20) DEFAULT NULL,
  `DESCRIPTION` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`PASSWORDPOLICYID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table rdbsmsdev.web_passwordpolicy: ~1 rows (approximately)
INSERT INTO `web_passwordpolicy` (`PASSWORDPOLICYID`, `MINIMUMLENGTH`, `MAXIMUMLENGTH`, `MINIMUMSPECIALCHARACTERS`, `MINIMUMUPPERCASECHARACTERS`, `MINIMUMNUMERICALCHARACTERS`, `MINIMUMLOWERCASECHARACTERS`, `LASTUPDATEDUSER`, `LASTUPDATEDTIME`, `CREATETIME`, `NOOFINVALIDLOGINATTEMPT`, `REPEATCHARACTERSALLOW`, `INITIALPASSWORDEXPIRYSTATUS`, `PASSWORDEXPIRYPERIOD`, `NOOFHISTORYPASSWORD`, `MINIMUMPASSWORDCHANGEPERIOD`, `IDLEACCOUNTEXPIRYPERIOD`, `DESCRIPTION`) VALUES
	(1, 4, 7, 1, 1, 1, 1, 'admin', '2021-12-09 15:22:17', '2021-01-20 00:00:00', 300, 1, 0, 500, 1, 100, 100, 'Admin User Password');

-- Dumping structure for table rdbsmsdev.web_section
CREATE TABLE IF NOT EXISTS `web_section` (
  `SECTIONCODE` varchar(16) NOT NULL,
  `DESCRIPTION` varchar(64) DEFAULT NULL,
  `SORTKEY` int(11) DEFAULT NULL,
  `STATUS` varchar(16) DEFAULT NULL,
  `LASTUPDATEDUSER` varchar(64) DEFAULT NULL,
  `LASTUPDATEDTIME` datetime DEFAULT current_timestamp(),
  `CREATEDTIME` datetime DEFAULT current_timestamp(),
  `CREATEDUSER` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`SECTIONCODE`),
  KEY `WEB_SECTION_STATUS_FK` (`STATUS`),
  CONSTRAINT `WEB_SECTION_STATUS_FK` FOREIGN KEY (`STATUS`) REFERENCES `status` (`STATUSCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table rdbsmsdev.web_section: ~4 rows (approximately)
INSERT INTO `web_section` (`SECTIONCODE`, `DESCRIPTION`, `SORTKEY`, `STATUS`, `LASTUPDATEDUSER`, `LASTUPDATEDTIME`, `CREATEDTIME`, `CREATEDUSER`) VALUES
	('SCSC', 'System Configuration Management', 2, 'ACT', 'admin', '2021-01-19 00:00:00', '2021-01-19 00:00:00', NULL),
	('SYAU', 'System Audit', 3, 'ACT', 'admin', '2021-01-22 00:00:00', '2021-01-22 00:00:00', NULL),
	('UMSC', 'User Settings', 10, 'ACT', 'admin', '2021-03-30 00:00:00', '2021-01-18 00:00:00', NULL),
	('WARRANTY', 'Warranty', 1, 'ACT', 'jayana', '2022-06-27 23:50:30', '2022-06-27 23:50:30', 'jayana');

-- Dumping structure for table rdbsmsdev.web_sectionpage
CREATE TABLE IF NOT EXISTS `web_sectionpage` (
  `USERROLE` varchar(16) NOT NULL,
  `SECTION` varchar(16) NOT NULL,
  `PAGE` varchar(16) NOT NULL,
  `LASTUPDATEDUSER` varchar(64) DEFAULT NULL,
  `LASTUPDATEDTIME` datetime DEFAULT current_timestamp(),
  `CREATETIME` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`USERROLE`,`SECTION`,`PAGE`),
  KEY `WEB_SECTIONPAGE_SECTION_FK` (`SECTION`),
  KEY `WEB_SECTIONPAGE_PAGE_FK` (`PAGE`),
  CONSTRAINT `WEB_SECTIONPAGE_PAGE_FK` FOREIGN KEY (`PAGE`) REFERENCES `web_page` (`PAGECODE`),
  CONSTRAINT `WEB_SECTIONPAGE_SECTION_FK` FOREIGN KEY (`SECTION`) REFERENCES `web_section` (`SECTIONCODE`),
  CONSTRAINT `WEB_SECTIONPAGE_USERROLE_FK` FOREIGN KEY (`USERROLE`) REFERENCES `userrole` (`USERROLECODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table rdbsmsdev.web_sectionpage: ~13 rows (approximately)
INSERT INTO `web_sectionpage` (`USERROLE`, `SECTION`, `PAGE`, `LASTUPDATEDUSER`, `LASTUPDATEDTIME`, `CREATETIME`) VALUES
	('ADMIN', 'SCSC', 'CLAIMS', 'dilanka', '2022-06-25 19:24:24', '2022-06-25 19:24:24'),
	('ADMIN', 'SCSC', 'DEALERSHIP', 'admin', '2022-06-27 23:43:27', '2022-06-27 23:43:27'),
	('ADMIN', 'SCSC', 'PWPM', 'admin', '2021-01-19 00:00:00', '2021-01-19 00:00:00'),
	('ADMIN', 'SCSC', 'SUPPLIER', 'jayana', '2022-06-26 00:53:46', '2022-06-26 00:53:46'),
	('ADMIN', 'SCSC', 'UPMT', 'dilanka', '2021-11-20 06:56:43', '2021-11-20 06:56:43'),
	('ADMIN', 'SYAU', 'ATMT', 'admin', '2021-02-13 00:00:00', '2021-02-13 00:00:00'),
	('ADMIN', 'UMSC', 'PGMT', 'admin', '2021-01-18 00:00:00', '2021-01-18 00:00:00'),
	('ADMIN', 'UMSC', 'SCMT', 'admin', '2021-01-18 00:00:00', '2021-01-18 00:00:00'),
	('ADMIN', 'UMSC', 'TSMT', 'admin', '2021-01-18 00:00:00', '2021-01-18 00:00:00'),
	('ADMIN', 'UMSC', 'URMT', 'admin', '2021-01-18 00:00:00', '2021-01-18 00:00:00'),
	('ADMIN', 'UMSC', 'USMT', 'admin', '2021-01-18 00:00:00', '2021-01-18 00:00:00'),
	('HEADOFFICE', 'WARRANTY', 'DEALERSHIP', 'jayana', '2022-06-27 23:50:55', '2022-06-27 23:50:55'),
	('HEADOFFICE', 'WARRANTY', 'SUPPLIER', 'jayana', '2022-06-27 23:50:55', '2022-06-27 23:50:55');

-- Dumping structure for table rdbsmsdev.web_systemaudit
CREATE TABLE IF NOT EXISTS `web_systemaudit` (
  `systemauditid` int(11) NOT NULL AUTO_INCREMENT,
  `userrole` varchar(50) DEFAULT NULL,
  `section` varchar(50) DEFAULT NULL,
  `page` varchar(50) DEFAULT NULL,
  `task` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `remarks` varchar(50) DEFAULT NULL,
  `field` varchar(200) DEFAULT NULL,
  `oldvalue` varchar(500) DEFAULT NULL,
  `newvalue` varchar(500) DEFAULT NULL,
  `lastupdateduser` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `lastupdatedtime` datetime DEFAULT NULL,
  PRIMARY KEY (`systemauditid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1593 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table rdbsmsdev.web_systemaudit: ~801 rows (approximately)

-- Dumping structure for table rdbsmsdev.web_systemuser
CREATE TABLE IF NOT EXISTS `web_systemuser` (
  `USERNAME` varchar(64) NOT NULL,
  `PASSWORD` varchar(256) DEFAULT NULL,
  `USERROLE` varchar(16) DEFAULT NULL,
  `EXPIRYDATE` datetime DEFAULT NULL,
  `FULLNAME` varchar(256) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `MOBILE` varchar(16) DEFAULT NULL,
  `NOOFINVLIDATTEMPT` int(11) DEFAULT 0,
  `LOGGEDDATE` datetime DEFAULT NULL,
  `INITIALLOGINSTATUS` int(11) DEFAULT 0,
  `AD` int(11) DEFAULT 0,
  `STATUS` varchar(16) DEFAULT 'ACT',
  `NIC` varchar(16) DEFAULT NULL,
  `SERVICEID` varchar(16) DEFAULT NULL,
  `LASTUPDATEDUSER` varchar(255) DEFAULT NULL,
  `LASTUPDATEDTIME` datetime DEFAULT current_timestamp(),
  `CREATETIME` datetime DEFAULT current_timestamp(),
  `CREATEDUSER` varchar(64) DEFAULT NULL,
  `DEALERSHIP` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`USERNAME`),
  KEY `WEB_SYSTEMUSER_USERROLE_FK` (`USERROLE`),
  KEY `WEB_SYSTEMUSER_STATUS_FK` (`STATUS`),
  CONSTRAINT `WEB_SYSTEMUSER_STATUS_FK` FOREIGN KEY (`STATUS`) REFERENCES `status` (`STATUSCODE`),
  CONSTRAINT `WEB_SYSTEMUSER_USERROLE_FK` FOREIGN KEY (`USERROLE`) REFERENCES `userrole` (`USERROLECODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table rdbsmsdev.web_systemuser: ~5 rows (approximately)
INSERT INTO `web_systemuser` (`USERNAME`, `PASSWORD`, `USERROLE`, `EXPIRYDATE`, `FULLNAME`, `EMAIL`, `MOBILE`, `NOOFINVLIDATTEMPT`, `LOGGEDDATE`, `INITIALLOGINSTATUS`, `AD`, `STATUS`, `NIC`, `SERVICEID`, `LASTUPDATEDUSER`, `LASTUPDATEDTIME`, `CREATETIME`, `CREATEDUSER`, `DEALERSHIP`) VALUES
	('admin', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'ADMIN', '2030-12-09 12:36:01', 'Admin', 'admin@epiclanka.net', '0777123456', 0, '2022-09-01 13:42:29', 0, 0, 'ACT', '913410602V', '32422', 'admin', '2022-09-01 13:42:29', '2021-01-15 00:00:00', 'admin', 'DEAL-0005'),
	('dilanka', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'ADMIN', '2030-12-09 12:36:01', 'Dilanka Wagachchi', 'dilanka_w@epiclanka.net', '0713535210', 0, '2022-06-27 13:18:16', 0, 0, 'ACT', '913410605V', '32425', 'dilanka', '2022-06-27 13:18:16', '2021-01-15 00:00:00', 'admin', 'DEAL-0001'),
	('jayana', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'ADMIN', '2030-12-09 12:36:01', 'Jayana Illuwkatte', 'admin@dsa.lk', '2123123123', 0, '2022-07-04 13:49:05', 0, 0, 'ACT', '913410604V', '32424', 'dilanka', '2022-07-04 13:49:05', '2022-06-25 15:10:10', 'admin', 'DEAL-0002'),
	('john', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'HEADOFFICE', '2030-12-09 12:36:01', 'John Does', 'admin@epiclanka.net', '0777123456', 0, '2022-07-04 13:50:20', 0, 0, 'ACT', '913410601V', '32421', 'admin', '2022-07-04 13:50:20', '2021-01-15 00:00:00', 'admin', 'DEAL-0003'),
	('rahul', 'ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb', 'ADMIN', '2030-12-09 12:36:01', 'Rahul Satheesh', 'satheesh_m@epiclanka.net', '0777123456', 1, '2022-06-25 17:09:42', 0, 0, 'DEACT', '913410603V', '32423', 'admin', '2022-06-29 22:29:08', '2021-04-27 00:00:00', 'admin', 'DEAL-0004');

-- Dumping structure for table rdbsmsdev.web_task
CREATE TABLE IF NOT EXISTS `web_task` (
  `TASKCODE` varchar(16) NOT NULL,
  `DESCRIPTION` varchar(32) DEFAULT NULL,
  `STATUS` varchar(16) DEFAULT NULL,
  `LASTUPDATEDUSER` varchar(64) DEFAULT NULL,
  `LASTUPDATEDTIME` datetime DEFAULT current_timestamp(),
  `CREATEDTIME` datetime DEFAULT current_timestamp(),
  `CREATEDUSER` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`TASKCODE`),
  KEY `WEB_TASK_STATUS_FK` (`STATUS`),
  CONSTRAINT `WEB_TASK_STATUS_FK` FOREIGN KEY (`STATUS`) REFERENCES `status` (`STATUSCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table rdbsmsdev.web_task: ~20 rows (approximately)
INSERT INTO `web_task` (`TASKCODE`, `DESCRIPTION`, `STATUS`, `LASTUPDATEDUSER`, `LASTUPDATEDTIME`, `CREATEDTIME`, `CREATEDUSER`) VALUES
	('ADD', 'Add', 'ACT', 'shalika', '2021-02-02 00:00:00', '2021-01-12 00:00:00', 'admin'),
	('ASGNPAGE', 'Assign Page', 'ACT', 'admin', '2021-01-22 00:00:00', '2021-01-22 00:00:00', 'admin'),
	('ASGNTASK', 'Assign Task', 'ACT', 'admin', '2021-01-22 00:00:00', '2021-01-22 00:00:00', 'admin'),
	('BGBF', 'VDFVVDVFbh', 'ACT', 'admin', '2021-12-09 13:46:21', '2021-12-09 13:45:18', 'admin'),
	('CONF', 'Confirm', 'ACT', 'admin', '2021-01-12 00:00:00', '2021-01-12 00:00:00', 'admin'),
	('DDD', 'SavingsSQL', 'ACT', 'admin', '2021-10-22 00:00:00', '2021-10-22 00:00:00', NULL),
	('DEL', 'Delete', 'ACT', 'admin', '2021-01-12 00:00:00', '2021-01-12 00:00:00', 'admin'),
	('DIL', 'user role1', 'ACT', 'dilanka', '2021-11-25 16:49:48', '2021-11-25 16:47:59', NULL),
	('DT1', 'Task 1132323csdsd', 'RES', 'admin', '2022-07-19 16:21:48', '2021-12-10 09:22:41', 'dilanka'),
	('DWLD', 'Download', 'ACT', 'admin', '2021-01-12 00:00:00', '2021-01-12 00:00:00', 'admin'),
	('HOLD', 'hold', 'ACT', 'admin', '2021-04-06 00:00:00', '2021-04-06 00:00:00', 'admin'),
	('LGOT', 'Logout', 'ACT', 'admin', '2021-01-12 00:00:00', '2021-01-12 00:00:00', 'admin'),
	('LOGIN', 'Login', 'ACT', 'admin', '2021-01-22 00:00:00', '2021-01-22 00:00:00', 'admin'),
	('LOGN', 'Login', 'ACT', 'admin', '2021-01-12 00:00:00', '2021-01-12 00:00:00', 'admin'),
	('PRO', 'Process', 'ACT', 'admin', '2021-04-06 00:00:00', '2021-04-06 00:00:00', 'admin'),
	('REJT', 'Reject', 'ACT', 'admin', '2021-01-12 00:00:00', '2021-01-12 00:00:00', 'admin'),
	('SEND', 'Send 123', 'ACT', 'dilanka', '2021-04-21 00:00:00', '2021-04-06 00:00:00', 'admin'),
	('SRCH', 'Search', 'ACT', 'admin', '2021-01-12 00:00:00', '2021-01-12 00:00:00', 'admin'),
	('UPDATE', 'Update', 'ACT', 'admin', '2021-01-12 00:00:00', '2021-01-12 00:00:00', 'admin'),
	('VIEW', 'View', 'ACT', 'admin', '2021-01-12 00:00:00', '2021-01-12 00:00:00', 'admin');

-- Dumping structure for table rdbsmsdev.web_tmpauthrec
CREATE TABLE IF NOT EXISTS `web_tmpauthrec` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PAGE` varchar(16) DEFAULT NULL,
  `TASK` varchar(16) DEFAULT NULL,
  `KEY1` varchar(300) DEFAULT NULL,
  `KEY2` varchar(300) DEFAULT NULL,
  `KEY3` varchar(300) DEFAULT NULL,
  `KEY4` varchar(300) DEFAULT NULL,
  `KEY5` varchar(300) DEFAULT NULL,
  `KEY6` varchar(300) DEFAULT NULL,
  `KEY7` varchar(300) DEFAULT NULL,
  `KEY8` varchar(300) DEFAULT NULL,
  `KEY9` varchar(300) DEFAULT NULL,
  `KEY10` varchar(300) DEFAULT NULL,
  `KEY11` varchar(300) DEFAULT NULL,
  `KEY12` varchar(300) DEFAULT NULL,
  `KEY13` varchar(300) DEFAULT NULL,
  `KEY14` varchar(300) DEFAULT NULL,
  `KEY15` varchar(300) DEFAULT NULL,
  `KEY16` varchar(300) DEFAULT NULL,
  `KEY17` varchar(300) DEFAULT NULL,
  `KEY18` varchar(300) DEFAULT NULL,
  `KEY19` varchar(300) DEFAULT NULL,
  `KEY20` varchar(300) DEFAULT NULL,
  `STATUS` varchar(16) DEFAULT NULL,
  `CREATEDTIME` datetime(6) DEFAULT NULL,
  `LASTUPDATEDTIME` datetime(6) DEFAULT NULL,
  `LASTUPDATEDUSER` varchar(64) DEFAULT NULL,
  `TMPRECORD` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `WEB_TMPAUTHREC_STATUS_FK` (`STATUS`),
  CONSTRAINT `WEB_TMPAUTHREC_STATUS_FK` FOREIGN KEY (`STATUS`) REFERENCES `status` (`STATUSCODE`)
) ENGINE=InnoDB AUTO_INCREMENT=382 DEFAULT CHARSET=latin1;

-- Dumping data for table rdbsmsdev.web_tmpauthrec: ~0 rows (approximately)

-- Dumping structure for table rdbsmsdev.web_userrolesection
CREATE TABLE IF NOT EXISTS `web_userrolesection` (
  `USERROLE` varchar(16) NOT NULL,
  `SECTION` varchar(16) NOT NULL,
  `LASTUPDATEDUSER` varchar(64) DEFAULT NULL,
  `LASTUPDATEDTIME` datetime DEFAULT current_timestamp(),
  `CREATETIME` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`USERROLE`,`SECTION`),
  KEY `WEB_USERROLESECTION_SECTION` (`SECTION`),
  CONSTRAINT `WEB_USERROLESECTION_SECTION` FOREIGN KEY (`SECTION`) REFERENCES `web_section` (`SECTIONCODE`),
  CONSTRAINT `WEB_USERROLESECTION_USERROLE` FOREIGN KEY (`USERROLE`) REFERENCES `userrole` (`USERROLECODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table rdbsmsdev.web_userrolesection: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
