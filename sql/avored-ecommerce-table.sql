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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_categories`
--

LOCK TABLES `avored_categories` WRITE;
/*!40000 ALTER TABLE `avored_categories` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_category_product`
--

LOCK TABLES `avored_category_product` WRITE;
/*!40000 ALTER TABLE `avored_category_product` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_configurations`
--

LOCK TABLES `avored_configurations` WRITE;
/*!40000 ALTER TABLE `avored_configurations` DISABLE KEYS */;
INSERT INTO `avored_configurations` VALUES (1,'general_site_title','AvoRed Laravel Ecommerce','2018-02-23 10:10:32','2018-02-23 10:10:32'),(2,'general_site_description','AvoRed Laravel Ecommerce','2018-02-23 10:10:32','2018-02-23 10:10:32'),(3,'avored_tax_class_default_country_for_tax_calculation','141','2018-02-23 10:10:32','2018-02-23 10:10:32');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_pages`
--

LOCK TABLES `avored_pages` WRITE;
/*!40000 ALTER TABLE `avored_pages` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_product_images`
--

LOCK TABLES `avored_product_images` WRITE;
/*!40000 ALTER TABLE `avored_product_images` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_product_prices`
--

LOCK TABLES `avored_product_prices` WRITE;
/*!40000 ALTER TABLE `avored_product_prices` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_products`
--

LOCK TABLES `avored_products` WRITE;
/*!40000 ALTER TABLE `avored_products` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avored_visitors`
--

LOCK TABLES `avored_visitors` WRITE;
/*!40000 ALTER TABLE `avored_visitors` DISABLE KEYS */;
INSERT INTO `avored_visitors` VALUES (1,'127.0.0.1','install/database/data','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36',NULL,'2018-02-23 10:10:32','2018-02-23 10:10:32');
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

-- Dump completed on 2018-02-24 12:13:54
