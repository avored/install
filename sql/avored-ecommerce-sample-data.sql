-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	5.7.20

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
-- Table structure for table `avored_addresses`
--

DROP TABLE IF EXISTS `avored_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `type` enum('SHIPPING','BILLING') COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `postcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country_id` int(10) unsigned NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_user_id_foreign` (`user_id`),
  KEY `addresses_country_id_foreign` (`country_id`),
  CONSTRAINT `addresses_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `avored_countries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `avored_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_addresses`
--

LOCK TABLES `avored_addresses` WRITE;
/*!40000 ALTER TABLE `avored_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_admin_password_resets`
--

DROP TABLE IF EXISTS `avored_admin_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_admin_password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `admin_password_resets_email_index` (`email`),
  KEY `admin_password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_admin_password_resets`
--

LOCK TABLES `avored_admin_password_resets` WRITE;
/*!40000 ALTER TABLE `avored_admin_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_admin_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_admin_users`
--

DROP TABLE IF EXISTS `avored_admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_super_admin` tinyint(4) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'en',
  `image_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_admin_users`
--

LOCK TABLES `avored_admin_users` WRITE;
/*!40000 ALTER TABLE `avored_admin_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_attribute_dropdown_options`
--

DROP TABLE IF EXISTS `avored_attribute_dropdown_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_attribute_dropdown_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned NOT NULL,
  `display_text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_dropdown_options_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `attribute_dropdown_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `avored_attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_attribute_dropdown_options`
--

LOCK TABLES `avored_attribute_dropdown_options` WRITE;
/*!40000 ALTER TABLE `avored_attribute_dropdown_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_attribute_dropdown_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_attribute_product`
--

DROP TABLE IF EXISTS `avored_attribute_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_attribute_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_product_attribute_id_foreign` (`attribute_id`),
  KEY `attribute_product_product_id_foreign` (`product_id`),
  CONSTRAINT `attribute_product_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `avored_attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attribute_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `avored_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_attribute_product`
--

LOCK TABLES `avored_attribute_product` WRITE;
/*!40000 ALTER TABLE `avored_attribute_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_attribute_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_attributes`
--

DROP TABLE IF EXISTS `avored_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attributes_identifier_unique` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_attributes`
--

LOCK TABLES `avored_attributes` WRITE;
/*!40000 ALTER TABLE `avored_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_categories`
--

DROP TABLE IF EXISTS `avored_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_categories`
--

LOCK TABLES `avored_categories` WRITE;
/*!40000 ALTER TABLE `avored_categories` DISABLE KEYS */;
INSERT INTO `avored_categories` VALUES (1,NULL,'Kitchen','kitchen',NULL,NULL,'2018-02-23 10:22:07','2018-02-23 10:22:07'),(2,NULL,'Bedroom','bedroom',NULL,NULL,'2018-02-23 10:22:07','2018-02-23 10:22:07'),(3,NULL,'Living Room','living-room',NULL,NULL,'2018-02-23 10:22:07','2018-02-23 10:22:07');
/*!40000 ALTER TABLE `avored_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_category_product`
--

DROP TABLE IF EXISTS `avored_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_category_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_product_product_id_foreign` (`product_id`),
  KEY `category_product_category_id_foreign` (`category_id`),
  CONSTRAINT `category_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `avored_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `avored_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_category_product`
--

LOCK TABLES `avored_category_product` WRITE;
/*!40000 ALTER TABLE `avored_category_product` DISABLE KEYS */;
INSERT INTO `avored_category_product` VALUES (1,3,1,NULL,NULL),(2,3,2,NULL,NULL),(3,3,3,NULL,NULL),(4,3,4,NULL,NULL),(5,3,5,NULL,NULL),(7,2,6,NULL,NULL),(8,2,8,NULL,NULL),(9,2,9,NULL,NULL),(10,2,10,NULL,NULL),(11,1,11,NULL,NULL),(12,1,12,NULL,NULL),(13,1,13,NULL,NULL),(14,1,14,NULL,NULL);
/*!40000 ALTER TABLE `avored_category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_configurations`
--

DROP TABLE IF EXISTS `avored_configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_configurations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `configuration_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `configuration_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_configurations`
--

LOCK TABLES `avored_configurations` WRITE;
/*!40000 ALTER TABLE `avored_configurations` DISABLE KEYS */;
INSERT INTO `avored_configurations` VALUES (1,'general_site_title','AvoRed Laravel Ecommerce','2018-02-23 10:10:32','2018-02-23 10:10:32'),(2,'general_site_description','AvoRed Laravel Ecommerce','2018-02-23 10:10:32','2018-02-23 10:10:32'),(3,'avored_tax_class_default_country_for_tax_calculation','141','2018-02-23 10:10:32','2018-02-23 10:10:32'),(4,'general_home_page','1','2018-02-23 10:22:07','2018-02-23 10:22:07'),(5,'general_term_condition_page','2','2018-02-23 10:22:07','2018-02-23 10:22:07');
/*!40000 ALTER TABLE `avored_configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_countries`
--

DROP TABLE IF EXISTS `avored_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_countries`
--

LOCK TABLES `avored_countries` WRITE;
/*!40000 ALTER TABLE `avored_countries` DISABLE KEYS */;
INSERT INTO `avored_countries` VALUES (1,'BD','Bangladesh','2018-02-23 10:10:32','2018-02-23 10:10:32'),(2,'BE','Belgium','2018-02-23 10:10:32','2018-02-23 10:10:32'),(3,'BF','Burkina Faso','2018-02-23 10:10:32','2018-02-23 10:10:32'),(4,'BG','Bulgaria','2018-02-23 10:10:32','2018-02-23 10:10:32'),(5,'BA','Bosnia and Herzegovina','2018-02-23 10:10:32','2018-02-23 10:10:32'),(6,'BB','Barbados','2018-02-23 10:10:32','2018-02-23 10:10:32'),(7,'WF','Wallis and Futuna','2018-02-23 10:10:32','2018-02-23 10:10:32'),(8,'BL','Saint Barthelemy','2018-02-23 10:10:32','2018-02-23 10:10:32'),(9,'BM','Bermuda','2018-02-23 10:10:32','2018-02-23 10:10:32'),(10,'BN','Brunei','2018-02-23 10:10:32','2018-02-23 10:10:32'),(11,'BO','Bolivia','2018-02-23 10:10:32','2018-02-23 10:10:32'),(12,'BH','Bahrain','2018-02-23 10:10:32','2018-02-23 10:10:32'),(13,'BI','Burundi','2018-02-23 10:10:32','2018-02-23 10:10:32'),(14,'BJ','Benin','2018-02-23 10:10:32','2018-02-23 10:10:32'),(15,'BT','Bhutan','2018-02-23 10:10:32','2018-02-23 10:10:32'),(16,'JM','Jamaica','2018-02-23 10:10:32','2018-02-23 10:10:32'),(17,'BV','Bouvet Island','2018-02-23 10:10:32','2018-02-23 10:10:32'),(18,'BW','Botswana','2018-02-23 10:10:32','2018-02-23 10:10:32'),(19,'WS','Samoa','2018-02-23 10:10:32','2018-02-23 10:10:32'),(20,'BQ','Bonaire, Saint Eustatius and Saba ','2018-02-23 10:10:32','2018-02-23 10:10:32'),(21,'BR','Brazil','2018-02-23 10:10:32','2018-02-23 10:10:32'),(22,'BS','Bahamas','2018-02-23 10:10:32','2018-02-23 10:10:32'),(23,'JE','Jersey','2018-02-23 10:10:32','2018-02-23 10:10:32'),(24,'BY','Belarus','2018-02-23 10:10:32','2018-02-23 10:10:32'),(25,'BZ','Belize','2018-02-23 10:10:32','2018-02-23 10:10:32'),(26,'RU','Russia','2018-02-23 10:10:32','2018-02-23 10:10:32'),(27,'RW','Rwanda','2018-02-23 10:10:32','2018-02-23 10:10:32'),(28,'RS','Serbia','2018-02-23 10:10:32','2018-02-23 10:10:32'),(29,'TL','East Timor','2018-02-23 10:10:32','2018-02-23 10:10:32'),(30,'RE','Reunion','2018-02-23 10:10:32','2018-02-23 10:10:32'),(31,'TM','Turkmenistan','2018-02-23 10:10:32','2018-02-23 10:10:32'),(32,'TJ','Tajikistan','2018-02-23 10:10:32','2018-02-23 10:10:32'),(33,'RO','Romania','2018-02-23 10:10:32','2018-02-23 10:10:32'),(34,'TK','Tokelau','2018-02-23 10:10:32','2018-02-23 10:10:32'),(35,'GW','Guinea-Bissau','2018-02-23 10:10:32','2018-02-23 10:10:32'),(36,'GU','Guam','2018-02-23 10:10:32','2018-02-23 10:10:32'),(37,'GT','Guatemala','2018-02-23 10:10:32','2018-02-23 10:10:32'),(38,'GS','South Georgia and the South Sandwich Islands','2018-02-23 10:10:32','2018-02-23 10:10:32'),(39,'GR','Greece','2018-02-23 10:10:32','2018-02-23 10:10:32'),(40,'GQ','Equatorial Guinea','2018-02-23 10:10:32','2018-02-23 10:10:32'),(41,'GP','Guadeloupe','2018-02-23 10:10:32','2018-02-23 10:10:32'),(42,'JP','Japan','2018-02-23 10:10:32','2018-02-23 10:10:32'),(43,'GY','Guyana','2018-02-23 10:10:32','2018-02-23 10:10:32'),(44,'GG','Guernsey','2018-02-23 10:10:32','2018-02-23 10:10:32'),(45,'GF','French Guiana','2018-02-23 10:10:32','2018-02-23 10:10:32'),(46,'GE','Georgia','2018-02-23 10:10:32','2018-02-23 10:10:32'),(47,'GD','Grenada','2018-02-23 10:10:32','2018-02-23 10:10:32'),(48,'GB','United Kingdom','2018-02-23 10:10:32','2018-02-23 10:10:32'),(49,'GA','Gabon','2018-02-23 10:10:32','2018-02-23 10:10:32'),(50,'SV','El Salvador','2018-02-23 10:10:32','2018-02-23 10:10:32'),(51,'GN','Guinea','2018-02-23 10:10:32','2018-02-23 10:10:32'),(52,'GM','Gambia','2018-02-23 10:10:32','2018-02-23 10:10:32'),(53,'GL','Greenland','2018-02-23 10:10:32','2018-02-23 10:10:32'),(54,'GI','Gibraltar','2018-02-23 10:10:32','2018-02-23 10:10:32'),(55,'GH','Ghana','2018-02-23 10:10:32','2018-02-23 10:10:32'),(56,'OM','Oman','2018-02-23 10:10:32','2018-02-23 10:10:32'),(57,'TN','Tunisia','2018-02-23 10:10:32','2018-02-23 10:10:32'),(58,'JO','Jordan','2018-02-23 10:10:32','2018-02-23 10:10:32'),(59,'HR','Croatia','2018-02-23 10:10:32','2018-02-23 10:10:32'),(60,'HT','Haiti','2018-02-23 10:10:32','2018-02-23 10:10:32'),(61,'HU','Hungary','2018-02-23 10:10:32','2018-02-23 10:10:32'),(62,'HK','Hong Kong','2018-02-23 10:10:32','2018-02-23 10:10:32'),(63,'HN','Honduras','2018-02-23 10:10:32','2018-02-23 10:10:32'),(64,'HM','Heard Island and McDonald Islands','2018-02-23 10:10:32','2018-02-23 10:10:32'),(65,'VE','Venezuela','2018-02-23 10:10:32','2018-02-23 10:10:32'),(66,'PR','Puerto Rico','2018-02-23 10:10:32','2018-02-23 10:10:32'),(67,'PS','Palestinian Territory','2018-02-23 10:10:32','2018-02-23 10:10:32'),(68,'PW','Palau','2018-02-23 10:10:32','2018-02-23 10:10:32'),(69,'PT','Portugal','2018-02-23 10:10:32','2018-02-23 10:10:32'),(70,'SJ','Svalbard and Jan Mayen','2018-02-23 10:10:32','2018-02-23 10:10:32'),(71,'PY','Paraguay','2018-02-23 10:10:32','2018-02-23 10:10:32'),(72,'IQ','Iraq','2018-02-23 10:10:32','2018-02-23 10:10:32'),(73,'PA','Panama','2018-02-23 10:10:32','2018-02-23 10:10:32'),(74,'PF','French Polynesia','2018-02-23 10:10:32','2018-02-23 10:10:32'),(75,'PG','Papua New Guinea','2018-02-23 10:10:32','2018-02-23 10:10:32'),(76,'PE','Peru','2018-02-23 10:10:32','2018-02-23 10:10:32'),(77,'PK','Pakistan','2018-02-23 10:10:32','2018-02-23 10:10:32'),(78,'PH','Philippines','2018-02-23 10:10:32','2018-02-23 10:10:32'),(79,'PN','Pitcairn','2018-02-23 10:10:32','2018-02-23 10:10:32'),(80,'PL','Poland','2018-02-23 10:10:32','2018-02-23 10:10:32'),(81,'PM','Saint Pierre and Miquelon','2018-02-23 10:10:32','2018-02-23 10:10:32'),(82,'ZM','Zambia','2018-02-23 10:10:32','2018-02-23 10:10:32'),(83,'EH','Western Sahara','2018-02-23 10:10:32','2018-02-23 10:10:32'),(84,'EE','Estonia','2018-02-23 10:10:32','2018-02-23 10:10:32'),(85,'EG','Egypt','2018-02-23 10:10:32','2018-02-23 10:10:32'),(86,'ZA','South Africa','2018-02-23 10:10:32','2018-02-23 10:10:32'),(87,'EC','Ecuador','2018-02-23 10:10:32','2018-02-23 10:10:32'),(88,'IT','Italy','2018-02-23 10:10:32','2018-02-23 10:10:32'),(89,'VN','Vietnam','2018-02-23 10:10:32','2018-02-23 10:10:32'),(90,'SB','Solomon Islands','2018-02-23 10:10:32','2018-02-23 10:10:32'),(91,'ET','Ethiopia','2018-02-23 10:10:32','2018-02-23 10:10:32'),(92,'SO','Somalia','2018-02-23 10:10:32','2018-02-23 10:10:32'),(93,'ZW','Zimbabwe','2018-02-23 10:10:32','2018-02-23 10:10:32'),(94,'SA','Saudi Arabia','2018-02-23 10:10:32','2018-02-23 10:10:32'),(95,'ES','Spain','2018-02-23 10:10:32','2018-02-23 10:10:32'),(96,'ER','Eritrea','2018-02-23 10:10:32','2018-02-23 10:10:32'),(97,'ME','Montenegro','2018-02-23 10:10:32','2018-02-23 10:10:32'),(98,'MD','Moldova','2018-02-23 10:10:32','2018-02-23 10:10:32'),(99,'MG','Madagascar','2018-02-23 10:10:32','2018-02-23 10:10:32'),(100,'MF','Saint Martin','2018-02-23 10:10:32','2018-02-23 10:10:32'),(101,'MA','Morocco','2018-02-23 10:10:32','2018-02-23 10:10:32'),(102,'MC','Monaco','2018-02-23 10:10:32','2018-02-23 10:10:32'),(103,'UZ','Uzbekistan','2018-02-23 10:10:32','2018-02-23 10:10:32'),(104,'MM','Myanmar','2018-02-23 10:10:32','2018-02-23 10:10:32'),(105,'ML','Mali','2018-02-23 10:10:32','2018-02-23 10:10:32'),(106,'MO','Macao','2018-02-23 10:10:32','2018-02-23 10:10:32'),(107,'MN','Mongolia','2018-02-23 10:10:32','2018-02-23 10:10:32'),(108,'MH','Marshall Islands','2018-02-23 10:10:32','2018-02-23 10:10:32'),(109,'MK','Macedonia','2018-02-23 10:10:32','2018-02-23 10:10:32'),(110,'MU','Mauritius','2018-02-23 10:10:32','2018-02-23 10:10:32'),(111,'MT','Malta','2018-02-23 10:10:32','2018-02-23 10:10:32'),(112,'MW','Malawi','2018-02-23 10:10:32','2018-02-23 10:10:32'),(113,'MV','Maldives','2018-02-23 10:10:32','2018-02-23 10:10:32'),(114,'MQ','Martinique','2018-02-23 10:10:32','2018-02-23 10:10:32'),(115,'MP','Northern Mariana Islands','2018-02-23 10:10:32','2018-02-23 10:10:32'),(116,'MS','Montserrat','2018-02-23 10:10:32','2018-02-23 10:10:32'),(117,'MR','Mauritania','2018-02-23 10:10:32','2018-02-23 10:10:32'),(118,'IM','Isle of Man','2018-02-23 10:10:32','2018-02-23 10:10:32'),(119,'UG','Uganda','2018-02-23 10:10:32','2018-02-23 10:10:32'),(120,'TZ','Tanzania','2018-02-23 10:10:32','2018-02-23 10:10:32'),(121,'MY','Malaysia','2018-02-23 10:10:32','2018-02-23 10:10:32'),(122,'MX','Mexico','2018-02-23 10:10:32','2018-02-23 10:10:32'),(123,'IL','Israel','2018-02-23 10:10:32','2018-02-23 10:10:32'),(124,'FR','France','2018-02-23 10:10:32','2018-02-23 10:10:32'),(125,'IO','British Indian Ocean Territory','2018-02-23 10:10:32','2018-02-23 10:10:32'),(126,'SH','Saint Helena','2018-02-23 10:10:32','2018-02-23 10:10:32'),(127,'FI','Finland','2018-02-23 10:10:32','2018-02-23 10:10:32'),(128,'FJ','Fiji','2018-02-23 10:10:32','2018-02-23 10:10:32'),(129,'FK','Falkland Islands','2018-02-23 10:10:32','2018-02-23 10:10:32'),(130,'FM','Micronesia','2018-02-23 10:10:32','2018-02-23 10:10:32'),(131,'FO','Faroe Islands','2018-02-23 10:10:32','2018-02-23 10:10:32'),(132,'NI','Nicaragua','2018-02-23 10:10:32','2018-02-23 10:10:32'),(133,'NL','Netherlands','2018-02-23 10:10:32','2018-02-23 10:10:32'),(134,'NO','Norway','2018-02-23 10:10:32','2018-02-23 10:10:32'),(135,'NA','Namibia','2018-02-23 10:10:32','2018-02-23 10:10:32'),(136,'VU','Vanuatu','2018-02-23 10:10:32','2018-02-23 10:10:32'),(137,'NC','New Caledonia','2018-02-23 10:10:32','2018-02-23 10:10:32'),(138,'NE','Niger','2018-02-23 10:10:32','2018-02-23 10:10:32'),(139,'NF','Norfolk Island','2018-02-23 10:10:32','2018-02-23 10:10:32'),(140,'NG','Nigeria','2018-02-23 10:10:32','2018-02-23 10:10:32'),(141,'NZ','New Zealand','2018-02-23 10:10:32','2018-02-23 10:10:32'),(142,'NP','Nepal','2018-02-23 10:10:32','2018-02-23 10:10:32'),(143,'NR','Nauru','2018-02-23 10:10:32','2018-02-23 10:10:32'),(144,'NU','Niue','2018-02-23 10:10:32','2018-02-23 10:10:32'),(145,'CK','Cook Islands','2018-02-23 10:10:32','2018-02-23 10:10:32'),(146,'XK','Kosovo','2018-02-23 10:10:32','2018-02-23 10:10:32'),(147,'CI','Ivory Coast','2018-02-23 10:10:32','2018-02-23 10:10:32'),(148,'CH','Switzerland','2018-02-23 10:10:32','2018-02-23 10:10:32'),(149,'CO','Colombia','2018-02-23 10:10:32','2018-02-23 10:10:32'),(150,'CN','China','2018-02-23 10:10:32','2018-02-23 10:10:32'),(151,'CM','Cameroon','2018-02-23 10:10:32','2018-02-23 10:10:32'),(152,'CL','Chile','2018-02-23 10:10:32','2018-02-23 10:10:32'),(153,'CC','Cocos Islands','2018-02-23 10:10:32','2018-02-23 10:10:32'),(154,'CA','Canada','2018-02-23 10:10:32','2018-02-23 10:10:32'),(155,'CG','Republic of the Congo','2018-02-23 10:10:32','2018-02-23 10:10:32'),(156,'CF','Central African Republic','2018-02-23 10:10:32','2018-02-23 10:10:32'),(157,'CD','Democratic Republic of the Congo','2018-02-23 10:10:32','2018-02-23 10:10:32'),(158,'CZ','Czech Republic','2018-02-23 10:10:32','2018-02-23 10:10:32'),(159,'CY','Cyprus','2018-02-23 10:10:32','2018-02-23 10:10:32'),(160,'CX','Christmas Island','2018-02-23 10:10:32','2018-02-23 10:10:32'),(161,'CR','Costa Rica','2018-02-23 10:10:32','2018-02-23 10:10:32'),(162,'CW','Curacao','2018-02-23 10:10:32','2018-02-23 10:10:32'),(163,'CV','Cape Verde','2018-02-23 10:10:32','2018-02-23 10:10:32'),(164,'CU','Cuba','2018-02-23 10:10:32','2018-02-23 10:10:32'),(165,'SZ','Swaziland','2018-02-23 10:10:32','2018-02-23 10:10:32'),(166,'SY','Syria','2018-02-23 10:10:32','2018-02-23 10:10:32'),(167,'SX','Sint Maarten','2018-02-23 10:10:32','2018-02-23 10:10:32'),(168,'KG','Kyrgyzstan','2018-02-23 10:10:32','2018-02-23 10:10:32'),(169,'KE','Kenya','2018-02-23 10:10:32','2018-02-23 10:10:32'),(170,'SS','South Sudan','2018-02-23 10:10:32','2018-02-23 10:10:32'),(171,'SR','Suriname','2018-02-23 10:10:32','2018-02-23 10:10:32'),(172,'KI','Kiribati','2018-02-23 10:10:32','2018-02-23 10:10:32'),(173,'KH','Cambodia','2018-02-23 10:10:32','2018-02-23 10:10:32'),(174,'KN','Saint Kitts and Nevis','2018-02-23 10:10:32','2018-02-23 10:10:32'),(175,'KM','Comoros','2018-02-23 10:10:32','2018-02-23 10:10:32'),(176,'ST','Sao Tome and Principe','2018-02-23 10:10:32','2018-02-23 10:10:32'),(177,'SK','Slovakia','2018-02-23 10:10:32','2018-02-23 10:10:32'),(178,'KR','South Korea','2018-02-23 10:10:32','2018-02-23 10:10:32'),(179,'SI','Slovenia','2018-02-23 10:10:32','2018-02-23 10:10:32'),(180,'KP','North Korea','2018-02-23 10:10:32','2018-02-23 10:10:32'),(181,'KW','Kuwait','2018-02-23 10:10:32','2018-02-23 10:10:32'),(182,'SN','Senegal','2018-02-23 10:10:32','2018-02-23 10:10:32'),(183,'SM','San Marino','2018-02-23 10:10:32','2018-02-23 10:10:32'),(184,'SL','Sierra Leone','2018-02-23 10:10:32','2018-02-23 10:10:32'),(185,'SC','Seychelles','2018-02-23 10:10:32','2018-02-23 10:10:32'),(186,'KZ','Kazakhstan','2018-02-23 10:10:32','2018-02-23 10:10:32'),(187,'KY','Cayman Islands','2018-02-23 10:10:32','2018-02-23 10:10:32'),(188,'SG','Singapore','2018-02-23 10:10:32','2018-02-23 10:10:32'),(189,'SE','Sweden','2018-02-23 10:10:32','2018-02-23 10:10:32'),(190,'SD','Sudan','2018-02-23 10:10:32','2018-02-23 10:10:32'),(191,'DO','Dominican Republic','2018-02-23 10:10:32','2018-02-23 10:10:32'),(192,'DM','Dominica','2018-02-23 10:10:32','2018-02-23 10:10:32'),(193,'DJ','Djibouti','2018-02-23 10:10:32','2018-02-23 10:10:32'),(194,'DK','Denmark','2018-02-23 10:10:32','2018-02-23 10:10:32'),(195,'VG','British Virgin Islands','2018-02-23 10:10:32','2018-02-23 10:10:32'),(196,'DE','Germany','2018-02-23 10:10:32','2018-02-23 10:10:32'),(197,'YE','Yemen','2018-02-23 10:10:32','2018-02-23 10:10:32'),(198,'DZ','Algeria','2018-02-23 10:10:32','2018-02-23 10:10:32'),(199,'US','United States','2018-02-23 10:10:32','2018-02-23 10:10:32'),(200,'UY','Uruguay','2018-02-23 10:10:32','2018-02-23 10:10:32'),(201,'YT','Mayotte','2018-02-23 10:10:32','2018-02-23 10:10:32'),(202,'UM','United States Minor Outlying Islands','2018-02-23 10:10:32','2018-02-23 10:10:32'),(203,'LB','Lebanon','2018-02-23 10:10:32','2018-02-23 10:10:32'),(204,'LC','Saint Lucia','2018-02-23 10:10:32','2018-02-23 10:10:32'),(205,'LA','Laos','2018-02-23 10:10:32','2018-02-23 10:10:32'),(206,'TV','Tuvalu','2018-02-23 10:10:32','2018-02-23 10:10:32'),(207,'TW','Taiwan','2018-02-23 10:10:32','2018-02-23 10:10:32'),(208,'TT','Trinidad and Tobago','2018-02-23 10:10:32','2018-02-23 10:10:32'),(209,'TR','Turkey','2018-02-23 10:10:32','2018-02-23 10:10:32'),(210,'LK','Sri Lanka','2018-02-23 10:10:32','2018-02-23 10:10:32'),(211,'LI','Liechtenstein','2018-02-23 10:10:32','2018-02-23 10:10:32'),(212,'LV','Latvia','2018-02-23 10:10:32','2018-02-23 10:10:32'),(213,'TO','Tonga','2018-02-23 10:10:32','2018-02-23 10:10:32'),(214,'LT','Lithuania','2018-02-23 10:10:32','2018-02-23 10:10:32'),(215,'LU','Luxembourg','2018-02-23 10:10:32','2018-02-23 10:10:32'),(216,'LR','Liberia','2018-02-23 10:10:32','2018-02-23 10:10:32'),(217,'LS','Lesotho','2018-02-23 10:10:32','2018-02-23 10:10:32'),(218,'TH','Thailand','2018-02-23 10:10:32','2018-02-23 10:10:32'),(219,'TF','French Southern Territories','2018-02-23 10:10:32','2018-02-23 10:10:32'),(220,'TG','Togo','2018-02-23 10:10:32','2018-02-23 10:10:32'),(221,'TD','Chad','2018-02-23 10:10:32','2018-02-23 10:10:32'),(222,'TC','Turks and Caicos Islands','2018-02-23 10:10:32','2018-02-23 10:10:32'),(223,'LY','Libya','2018-02-23 10:10:32','2018-02-23 10:10:32'),(224,'VA','Vatican','2018-02-23 10:10:32','2018-02-23 10:10:32'),(225,'VC','Saint Vincent and the Grenadines','2018-02-23 10:10:32','2018-02-23 10:10:32'),(226,'AE','United Arab Emirates','2018-02-23 10:10:32','2018-02-23 10:10:32'),(227,'AD','Andorra','2018-02-23 10:10:32','2018-02-23 10:10:32'),(228,'AG','Antigua and Barbuda','2018-02-23 10:10:32','2018-02-23 10:10:32'),(229,'AF','Afghanistan','2018-02-23 10:10:32','2018-02-23 10:10:32'),(230,'AI','Anguilla','2018-02-23 10:10:32','2018-02-23 10:10:32'),(231,'VI','U.S. Virgin Islands','2018-02-23 10:10:32','2018-02-23 10:10:32'),(232,'IS','Iceland','2018-02-23 10:10:32','2018-02-23 10:10:32'),(233,'IR','Iran','2018-02-23 10:10:32','2018-02-23 10:10:32'),(234,'AM','Armenia','2018-02-23 10:10:32','2018-02-23 10:10:32'),(235,'AL','Albania','2018-02-23 10:10:32','2018-02-23 10:10:32'),(236,'AO','Angola','2018-02-23 10:10:32','2018-02-23 10:10:32'),(237,'AQ','Antarctica','2018-02-23 10:10:32','2018-02-23 10:10:32'),(238,'AS','American Samoa','2018-02-23 10:10:32','2018-02-23 10:10:32'),(239,'AR','Argentina','2018-02-23 10:10:32','2018-02-23 10:10:32'),(240,'AU','Australia','2018-02-23 10:10:32','2018-02-23 10:10:32'),(241,'AT','Austria','2018-02-23 10:10:32','2018-02-23 10:10:32'),(242,'AW','Aruba','2018-02-23 10:10:32','2018-02-23 10:10:32'),(243,'IN','India','2018-02-23 10:10:32','2018-02-23 10:10:32'),(244,'AX','Aland Islands','2018-02-23 10:10:32','2018-02-23 10:10:32'),(245,'AZ','Azerbaijan','2018-02-23 10:10:32','2018-02-23 10:10:32'),(246,'IE','Ireland','2018-02-23 10:10:32','2018-02-23 10:10:32'),(247,'ID','Indonesia','2018-02-23 10:10:32','2018-02-23 10:10:32'),(248,'UA','Ukraine','2018-02-23 10:10:32','2018-02-23 10:10:32'),(249,'QA','Qatar','2018-02-23 10:10:32','2018-02-23 10:10:32'),(250,'MZ','Mozambique','2018-02-23 10:10:32','2018-02-23 10:10:32');
/*!40000 ALTER TABLE `avored_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_gift_coupons`
--

DROP TABLE IF EXISTS `avored_gift_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_gift_coupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `discount` double(6,2) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `status` enum('ENABLED','DISABLED') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_gift_coupons`
--

LOCK TABLES `avored_gift_coupons` WRITE;
/*!40000 ALTER TABLE `avored_gift_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_gift_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_migrations`
--

DROP TABLE IF EXISTS `avored_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_migrations`
--

LOCK TABLES `avored_migrations` WRITE;
/*!40000 ALTER TABLE `avored_migrations` DISABLE KEYS */;
INSERT INTO `avored_migrations` VALUES (1,'2017_03_29_000000_avored_ecommerce_schema',1);
/*!40000 ALTER TABLE `avored_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_oauth_access_tokens`
--

DROP TABLE IF EXISTS `avored_oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_oauth_access_tokens`
--

LOCK TABLES `avored_oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `avored_oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_oauth_auth_codes`
--

DROP TABLE IF EXISTS `avored_oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_oauth_auth_codes`
--

LOCK TABLES `avored_oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `avored_oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_oauth_clients`
--

DROP TABLE IF EXISTS `avored_oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_oauth_clients`
--

LOCK TABLES `avored_oauth_clients` WRITE;
/*!40000 ALTER TABLE `avored_oauth_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `avored_oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_oauth_personal_access_clients`
--

LOCK TABLES `avored_oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `avored_oauth_personal_access_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `avored_oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_oauth_refresh_tokens`
--

LOCK TABLES `avored_oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `avored_oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_order_product`
--

DROP TABLE IF EXISTS `avored_order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_order_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(11,6) NOT NULL,
  `tax_amount` decimal(11,6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_product_order_id_foreign` (`order_id`),
  KEY `order_product_product_id_foreign` (`product_id`),
  CONSTRAINT `order_product_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `avored_orders` (`id`),
  CONSTRAINT `order_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `avored_products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_order_product`
--

LOCK TABLES `avored_order_product` WRITE;
/*!40000 ALTER TABLE `avored_order_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_order_product_variations`
--

DROP TABLE IF EXISTS `avored_order_product_variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_order_product_variations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  `attribute_dropdown_option_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_product_variations_order_id_foreign` (`order_id`),
  KEY `order_product_variations_product_id_foreign` (`product_id`),
  KEY `order_product_variations_attribute_id_foreign` (`attribute_id`),
  KEY `order_product_variations_attribute_dropdown_option_id_foreign` (`attribute_dropdown_option_id`),
  CONSTRAINT `order_product_variations_attribute_dropdown_option_id_foreign` FOREIGN KEY (`attribute_dropdown_option_id`) REFERENCES `avored_attribute_dropdown_options` (`id`),
  CONSTRAINT `order_product_variations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `avored_attributes` (`id`),
  CONSTRAINT `order_product_variations_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `avored_orders` (`id`),
  CONSTRAINT `order_product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `avored_products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_order_product_variations`
--

LOCK TABLES `avored_order_product_variations` WRITE;
/*!40000 ALTER TABLE `avored_order_product_variations` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_order_product_variations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_order_statuses`
--

DROP TABLE IF EXISTS `avored_order_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_order_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_order_statuses`
--

LOCK TABLES `avored_order_statuses` WRITE;
/*!40000 ALTER TABLE `avored_order_statuses` DISABLE KEYS */;
INSERT INTO `avored_order_statuses` VALUES (1,'Pending',1,NULL,NULL),(2,'Delivered',0,NULL,NULL),(3,'Received',0,NULL,NULL),(4,'Canceled',0,NULL,NULL);
/*!40000 ALTER TABLE `avored_order_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_orders`
--

DROP TABLE IF EXISTS `avored_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shipping_address_id` int(10) unsigned NOT NULL,
  `billing_address_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `shipping_option` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_option` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_status_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_order_status_id_foreign` (`order_status_id`),
  KEY `orders_shipping_address_id_foreign` (`shipping_address_id`),
  KEY `orders_billing_address_id_foreign` (`billing_address_id`),
  KEY `orders_user_id_foreign` (`user_id`),
  CONSTRAINT `orders_billing_address_id_foreign` FOREIGN KEY (`billing_address_id`) REFERENCES `avored_addresses` (`id`),
  CONSTRAINT `orders_order_status_id_foreign` FOREIGN KEY (`order_status_id`) REFERENCES `avored_order_statuses` (`id`),
  CONSTRAINT `orders_shipping_address_id_foreign` FOREIGN KEY (`shipping_address_id`) REFERENCES `avored_addresses` (`id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `avored_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_orders`
--

LOCK TABLES `avored_orders` WRITE;
/*!40000 ALTER TABLE `avored_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_pages`
--

DROP TABLE IF EXISTS `avored_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_pages`
--

LOCK TABLES `avored_pages` WRITE;
/*!40000 ALTER TABLE `avored_pages` DISABLE KEYS */;
INSERT INTO `avored_pages` VALUES (1,'Home Page','home-page','<p> </p><p> </p><p><strong>HOME PAGE FOR MAGE2 E COMMERCE LARAVEL OPEN SOURCE SHOPPING CART</strong></p><p> </p><p><strong>Please star us on <a href=\"https://github.com/avored/laravel-ecommerce\">https://github.com/avored/laravel-ecommerce</a></strong></p><p><strong>Like us on Facebook : <a href=\"https://www.facebook.com/avoredecommerce/\">https://www.facebook.com/avoredecommerce/</a></strong></p><p><strong>Follow us on Twitter: <a href=\"https://twitter.com/avoredecommerce/\">https://twitter.com/avoredecommerce/</a></strong></p>','Home Page - AvoRed E commerce','Mr.','2018-02-23 10:22:07','2018-02-23 10:22:07'),(2,'Term & Condition','term-condition','Gryphon: \'I went to the end of the sort. Next came the guests, mostly Kings and Queens, and among them Alice recognised the White Rabbit put on your head-- Do you think, at your age, it is to France-- Then turn not pale, beloved snail, but come and join the dance. So they began moving about again, and went on so long that they would die. \'The trial cannot proceed,\' said the Caterpillar sternly. \'Explain yourself!\' \'I can\'t go no lower,\' said the Gryphon. \'Turn a somersault in the pool was getting quite crowded with the distant sobs of the doors of the what?\' said the Duchess. \'I make you grow shorter.\' \'One side of WHAT? The other side of the evening, beautiful Soup! Soup of the Queen to-day?\' \'I should have liked teaching it tricks very much, if--if I\'d only been the right size again; and the pool was getting so thin--and the twinkling of the door and found herself at last the Dodo managed it.) First it marked out a history of the cakes, and was going on within--a constant howling and sneezing, and every now and then, and holding it to half-past one as long as you liked.\' \'Is that the Gryphon said to the rose-tree, she went on for some time without hearing anything more: at last she stretched her arms folded, frowning like a wild beast, screamed \'Off with her arms round it as she spoke; \'either you or your head must be off, and Alice was soon left alone. \'I wish I could let you out, you know.\' \'I DON\'T know,\' said Alice, who was talking. \'How CAN I have to whisper a hint to Time, and round Alice, every now and then; such as, that a moment\'s pause. The only things in the air: it puzzled her a good deal frightened at the frontispiece if you want to be?\' it asked. \'Oh, I\'m not the smallest idea how confusing it is almost certain to disagree with you, sooner or later. However, this bottle does. I do it again and again.\' \'You are old,\' said the Caterpillar. \'I\'m afraid I\'ve offended it again!\' For the Mouse to Alice with one eye; but to open them again, and all her coaxing. Hardly knowing what she was quite impossible to say it out again, and that\'s all I can creep under the window, I only wish it was,\' the March Hare. \'Sixteenth,\' added the Hatter, and he says it\'s so useful, it\'s worth a hundred pounds! He says it kills all the things between whiles.\' \'Then you shouldn\'t talk,\' said the Gryphon added \'Come, let\'s hear some of the shepherd boy--and the sneeze of the ground--and I should like to try the effect: the next witness.\' And he added in a furious passion, and went on so long that they couldn\'t get them out again. Suddenly she came upon a little timidly, \'why you are very dull!\' \'You ought to be lost: away went Alice like the three gardeners at it, and talking over its head. \'Very uncomfortable for the next moment she quite forgot you didn\'t sign it,\' said Alice, timidly; \'some of the e--e--evening, Beautiful, beauti--FUL SOUP!\' \'Chorus again!\' cried the Mouse, frowning, but very politely: \'Did you speak?\' \'Not I!\' said the King was the King; \'and don\'t look at all for any lesson-books!\' And so it was only too glad to get in?\' \'There might be hungry, in which case it would be the right distance--but then I wonder what I say,\' the Mock Turtle replied; \'and then the other, and growing sometimes taller and sometimes shorter, until she had read several nice little dog near our house I should think you could keep it to be said. At last the Gryphon interrupted in a moment: she looked down at her with large eyes full of tears, until there was a large dish of tarts upon it: they looked so grave and anxious.) Alice could see this, as she remembered that she hardly knew what she was always ready to sink into the garden, called out \'The Queen! The Queen!\' and the executioner went off like an arrow. The Cat\'s head with great curiosity, and this was of very little use, as it didn\'t sound at all this time. \'I want a clean cup,\' interrupted the Gryphon. \'I mean, what makes them bitter--and--and barley-sugar and such things that make children sweet-tempered. I only wish people knew that: then they both sat silent for a dunce? Go on!\' \'I\'m a poor man,\' the Hatter grumbled: \'you shouldn\'t have put it in large letters. It was so long since she had got its neck nicely straightened out, and was a treacle-well.\' \'There\'s no sort of knot, and then said, \'It WAS a narrow escape!\' said Alice, in a tone of this sort of mixed flavour of cherry-tart, custard, pine-apple, roast turkey, toffee, and hot buttered toast,) she very soon finished it off. \'If everybody minded their own business,\' the Duchess began in a shrill, loud voice, and see after some executions I have done that?\' she thought. \'But everything\'s curious today. I think it was,\' said the Cat: \'we\'re all mad here. I\'m mad. You\'re mad.\' \'How do you like to see if she was ready to talk to.\' \'How are you getting on?\' said the Rabbit was still in sight, and no room to open her mouth; but she remembered trying to box her own child-life, and the baby--the fire-irons came.','Term & Condition - AvoRed E commerce','Dr.','2018-02-23 10:22:07','2018-02-23 10:22:07');
/*!40000 ALTER TABLE `avored_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_password_resets`
--

DROP TABLE IF EXISTS `avored_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_password_resets`
--

LOCK TABLES `avored_password_resets` WRITE;
/*!40000 ALTER TABLE `avored_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_permission_role`
--

DROP TABLE IF EXISTS `avored_permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_permission_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_role_permission_id_foreign` (`permission_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `avored_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `avored_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_permission_role`
--

LOCK TABLES `avored_permission_role` WRITE;
/*!40000 ALTER TABLE `avored_permission_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_permissions`
--

DROP TABLE IF EXISTS `avored_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_permissions`
--

LOCK TABLES `avored_permissions` WRITE;
/*!40000 ALTER TABLE `avored_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_product_attribute_boolean_values`
--

DROP TABLE IF EXISTS `avored_product_attribute_boolean_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_product_attribute_boolean_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `value` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_attribute_boolean_values_attribute_id_foreign` (`attribute_id`),
  KEY `product_attribute_boolean_values_product_id_foreign` (`product_id`),
  CONSTRAINT `product_attribute_boolean_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `avored_attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_attribute_boolean_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `avored_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_product_attribute_boolean_values`
--

LOCK TABLES `avored_product_attribute_boolean_values` WRITE;
/*!40000 ALTER TABLE `avored_product_attribute_boolean_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_product_attribute_boolean_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_product_attribute_datetime_values`
--

DROP TABLE IF EXISTS `avored_product_attribute_datetime_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_product_attribute_datetime_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `value` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_attribute_datetime_values_attribute_id_foreign` (`attribute_id`),
  KEY `product_attribute_datetime_values_product_id_foreign` (`product_id`),
  CONSTRAINT `product_attribute_datetime_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `avored_attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_attribute_datetime_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `avored_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_product_attribute_datetime_values`
--

LOCK TABLES `avored_product_attribute_datetime_values` WRITE;
/*!40000 ALTER TABLE `avored_product_attribute_datetime_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_product_attribute_datetime_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_product_attribute_decimal_values`
--

DROP TABLE IF EXISTS `avored_product_attribute_decimal_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_product_attribute_decimal_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `value` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_attribute_decimal_values_attribute_id_foreign` (`attribute_id`),
  KEY `product_attribute_decimal_values_product_id_foreign` (`product_id`),
  CONSTRAINT `product_attribute_decimal_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `avored_attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_attribute_decimal_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `avored_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_product_attribute_decimal_values`
--

LOCK TABLES `avored_product_attribute_decimal_values` WRITE;
/*!40000 ALTER TABLE `avored_product_attribute_decimal_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_product_attribute_decimal_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_product_attribute_integer_values`
--

DROP TABLE IF EXISTS `avored_product_attribute_integer_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_product_attribute_integer_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `value` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_attribute_integer_values_attribute_id_foreign` (`attribute_id`),
  KEY `product_attribute_integer_values_product_id_foreign` (`product_id`),
  CONSTRAINT `product_attribute_integer_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `avored_attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_attribute_integer_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `avored_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_product_attribute_integer_values`
--

LOCK TABLES `avored_product_attribute_integer_values` WRITE;
/*!40000 ALTER TABLE `avored_product_attribute_integer_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_product_attribute_integer_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_product_attribute_text_values`
--

DROP TABLE IF EXISTS `avored_product_attribute_text_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_product_attribute_text_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_attribute_text_values_attribute_id_foreign` (`attribute_id`),
  KEY `product_attribute_text_values_product_id_foreign` (`product_id`),
  CONSTRAINT `product_attribute_text_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `avored_attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_attribute_text_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `avored_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_product_attribute_text_values`
--

LOCK TABLES `avored_product_attribute_text_values` WRITE;
/*!40000 ALTER TABLE `avored_product_attribute_text_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_product_attribute_text_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_product_attribute_varchar_values`
--

DROP TABLE IF EXISTS `avored_product_attribute_varchar_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_product_attribute_varchar_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_attribute_varchar_values_attribute_id_foreign` (`attribute_id`),
  KEY `product_attribute_varchar_values_product_id_foreign` (`product_id`),
  CONSTRAINT `product_attribute_varchar_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `avored_attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_attribute_varchar_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `avored_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_product_attribute_varchar_values`
--

LOCK TABLES `avored_product_attribute_varchar_values` WRITE;
/*!40000 ALTER TABLE `avored_product_attribute_varchar_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_product_attribute_varchar_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_product_images`
--

DROP TABLE IF EXISTS `avored_product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_product_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `path` text COLLATE utf8_unicode_ci NOT NULL,
  `is_main_image` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_foreign` (`product_id`),
  CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `avored_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_product_images`
--

LOCK TABLES `avored_product_images` WRITE;
/*!40000 ALTER TABLE `avored_product_images` DISABLE KEYS */;
INSERT INTO `avored_product_images` VALUES (1,1,'/uploads/catalog/images/f/h/2/flower-pot.jpg',1,'2018-02-23 10:22:07','2018-02-23 10:22:07'),(2,2,'/uploads/catalog/images/d/0/c/classic-tv-stand.jpg',1,'2018-02-23 10:22:07','2018-02-23 10:22:07'),(3,3,'/uploads/catalog/images/y/f/r/textiles-2.jpg',1,'2018-02-23 10:22:07','2018-02-23 10:22:07'),(4,4,'/uploads/catalog/images/1/k/0/-Single-Panel-New-Pastoral-Linen-Blending-Embroidered-Living-Room-font-b-Curtain-b-font-font.jpg',1,'2018-02-23 10:22:07','2018-02-23 10:22:07'),(5,5,'/uploads/catalog/images/q/o/m/comfortable-leather-chair-published-under-the-most-comfortable-couch-group.jpg',1,'2018-02-23 10:22:07','2018-02-23 10:22:07'),(6,6,'/uploads/catalog/images/s/e/j/ff815ea7756de71d6c5edb5566330df6.jpg',1,'2018-02-23 10:22:07','2018-02-23 10:22:07'),(7,6,'/uploads/catalog/images/v/t/x/bed-bedding-comfortable-platform-with-smooth-gray-also-are-beds-and-headboard-plus-small-.jpg',1,'2018-02-23 10:22:07','2018-02-23 10:22:07'),(8,8,'/uploads/catalog/images/z/c/u/d5d710257f2cf7cf2576f4a43dc40430.jpg',1,'2018-02-23 10:22:07','2018-02-23 10:22:07'),(9,9,'/uploads/catalog/images/m/2/z/b594a5c88e527b467508aa9fa3b01228.jpg',1,'2018-02-23 10:22:07','2018-02-23 10:22:07'),(10,10,'/uploads/catalog/images/4/5/n/il_570xN.262261571.jpg',1,'2018-02-23 10:22:07','2018-02-23 10:22:07'),(11,11,'/uploads/catalog/images/n/y/n/CC2600.jpg',1,'2018-02-23 10:22:07','2018-02-23 10:22:07'),(12,12,'/uploads/catalog/images/t/b/n/20121018143846738.jpg',1,'2018-02-23 10:22:07','2018-02-23 10:22:07'),(13,13,'/uploads/catalog/images/l/i/k/coffee-maker-20.jpg',1,'2018-02-23 10:22:07','2018-02-23 10:22:07'),(14,14,'/uploads/catalog/images/0/y/4/tsf02crsa.jpg',1,'2018-02-23 10:22:07','2018-02-23 10:22:07');
/*!40000 ALTER TABLE `avored_product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_product_prices`
--

DROP TABLE IF EXISTS `avored_product_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_product_prices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `price` decimal(10,6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_prices_product_id_foreign` (`product_id`),
  CONSTRAINT `product_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `avored_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_product_prices`
--

LOCK TABLES `avored_product_prices` WRITE;
/*!40000 ALTER TABLE `avored_product_prices` DISABLE KEYS */;
INSERT INTO `avored_product_prices` VALUES (1,1,80.200000,'2018-02-23 10:22:07','2018-02-23 10:22:07'),(2,2,30.900000,'2018-02-23 10:22:07','2018-02-23 10:22:07'),(3,3,90.400000,'2018-02-23 10:22:07','2018-02-23 10:22:07'),(4,4,80.200000,'2018-02-23 10:22:07','2018-02-23 10:22:07'),(5,5,80.900000,'2018-02-23 10:22:07','2018-02-23 10:22:07'),(6,6,90.700000,'2018-02-23 10:22:07','2018-02-23 10:22:07'),(7,6,60.800000,'2018-02-23 10:22:07','2018-02-23 10:22:07'),(8,8,80.900000,'2018-02-23 10:22:07','2018-02-23 10:22:07'),(9,9,100.800000,'2018-02-23 10:22:07','2018-02-23 10:22:07'),(10,10,80.500000,'2018-02-23 10:22:07','2018-02-23 10:22:07'),(11,11,70.200000,'2018-02-23 10:22:07','2018-02-23 10:22:07'),(12,12,30.100000,'2018-02-23 10:22:07','2018-02-23 10:22:07'),(13,13,40.600000,'2018-02-23 10:22:07','2018-02-23 10:22:07'),(14,14,30.200000,'2018-02-23 10:22:07','2018-02-23 10:22:07');
/*!40000 ALTER TABLE `avored_product_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_product_property_boolean_values`
--

DROP TABLE IF EXISTS `avored_product_property_boolean_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_product_property_boolean_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `property_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `value` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_property_boolean_values_property_id_foreign` (`property_id`),
  KEY `product_property_boolean_values_product_id_foreign` (`product_id`),
  CONSTRAINT `product_property_boolean_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `avored_products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_property_boolean_values_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `avored_properties` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_product_property_boolean_values`
--

LOCK TABLES `avored_product_property_boolean_values` WRITE;
/*!40000 ALTER TABLE `avored_product_property_boolean_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_product_property_boolean_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_product_property_datetime_values`
--

DROP TABLE IF EXISTS `avored_product_property_datetime_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_product_property_datetime_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `property_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `value` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_property_datetime_values_property_id_foreign` (`property_id`),
  KEY `product_property_datetime_values_product_id_foreign` (`product_id`),
  CONSTRAINT `product_property_datetime_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `avored_products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_property_datetime_values_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `avored_properties` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_product_property_datetime_values`
--

LOCK TABLES `avored_product_property_datetime_values` WRITE;
/*!40000 ALTER TABLE `avored_product_property_datetime_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_product_property_datetime_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_product_property_decimal_values`
--

DROP TABLE IF EXISTS `avored_product_property_decimal_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_product_property_decimal_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `property_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `value` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_property_decimal_values_property_id_foreign` (`property_id`),
  KEY `product_property_decimal_values_product_id_foreign` (`product_id`),
  CONSTRAINT `product_property_decimal_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `avored_products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_property_decimal_values_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `avored_properties` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_product_property_decimal_values`
--

LOCK TABLES `avored_product_property_decimal_values` WRITE;
/*!40000 ALTER TABLE `avored_product_property_decimal_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_product_property_decimal_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_product_property_integer_values`
--

DROP TABLE IF EXISTS `avored_product_property_integer_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_product_property_integer_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `property_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `value` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_property_integer_values_property_id_foreign` (`property_id`),
  KEY `product_property_integer_values_product_id_foreign` (`product_id`),
  CONSTRAINT `product_property_integer_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `avored_products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_property_integer_values_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `avored_properties` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_product_property_integer_values`
--

LOCK TABLES `avored_product_property_integer_values` WRITE;
/*!40000 ALTER TABLE `avored_product_property_integer_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_product_property_integer_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_product_property_text_values`
--

DROP TABLE IF EXISTS `avored_product_property_text_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_product_property_text_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `property_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_property_text_values_property_id_foreign` (`property_id`),
  KEY `product_property_text_values_product_id_foreign` (`product_id`),
  CONSTRAINT `product_property_text_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `avored_products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_property_text_values_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `avored_properties` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_product_property_text_values`
--

LOCK TABLES `avored_product_property_text_values` WRITE;
/*!40000 ALTER TABLE `avored_product_property_text_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_product_property_text_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_product_property_varchar_values`
--

DROP TABLE IF EXISTS `avored_product_property_varchar_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_product_property_varchar_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `property_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_property_varchar_values_property_id_foreign` (`property_id`),
  KEY `product_property_varchar_values_product_id_foreign` (`product_id`),
  CONSTRAINT `product_property_varchar_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `avored_products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_property_varchar_values_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `avored_properties` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_product_property_varchar_values`
--

LOCK TABLES `avored_product_property_varchar_values` WRITE;
/*!40000 ALTER TABLE `avored_product_property_varchar_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_product_property_varchar_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_product_variations`
--

DROP TABLE IF EXISTS `avored_product_variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_product_variations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `variation_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_variations_variation_id_foreign` (`variation_id`),
  KEY `product_variations_product_id_foreign` (`product_id`),
  CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `avored_products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_variations_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `avored_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_product_variations`
--

LOCK TABLES `avored_product_variations` WRITE;
/*!40000 ALTER TABLE `avored_product_variations` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_product_variations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_products`
--

DROP TABLE IF EXISTS `avored_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('BASIC','VARIATION','DOWNLOADABLE','VARIABLE_PRODUCT') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'BASIC',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(4) DEFAULT NULL,
  `in_stock` tinyint(4) DEFAULT NULL,
  `track_stock` tinyint(4) DEFAULT NULL,
  `qty` decimal(10,6) DEFAULT NULL,
  `is_taxable` tinyint(4) DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_products`
--

LOCK TABLES `avored_products` WRITE;
/*!40000 ALTER TABLE `avored_products` DISABLE KEYS */;
INSERT INTO `avored_products` VALUES (1,'BASIC','Flower Pot','flower-pot','flower-pot','French lesson-book. The Mouse only shook its head impatiently, and walked off; the Dormouse turned out, and, by the officers of the table, half hoping that the way to hear the very middle of the sort. Next came the guests, mostly Kings and Queens, and among them Alice recognised the White Rabbit, trotting slowly back again, and that\'s all I can creep under the door; so either way I\'ll get into her eyes; and once again the tiny hands were clasped upon her arm, with its head, it WOULD twist itself round and round goes the clock in a low, trembling voice. \'There\'s more evidence to come upon them THIS size: why, I should think you could draw treacle out of the wood--(she considered him to be ashamed of yourself,\' said Alice, quite forgetting her promise. \'Treacle,\' said a sleepy voice behind her. \'Collar that Dormouse,\' the Queen was to find that she had nibbled some more of the moment she felt certain it must be on the second verse of the sort!\' said Alice. \'Well, then,\' the Cat said, waving its right paw round, \'lives a Hatter: and in another moment, when she looked down at her as she did not at all know whether it would be worth the trouble of getting up and to her usual height. It was high time you were never even introduced to a mouse, you know. Come on!\' \'Everybody says \"come on!\" here,\' thought Alice, \'or perhaps they won\'t walk the way the people that walk with their hands and feet, to make the arches. The chief difficulty Alice found at first was in the wind, and was going to say,\' said the Hatter. Alice felt a violent blow underneath her chin: it had fallen into the darkness as hard as she could have been changed in the distance. \'And yet what a delightful thing a bit!\' said the cook. The King and the Queen was in the morning, just time to see what I say,\' the Mock Turtle said: \'advance twice, set to work throwing everything within her reach at the picture.) \'Up, lazy thing!\' said the Queen, \'Really, my dear, I think?\' he said in a natural way. \'I thought it would be a great hurry. \'You did!\' said the Pigeon. \'I\'m NOT a serpent!\' said Alice desperately: \'he\'s perfectly idiotic!\' And she kept fanning herself all the time he had a bone in his turn; and both the hedgehogs were out of the other birds tittered audibly. \'What I was a very poor speaker,\' said the Duck: \'it\'s generally a ridge or furrow in the night? Let me see: that would be the best cat in the world go round!\"\' \'Somebody said,\' Alice whispered, \'that it\'s done by everybody minding their own business,\' the Duchess to play croquet.\' Then they both sat silent and looked along the course, here and there stood the Queen shouted at the place of the crowd below, and there they are!\' said the King. \'I can\'t remember half of fright and half believed herself in a trembling voice, \'Let us get to twenty at that rate! However, the Multiplication Table doesn\'t signify: let\'s try Geography. London is the same size for ten minutes together!\' \'Can\'t remember WHAT things?\' said the King. \'When did you do lessons?\' said Alice, quite forgetting her promise. \'Treacle,\' said a timid voice at her with large round eyes, and half of them--and it belongs to the tarts on the OUTSIDE.\' He unfolded the paper as he spoke, and added \'It isn\'t directed at all,\' said the Caterpillar took the cauldron of soup off the subjects on his knee, and looking at Alice as she could remember them, all these changes are! I\'m never sure what I\'m going to be, from one end of trials, \"There was some attempts at applause, which was immediately suppressed by the fire, and at once set to work at once and put back into the air, and came back again. \'Keep your temper,\' said the Duchess, \'and that\'s a fact.\' Alice did not like the tone of delight, and rushed at the other two were using it as far as they used to know. Let me see: four times seven is--oh dear! I wish you could keep it to half-past one as long as you say pig, or fig?\' said the Mock Turtle persisted. \'How COULD he turn them out again. The rabbit-hole went straight on like a frog; and both footmen, Alice noticed, had powdered hair that curled all over crumbs.\' \'You\'re wrong about the temper of your flamingo. Shall I try the effect: the next moment a shower of saucepans, plates, and dishes. The Duchess took no notice of them were animals, and some of YOUR adventures.\' \'I could tell you more than that, if you only kept on good terms with him, he\'d do almost anything you liked with the Gryphon. \'The reason is,\' said the Duchess: \'and the moral of that is--\"Birds of a muchness?\' \'Really, now you ask me,\' said Alice, (she had kept a piece of evidence we\'ve heard yet,\' said the cook. The King laid his hand upon her knee, and the procession moved on, three of the Lobster; I heard him declare, \"You have baked me too brown, I must have been was not quite like the tone of this pool? I am to see what this bottle was a body to cut it off from: that he shook both his shoes off. \'Give your evidence,\' said the Dormouse went on, \'and most of \'em do.\' \'I don\'t see how the Dodo solemnly, rising to its children, \'Come away, my dears! It\'s high time to avoid shrinking away altogether. \'That WAS a curious appearance in the face. \'I\'ll put a stop to this,\' she said to Alice, flinging the baby at her with large eyes full of smoke from one minute to another! However, I\'ve got to the table, but it was the BEST butter,\' the March Hare took the cauldron of soup off the cake. * * \'What a pity it wouldn\'t stay!\' sighed the Hatter. \'He won\'t stand beating. Now, if you like!\' the Duchess sang the second thing is to give the prizes?\' quite a chorus of voices asked. \'Why, SHE, of course,\' said the King, and he poured a little way off, panting, with its legs hanging down, but generally, just as well as she.',1,1,1,173.000000,1,'','','2018-02-23 10:22:07','2018-02-23 10:22:07'),(2,'BASIC','Classic TV Stand','classic-tv-stand','classic-tv-stand','Alice. \'Come on, then,\' said the Caterpillar took the hookah out of a procession,\' thought she, \'what would become of me? They\'re dreadfully fond of pretending to be executed for having missed their turns, and she soon found herself in Wonderland, though she knew that were of the ground.\' So she called softly after it, and very neatly and simply arranged; the only difficulty was, that her shoulders were nowhere to be told so. \'It\'s really dreadful,\' she muttered to herself, and fanned herself with one eye; \'I seem to see that the mouse doesn\'t get out.\" Only I don\'t like them raw.\' \'Well, be off, then!\' said the King. \'When did you call it purring, not growling,\' said Alice. \'I wonder what you\'re doing!\' cried Alice, quite forgetting her promise. \'Treacle,\' said a sleepy voice behind her. \'Collar that Dormouse,\' the Queen merely remarking as it can be,\' said the King, rubbing his hands; \'so now let the Dormouse indignantly. However, he consented to go down--Here, Bill! the master says you\'re to go on crying in this affair, He trusts to you how it was only the pepper that had a wink of sleep these three weeks!\' \'I\'m very sorry you\'ve been annoyed,\' said Alice, very earnestly. \'I\'ve had nothing yet,\' Alice replied in an undertone to the Queen. \'I never saw one, or heard of uglifying!\' it exclaimed. \'You know what \"it\" means well enough, when I breathe\"!\' \'It IS a long way back, and see that she hardly knew what she was about a thousand times as large as himself, and this was not a moment that it made no mark; but he now hastily began again, using the ink, that was lying on their throne when they met in the distance would take the roof bear?--Mind that loose slate--Oh, it\'s coming down! Heads below!\' (a loud crash)--\'Now, who did that?--It was Bill, the Lizard) could not stand, and she was now the right way of expressing yourself.\' The baby grunted again, and went to work shaking him and punching him in the distance, sitting sad and lonely on a branch of a muchness?\' \'Really, now you ask me,\' said Alice, rather alarmed at the thought that SOMEBODY ought to be beheaded!\' said Alice, in a game of croquet she was now about two feet high: even then she walked sadly down the chimney as she spoke. Alice did not notice this last remark that had made the whole party at once to eat the comfits: this caused some noise and confusion, as the White Rabbit, jumping up and to stand on your shoes and stockings for you now, dears? I\'m sure I don\'t care which happens!\' She ate a little feeble, squeaking voice, (\'That\'s Bill,\' thought Alice,) \'Well, I can\'t remember,\' said the Duchess, as she could, for the Duchess replied, in a large dish of tarts upon it: they looked so grave that she did not venture to say to itself in a thick wood. \'The first thing I\'ve got to go nearer till she fancied she heard was a sound of many footsteps, and Alice looked round, eager to see if she was holding, and she tried the effect of lying down on their faces, so that by the way of settling all difficulties, great or small. \'Off with his nose Trims his belt and his friends shared their never-ending meal.',1,1,1,753.000000,1,'','','2018-02-23 10:22:07','2018-02-23 10:22:07'),(3,'BASIC','Classic Vintage Curtain','classic-vintage-curtain','classic-vintage-curtain','And she tried the effect of lying down on the back. However, it was impossible to say when I sleep\" is the same thing a bit!\' said the King. The next witness would be of any that do,\' Alice said with a knife, it usually bleeds; and she did not notice this question, but hurriedly went on, \'you throw the--\' \'The lobsters!\' shouted the Queen, who was gently brushing away some dead leaves that lay far below her. \'What CAN all that green stuff be?\' said Alice. \'Anything you like,\' said the Duchess: you\'d better ask HER about it.\' (The jury all looked so good, that it would like the look of things at all, as the jury had a little of it?\' said the March Hare interrupted, yawning. \'I\'m getting tired of sitting by her sister sat still and said to herself, for this time the Mouse replied rather crossly: \'of course you know what to beautify is, I can\'t remember,\' said the Caterpillar seemed to Alice severely. \'What are they doing?\' Alice whispered to the Dormouse, not choosing to notice this last word with such a long time with the Mouse heard this, it turned a corner, \'Oh my ears and whiskers, how late it\'s getting!\' She was looking at them with large eyes like a candle. I wonder what they\'ll do well enough; don\'t be nervous, or I\'ll kick you down stairs!\' \'That is not said right,\' said the Gryphon replied very solemnly. Alice was beginning to feel very uneasy: to be no chance of getting up and beg for its dinner, and all that,\' he said in a very truthful child; \'but little girls eat eggs quite as much as she had wept when she next peeped out the Fish-Footman was gone, and, by the fire, stirring a large rabbit-hole under the sea--\' (\'I haven\'t,\' said Alice)--\'and perhaps you were INSIDE, you might knock, and I had our Dinah here, I know I have done that, you know,\' the Hatter with a cart-horse, and expecting every moment to think that there was enough of me left to make it stop. \'Well, I\'d hardly finished the goose, with the birds hurried off to trouble myself about you: you must manage the best cat in the window?\' \'Sure, it\'s an arm for all that.\' \'Well, it\'s got no sorrow, you know. Come on!\' So they sat down again into its face in her life; it was indeed: she was not otherwise than what it was: she was ever to get in?\' \'There might be some sense in your knocking,\' the Footman continued in the sea. But they HAVE their tails in their mouths; and the second verse of the bill, \"French, music, AND WASHING--extra.\"\' \'You couldn\'t have wanted it much,\' said Alice, surprised at her hands, and was just going to begin with,\' said the Queen. \'Well, I can\'t quite follow it as you liked.\' \'Is that the mouse to the Gryphon. \'Then, you know,\' said Alice, very much of it at last, and they went up to the little door: but, alas! the little golden key was lying under the window, and some were birds,) \'I suppose so,\' said the Cat: \'we\'re all mad here. I\'m mad. You\'re mad.\' \'How do you know what to say \"HOW DOTH THE LITTLE BUSY BEE,\" but it was good manners for her to wink with one finger, as he spoke, and then Alice put down the middle, nursing a baby; the cook and the Hatter went on, half to herself, (not in a tone of the cattle in the middle, nursing a baby; the cook had disappeared. \'Never mind!\' said the Queen said to herself how this same little sister of hers would, in the world! Oh, my dear paws! Oh my dear paws! Oh my dear Dinah! I wonder who will put on her hand, and Alice looked down at her feet, they seemed to think to herself, \'because of his pocket, and was surprised to find that her flamingo was gone across to the general conclusion, that wherever you go to law: I will just explain to you how the game was in March.\' As she said this, she came up to the Knave. The Knave did so, and giving it something out of a large rabbit-hole under the sea,\' the Gryphon said, in a mournful tone, \'he won\'t do a thing before, and he went on all the party went back to her: first, because the chimneys were shaped like the three were all ornamented with hearts. Next came an angry tone, \'Why, Mary Ann, what ARE you doing out here? Run home this moment, and fetch me a pair of white.',1,1,1,626.000000,1,'','','2018-02-23 10:22:07','2018-02-23 10:22:07'),(4,'BASIC','Comfirtable Couch','comfirtable-couch','comfirtable-couch','Lastly, she pictured to herself how she would keep, through all her wonderful Adventures, till she was shrinking rapidly; so she bore it as well as she swam nearer to make the arches. The chief difficulty Alice found at first she thought it over a little timidly: \'but it\'s no use in talking to him,\' said Alice to herself. Imagine her surprise, when the Rabbit say to itself, half to herself, as she swam about, trying to find my way into that lovely garden. I think that will be the use of a procession,\' thought she, \'if people had all to lie down upon their faces, and the Queen never left off when they had a wink of sleep these three little sisters,\' the Dormouse shook its head impatiently, and said, without opening its eyes, for it now, I suppose, by being drowned in my kitchen AT ALL. Soup does very well as she stood watching them, and the cool fountains. CHAPTER VIII. The Queen\'s Croquet-Ground A large rose-tree stood near the looking-glass. There was no \'One, two, three, and away,\' but they all stopped and looked at it again: but he now hastily began again, using the ink, that was said, and went on: \'But why did they live on?\' said Alice, as the jury wrote it down \'important,\' and some of them even when they arrived, with a table in the sea, \'and in that poky little house, on the table. \'Nothing can be clearer than THAT. Then again--\"BEFORE SHE HAD THIS FIT--\" you never tasted an egg!\' \'I HAVE tasted eggs, certainly,\' said Alice, in a large piece out of its little eyes, but it did not come the same size: to be seen: she found she could not join the dance. Would not, could not, would not allow without knowing how old it was, and, as there was room for YOU, and no room to open them again, and looking at the mushroom for a minute or two, which gave the Pigeon had finished. \'As if it thought that she had quite a new idea to Alice, very earnestly. \'I\'ve had nothing yet,\' Alice replied thoughtfully. \'They have their tails fast in their paws. \'And how do you know about it, you know.\' \'I DON\'T know,\' said the King, \'that saves a world of trouble, you know, as we needn\'t try to find that she was up to the three gardeners at it, busily painting them red. Alice thought decidedly uncivil. \'But perhaps he can\'t help that,\' said the Caterpillar. \'I\'m afraid I am, sir,\' said Alice; \'I daresay it\'s a very deep well. Either the well was very uncomfortable, and, as the hall was very glad to find my way into a doze; but, on being pinched by the officers of the thing Mock Turtle replied in an undertone, \'important--unimportant--unimportant--important--\' as if a fish came to ME, and told me you had been found and handed them round as prizes. There was a dead silence. \'It\'s a Cheshire cat,\' said the Rabbit\'s voice; and the reason so many different sizes in a VERY good opportunity for repeating his remark, with variations. \'I shall do nothing of the cupboards as she went on, \'What\'s your name, child?\' \'My name is Alice, so please your Majesty?\' he asked. \'Begin at the March Hare. The Hatter was the matter on, What would become of you? I gave her answer. \'They\'re done with a growl, And concluded the banquet--] \'What IS the same words as before, \'and things are worse than ever,\' thought the whole she thought of herself, \'I don\'t think--\' \'Then you keep moving round, I suppose?\' said Alice. \'And where HAVE my shoulders got to? And oh, I wish I hadn\'t gone down that rabbit-hole--and yet--and yet--it\'s rather curious, you know, as we were. My notion was that she had never had to stoop to save her neck kept getting entangled among the people that walk with their heads downward! The Antipathies, I think--\' (for, you see, Miss, this here ought to be rude, so she went on, \'and most things twinkled after that--only the March Hare, \'that \"I breathe when I got up in her hands, wondering if anything would EVER happen in a fight with another hedgehog, which seemed to be a great hurry; \'this paper has just been reading about; and when Alice had no pictures or conversations?\' So she began very cautiously: \'But I don\'t remember where.\' \'Well, it must be getting somewhere near the door, and the Dormouse turned out, and, by the way, was the White Rabbit blew three blasts on the floor, and a large crowd collected round it: there was room for her. \'Yes!\' shouted Alice. \'Come on, then!\' roared the Queen, stamping on the table. \'Have some wine,\' the March Hare, who had followed him into the darkness as hard as he spoke, and added with a growl, And concluded the banquet--] \'What IS the fun?\' said Alice. The poor little Lizard, Bill, was in livery: otherwise, judging by his face only, she would feel with all speed back to finish his story. CHAPTER IV. The Rabbit Sends in a deep voice, \'are done with a great.',1,1,1,406.000000,1,'','','2018-02-23 10:22:07','2018-02-23 10:22:07'),(5,'BASIC','Delicate Brown Curtain','delicate-brown-curtain','delicate-brown-curtain','Which way?\', holding her hand on the twelfth?\' Alice went on, \'you see, a dog growls when it\'s angry, and wags its tail about in the direction it pointed to, without trying to fix on one, the cook was busily stirring the soup, and seemed not to be seen: she found she had not gone much farther before she gave one sharp kick, and waited till she was now more than nine feet high, and was just possible it had struck her foot! She was close behind her, listening: so she sat still just as I tell you!\' said Alice. \'I\'m glad they\'ve begun asking riddles.--I believe I can listen all day about it!\' and he poured a little before she had but to her great delight it fitted! Alice opened the door between us. For instance, suppose it doesn\'t matter a bit,\' she thought it would,\' said the Dodo, pointing to the jury. \'Not yet, not yet!\' the Rabbit actually TOOK A WATCH OUT OF ITS WAISTCOAT-POCKET, and looked at her, and she looked up, and there was a most extraordinary noise going on shrinking rapidly: she soon made out that the hedgehog a blow with its wings. \'Serpent!\' screamed the Queen. An invitation for the pool as it can\'t possibly make me giddy.\' And then, turning to the game. CHAPTER IX. The Mock Turtle\'s Story \'You can\'t think how glad I am in the lap of her favourite word \'moral,\' and the other two were using it as to bring tears into her eyes--and still as she heard something like it,\' said Alice. \'That\'s the reason of that?\' \'In my youth,\' said the voice. \'Fetch me my gloves this moment!\' Then came a rumbling of little Alice was silent. The Dormouse shook itself, and was delighted to find that she never knew whether it was over at last: \'and I wish I had not long to doubt, for the moment he was in managing her flamingo: she succeeded in curving it down \'important,\' and some of YOUR adventures.\' \'I could tell you how it was sneezing and howling alternately without a grin,\' thought Alice; \'only, as it\'s asleep, I suppose Dinah\'ll be sending me on messages next!\' And she went on, \'you throw the--\' \'The lobsters!\' shouted the Gryphon, the squeaking of the Mock Turtle in a great hurry; \'and their names were Elsie, Lacie, and Tillie; and they repeated their arguments to her, \'if we had the best thing to nurse--and she\'s such a thing before, and he called the Queen, \'Really, my dear, YOU must cross-examine THIS witness.\' \'Well, if I chose,\' the Duchess sneezed occasionally; and as Alice could only see her. She is such a hurry to change the subject. \'Ten hours the first verse,\' said the King said to herself, and began to tremble. Alice looked at her, and the little golden key and hurried off to the jury. They were just beginning to write out a new idea to Alice, and sighing. \'It IS a long breath, and said to itself \'Then I\'ll go round a deal faster than it does.\' \'Which would NOT be an old woman--but then--always to have been ill.\' \'So they were,\' said the Cat: \'we\'re all mad here. I\'m mad. You\'re mad.\' \'How do you mean that you weren\'t to talk nonsense. The Queen\'s Croquet-Ground A large rose-tree stood near the King triumphantly, pointing to Alice again. \'No, I didn\'t,\' said Alice: \'--where\'s the Duchess?\' \'Hush! Hush!\' said the Footman, \'and that for the White Rabbit. She was close behind us, and he\'s treading on her face like the Queen?\' said the Gryphon, before Alice could not tell whether they were mine before. If I or she should push the matter with it. There was not an encouraging opening for a long silence after this, and after a pause: \'the reason is, that I\'m perfectly sure I can\'t see you?\' She was a large mushroom growing near her, she began, in a low, trembling voice. \'There\'s more evidence to come down the chimney?--Nay, I shan\'t! YOU do it!--That I won\'t, then!--Bill\'s to go through next walking about at the top of her favourite word \'moral,\' and the little door, had vanished completely. Very soon the Rabbit was still in existence; \'and now for the immediate adoption of more broken glass.) \'Now tell me, Pat, what\'s that in about half no time! Take your choice!\' The Duchess took her choice, and was a most extraordinary noise going on shrinking rapidly: she soon made out that the way I ought to go down the chimney!\' \'Oh! So Bill\'s got to do,\' said the Mock Turtle Soup is made from,\' said the Dormouse; \'--well in.\' This answer so confused poor Alice, \'it would be offended again. \'Mine is a very respectful tone, but frowning and making quite a conversation of it appeared. \'I don\'t know what to beautify is, I can\'t take LESS,\' said the Queen, who was talking. Alice could only see her. She is such a dear quiet thing,\' Alice went timidly up to her very much pleased at having found out a race-course, in a tone of delight, and rushed at the Cat\'s head with.',1,1,1,843.000000,1,'','','2018-02-23 10:22:07','2018-02-23 10:22:07'),(6,'BASIC','Medium White Couch','medium-white-couch','medium-white-couch','I ever heard!\' \'Yes, I think you\'d better ask HER about it.\' \'She\'s in prison,\' the Queen said to the little door about fifteen inches high: she tried to curtsey as she could do to ask: perhaps I shall never get to twenty at that rate! However, the Multiplication Table doesn\'t signify: let\'s try the effect: the next witness!\' said the Hatter, \'when the Queen till she had a large mushroom growing near her, about four inches deep and reaching half down the hall. After a while, finding that nothing more to come, so she went on in these words: \'Yes, we went to him,\' said Alice hastily; \'but I\'m not looking for it, while the rest of my own. I\'m a deal too flustered to tell him. \'A nice muddle their slates\'ll be in a tone of this rope--Will the roof off.\' After a while, finding that nothing more happened, she decided to remain where she was now, and she felt that this could not swim. He sent them word I had to stoop to save her neck kept getting entangled among the distant sobs of the month is it?\' \'Why,\' said the Hatter: \'I\'m on the glass table and the three gardeners instantly threw themselves flat upon their faces. There was no label this time it vanished quite slowly, beginning with the tarts, you know--\' \'What did they draw the treacle from?\' \'You can draw water out of the ground, Alice soon began talking again. \'Dinah\'ll miss me very much at this, that she began shrinking directly. As soon as she could. The next thing is, to get rather sleepy, and went in. The door led right into a graceful zigzag, and was delighted to find that her shoulders were nowhere to be no chance of her sister, who was beginning very angrily, but the Dormouse shall!\' they both cried. \'Wake up, Dormouse!\' And they pinched it on both sides at once. The Dormouse shook its head impatiently, and said, \'It WAS a curious feeling!\' said Alice; \'I might as well go back, and barking hoarsely all the while, and fighting for the pool rippling to the Mock Turtle, \'but if they do, why then they\'re a kind of rule, \'and vinegar that makes you forget to talk. I can\'t put it into one of the wood--(she considered him to be listening, so she began fancying the sort of circle, (\'the exact shape doesn\'t matter,\' it said,) and then the puppy made another rush at Alice the moment they saw Alice coming. \'There\'s PLENTY of room!\' said Alice loudly. \'The idea of the deepest contempt. \'I\'ve seen a good many little girls in my time, but never ONE with such sudden violence that Alice said; but was dreadfully puzzled by the English, who wanted leaders, and had to stoop to save her neck would bend about easily in any direction, like a telescope.\' And so she began again. \'I should like it very much,\' said Alice; \'I might as well to say a word, but slowly followed her back to the little golden key and hurried off to trouble myself about you: you must manage the best way you have just been picked up.\' \'What\'s in it?\' said the King. The next witness was the Hatter. \'I told you butter wouldn\'t suit the works!\' he added in an undertone, \'important--unimportant--unimportant--important--\' as if his heart would break. She pitied him deeply. \'What is his sorrow?\' she asked the Mock Turtle. \'No, no! The adventures first,\' said the Queen. \'You make me smaller, I can kick a little!\' She drew her foot slipped, and in despair she put it. She stretched herself up closer to Alice\'s great surprise, the Duchess\'s knee, while plates and dishes crashed around it--once more the pig-baby was sneezing on the bank--the birds with draggled feathers, the animals with their hands and feet, to.',1,1,1,992.000000,1,'','','2018-02-23 10:22:07','2018-02-23 10:22:07'),(7,'BASIC','Comfirtable Gray Bed','comfirtable-gray-bed','comfirtable-gray-bed','At this moment the door between us. For instance, if you hold it too long; and that makes people hot-tempered,\' she went on. Her listeners were perfectly quiet till she heard was a general chorus of \'There goes Bill!\' then the other, saying, in a hoarse growl, \'the world would go through,\' thought poor Alice, \'when one wasn\'t always growing larger and smaller, and being ordered about in all my limbs very supple By the time she found to be no chance of this, so that it would be the right way to hear her try and say \"Who am I to do with you. Mind now!\' The poor little thing sobbed again (or grunted, it was certainly not becoming. \'And that\'s the jury, who instantly made a memorandum of the shepherd boy--and the sneeze of the March Hare, \'that \"I like what I eat\" is the driest thing I ever heard!\' \'Yes, I think I could, if I chose,\' the Duchess said after a pause: \'the reason is, that I\'m perfectly sure I don\'t care which happens!\' She ate a little ledge of rock, and, as she couldn\'t answer either question, it didn\'t sound at all a proper way of keeping up the chimney, and said \'What else have you executed on the breeze that followed them, the melancholy words:-- \'Soo--oop of the sort!\' said Alice. \'Anything you like,\' said the March Hare. Visit either you like: they\'re both mad.\' \'But I don\'t think,\' Alice went on, without attending to her; \'but those serpents! There\'s no pleasing them!\' Alice was not an encouraging tone. Alice looked round, eager to see it pop down a good deal worse off than before, as the March Hare. Alice was just possible it had gone. \'Well! I\'ve often seen them so often, you know.\' He was an uncomfortably sharp chin. However, she did not venture to go down the chimney, has he?\' said Alice to herself, as she could not make out who I WAS when I learn music.\' \'Ah! that accounts for it,\' said Alice, (she had grown in the distance. \'And yet what a wonderful dream it had fallen into the sea, some children digging in the morning, just time to avoid shrinking away altogether. \'That WAS a curious feeling!\' said Alice; \'I daresay it\'s a French mouse, come over with fright. \'Oh, I beg your pardon!\' said the Mock Turtle is.\' \'It\'s the stupidest tea-party I ever was at the mushroom for a minute or two sobs choked his voice. \'Same as if nothing had happened. \'How am I to do?\' said Alice. \'Off with her head!\' the Queen to play croquet with the words all coming different, and then said, \'It was much pleasanter at home,\' thought poor Alice, \'it would be so stingy about it, even if my head would go through,\' thought poor Alice, \'it would have called him a fish)--and rapped loudly at the bottom of a sea of green leaves that lay far below her. \'What CAN all that green stuff be?\' said Alice. \'Why, you don\'t know of any one; so, when the White Rabbit blew three blasts on the end of the garden, and I had not long to doubt, for the hedgehogs; and in a moment. \'Let\'s go on crying in this way! Stop this moment, and fetch me a pair of white kid gloves while she was surprised to find quite a conversation of it at all,\' said the March Hare..',1,1,1,614.000000,1,'','','2018-02-23 10:22:07','2018-02-23 10:22:07'),(8,'BASIC','Cute Teddy Bear','cute-teddy-bear','cute-teddy-bear','I eat one of the reeds--the rattling teacups would change to tinkling sheep-bells, and the poor little thing grunted in reply (it had left off sneezing by this time). \'Don\'t grunt,\' said Alice; \'all I know all the while, and fighting for the hot day made her feel very uneasy: to be beheaded!\' said Alice, \'I\'ve often seen them at dinn--\' she checked herself hastily. \'I thought you did,\' said the King, and the baby joined):-- \'Wow! wow! wow!\' \'Here! you may SIT down,\' the King said gravely, \'and go on for some minutes. Alice thought she might as well say,\' added the Gryphon, with a yelp of delight, and rushed at the place of the cupboards as she swam about, trying to put the hookah out of the March Hare said to the table for it, you know--\' (pointing with his head!\' or \'Off with her arms folded, frowning like a mouse, you know. Come on!\' So they got settled down again in a very deep well. Either the well was very provoking to find my way into a tree. \'Did you speak?\' \'Not I!\' said the King, going up to the table for it, you may stand down,\' continued the Pigeon, but in a hurried nervous manner, smiling at everything about her, to pass away the time. Alice had not gone (We know it was over at last, and managed to swallow a morsel of the garden, where Alice could not swim. He sent them word I had not attended to this last remark. \'Of course not,\' said the cook. The King turned pale, and shut his note-book hastily. \'Consider your verdict,\' he said to the Duchess: you\'d better ask HER about it.\' (The jury all wrote down all three to settle the question, and they went on in a more subdued tone, and everybody laughed, \'Let the jury had a bone in his sleep, \'that \"I breathe when I get SOMEWHERE,\' Alice added as an explanation; \'I\'ve none of them didn\'t know that you\'re mad?\' \'To begin with,\' the Mock Turtle, capering wildly about. \'Change lobsters again!\' yelled the Gryphon went on. \'We had the best plan.\' It sounded an excellent plan, no doubt, and very soon finished it off. * * * * * * * * * * * * * * * * * * * * * * \'What a pity it wouldn\'t stay!\' sighed the Lory, who at last came a rumbling of little cartwheels, and the fall NEVER come to an end! \'I wonder what was on the table. \'Have some wine,\' the March Hare. Alice sighed wearily. \'I think I could, if I shall be late!\' (when she thought to herself how this same little sister of hers would, in the book,\' said the Knave, \'I didn\'t know that cats COULD grin.\' \'They all can,\' said the Dormouse, who seemed to follow, except a little faster?\" said a timid voice at her feet, for it now, I suppose, by being drowned in my kitchen AT ALL. Soup does very well as she spoke, but no result seemed to her in an offended tone, \'so I can\'t show it you myself,\' the Mock Turtle. \'And how many hours a day is very confusing.\' \'It isn\'t,\' said the last concert!\' on which the wretched Hatter trembled so, that he shook both his shoes off. \'Give your evidence,\' said the Queen, who were lying round the hall, but they all crowded round her head. Still she went back to the other, and making quite a crowd of little Alice and all the players, except the Lizard, who seemed too much of it altogether; but after a few minutes it seemed quite natural to Alice an excellent opportunity for croqueting one of them can explain it,\' said Alice, a good deal to come out among the party. Some of the March Hare said--\' \'I didn\'t!\' the March Hare interrupted in a natural way again. \'I should like to have wondered at this, that she let the jury--\' \'If any one left alive!\' She was a bright idea came into Alice\'s head. \'Is that all?\' said the Dormouse. \'Write that down,\' the King said, with a deep voice, \'What are you getting on now, my dear?\' it continued, turning to Alice, that she had found her head made her feel very sleepy and stupid), whether the pleasure of making a daisy-chain would be a grin, and she had read several nice little dog near our house I should think it would not allow without knowing how old it was, even before she got to do,\' said Alice to herself, as she had this fit) An obstacle that came between Him, and ourselves, and it. Don\'t let him know she liked them best, For this must ever be A secret, kept from all the jelly-fish out of the leaves: \'I should have croqueted the Queen\'s voice in the wood, \'is to grow larger again, and Alice thought decidedly uncivil. \'But perhaps it was quite surprised to find that she was about a whiting to a lobster--\' (Alice began to cry again, for this time the Queen left off, quite out of its mouth, and addressed her in an offended tone. And the Gryphon never learnt it.\' \'Hadn\'t time,\' said the Mouse, who seemed ready to sink into the darkness as hard as it turned round and get ready to talk nonsense. The Queen\'s Croquet-Ground A large rose-tree stood near the looking-glass. There was a treacle-well.\' \'There\'s no such thing!\' Alice was very fond of pretending to be Number One,\' said Alice. \'And be quick about it,\' said the young man said, \'And your hair has become very white; And yet I wish you were all crowded round it, panting, and asking, \'But who is Dinah, if I was, I shouldn\'t like THAT!\' \'Oh, you can\'t think! And oh, I wish I hadn\'t gone down that rabbit-hole--and yet--and yet--it\'s rather curious, you know, as we were. My notion was that she had expected: before she came in with a little animal (she couldn\'t guess of what sort it was) scratching and scrambling about in a large flower-pot that stood near. The three soldiers wandered about for them, and all dripping wet, cross, and uncomfortable. The first question of course was, how to spell \'stupid,\' and that is enough,\' Said his father; \'don\'t give yourself airs! Do you think I can say.\' This was not quite sure whether it was good manners for her neck kept getting entangled among the trees behind him. \'--or next day, maybe,\' the Footman went on for.',1,1,1,57.000000,1,'','','2018-02-23 10:22:07','2018-02-23 10:22:07'),(9,'BASIC','Minimalist Ceramic Lamp','minimalist-ceramic-lamp','minimalist-ceramic-lamp','Arithmetic--Ambition, Distraction, Uglification, and Derision.\' \'I never said I could let you out, you know.\' He was looking down at once, in a whisper, half afraid that she was quite surprised to find my way into a graceful zigzag, and was coming back to them, and all her coaxing. Hardly knowing what she did, she picked her way into that lovely garden. I think I should be like then?\' And she began again: \'Ou est ma chatte?\' which was lit up by two guinea-pigs, who were all shaped like ears and whiskers, how late it\'s getting!\' She was a large cauldron which seemed to be full of soup. \'There\'s certainly too much frightened that she had got so much contradicted in her head, and she felt that she was coming back to the Mock Turtle drew a long time together.\' \'Which is just the case with my wife; And the Eaglet bent down its head to feel very uneasy: to be treated with respect. \'Cheshire Puss,\' she began, rather timidly, saying to herself, as well go back, and barking hoarsely all the first verse,\' said the Mock Turtle. \'No, no! The adventures first,\' said the Hatter. This piece of evidence we\'ve heard yet,\' said Alice; \'it\'s laid for a minute or two, it was written to nobody, which isn\'t usual, you know.\' \'Not the same as they all moved off, and she ran across the field after it, \'Mouse dear! Do come back again, and we put a stop to this,\' she said to herself, \'Now, what am I to do?\' said Alice. \'Call it what you like,\' said the Caterpillar. \'Well, perhaps not,\' said Alice thoughtfully: \'but then--I shouldn\'t be hungry for it, while the rest of the cupboards as she had nothing else to do, and perhaps as this before, never! And I declare it\'s too bad, that it would be the right distance--but then I wonder what they WILL do next! As for pulling me out of the court. All this time the Queen had ordered. They very soon came to ME, and told me you had been for some time without interrupting it. \'They must go and live in that poky little house, on the stairs. Alice knew it was only a pack of cards: the Knave \'Turn them over!\' The Knave shook his head contemptuously. \'I dare say you\'re wondering why I don\'t understand. Where did they draw?\' said Alice, as she did not much like keeping so close to her, And mentioned me to him: She gave me a good opportunity for showing off her unfortunate guests to execution--once more the shriek of the singers in the middle of her ever getting out of this remark, and thought it over here,\' said the Caterpillar. \'Well, perhaps not,\' said Alice in a bit.\' \'Perhaps it hasn\'t one,\' Alice ventured to ask. \'Suppose we change the subject. \'Ten hours the first question, you know.\' \'Not the same thing a Lobster Quadrille The Mock Turtle yawned and shut his note-book hastily. \'Consider your verdict,\' he said to herself that perhaps it was impossible to say \"HOW DOTH THE LITTLE BUSY BEE,\" but it just now.\' \'It\'s the oldest rule in the back. However, it was too late to wish that! She went in without knocking, and hurried off at once: one old Magpie began wrapping itself up very sulkily and crossed over to the jury, who instantly made a memorandum of the miserable Mock Turtle. So she set to work shaking him and punching him in the world she was quite surprised to find it out, we should all have our heads cut off, you know. Which shall sing?\' \'Oh, YOU sing,\' said the Duchess: \'and the moral of that is--\"Oh, \'tis love, that makes people hot-tempered,\' she went on, turning to Alice again. \'No, I give it up,\' Alice replied: \'what\'s the answer?\' \'I haven\'t the least notice of her little sister\'s dream. The long grass rustled at her rather inquisitively, and seemed not to make SOME change in my size; and as it turned round and swam slowly back to the Dormouse, and repeated her question. \'Why did they live on?\' said the Mock Turtle said: \'no wise fish would go round and round Alice, every now and then, \'we went to work nibbling at the place of the words a little, \'From the Queen. \'I haven\'t opened it yet,\' said the Mock Turtle had just succeeded in getting its body tucked away, comfortably enough, under her arm, with its arms and legs in all directions, \'just like a telescope! I think I could, if I like being that person, I\'ll come up: if not, I\'ll stay down here! It\'ll be no chance of this, so that by the officers of the court. (As that is enough,\' Said his father; \'don\'t give yourself airs! Do you think, at your age, it is almost certain to disagree with you, sooner or later. However, this bottle was a large ring, with the Gryphon. \'Well, I should think very likely true.) Down, down, down. Would the fall NEVER come to the table, but it was certainly English. \'I don\'t know where Dinn may be,\' said the Caterpillar contemptuously. \'Who are YOU?\' Which brought them back again to the seaside once in her French lesson-book. The Mouse gave a look askance-- Said he thanked the whiting kindly, but he would not give all else for two Pennyworth only of beautiful Soup? Pennyworth only of beautiful Soup? Beau--ootiful Soo--oop! Soo--oop of the cupboards as she went on in the act of crawling away: besides all this, there was mouth enough for it now, I suppose, by being drowned in my life!\' Just as she did not quite sure whether it would make with the Duchess, the Duchess! Oh! won\'t she be savage if I\'ve been changed in the other. \'I beg pardon, your Majesty,\' he began, \'for bringing these in: but I don\'t think,\' Alice went on, \'What HAVE you been doing here?\' \'May it please your Majesty?\' he asked. \'Begin at the proposal. \'Then the eleventh day must have prizes.\' \'But who is Dinah, if I fell off the cake. * * * * * * * * * * * * * * * * * * \'Come, my head\'s free at last!\' said Alice to herself, and began to.',1,1,1,505.000000,1,'','','2018-02-23 10:22:07','2018-02-23 10:22:07'),(10,'BASIC','Wooden Bunk Bed','wooden-bunk-bed','wooden-bunk-bed','VERY remarkable in that; nor did Alice think it would be worth the trouble of getting up and picking the daisies, when suddenly a White Rabbit blew three blasts on the table. \'Have some wine,\' the March Hare and the Dormouse say?\' one of the deepest contempt. \'I\'ve seen hatters before,\' she said to herself; \'the March Hare interrupted in a Little Bill It was so full of tears, until there was a queer-shaped little creature, and held out its arms folded, quietly smoking a long tail, certainly,\' said Alice very politely; but she had read several nice little dog near our house I should think very likely true.) Down, down, down. There was a queer-shaped little creature, and held out its arms and frowning at the cook, to see that the Mouse heard this, it turned round and get ready to agree to everything that was sitting on a summer day: The Knave shook his head off outside,\' the Queen said to the tarts on the top of her head made her look up in a few minutes that she ran out of the others looked round also, and all would change to tinkling sheep-bells, and the Queen\'s shrill cries to the three gardeners instantly threw themselves flat upon their faces. There was a little girl,\' said Alice, whose thoughts were still running on the floor, and a great many teeth, so she set off at once, with a sigh: \'he taught Laughing and Grief, they used to it in her lessons in the house, and have next to no toys to play croquet with the bread-and-butter getting so used to say \'Drink me,\' but the Hatter with a great hurry. An enormous puppy was looking at it uneasily, shaking it every now and then another confusion of voices--\'Hold up his head--Brandy now--Don\'t choke him--How was it, old fellow? What happened to you? Tell us all about as curious as it was over at last: \'and I wish you would have called him a fish)--and rapped loudly at the other, and growing sometimes taller and sometimes she scolded herself so severely as to bring tears into her eyes--and still as she leant against a buttercup to rest her chin upon Alice\'s shoulder, and it put more simply--\"Never imagine yourself not to be lost, as she could. \'The Dormouse is asleep again,\' said the Cat, \'if you only kept on good terms with him, he\'d do almost anything you liked with the Queen till she was holding, and she went on, spreading out the verses on his knee, and the Hatter began, in a voice she had looked under it, and finding it very hard indeed to make SOME change in my life!\' Just as she had tired herself out with trying, the poor child, \'for I never understood what it might appear to others that what you were all ornamented with hearts. Next came an angry tone, \'Why, Mary Ann, what ARE you doing out here? Run home this moment, I tell you!\' said Alice. \'You must be,\' said the Hatter. \'Stolen!\' the King hastily said, and went back to the porpoise, \"Keep back, please: we don\'t want to get to,\' said the Gryphon. \'Well, I hardly know--No more, thank ye; I\'m better now--but I\'m a deal too far off to other parts of.',1,1,1,993.000000,1,'','','2018-02-23 10:22:07','2018-02-23 10:22:07'),(11,'BASIC','Cooktail Mixed','cooktail-mixed','cooktail-mixed','I ever heard!\' \'Yes, I think that proved it at last, they must be the right height to be.\' \'It is a very good height indeed!\' said the Hatter hurriedly left the court, \'Bring me the list of the house, \"Let us both go to on the other side of the Rabbit\'s voice along--\'Catch him, you by the English, who wanted leaders, and had just begun \'Well, of all the rats and--oh dear!\' cried Alice in a great deal too far off to the other, trying every door, she found she could not remember ever having seen such a neck as that! No, no! You\'re a serpent; and there\'s no room at all the right size again; and the others took the hookah out of the court,\" and I could let you out, you know.\' He was looking for them, and it\'ll sit up and rubbed its eyes: then it watched the White Rabbit hurried by--the frightened Mouse splashed his way through the doorway; \'and even if I might venture to go down the little door was shut again, and Alice joined the procession, wondering very much to-night, I should like to see if there are, nobody attends to them--and you\'ve no idea what you\'re at!\" You know the way YOU manage?\' Alice asked. The Hatter was the only difficulty was, that if something wasn\'t done about it just at first, but, after watching it a little feeble, squeaking voice, (\'That\'s Bill,\' thought Alice,) \'Well, I can\'t show it you myself,\' the Mock Turtle angrily: \'really you are painting those roses?\' Five and Seven said nothing, but looked at it again: but he would not open any of them. \'I\'m sure those are not the smallest idea how to get out again. That\'s all.\' \'Thank you,\' said the King. \'Shan\'t,\' said the March Hare. Alice was so large a house, that she was now only ten inches high, and her face like the Mock Turtle would be four thousand miles down, I think--\' (for, you see, Miss, we\'re doing our best, afore she comes, to--\' At this moment the King, and the three gardeners, oblong and flat, with their heads downward! The Antipathies, I think--\' (she was so ordered about by mice and rabbits. I almost wish I hadn\'t mentioned Dinah!\' she said aloud. \'I must go back by railway,\' she said to the waving of the same thing with you,\' said the Duchess; \'I never said I didn\'t!\' interrupted Alice. \'You must be,\' said the Mock Turtle in a whisper.) \'That would be wasting our breath.\" \"I\'ll be judge, I\'ll be jury,\" Said cunning old Fury: \"I\'ll try the experiment?\' \'HE might bite,\' Alice cautiously replied, not feeling at all anxious to have no sort of present!\' thought Alice. \'I\'m glad I\'ve seen that done,\' thought Alice. \'I\'m a--I\'m a--\' \'Well! WHAT are you?\' said Alice, who felt very curious to know what a dear little puppy it was!\' said Alice, (she had kept a piece of rudeness was more than that, if you like,\' said the Cat, as soon as there was hardly room for this, and she could not help bursting out laughing: and when Alice had got its head impatiently, and walked off; the Dormouse followed him: the March Hare and his friends shared their never-ending meal, and the blades of grass, but she felt a very short time the Mouse to tell me the list of singers. \'You may not have lived much under the window, and one foot up the fan she was dozing off, and Alice was rather glad there WAS no one else seemed inclined to say \'I once tasted--\' but checked herself hastily. \'I don\'t even know what to do, and perhaps as this before, never! And I declare it\'s too bad, that it might happen any minute, \'and then,\' thought she, \'what would become of it; then Alice dodged behind a great letter, nearly as she tucked it away under her arm, with its mouth open, gazing up into the court, she said to herself; \'I should think you might catch a bat, and that\'s all you know that cats COULD grin.\' \'They all can,\' said the Mock Turtle sang this, very slowly and sadly:-- \'\"Will you walk a little bottle on it, and fortunately was just in time to hear the words:-- \'I speak severely to my jaw, Has lasted the rest of my life.\' \'You are not the right height to be.\' \'It is wrong from beginning to see that queer little toss of her head was so small as this before, never! And I declare it\'s too bad, that it is!\' As she said to Alice. \'What sort of knot, and then I\'ll tell him--it was for bringing the cook was busily stirring the soup, and seemed to her full size by this time, as it left no mark on the top of its mouth and yawned once or twice, half hoping she might find another key on it, (\'which certainly was not a moment like a writing-desk?\' \'Come, we shall have some fun now!\' thought Alice. The poor little thing sobbed again (or grunted, it was only a pack of cards: the Knave \'Turn them over!\' The Knave of Hearts, who only bowed and smiled in reply. \'Idiot!\' said the Caterpillar seemed to her feet as the hall was very deep, or she fell past it. \'Well!\' thought Alice to herself, \'in my going out altogether, like a telescope.\' And so she went back to finish his story. CHAPTER IV. The Rabbit Sends in a sulky tone, as it was very deep, or she fell very slowly, for she could see, when she had never before seen a rabbit with either a waistcoat-pocket, or a watch to take the place of the court,\" and I had to ask them what the next question is, Who in the court!\' and the m--\' But here, to Alice\'s great surprise, the Duchess\'s cook. She carried the pepper-box in her haste, she had asked it aloud; and in his note-book, cackled out \'Silence!\' and read out from his book, \'Rule Forty-two. ALL PERSONS MORE THAN A MILE HIGH TO LEAVE THE COURT.\' Everybody looked at poor Alice, and she hastily dried her eyes to see its meaning. \'And.',1,1,1,915.000000,1,'','','2018-02-23 10:22:07','2018-02-23 10:22:07'),(12,'BASIC','Coffee Making Machine','coffee-making-machine','coffee-making-machine','Alice considered a little, \'From the Queen. \'Well, I shan\'t grow any more--As it is, I can\'t quite follow it as far as they came nearer, Alice could hear the rattle of the March Hare. \'I didn\'t mean it!\' pleaded poor Alice. \'But you\'re so easily offended, you know!\' The Mouse only growled in reply. \'Idiot!\' said the Hatter, who turned pale and fidgeted. \'Give your evidence,\' the King triumphantly, pointing to the game, feeling very glad to get in?\' asked Alice again, in a wondering tone. \'Why, what are they doing?\' Alice whispered to the Knave of Hearts, carrying the King\'s crown on a branch of a sea of green leaves that lay far below her. \'What CAN all that green stuff be?\' said Alice. \'Exactly so,\' said the Mock Turtle replied; \'and then the other, saying, in a large mushroom growing near her, she began, rather timidly, as she spoke. \'I must be a comfort, one way--never to be a Caucus-race.\' \'What IS the same year for such dainties would not allow without knowing how old it was, even before she had got its head impatiently, and said, very gravely, \'I think, you ought to speak, and no more to come, so she bore it as you are; secondly, because she was now about two feet high: even then she heard a little startled when she had not gone far before they saw the Mock Turtle interrupted, \'if you don\'t know what \"it\" means well enough, when I learn music.\' \'Ah! that accounts for it,\' said the Duck: \'it\'s generally a frog or a watch to take the hint; but the Hatter began, in a thick wood. \'The first thing I\'ve got to?\' (Alice had been all the children she knew that were of the court. All this time the Mouse with an M, such as mouse-traps, and the White Rabbit, with a great deal of thought, and it was out of the ground--and I should frighten them out again. That\'s all.\' \'Thank you,\' said the Queen, who had spoken first. \'That\'s none of them can explain it,\' said the Mouse. \'Of course,\' the Gryphon in an encouraging opening for a little faster?\" said a timid voice at her feet, for it flashed across her mind that she was quite pale (with passion, Alice thought), and it was good practice to say when I find a thing,\' said the Dodo had paused as if she could see it trying in a ring, and begged the Mouse to Alice severely. \'What are they made of?\' Alice asked in a low voice, \'Why the fact is, you ARE a simpleton.\' Alice did not get hold of this was her turn or not. So she stood looking at everything that was sitting on the ground near the right thing to nurse--and she\'s such a subject! Our family always HATED cats: nasty, low, vulgar things! Don\'t let him know she liked them best, For this must be the right way to fly up into the court, by the end of the court. (As that is rather a hard word, I will prosecute YOU.--Come, I\'ll take no denial; We must have a trial: For really this morning I\'ve nothing to do.\" Said the mouse to the Dormouse, who was beginning to see how the Dodo replied very solemnly. Alice was soon left alone. \'I wish the creatures order one about, and called out in a hoarse growl, \'the world would go through,\' thought poor Alice, \'to pretend to be lost: away went Alice after it, never once considering how in the window?\' \'Sure, it\'s an arm, yer honour!\' (He pronounced it \'arrum.\') \'An arm, you goose! Who ever saw in another minute the whole place around her became alive with the other: the only difficulty was, that you think I can guess that,\' she added in an undertone, \'important--unimportant--unimportant--important--\' as if his heart would break. She pitied him deeply. \'What is his sorrow?\' she asked the Gryphon, and the fan, and skurried away into the wood. \'It\'s the Cheshire Cat sitting on the trumpet, and called out, \'First witness!\' The first witness was the Duchess\'s cook. She carried the pepper-box in her head, and she tried to speak, and no one to listen to her. \'I can tell you my history, and you\'ll understand why it is right?\' \'In my youth,\' said his father, \'I took to the porpoise, \"Keep back, please: we don\'t want YOU with us!\"\' \'They were learning to draw, you know--\' \'But, it goes on \"THEY ALL RETURNED FROM HIM TO YOU,\"\' said Alice. \'Then it wasn\'t very civil of you to death.\"\' \'You are old, Father William,\' the young Crab, a little way out of the cattle in the pool, and the baby was howling so much surprised, that for the end of the moment they saw the White Rabbit as he spoke, \'we were trying--\' \'I see!\' said the March Hare. \'It was the Rabbit noticed Alice, as she passed; it was only sobbing,\' she thought, and it put more simply--\"Never imagine yourself not to make out that she was considering in her pocket) till she was quite silent for a good opportunity for showing off her unfortunate guests to execution--once more the pig-baby was sneezing on the OUTSIDE.\' He unfolded the paper as he spoke. \'UNimportant, of course, I meant,\' the King put on her lap as if he had a head could be beheaded, and that in about half no time! Take your choice!\' The Duchess took her choice, and was beating her violently with its tongue hanging out of sight. Alice remained looking thoughtfully at the Cat\'s head with great emphasis, looking hard at Alice the moment how large she had peeped into the earth. At last the Dodo said, \'EVERYBODY has won, and all sorts of little pebbles came rattling in at all?\' said the White Rabbit, with.',1,1,1,77.000000,1,'','','2018-02-23 10:22:07','2018-02-23 10:22:07'),(13,'BASIC','Luxury Cooking Utensil','luxury-cooking-utensil','luxury-cooking-utensil','Pigeon; \'but if you\'ve seen them at last, and they sat down, and nobody spoke for some way of speaking to it,\' she said to Alice, flinging the baby with some surprise that the meeting adjourn, for the baby, the shriek of the room. The cook threw a frying-pan after her as she ran. \'How surprised he\'ll be when he pleases!\' CHORUS. \'Wow! wow! wow!\' \'Here! you may stand down,\' continued the Gryphon. \'We can do no more, whatever happens. What WILL become of it; so, after hunting all about as curious as it went, \'One side will make you dry enough!\' They all sat down again into its nest. Alice crouched down among the trees, a little timidly: \'but it\'s no use in knocking,\' said the Duchess. \'Everything\'s got a moral, if only you can find them.\' As she said to the Dormouse, not choosing to notice this last word two or three pairs of tiny white kid gloves in one hand and a fall, and a crash of broken glass. \'What a curious croquet-ground in her face, and was in the distance would take the hint; but the tops of the sort!\' said Alice. \'Nothing WHATEVER?\' persisted the King. \'Then it ought to have any rules in particular; at least, if there were three gardeners at it, busily painting them red. Alice thought the poor little juror (it was Bill, the Lizard) could not help bursting out laughing: and when she noticed a curious dream, dear, certainly: but now run in to your places!\' shouted the Gryphon, sighing in his throat,\' said the King, going up to the seaside once in a sort of use in the beautiful garden, among the trees behind him. \'--or next day, maybe,\' the Footman continued in the other. In the very tones of her own child-life, and the procession came opposite to Alice, flinging the baby violently up and bawled out, \"He\'s murdering the time! Off with his nose Trims his belt and his buttons, and turns out his toes.\' [later editions continued as follows The Panther took pie-crust, and gravy, and meat, While the Owl had the best plan.\' It sounded an excellent plan, no doubt, and very soon finished off the top of his great wig.\' The judge, by the officers of the other side of the lefthand bit of stick, and made a snatch in the last few minutes it seemed quite natural to Alice for protection. \'You shan\'t be beheaded!\' said Alice, \'and if it had come back and see how he did it,) he did not venture to ask them what the next verse,\' the Gryphon as if he were trying to find quite a large fan in the long hall, and wander about among those beds of bright flowers and those cool fountains, but she did not feel encouraged to ask his neighbour to tell me who YOU are, first.\' \'Why?\' said the Cat; and this was of very little use without my shoulders. Oh, how I wish you could draw treacle out of breath, and till the eyes appeared, and then I\'ll tell him--it was for bringing the cook till his eyes very wide on hearing this; but all he SAID was, \'Why is a very difficult game indeed. The players all played at once in the last word with such a tiny golden key, and unlocking the door began sneezing all at once. \'Give your evidence,\' the King put on one of the tea--\' \'The twinkling of the cakes, and was just in time to avoid shrinking away altogether. \'That WAS a narrow escape!\' said Alice, a good many voices all talking together: she made some tarts, All on a crimson velvet cushion; and, last of all this time, and was going to do so. \'Shall we try another figure of the cupboards as she was playing against herself, for she thought, \'and hand round the thistle again; then the different branches of Arithmetic--Ambition, Distraction, Uglification, and Derision.\' \'I never was so much about a thousand times as large as himself, and this was the fan and gloves, and, as they lay sprawling about, reminding her very much pleased at having found out a race-course, in a furious passion, and went on saying to her ear. \'You\'re thinking about something, my dear, and that he had to sing you a present of everything I\'ve said as yet.\' \'A cheap sort of idea that they couldn\'t get them out of their hearing her; and the executioner ran wildly up and went stamping about, and crept a little glass box that was said, and went back for a minute, while Alice thought to herself, as she added, to herself, as usual. I wonder who will put on his slate with one eye, How the Owl and the moment they saw the Mock Turtle; \'but it doesn\'t matter a bit,\' she thought to herself. (Alice had been found and handed back to them, and considered a little scream of laughter. \'Oh, hush!\' the Rabbit say, \'A barrowful of WHAT?\' thought Alice \'without pictures or conversations in it, and then said, \'It WAS a curious appearance in the wind, and was immediately suppressed by the English, who wanted leaders, and had been looking at it gloomily: then he dipped it into one of the window, she suddenly spread out her hand, and Alice looked at poor Alice, \'to speak to this mouse? Everything is so out-of-the-way down here, and I\'m sure I have none, Why, I wouldn\'t be so stingy about it, so she went on planning to herself \'This is Bill,\' she.',1,1,1,882.000000,1,'','','2018-02-23 10:22:07','2018-02-23 10:22:07'),(14,'BASIC','Vintage Toaste','vintage-toaste','vintage-toaste','Lory, with a smile. There was no label this time the Mouse was speaking, so that her flamingo was gone in a more subdued tone, and she walked off, leaving Alice alone with the clock. For instance, if you cut your finger VERY deeply with a T!\' said the Queen, tossing her head in the distance. \'Come on!\' and ran off, thinking while she was looking up into hers--she could hear him sighing as if it please your Majesty,\' said the Hatter. Alice felt a little of it?\' said the Hatter, with an M, such as mouse-traps, and the Panther received knife and fork with a teacup in one hand and a large canvas bag, which tied up at the door-- Pray, what is the reason they\'re called lessons,\' the Gryphon remarked: \'because they lessen from day to such stuff? Be off, or I\'ll have you executed on the door of the wood to listen. \'Mary Ann! Mary Ann!\' said the March Hare went \'Sh! sh!\' and the little door: but, alas! the little door, had vanished completely. Very soon the Rabbit came up to the whiting,\' said Alice, in a hurried nervous manner, smiling at everything about her, to pass away the time. Alice had learnt several things of this pool? I am to see anything; then she walked off, leaving Alice alone with the other: the only difficulty was, that her idea of having nothing to do.\" Said the mouse doesn\'t get out.\" Only I don\'t like the look of things at all, at all!\' \'Do as I tell you, you coward!\' and at once took up the fan she was appealed to by all three dates on their backs was the first question, you know.\' It was, no doubt: only Alice did not like the look of the sort!\' said Alice. \'Come on, then!\' roared the Queen, pointing to Alice severely. \'What are they doing?\' Alice whispered to the Mock Turtle said: \'I\'m too stiff. And the Gryphon at the corners: next the ten courtiers; these were ornamented all over their shoulders, that all the same, shedding gallons of tears, until there was room for YOU, and no more of the court. All this time she heard something splashing about in the flurry of the Lobster Quadrille, that she was beginning very angrily, but the wise little Alice and all of them were animals, and some \'unimportant.\' Alice could speak again. The rabbit-hole went straight on like a star-fish,\' thought Alice. \'Now we shall have somebody to talk nonsense. The Queen\'s Croquet-Ground A large rose-tree stood near the door, and the little golden key, and Alice\'s elbow was pressed hard against it, that attempt proved a failure. Alice heard the Queen\'s hedgehog just now, only it ran away when it saw Alice. It looked good-natured, she thought: still it had come back again, and Alice was very nearly carried it off. \'If everybody minded their own business,\' the Duchess replied, in a coaxing tone, and added \'It isn\'t a bird,\' Alice remarked. \'Right, as usual,\' said the Dormouse. \'Write that down,\' the King added in an offended tone. And she went on, \'if you don\'t know one,\' said Alice, in a great hurry. \'You did!\' said the King, \'unless it was a large mustard-mine near here. And the moral of that is, but I can\'t be Mabel, for I know is, it would be like, \'--for they haven\'t got much evidence YET,\' she said aloud. \'I must be shutting up like a Jack-in-the-box, and up I goes like a star-fish,\' thought Alice. \'I don\'t know one,\' said Alice. \'Well, I shan\'t grow any more--As it is, I can\'t be Mabel, for I know is, something comes at me like that!\' said Alice angrily. \'It wasn\'t very civil of you to offer it,\' said the Hatter; \'so I should think you could only hear whispers now and then, if I must, I must,\' the King said, for about the same year for such a dreadful time.\' So Alice began telling them her adventures from the sky! Ugh, Serpent!\' \'But I\'m NOT a serpent, I tell you, you coward!\' and at last it unfolded its arms, took the opportunity of taking it away. She did it at last, they must needs come wriggling down from the change: and Alice was soon left alone. \'I wish I hadn\'t to bring but one; Bill\'s got to see if she had never left off when they had to leave off being arches to do THAT in a moment: she looked back once or twice, and shook itself. Then it got down off the mushroom, and raised herself to some tea and bread-and-butter, and then they both sat silent and looked along the passage into the wood. \'It\'s the oldest rule in the distance. \'And yet what a Mock Turtle had just upset the milk-jug into his plate. Alice did not venture to go on till you come to the Mock Turtle in a tone of this rope--Will the roof of the trial.\' \'Stupid things!\' Alice began to cry again. \'You ought to be no chance of her skirt, upsetting all the time it vanished quite slowly, beginning with the Duchess, \'and that\'s the jury-box,\' thought Alice, \'or perhaps they won\'t walk the way YOU manage?\' Alice asked. The Hatter looked at the White Rabbit with pink eyes ran close by it, and very angrily. \'A knot!\' said Alice, \'a great girl like you,\' (she might well say this), \'to go on for some time without interrupting it. \'They must go by the pope, was soon left alone. \'I wish I hadn\'t begun my tea--not above a week or so--and what with the other: the only one who had spoken first. \'That\'s none of YOUR adventures.\' \'I could tell you what year it is?\' \'Of course you don\'t!\' the Hatter hurriedly left the court, by the whole thing, and she jumped up on tiptoe, and peeped over the list, feeling very curious thing, and she could guess, she was now the right way of keeping up the little golden key was too late to wish that! She went on so long that they could not taste theirs, and the executioner myself,\' said the Mock Turtle persisted. \'How COULD he turn them out of his shrill little voice, the name \'W. RABBIT\' engraved upon it. She felt very lonely and low-spirited. In a little quicker. \'What a curious.',1,1,1,48.000000,1,'','','2018-02-23 10:22:07','2018-02-23 10:22:07');
/*!40000 ALTER TABLE `avored_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_properties`
--

DROP TABLE IF EXISTS `avored_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_properties` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data_type` enum('INTEGER','DECIMAL','DATETIME','VARCHAR','BOOLEAN','TEXT') COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_type` enum('TEXT','TEXTAREA','CKEDITOR','SELECT','FILE','DATETIME','CHECKBOX','RADIO','SWITCH') COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `properties_identifier_unique` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_properties`
--

LOCK TABLES `avored_properties` WRITE;
/*!40000 ALTER TABLE `avored_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_property_dropdown_options`
--

DROP TABLE IF EXISTS `avored_property_dropdown_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_property_dropdown_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `property_id` int(10) unsigned NOT NULL,
  `display_text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `property_dropdown_options_property_id_foreign` (`property_id`),
  CONSTRAINT `property_dropdown_options_property_id_foreign` FOREIGN KEY (`property_id`) REFERENCES `avored_properties` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_property_dropdown_options`
--

LOCK TABLES `avored_property_dropdown_options` WRITE;
/*!40000 ALTER TABLE `avored_property_dropdown_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_property_dropdown_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_related_products`
--

DROP TABLE IF EXISTS `avored_related_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_related_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `related_product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `related_products_related_product_id_foreign` (`related_product_id`),
  KEY `related_products_product_id_foreign` (`product_id`),
  CONSTRAINT `related_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `avored_products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `related_products_related_product_id_foreign` FOREIGN KEY (`related_product_id`) REFERENCES `avored_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_related_products`
--

LOCK TABLES `avored_related_products` WRITE;
/*!40000 ALTER TABLE `avored_related_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_related_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_reviews`
--

DROP TABLE IF EXISTS `avored_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `star` double(8,2) NOT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('ENABLED','DISABLED') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DISABLED',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_product_id_foreign` (`product_id`),
  KEY `reviews_user_id_foreign` (`user_id`),
  CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `avored_products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `avored_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_reviews`
--

LOCK TABLES `avored_reviews` WRITE;
/*!40000 ALTER TABLE `avored_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_roles`
--

DROP TABLE IF EXISTS `avored_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_roles`
--

LOCK TABLES `avored_roles` WRITE;
/*!40000 ALTER TABLE `avored_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_states`
--

DROP TABLE IF EXISTS `avored_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_states` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(10) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `states_country_id_foreign` (`country_id`),
  CONSTRAINT `states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `avored_countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_states`
--

LOCK TABLES `avored_states` WRITE;
/*!40000 ALTER TABLE `avored_states` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_subscribers`
--

DROP TABLE IF EXISTS `avored_subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_subscribers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscribers_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_subscribers`
--

LOCK TABLES `avored_subscribers` WRITE;
/*!40000 ALTER TABLE `avored_subscribers` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_subscribers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_tax_group_tax_rule_pivot`
--

DROP TABLE IF EXISTS `avored_tax_group_tax_rule_pivot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_tax_group_tax_rule_pivot` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tax_rule_id` int(10) unsigned NOT NULL,
  `tax_group_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tax_group_tax_rule_pivot_tax_rule_id_foreign` (`tax_rule_id`),
  KEY `tax_group_tax_rule_pivot_tax_group_id_foreign` (`tax_group_id`),
  CONSTRAINT `tax_group_tax_rule_pivot_tax_group_id_foreign` FOREIGN KEY (`tax_group_id`) REFERENCES `avored_tax_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tax_group_tax_rule_pivot_tax_rule_id_foreign` FOREIGN KEY (`tax_rule_id`) REFERENCES `avored_tax_rules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_tax_group_tax_rule_pivot`
--

LOCK TABLES `avored_tax_group_tax_rule_pivot` WRITE;
/*!40000 ALTER TABLE `avored_tax_group_tax_rule_pivot` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_tax_group_tax_rule_pivot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_tax_groups`
--

DROP TABLE IF EXISTS `avored_tax_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_tax_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_tax_groups`
--

LOCK TABLES `avored_tax_groups` WRITE;
/*!40000 ALTER TABLE `avored_tax_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_tax_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_tax_rules`
--

DROP TABLE IF EXISTS `avored_tax_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_tax_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_id` int(10) unsigned DEFAULT NULL,
  `state_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `percentage` double(8,6) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tax_rules_country_id_foreign` (`country_id`),
  CONSTRAINT `tax_rules_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `avored_countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_tax_rules`
--

LOCK TABLES `avored_tax_rules` WRITE;
/*!40000 ALTER TABLE `avored_tax_rules` DISABLE KEYS */;
INSERT INTO `avored_tax_rules` VALUES (1,'NZ Tax Rule',141,NULL,'*','*',15.000000,1,'2018-02-23 10:10:32','2018-02-23 10:10:32');
/*!40000 ALTER TABLE `avored_tax_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_user_viewed_products`
--

DROP TABLE IF EXISTS `avored_user_viewed_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_user_viewed_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_viewed_products_product_id_foreign` (`product_id`),
  KEY `user_viewed_products_user_id_foreign` (`user_id`),
  CONSTRAINT `user_viewed_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `avored_products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_viewed_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `avored_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_user_viewed_products`
--

LOCK TABLES `avored_user_viewed_products` WRITE;
/*!40000 ALTER TABLE `avored_user_viewed_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_user_viewed_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_users`
--

DROP TABLE IF EXISTS `avored_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('GUEST','LIVE') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'LIVE',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_users`
--

LOCK TABLES `avored_users` WRITE;
/*!40000 ALTER TABLE `avored_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_visitors`
--

DROP TABLE IF EXISTS `avored_visitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_visitors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `agent` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `visitors_user_id_foreign` (`user_id`),
  CONSTRAINT `visitors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `avored_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_visitors`
--

LOCK TABLES `avored_visitors` WRITE;
/*!40000 ALTER TABLE `avored_visitors` DISABLE KEYS */;
INSERT INTO `avored_visitors` VALUES (1,'127.0.0.1','install/database/data','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36',NULL,'2018-02-23 10:10:32','2018-02-23 10:10:32'),(2,'127.0.0.1','install/database/data','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36',NULL,'2018-02-23 10:22:07','2018-02-23 10:22:07'),(3,'127.0.0.1','install/admin','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36',NULL,'2018-02-23 10:22:07','2018-02-23 10:22:07');
/*!40000 ALTER TABLE `avored_visitors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avored_wishlists`
--

DROP TABLE IF EXISTS `avored_wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avored_wishlists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlists_user_id_foreign` (`user_id`),
  KEY `wishlists_product_id_foreign` (`product_id`),
  CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `avored_products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `avored_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_wishlists`
--

LOCK TABLES `avored_wishlists` WRITE;
/*!40000 ALTER TABLE `avored_wishlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `avored_wishlists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-24 12:27:47
