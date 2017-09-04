# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.6.35)
# Datenbank: db12345678_baukasten
# Erstellt am: 2017-09-04 13:54:07 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Export von Tabelle craft_assetfiles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assetfiles`;

CREATE TABLE `craft_assetfiles` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetfiles_filename_folderId_unq_idx` (`filename`,`folderId`),
  KEY `craft_assetfiles_sourceId_fk` (`sourceId`),
  KEY `craft_assetfiles_folderId_fk` (`folderId`),
  CONSTRAINT `craft_assetfiles_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `craft_assetfolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assetfiles_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assetfiles_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_assetfiles` WRITE;
/*!40000 ALTER TABLE `craft_assetfiles` DISABLE KEYS */;

INSERT INTO `craft_assetfiles` (`id`, `sourceId`, `folderId`, `filename`, `kind`, `width`, `height`, `size`, `dateModified`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(11,1,1,'image_01.jpg','image',4000,3000,888342,'2017-04-20 09:16:37','2017-04-17 18:46:13','2017-06-08 17:04:47','d74680cf-438d-4052-9036-6bb2dd4ae2bc'),
	(12,1,1,'image_02.jpg','image',4000,2660,690372,'2017-04-20 09:16:39','2017-04-17 18:46:14','2017-06-08 17:05:09','af99f5dc-b5c5-415b-a44c-56b5388fcdd6'),
	(13,1,1,'image_03.jpg','image',2660,4000,348087,'2017-04-20 09:16:41','2017-04-17 18:46:15','2017-06-08 17:05:26','1a37c407-09d1-4e8c-b276-b5adaab2e4d7'),
	(14,1,1,'image_04.jpg','image',2660,4000,345495,'2017-04-20 09:16:42','2017-04-17 18:46:16','2017-06-08 17:05:44','1219a84f-94ab-44d6-921f-5ea1a65c8489');

/*!40000 ALTER TABLE `craft_assetfiles` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_assetfolders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assetfolders`;

CREATE TABLE `craft_assetfolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetfolders_name_parentId_sourceId_unq_idx` (`name`,`parentId`,`sourceId`),
  KEY `craft_assetfolders_parentId_fk` (`parentId`),
  KEY `craft_assetfolders_sourceId_fk` (`sourceId`),
  CONSTRAINT `craft_assetfolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `craft_assetfolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_assetfolders_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_assetfolders` WRITE;
/*!40000 ALTER TABLE `craft_assetfolders` DISABLE KEYS */;

INSERT INTO `craft_assetfolders` (`id`, `parentId`, `sourceId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,NULL,1,'Site Images','','2017-04-16 22:48:52','2017-04-16 22:48:52','e0255984-fbff-4747-b52c-a1b52c263e0d'),
	(2,NULL,2,'Site Downloads','','2017-04-16 22:48:52','2017-04-16 22:48:52','9925a79c-a703-4e9b-864a-984de140b806'),
	(3,NULL,3,'Site Graphics','','2017-04-16 22:48:52','2017-04-16 22:48:52','2fd35fd8-f0d6-4d9d-8c20-b277fb4daf88'),
	(4,NULL,4,'Site Users','','2017-04-16 22:48:52','2017-04-16 22:48:52','e9f8b2ad-b6b5-41b6-a42f-83489e5eeead');

/*!40000 ALTER TABLE `craft_assetfolders` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_assetindexdata
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assetindexdata`;

CREATE TABLE `craft_assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sourceId` int(10) NOT NULL,
  `offset` int(10) NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recordId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetindexdata_sessionId_sourceId_offset_unq_idx` (`sessionId`,`sourceId`,`offset`),
  KEY `craft_assetindexdata_sourceId_fk` (`sourceId`),
  CONSTRAINT `craft_assetindexdata_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_assetsources
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assetsources`;

CREATE TABLE `craft_assetsources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assetsources_name_unq_idx` (`name`),
  UNIQUE KEY `craft_assetsources_handle_unq_idx` (`handle`),
  KEY `craft_assetsources_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_assetsources_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_assetsources` WRITE;
/*!40000 ALTER TABLE `craft_assetsources` DISABLE KEYS */;

INSERT INTO `craft_assetsources` (`id`, `name`, `handle`, `type`, `settings`, `sortOrder`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Site Images','siteImages','Local','{\"path\":\"{uploadPath}\\/images\\/\",\"publicURLs\":\"1\",\"url\":\"{uploadUrl}\\/images\\/\"}',1,145,'2017-04-16 22:48:52','2017-06-08 16:52:41','ff0b5648-f1d6-418e-ba27-5075ee7ed5ca'),
	(2,'Site Downloads','siteDownloads','Local','{\"path\":\"{uploadPath}\\/downloads\\/\",\"publicURLs\":\"1\",\"url\":\"{uploadUrl}\\/downloads\\/\"}',2,146,'2017-04-16 22:48:52','2017-06-08 16:52:56','8f7efc74-2340-4272-aeda-5ed035ef86ed'),
	(3,'Site Graphics','siteGraphics','Local','{\"path\":\"{uploadPath}\\/graphics\\/\",\"publicURLs\":\"1\",\"url\":\"{uploadUrl}\\/graphics\\/\"}',3,147,'2017-04-16 22:48:52','2017-06-08 16:53:07','e8bc61b2-50c2-490c-9613-acb241ba431f'),
	(4,'Site Users','siteUsers','Local','{\"path\":\"{uploadPath}\\/users\\/\",\"publicURLs\":\"1\",\"url\":\"{uploadUrl}\\/users\\/\"}',4,148,'2017-04-16 22:48:52','2017-06-08 16:53:23','c2ff7f4c-55dc-4a42-93d4-59505cda75f0');

/*!40000 ALTER TABLE `craft_assetsources` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_assettransformindex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assettransformindex`;

CREATE TABLE `craft_assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT NULL,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_assettransformindex_sourceId_fileId_location_idx` (`sourceId`,`fileId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_assettransformindex` WRITE;
/*!40000 ALTER TABLE `craft_assettransformindex` DISABLE KEYS */;

INSERT INTO `craft_assettransformindex` (`id`, `fileId`, `filename`, `format`, `location`, `sourceId`, `fileExists`, `inProgress`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,11,'image_01.jpg',NULL,'_300xAUTO_crop_center-center',1,1,1,'2017-07-13 22:10:13','2017-07-13 22:10:13','2017-07-13 22:10:13','d37ad164-23a7-4b44-9692-f8ab438af2d5');

/*!40000 ALTER TABLE `craft_assettransformindex` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_assettransforms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_assettransforms`;

CREATE TABLE `craft_assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `height` int(10) DEFAULT NULL,
  `width` int(10) DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(10) DEFAULT NULL,
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_assettransforms_name_unq_idx` (`name`),
  UNIQUE KEY `craft_assettransforms_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_assettransforms` WRITE;
/*!40000 ALTER TABLE `craft_assettransforms` DISABLE KEYS */;

INSERT INTO `craft_assettransforms` (`id`, `name`, `handle`, `mode`, `position`, `height`, `width`, `format`, `quality`, `dimensionChangeTime`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Social Sharing','socialSharing','crop','center-center',630,1200,NULL,100,'2017-06-08 17:00:05','2017-06-08 17:00:05','2017-06-08 17:00:05','882d9ee5-f123-4c50-84b5-43e17f3e8c6f');

/*!40000 ALTER TABLE `craft_assettransforms` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_categories`;

CREATE TABLE `craft_categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_categories_groupId_fk` (`groupId`),
  CONSTRAINT `craft_categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_categories_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_categorygroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_categorygroups`;

CREATE TABLE `craft_categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_categorygroups_name_unq_idx` (`name`),
  UNIQUE KEY `craft_categorygroups_handle_unq_idx` (`handle`),
  KEY `craft_categorygroups_structureId_fk` (`structureId`),
  KEY `craft_categorygroups_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_categorygroups` WRITE;
/*!40000 ALTER TABLE `craft_categorygroups` DISABLE KEYS */;

INSERT INTO `craft_categorygroups` (`id`, `structureId`, `fieldLayoutId`, `name`, `handle`, `hasUrls`, `template`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,58,'Default','default',1,'','2017-04-16 22:50:30','2017-04-16 22:50:30','188f3c4d-2d6c-46be-9c65-903ac3db6c76');

/*!40000 ALTER TABLE `craft_categorygroups` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_categorygroups_i18n
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_categorygroups_i18n`;

CREATE TABLE `craft_categorygroups_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `urlFormat` text COLLATE utf8_unicode_ci,
  `nestedUrlFormat` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_categorygroups_i18n_groupId_locale_unq_idx` (`groupId`,`locale`),
  KEY `craft_categorygroups_i18n_locale_fk` (`locale`),
  CONSTRAINT `craft_categorygroups_i18n_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_categorygroups_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_categorygroups_i18n` WRITE;
/*!40000 ALTER TABLE `craft_categorygroups_i18n` DISABLE KEYS */;

INSERT INTO `craft_categorygroups_i18n` (`id`, `groupId`, `locale`, `urlFormat`, `nestedUrlFormat`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'de','default/{slug}','{parent.uri}/{slug}','2017-04-16 22:50:30','2017-04-16 22:50:30','099a53d9-25b6-48e6-8d42-cc29c06ffa2a');

/*!40000 ALTER TABLE `craft_categorygroups_i18n` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_content`;

CREATE TABLE `craft_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_pluginSeomatic` text COLLATE utf8_unicode_ci,
  `field_settingsFocalPoint` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_singleAnchor` text COLLATE utf8_unicode_ci,
  `field_singleButton` text COLLATE utf8_unicode_ci,
  `field_singleCode` text COLLATE utf8_unicode_ci,
  `field_singleDefinitionList` text COLLATE utf8_unicode_ci,
  `field_singleEmbedCode` text COLLATE utf8_unicode_ci,
  `field_singleHeadline` text COLLATE utf8_unicode_ci,
  `field_singleLabel` text COLLATE utf8_unicode_ci,
  `field_singleQuote` text COLLATE utf8_unicode_ci,
  `field_singleRichText` text COLLATE utf8_unicode_ci,
  `field_singleSource` text COLLATE utf8_unicode_ci,
  `field_singleSourceUrl` text COLLATE utf8_unicode_ci,
  `field_singleSubline` text COLLATE utf8_unicode_ci,
  `field_singleText` text COLLATE utf8_unicode_ci,
  `field_pluginPreparseDominantColor` text COLLATE utf8_unicode_ci,
  `field_singleSeoTitle` text COLLATE utf8_unicode_ci,
  `field_singleIntroText` text COLLATE utf8_unicode_ci,
  `field_pluginSeomaticNews` text COLLATE utf8_unicode_ci,
  `field_pluginSeomaticPages` text COLLATE utf8_unicode_ci,
  `field_globalGoogleAnalytics` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_content_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_content_title_idx` (`title`),
  KEY `craft_content_locale_fk` (`locale`),
  CONSTRAINT `craft_content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_content_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_content` WRITE;
/*!40000 ALTER TABLE `craft_content` DISABLE KEYS */;

INSERT INTO `craft_content` (`id`, `elementId`, `locale`, `title`, `field_pluginSeomatic`, `field_settingsFocalPoint`, `field_singleAnchor`, `field_singleButton`, `field_singleCode`, `field_singleDefinitionList`, `field_singleEmbedCode`, `field_singleHeadline`, `field_singleLabel`, `field_singleQuote`, `field_singleRichText`, `field_singleSource`, `field_singleSourceUrl`, `field_singleSubline`, `field_singleText`, `field_pluginPreparseDominantColor`, `field_singleSeoTitle`, `field_singleIntroText`, `field_pluginSeomaticNews`, `field_pluginSeomaticPages`, `field_globalGoogleAnalytics`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-16 21:53:42','2017-09-03 17:05:28','d0823a0f-a07f-4750-aae2-c64b5131b2c5'),
	(4,4,'de','Homepage',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-16 22:48:52','2017-04-16 22:48:52','33215c87-bbc0-45fa-8e1c-adb0601eaa92'),
	(5,5,'de','Modules',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,NULL,'2017-04-16 22:48:52','2017-07-19 09:58:51','1b8d64a7-32b4-4dd0-9b86-eee90214b9af'),
	(6,6,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-16 22:49:03','2017-09-03 22:18:26','59c70a0e-77ae-46fb-8f2a-00ff9bf4dd8f'),
	(7,7,'de',NULL,NULL,NULL,NULL,'{\"type\":\"entry\",\"email\":\"\",\"tel\":\"\",\"custom\":\"\",\"entry\":[\"5\"],\"asset\":\"\",\"category\":\"\",\"customText\":\"HOME\",\"target\":\"\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-17 02:19:23','2017-07-19 09:58:51','f1098126-0bd8-441e-ad39-d58120f35a71'),
	(8,9,'de',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-17 18:45:37','2017-07-19 09:58:51','2c88f81e-af36-43a6-bdaf-5f3f57300e65'),
	(9,11,'de','Image 01',NULL,'52.43% 34.78%',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'#3d372f',NULL,NULL,NULL,NULL,NULL,'2017-04-17 18:46:13','2017-06-08 17:04:47','58b7be95-b740-43dc-9da0-403ccb510ded'),
	(10,12,'de','Image 02',NULL,'26.76% 45.37%',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'#a7a7a7',NULL,NULL,NULL,NULL,NULL,'2017-04-17 18:46:14','2017-06-08 17:05:09','4b04ecc5-c7a8-4917-9955-0249ad6c39c0'),
	(11,13,'de','Image 03',NULL,'60.43% 52.08%',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'#656565',NULL,NULL,NULL,NULL,NULL,'2017-04-17 18:46:15','2017-06-08 17:05:26','1f2ec258-2381-4ab3-a2e0-95862b64e8dc'),
	(12,14,'de','Image 04',NULL,'55.43% 31.07%',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'#c7c7c7',NULL,NULL,NULL,NULL,NULL,'2017-04-17 18:46:16','2017-06-08 17:05:44','64eabe10-07c0-41b0-bfe8-5639673636c0'),
	(13,15,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-17 18:46:19','2017-07-19 09:58:51','fe97cb4b-f9e3-4ca7-8199-40a91f6f27ce'),
	(14,20,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Das ist eine Headline',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-19 21:20:00','2017-07-19 09:58:51','5c8b4628-9327-4ad7-af5f-cbea64f46e44'),
	(15,22,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, <a href=\"{entry:4:url}\">consectetur adipiscing elit</a>. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.</p>\n<p><strong>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.</strong><br /></p>\n<p><em>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.</em><br /></p>\n<p><del>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.</del></p>\n<ul><li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.</li><li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.<ul><li>!Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.</li><li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.\n<ul><li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.</li></ul></li></ul></li><li>Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.</li><li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna.</li><li>In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.</li></ul><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.</p>\n<ol><li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.</li><li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.\n<ol><li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.</li><li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.\n<ol><li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.</li></ol></li></ol></li></ol>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-19 21:28:03','2017-07-19 09:58:51','750018e6-7cff-4dfd-8e61-f2ab6774c9f2'),
	(20,28,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, quas appetere qui te, vel ne enim putent tractatos, ullum inani et duo. Per placerat ocurreret te, eos diceret accumsan in? Qui no viderer vivendum facilisi, pro illud possim legimus at. Illum sonet numquam id vis. Ei accumsan nominati eos? Nam suas admodum ancillae ne? Nullam noster scribentur per cu, te duis consetetur adipiscing pri? Mollis deseruisse te mei. Cu euismod singulis suavitate eam. Ex eos purto similique, an eum fabellas adolescens! Dolor signiferumque cum id. Dicunt cetero detracto mea ei? Ex dico dolor vis, splendide vituperatoribus cu usu, ei mea posse sonet labores! Ad duo veritus intellegam, alterum appellantur vix et. Vis dissentiet repudiandae eu, decore integre principes per ei. Id vim stet mentitum repudiandae, pri mentitum qualisque ea, ex usu augue viderer suscipit. Ea vel mucius graecis, mentitum perfecto eu duo, duo eu ipsum urbanitas. Eruditi recteque abhorreant ius et, omnes dolore debitis vel ei? An inani copiosae nec, audiam sanctus nostrum est ea? Assum iuvaret mea id.</p>\n<p>An populo iriure interesset sit! Eum quas zril nostrum ei. Est no esse illum, falli doming vix no? No pri causae petentium! Id vocibus volutpat deterruisset usu, vocibus verterem sed ne, usu ne similique temporibus! Ex vix dicat discere partiendo, at ignota corpora mei, posse percipitur mea ut. At doming commodo deseruisse sit, eu diceret fabulas eligendi vix, sea nostrum scriptorem ad! Quo cu eius tollit instructior.</p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-19 23:18:28','2017-07-19 09:58:51','2717fcbd-5134-4f81-acad-6b670090c144'),
	(21,29,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-19 23:18:28','2017-07-19 09:58:51','e08ae2fb-4453-4c95-88a6-ebb3f1e86214'),
	(22,30,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'An populo iriure interesset sit! Eum quas zril nostrum ei. Est no esse illum, falli doming vix no?',NULL,'Max Mustermann','{\"type\":\"custom\",\"custom\":\"http:\\/\\/google.com\",\"customText\":\"YO\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-19 23:18:28','2017-07-19 09:58:51','46d1aa50-79c8-471e-acc1-a755abe133b9'),
	(23,31,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-19 23:18:28','2017-07-19 09:58:51','2e2b6ae3-82fa-4fd4-bc32-2848ab41a16c'),
	(24,32,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-19 23:18:28','2017-07-19 09:58:51','a325a432-9545-44f5-b610-a0b36f13890b'),
	(25,34,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'An populo iriure interesset sit! Eum quas zril nostrum ei. Est no esse illum, falli doming vix no? No pri causae petentium! Id vocibus volutpat deterruisset usu, vocibus verterem sed ne, usu ne similique temporibus! Ex vix dicat discere partiendo, at ignota corpora mei, posse percipitur mea ut. At doming commodo deseruisse sit, eu diceret fabulas eligendi vix, sea nostrum scriptorem ad! Quo cu eius tollit instructior. ',NULL,'Max Mustermann','{\"type\":\"custom\",\"custom\":\"http:\\/\\/google.com\",\"customText\":\"\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-20 00:06:35','2017-07-19 09:58:51','d1ffa843-375b-4768-9d23-d041d056d867'),
	(26,35,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-20 00:07:18','2017-07-19 09:58:51','765aa23f-a4a3-4929-83ea-0f768bd50c5d'),
	(27,37,'de',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-20 00:11:24','2017-07-19 09:58:51','7b8bb989-0326-4e14-acc0-ad5ff239491a'),
	(28,39,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Mimi the Cat',NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-20 00:11:24','2017-07-19 09:58:51','578cf9f6-2afe-4b07-b71c-85bdd45d9f1c'),
	(37,49,'de',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-20 09:21:50','2017-07-19 09:58:51','ab925287-f9aa-4037-8dd1-259f7f5f9623'),
	(38,51,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, quas appetere qui te, vel ne enim putent tractatos, ullum inani et duo. Per placerat ocurreret te, eos diceret accumsan in? Qui no viderer vivendum facilisi, pro illud possim legimus at. Illum sonet numquam id vis. Ei accumsan nominati eos? Nam suas admodum ancillae ne? Nullam noster scribentur per cu, te duis consetetur adipiscing pri? Mollis deseruisse te mei. Cu euismod singulis suavitate eam. Ex eos purto similique, an eum fabellas adolescens! Dolor signiferumque cum id. Dicunt cetero detracto mea ei? Ex dico dolor vis, splendide vituperatoribus cu usu, ei mea posse sonet labores! Ad duo veritus intellegam, alterum appellantur vix et. Vis dissentiet repudiandae eu, decore integre principes per ei. Id vim stet mentitum repudiandae, pri mentitum qualisque ea, ex usu augue viderer suscipit. Ea vel mucius graecis, mentitum perfecto eu duo, duo eu ipsum urbanitas. Eruditi recteque abhorreant ius et, omnes dolore debitis vel ei? An inani copiosae nec, audiam sanctus nostrum est ea? Assum iuvaret mea id.</p>\n<p>An populo iriure interesset sit! Eum quas zril nostrum ei. Est no esse illum, falli doming vix no? No pri causae petentium! Id vocibus volutpat deterruisset usu, vocibus verterem sed ne, usu ne similique temporibus! Ex vix dicat discere partiendo, at ignota corpora mei, posse percipitur mea ut. At doming commodo deseruisse sit, eu diceret fabulas eligendi vix, sea nostrum scriptorem ad! Quo cu eius tollit instructior.<br /></p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-20 09:21:50','2017-07-19 09:58:51','b89b29ab-f8e2-4cd0-ace6-2968a6b487eb'),
	(39,52,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-20 09:25:22','2017-07-19 09:58:51','b0b15206-c96d-4832-82a4-1da2d616f946'),
	(40,54,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-20 11:41:09','2017-07-19 09:58:51','d558b2fb-ac66-494d-9248-b3ad9a1d65b8'),
	(41,56,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-20 12:31:26','2017-07-19 09:58:51','d45520d5-d9b2-4f57-8f34-548f22641ebc'),
	(42,61,'de',NULL,NULL,NULL,NULL,NULL,NULL,'[{\"col1\":\"Term 1\",\"col2\":\"Lorem ipsum dolor sit amet, quas appetere qui te, vel ne enim putent tractatos, ullum inani et duo. Per placerat ocurreret te, eos diceret accumsan in? Qui no viderer vivendum facilisi, pro illud possim legimus at. Illum sonet numquam id vis. Ei accumsan nominati eos? Nam suas admodum ancillae ne? Nullam noster scribentur per cu, te duis consetetur adipiscing pri?\"},{\"col1\":\"Term 2\",\"col2\":\"Lorem ipsum dolor sit amet, quas appetere qui te, vel ne enim putent tractatos, ullum inani et duo. Per placerat ocurreret te, eos diceret accumsan in? Qui no viderer vivendum facilisi, pro illud possim legimus at. Illum sonet numquam id vis. Ei accumsan nominati eos? Nam suas admodum ancillae ne? Nullam noster scribentur per cu, te duis consetetur adipiscing pri?\"},{\"col1\":\"Term 3\",\"col2\":\"Lorem ipsum dolor sit amet, quas appetere qui te, vel ne enim putent tractatos, ullum inani et duo. Per placerat ocurreret te, eos diceret accumsan in? Qui no viderer vivendum facilisi, pro illud possim legimus at. Illum sonet numquam id vis. Ei accumsan nominati eos? Nam suas admodum ancillae ne? Nullam noster scribentur per cu, te duis consetetur adipiscing pri?\"},{\"col1\":\"Term 4\",\"col2\":\"Lorem ipsum dolor sit amet, quas appetere qui te, vel ne enim putent tractatos, ullum inani et duo. Per placerat ocurreret te, eos diceret accumsan in? Qui no viderer vivendum facilisi, pro illud possim legimus at. Illum sonet numquam id vis. Ei accumsan nominati eos? Nam suas admodum ancillae ne? Nullam noster scribentur per cu, te duis consetetur adipiscing pri?\"},{\"col1\":\"Term 5\",\"col2\":\"Lorem ipsum dolor sit amet, quas appetere qui te, vel ne enim putent tractatos, ullum inani et duo. Per placerat ocurreret te, eos diceret accumsan in? Qui no viderer vivendum facilisi, pro illud possim legimus at. Illum sonet numquam id vis. Ei accumsan nominati eos? Nam suas admodum ancillae ne? Nullam noster scribentur per cu, te duis consetetur adipiscing pri?\"}]',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-20 12:52:30','2017-07-19 09:58:52','2fe603b4-4251-49ba-ba1d-f7afc12d17c5'),
	(44,65,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<script src=\"https://gist.github.com/davidhellmann/bcff756336391e0ad3173a3ceba34511.js\"></script>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-20 13:35:13','2017-07-19 09:58:52','ab95d8c8-7ed7-455e-bd82-2c367dbe3b02'),
	(47,71,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-20 13:52:06','2017-07-19 09:58:52','cf69c476-d962-44a2-96f3-eafd30642f45'),
	(48,73,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-20 14:00:53','2017-07-19 09:58:52','38e05b05-322c-4c14-9d87-99085e4fd71d'),
	(49,74,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Accordion',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-20 14:00:53','2017-07-19 09:58:52','c44c6ba9-0b6f-4a17-9816-bfe82ec8f4ab'),
	(50,75,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, quas appetere qui te, vel ne enim putent tractatos, ullum inani et duo. Per placerat ocurreret te, eos diceret accumsan in? Qui no viderer vivendum facilisi, pro illud possim legimus at. Illum sonet numquam id vis. Ei accumsan nominati eos? Nam suas admodum ancillae ne? Nullam noster scribentur per cu, te duis consetetur adipiscing pri? Mollis deseruisse te mei. Cu euismod singulis suavitate eam. Ex eos purto similique, an eum fabellas adolescens! Dolor signiferumque cum id. Dicunt cetero detracto mea ei? Ex dico dolor vis, splendide vituperatoribus cu usu, ei mea posse sonet labores! Ad duo veritus intellegam, alterum appellantur vix et. Vis dissentiet repudiandae eu, decore integre principes per ei. Id vim stet mentitum repudiandae, pri mentitum qualisque ea, ex usu augue viderer suscipit. Ea vel mucius graecis, mentitum perfecto eu duo, duo eu ipsum urbanitas. Eruditi recteque abhorreant ius et, omnes dolore debitis vel ei? An inani copiosae nec, audiam sanctus nostrum est ea? Assum iuvaret mea id.</p>\n<p>An populo iriure interesset sit! Eum quas zril nostrum ei. Est no esse illum, falli doming vix no? No pri causae petentium! Id vocibus volutpat deterruisset usu, vocibus verterem sed ne, usu ne similique temporibus! Ex vix dicat discere partiendo, at ignota corpora mei, posse percipitur mea ut. At doming commodo deseruisse sit, eu diceret fabulas eligendi vix, sea nostrum scriptorem ad! Quo cu eius tollit instructior.</p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-20 14:00:53','2017-07-19 09:58:52','03e00a3e-9ad9-4574-9962-8b5a2c6564c9'),
	(51,76,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ein weiteres Label',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-20 14:00:53','2017-07-19 09:58:52','ed2fb3f2-5612-4c40-b555-0a15d618ab64'),
	(52,77,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, quas appetere qui te, vel ne enim putent tractatos, ullum inani et duo. Per placerat ocurreret te, eos diceret accumsan in? Qui no viderer vivendum facilisi, pro illud possim legimus at. Illum sonet numquam id vis. Ei accumsan nominati eos? Nam suas admodum ancillae ne? Nullam noster scribentur per cu, te duis consetetur adipiscing pri? Mollis deseruisse te mei. Cu euismod singulis suavitate eam. Ex eos purto similique, an eum fabellas adolescens! Dolor signiferumque cum id. Dicunt cetero detracto mea ei? Ex dico dolor vis, splendide vituperatoribus cu usu, ei mea posse sonet labores! Ad duo veritus intellegam, alterum appellantur vix et. Vis dissentiet repudiandae eu, decore integre principes per ei. Id vim stet mentitum repudiandae, pri mentitum qualisque ea, ex usu augue viderer suscipit. Ea vel mucius graecis, mentitum perfecto eu duo, duo eu ipsum urbanitas. Eruditi recteque abhorreant ius et, omnes dolore debitis vel ei? An inani copiosae nec, audiam sanctus nostrum est ea? Assum iuvaret mea id.<br /></p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-20 14:00:53','2017-07-19 09:58:52','a012072a-8068-4a6b-927b-ac598ad21bc8'),
	(53,78,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-20 14:09:24','2017-07-19 09:58:52','0e427122-63b0-4dbd-8981-fafae68a0059'),
	(54,80,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-20 14:46:34','2017-07-19 09:58:51','36540ff8-d8ec-4928-99d0-6fed9c8efcb7'),
	(55,82,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-20 15:34:51','2017-07-19 09:58:52','ab765c0d-bae6-482b-8621-31f0a9c188ae'),
	(56,84,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-20 15:34:51','2017-07-19 09:58:52','1904dc2b-1f22-4ccd-81b7-03ae01618b64'),
	(57,85,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, quas appetere qui te, vel ne enim putent tractatos, ullum inani et duo. Per placerat ocurreret te, eos diceret accumsan in? Qui no viderer vivendum facilisi, pro illud possim legimus at. Illum sonet numquam id vis. Ei accumsan nominati eos? Nam suas admodum ancillae ne? Nullam noster scribentur per cu, te duis consetetur adipiscing pri? Mollis deseruisse te mei. Cu euismod singulis suavitate eam. Ex eos purto similique, an eum fabellas adolescens! Dolor signiferumque cum id. Dicunt cetero detracto mea ei? Ex dico dolor vis, splendide vituperatoribus cu usu, ei mea posse sonet labores! Ad duo veritus intellegam, alterum appellantur vix et. Vis dissentiet repudiandae eu, decore integre principes per ei. Id vim stet mentitum repudiandae, pri mentitum qualisque ea, ex usu augue viderer suscipit. Ea vel mucius graecis, mentitum perfecto eu duo, duo eu ipsum urbanitas. Eruditi recteque abhorreant ius et, omnes dolore debitis vel ei? An inani copiosae nec, audiam sanctus nostrum est ea? Assum iuvaret mea id.</p>\n<p>An populo iriure interesset sit! Eum quas zril nostrum ei. Est no esse illum, falli doming vix no? No pri causae petentium! Id vocibus volutpat deterruisset usu, vocibus verterem sed ne, usu ne similique temporibus! Ex vix dicat discere partiendo, at ignota corpora mei, posse percipitur mea ut. At doming commodo deseruisse sit, eu diceret fabulas eligendi vix, sea nostrum scriptorem ad! Quo cu eius tollit instructior.<br /></p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-20 15:34:51','2017-07-19 09:58:52','c56ccf60-aab0-45fc-9c65-39f771be43e4'),
	(58,86,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-20 15:34:51','2017-07-19 09:58:52','07727dcf-d018-42db-a174-c450b96f900e'),
	(59,87,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>An populo iriure interesset sit! Eum quas zril nostrum ei. Est no esse illum, falli doming vix no? No pri causae petentium! Id vocibus volutpat deterruisset usu, vocibus verterem sed ne, usu ne similique temporibus! Ex vix dicat discere partiendo, at ignota corpora mei, posse percipitur mea ut. At doming commodo deseruisse sit, eu diceret fabulas eligendi vix, sea nostrum scriptorem ad! Quo cu eius tollit instructior. </p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-20 15:34:51','2017-07-19 09:58:52','ef4dfc24-a9b8-4375-b0b1-64c43be68031'),
	(60,88,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-20 15:34:51','2017-07-19 09:58:52','8648615e-3c33-4f3c-86fb-c96e8856bad2'),
	(61,90,'de',NULL,NULL,NULL,NULL,'{\"type\":\"entry\",\"email\":\"\",\"tel\":\"\",\"custom\":\"\",\"entry\":[\"5\"],\"asset\":\"\",\"category\":\"\",\"customText\":\"HOME\",\"target\":\"\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-06-26 21:11:47','2017-07-19 09:58:51','2d678475-e81d-48a9-87c4-5df7a63f508a'),
	(62,92,'de',NULL,NULL,NULL,NULL,'{\"type\":\"entry\",\"email\":\"\",\"tel\":\"\",\"custom\":\"\",\"entry\":[\"5\"],\"asset\":\"\",\"category\":\"\",\"customText\":\"HOME\",\"target\":\"\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-06-26 21:11:47','2017-07-19 09:58:51','cc6bed1c-ea33-4a88-bec6-78473a7742fe'),
	(63,94,'de',NULL,NULL,NULL,NULL,'{\"type\":\"entry\",\"email\":\"\",\"tel\":\"\",\"custom\":\"\",\"entry\":[\"5\"],\"asset\":\"\",\"category\":\"\",\"customText\":\"HOME\",\"target\":\"\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-06-26 21:11:47','2017-07-19 09:58:51','1390a593-1b90-417d-8410-157ed389e049'),
	(71,110,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-07-19 09:26:57','2017-07-19 09:58:51','a4d8aa87-871b-496d-b656-490a49ab038b'),
	(72,112,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ySTsMuOdhRg\" frameborder=\"0\" allowfullscreen></iframe>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-07-19 09:52:11','2017-07-19 09:58:52','cbc6844f-e21c-4e19-90a9-f0b434641fa9'),
	(73,114,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-03 17:01:51','2017-09-03 17:01:51','6f1695ea-94f2-41e3-bde3-94afe6da500a'),
	(74,115,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-03 17:04:46','2017-09-03 17:04:46','a6b5f670-97c7-4dde-ac9d-95c6fdc1607a'),
	(75,116,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-04 13:52:53','2017-09-04 13:52:53','14275065-6515-4fdc-8cdc-a9007ec7fcdd');

/*!40000 ALTER TABLE `craft_content` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_deprecationerrors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_deprecationerrors`;

CREATE TABLE `craft_deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) unsigned NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `templateLine` smallint(6) unsigned DEFAULT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `traces` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_elementindexsettings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_elementindexsettings`;

CREATE TABLE `craft_elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_elementindexsettings_type_unq_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_elements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_elements`;

CREATE TABLE `craft_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `archived` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_elements_type_idx` (`type`),
  KEY `craft_elements_enabled_idx` (`enabled`),
  KEY `craft_elements_archived_dateCreated_idx` (`archived`,`dateCreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_elements` WRITE;
/*!40000 ALTER TABLE `craft_elements` DISABLE KEYS */;

INSERT INTO `craft_elements` (`id`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'User',1,0,'2017-04-16 21:53:42','2017-09-03 17:05:28','b9c2bd4b-c068-45fc-9760-bc6107691d2b'),
	(4,'Entry',1,0,'2017-04-16 22:48:52','2017-04-16 22:48:52','a216f836-8252-4f04-aaad-40b19b0fd94a'),
	(5,'Entry',1,0,'2017-04-16 22:48:52','2017-07-19 09:58:51','1528fa5d-880c-4c02-990a-f8c773f5eb9e'),
	(6,'GlobalSet',1,0,'2017-04-16 22:49:03','2017-09-03 22:18:26','05e2ebe3-b333-4020-8e73-24d7e5c9c0de'),
	(7,'Neo_Block',1,0,'2017-04-17 02:19:23','2017-07-19 09:58:51','95c22ec9-eb46-40af-b616-35d483ba7735'),
	(8,'SuperTable_Block',1,0,'2017-04-17 02:19:23','2017-07-19 09:58:51','9ab033e0-2785-4ba9-95f4-9d4f36417e6c'),
	(9,'Neo_Block',1,0,'2017-04-17 18:45:37','2017-07-19 09:58:51','976570eb-3504-4a37-a31e-295ba8f1f4c8'),
	(10,'SuperTable_Block',1,0,'2017-04-17 18:45:37','2017-07-19 09:58:51','abc5ece8-ffa8-41c3-b263-b9936c8a9a56'),
	(11,'Asset',1,0,'2017-04-17 18:46:13','2017-06-08 17:04:47','ae4b1200-1d3f-43dc-9a13-9e6c32e1ffd3'),
	(12,'Asset',1,0,'2017-04-17 18:46:14','2017-06-08 17:05:09','3ad031c9-8a24-4183-b5be-077478ef3454'),
	(13,'Asset',1,0,'2017-04-17 18:46:15','2017-06-08 17:05:26','f92cb31e-d450-463d-95bc-288009105b0b'),
	(14,'Asset',1,0,'2017-04-17 18:46:16','2017-06-08 17:05:44','ce7ca515-c1a7-4b37-805b-484a247e20ae'),
	(15,'Neo_Block',1,0,'2017-04-17 18:46:19','2017-07-19 09:58:51','c5f1953f-3cbc-435e-af8e-9f0876c5edc4'),
	(16,'SuperTable_Block',1,0,'2017-04-17 18:46:20','2017-07-19 09:58:51','19305e63-956d-4cb2-91e9-3791164c54a6'),
	(17,'SuperTable_Block',1,0,'2017-04-19 20:53:27','2017-04-20 20:46:13','4262430b-d9d4-4532-b83d-d41280b15d42'),
	(18,'SuperTable_Block',1,0,'2017-04-19 20:53:40','2017-04-20 20:46:27','1cf7c8ac-134d-4cc6-a943-21b6076705c3'),
	(19,'SuperTable_Block',1,0,'2017-04-19 20:54:05','2017-04-20 20:46:41','981c9f99-c845-41e9-84e1-f8f777c6cadd'),
	(20,'Neo_Block',1,0,'2017-04-19 21:20:00','2017-07-19 09:58:51','0e57cd64-1684-4b2f-87be-3be60c6d9076'),
	(21,'SuperTable_Block',1,0,'2017-04-19 21:20:00','2017-07-19 09:58:51','69fb9b10-29c1-4a10-a076-f59dc0641d94'),
	(22,'Neo_Block',1,0,'2017-04-19 21:28:03','2017-07-19 09:58:51','672c1951-8884-471a-a112-656caa796dc8'),
	(27,'SuperTable_Block',1,0,'2017-04-19 21:54:58','2017-04-20 20:46:51','b6d0e80d-76c7-4322-a2fc-44198d51a3e2'),
	(28,'Neo_Block',1,0,'2017-04-19 23:18:28','2017-07-19 09:58:51','4994418a-c428-4b47-983d-ca7f9d74e0f7'),
	(29,'Neo_Block',1,0,'2017-04-19 23:18:28','2017-07-19 09:58:51','1fc8a3e4-a20f-4b69-a760-0781c5d0e6bf'),
	(30,'Neo_Block',1,0,'2017-04-19 23:18:28','2017-07-19 09:58:51','845893ac-7c61-4c1a-98c8-e78642871a4c'),
	(31,'Neo_Block',1,0,'2017-04-19 23:18:28','2017-07-19 09:58:51','7ae85594-dad8-4893-93fd-3787afa34cdd'),
	(32,'Neo_Block',1,0,'2017-04-19 23:18:28','2017-07-19 09:58:51','954ec390-b1b2-4794-aefc-35613f22ae68'),
	(33,'SuperTable_Block',1,0,'2017-04-19 23:18:28','2017-07-19 09:58:51','1978281f-9fd4-43af-992c-7cca53bc550a'),
	(34,'Neo_Block',1,0,'2017-04-20 00:06:35','2017-07-19 09:58:51','e133c79f-2866-44c3-9b09-8114d8725ae2'),
	(35,'Neo_Block',1,0,'2017-04-20 00:07:18','2017-07-19 09:58:51','be9a3815-aa5e-450c-8a52-76ad67b078f0'),
	(36,'SuperTable_Block',1,0,'2017-04-20 00:07:18','2017-07-19 09:58:51','67c18d84-e3d5-4613-a9bd-fae972c09d5f'),
	(37,'Neo_Block',1,0,'2017-04-20 00:11:24','2017-07-19 09:58:51','81f83c63-3e49-41b7-a26b-207397be60ef'),
	(38,'SuperTable_Block',1,0,'2017-04-20 00:11:24','2017-07-19 09:58:51','5a8dddda-3293-41ea-8555-3da7d79916ac'),
	(39,'Neo_Block',1,0,'2017-04-20 00:11:24','2017-07-19 09:58:51','8a83f404-1ad6-4bff-95ea-f3fec19fcc66'),
	(40,'SuperTable_Block',1,0,'2017-04-20 00:11:24','2017-07-19 09:58:51','f53919e7-de68-4ddc-9923-a5a49847e0eb'),
	(49,'Neo_Block',1,0,'2017-04-20 09:21:50','2017-07-19 09:58:51','bc9b96ff-de40-4470-a6cb-53aaf7e26d1a'),
	(50,'SuperTable_Block',1,0,'2017-04-20 09:21:50','2017-07-19 09:58:51','8d202440-d90b-4de7-8b05-3842c24767ae'),
	(51,'Neo_Block',1,0,'2017-04-20 09:21:50','2017-07-19 09:58:51','013b35b5-a46d-492c-9ec0-1bcaf4badd28'),
	(52,'Neo_Block',1,0,'2017-04-20 09:25:22','2017-07-19 09:58:51','a6c7f7cd-9f47-49b2-9143-852a264dcb90'),
	(53,'SuperTable_Block',1,0,'2017-04-20 09:25:22','2017-07-19 09:58:51','c240a0c7-85ba-4c03-b296-4930e63b1eb0'),
	(54,'Neo_Block',1,0,'2017-04-20 11:41:09','2017-07-19 09:58:51','239f51f2-00d3-4c2c-827f-cd93438ad686'),
	(55,'SuperTable_Block',1,0,'2017-04-20 11:41:09','2017-07-19 09:58:51','7fb22c58-7524-4d72-b60a-141ae98ceba1'),
	(56,'Neo_Block',1,0,'2017-04-20 12:31:26','2017-07-19 09:58:51','a7be6e6a-74e6-4d35-a886-5a4b2b6d12eb'),
	(57,'SuperTable_Block',1,0,'2017-04-20 12:31:26','2017-07-19 09:58:51','8a844580-1acf-4cc1-858f-845306af7417'),
	(58,'SuperTable_Block',1,0,'2017-04-20 12:31:26','2017-07-19 09:58:51','e66da67a-61f3-403b-b833-1acd9f88c410'),
	(59,'SuperTable_Block',1,0,'2017-04-20 12:31:26','2017-07-19 09:58:52','43d5651f-5ff2-49c2-853a-4b0496fc00a8'),
	(60,'SuperTable_Block',1,0,'2017-04-20 12:31:26','2017-07-19 09:58:52','88415733-a2b6-46a5-a8de-6519d1e3561a'),
	(61,'Neo_Block',1,0,'2017-04-20 12:52:30','2017-07-19 09:58:52','8d8aff87-4569-4260-bbec-4d0aee85af6f'),
	(62,'SuperTable_Block',1,0,'2017-04-20 12:52:30','2017-07-19 09:58:52','bb06c451-e96b-41b2-8ede-37d2fa591a22'),
	(65,'Neo_Block',1,0,'2017-04-20 13:35:13','2017-07-19 09:58:52','8ad5b10f-c6aa-469f-8168-e0722699656f'),
	(66,'SuperTable_Block',1,0,'2017-04-20 13:35:13','2017-07-19 09:58:52','3e9ab57c-0d03-4a57-81af-24fdb99b20ba'),
	(68,'SuperTable_Block',1,0,'2017-04-20 13:44:03','2017-04-20 13:51:14','6f3915b5-28fc-407b-8fc8-5750458fb90c'),
	(70,'SuperTable_Block',1,0,'2017-04-20 13:48:14','2017-04-20 13:51:15','e124bd04-78b4-4163-b583-54462071ee32'),
	(71,'Neo_Block',1,0,'2017-04-20 13:52:06','2017-07-19 09:58:52','551be05a-c026-4e58-91b7-2dea57697fa7'),
	(72,'SuperTable_Block',1,0,'2017-04-20 13:52:06','2017-07-19 09:58:52','05f63c9d-1d60-498b-a63f-4b15186f4905'),
	(73,'Neo_Block',1,0,'2017-04-20 14:00:53','2017-07-19 09:58:52','19cf20e0-a127-4a12-a3ff-7204b3e03336'),
	(74,'Neo_Block',1,0,'2017-04-20 14:00:53','2017-07-19 09:58:52','18573337-661a-4dd3-8d0b-1de962ac358b'),
	(75,'Neo_Block',1,0,'2017-04-20 14:00:53','2017-07-19 09:58:52','510d688b-2c7f-43da-9009-efa217f79e94'),
	(76,'Neo_Block',1,0,'2017-04-20 14:00:53','2017-07-19 09:58:52','a81518bb-66a5-4a6a-93de-e5722f9d0c78'),
	(77,'Neo_Block',1,0,'2017-04-20 14:00:53','2017-07-19 09:58:52','5ea70f8e-f5ad-4fe9-8791-7c0fd26b4844'),
	(78,'Neo_Block',1,0,'2017-04-20 14:09:24','2017-07-19 09:58:52','81db86bf-1e83-423c-b363-28c89cfc0ae7'),
	(79,'SuperTable_Block',1,0,'2017-04-20 14:09:24','2017-07-19 09:58:52','58d07b83-7c39-47bc-ad98-8b2e55a82022'),
	(80,'Neo_Block',1,0,'2017-04-20 14:46:34','2017-07-19 09:58:51','8ab7b374-6c43-47a6-87ee-9867e9777997'),
	(81,'SuperTable_Block',1,0,'2017-04-20 14:46:34','2017-07-19 09:58:51','4e7b5e72-4a06-4220-a6a6-d7ec52524150'),
	(82,'Neo_Block',1,0,'2017-04-20 15:34:51','2017-07-19 09:58:52','f3d0eebf-e645-4b97-90d3-ca8e1e60c01c'),
	(83,'SuperTable_Block',1,0,'2017-04-20 15:34:51','2017-07-19 09:58:52','50eaf1f5-d5b2-4e05-a09d-0d1d5f77b131'),
	(84,'Neo_Block',1,0,'2017-04-20 15:34:51','2017-07-19 09:58:52','a8e40946-34df-4264-90c6-8da981d6f0d6'),
	(85,'Neo_Block',1,0,'2017-04-20 15:34:51','2017-07-19 09:58:52','a8b88977-5a0b-4e73-b608-77dcbf2a880c'),
	(86,'Neo_Block',1,0,'2017-04-20 15:34:51','2017-07-19 09:58:52','c291adc4-aea1-4b46-98b8-001153436319'),
	(87,'Neo_Block',1,0,'2017-04-20 15:34:51','2017-07-19 09:58:52','80e1f386-1a93-4bc5-a424-f9c642a84628'),
	(88,'Neo_Block',1,0,'2017-04-20 15:34:51','2017-07-19 09:58:52','4f34d00d-43a4-4dcf-ba01-0ef3846b8982'),
	(89,'SuperTable_Block',1,0,'2017-04-20 15:34:51','2017-07-19 09:58:52','acbdf331-6556-4b4d-b772-fc7442c65625'),
	(90,'Neo_Block',1,0,'2017-06-26 21:11:47','2017-07-19 09:58:51','179c74f5-3e62-499d-934f-8bfbd8975b39'),
	(91,'SuperTable_Block',1,0,'2017-06-26 21:11:47','2017-07-19 09:58:51','b40e1c8e-45d5-4772-a8bb-2ec162f31622'),
	(92,'Neo_Block',1,0,'2017-06-26 21:11:47','2017-07-19 09:58:51','dbc53304-50d1-4233-b135-b74e162308ea'),
	(93,'SuperTable_Block',1,0,'2017-06-26 21:11:47','2017-07-19 09:58:51','8ed3915d-405e-4396-8b20-d8b141493117'),
	(94,'Neo_Block',1,0,'2017-06-26 21:11:47','2017-07-19 09:58:51','c2b42755-61ab-4f8d-9e50-b17e0bc9365c'),
	(95,'SuperTable_Block',1,0,'2017-06-26 21:11:47','2017-07-19 09:58:51','2ca3a7ea-6d07-48d5-804f-ff64194c68ee'),
	(110,'Neo_Block',1,0,'2017-07-19 09:26:57','2017-07-19 09:58:51','c4b5bf66-2e4c-4c6d-9600-6cd81e55a738'),
	(111,'SuperTable_Block',1,0,'2017-07-19 09:26:57','2017-07-19 09:58:51','91bf5566-f19a-48d9-a18c-98842fe8890e'),
	(112,'Neo_Block',1,0,'2017-07-19 09:52:11','2017-07-19 09:58:52','8fce1b90-32e0-4a31-a775-8a07e9bc453a'),
	(113,'SuperTable_Block',1,0,'2017-07-19 09:52:11','2017-07-19 09:58:52','194bd92a-d4f9-4a46-b830-9f2d0fc01629'),
	(114,'GlobalSet',1,0,'2017-09-03 17:01:51','2017-09-03 17:01:51','243864ae-aeb1-4653-97ac-bce25fd90247'),
	(115,'GlobalSet',1,0,'2017-09-03 17:04:46','2017-09-03 17:04:46','22da85df-2311-4d6e-9b72-22025b60f561'),
	(116,'GlobalSet',1,0,'2017-09-04 13:52:53','2017-09-04 13:52:53','dff7bcd7-9a27-4046-9e49-893ed4627760');

/*!40000 ALTER TABLE `craft_elements` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_elements_i18n
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_elements_i18n`;

CREATE TABLE `craft_elements_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_elements_i18n_elementId_locale_unq_idx` (`elementId`,`locale`),
  UNIQUE KEY `craft_elements_i18n_uri_locale_unq_idx` (`uri`,`locale`),
  KEY `craft_elements_i18n_slug_locale_idx` (`slug`,`locale`),
  KEY `craft_elements_i18n_enabled_idx` (`enabled`),
  KEY `craft_elements_i18n_locale_fk` (`locale`),
  CONSTRAINT `craft_elements_i18n_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_elements_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_elements_i18n` WRITE;
/*!40000 ALTER TABLE `craft_elements_i18n` DISABLE KEYS */;

INSERT INTO `craft_elements_i18n` (`id`, `elementId`, `locale`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'de','',NULL,1,'2017-04-16 21:53:42','2017-09-03 17:05:28','f62f4336-026f-47a1-ad80-3c23aa756d4f'),
	(4,4,'de','homepage','__home__',1,'2017-04-16 22:48:52','2017-04-16 22:48:52','73ad8ab1-228c-4fb3-b707-3cb697ae55d3'),
	(5,5,'de','modules','modules',1,'2017-04-16 22:48:52','2017-07-19 09:58:51','4c07ed46-b518-48cf-90cb-44c91579600c'),
	(6,6,'de','',NULL,1,'2017-04-16 22:49:03','2017-09-03 22:18:26','fd02fd31-754a-410a-8ff2-4b579d1cd428'),
	(7,7,'de','',NULL,1,'2017-04-17 02:19:23','2017-07-19 09:58:51','f32474d8-9ac8-4609-a237-e4b641377110'),
	(8,8,'de','',NULL,1,'2017-04-17 02:19:23','2017-07-19 09:58:51','db6cd980-aaa9-4a56-928f-92e8539a56c2'),
	(9,9,'de','',NULL,1,'2017-04-17 18:45:37','2017-07-19 09:58:51','357deee4-5db8-4408-b74b-c3411660e0aa'),
	(10,10,'de','',NULL,1,'2017-04-17 18:45:37','2017-07-19 09:58:51','127af6b9-7d86-417c-a2d7-811825a6f627'),
	(11,11,'de','home-01',NULL,1,'2017-04-17 18:46:13','2017-06-08 17:04:47','f0777221-993b-410f-8a65-6b5f11438166'),
	(12,12,'de','home-02',NULL,1,'2017-04-17 18:46:14','2017-06-08 17:05:09','bb9b7b7e-eac5-4709-9681-78e682853075'),
	(13,13,'de','home-03',NULL,1,'2017-04-17 18:46:15','2017-06-08 17:05:26','2a99d309-e8bc-4479-b234-7ee202f49ae4'),
	(14,14,'de','home-04',NULL,1,'2017-04-17 18:46:16','2017-06-08 17:05:44','261a0f74-2957-400b-8d57-f9f133a6a034'),
	(15,15,'de','',NULL,1,'2017-04-17 18:46:20','2017-07-19 09:58:51','de75c465-0831-405f-8f6e-8eb1d3c31137'),
	(16,16,'de','',NULL,1,'2017-04-17 18:46:20','2017-07-19 09:58:51','75ea762b-7006-40a4-b645-b322b5f61ae3'),
	(17,17,'de','',NULL,1,'2017-04-19 20:53:27','2017-04-20 20:46:13','255aee1b-746d-42a9-92d1-edb42021298a'),
	(18,18,'de','',NULL,1,'2017-04-19 20:53:40','2017-04-20 20:46:27','79017fb1-52f8-4c66-a764-c715870cba15'),
	(19,19,'de','',NULL,1,'2017-04-19 20:54:05','2017-04-20 20:46:41','2d947d0f-ef2b-4908-a217-728488d85a22'),
	(20,20,'de','',NULL,1,'2017-04-19 21:20:00','2017-07-19 09:58:51','d5094353-bb2d-4893-a363-4f7a43c6ca49'),
	(21,21,'de','',NULL,1,'2017-04-19 21:20:00','2017-07-19 09:58:51','d1d0e30f-be75-4478-add4-d8891f12b121'),
	(22,22,'de','',NULL,1,'2017-04-19 21:28:03','2017-07-19 09:58:51','1b47f93e-cf18-4f69-8d57-a8044472b468'),
	(27,27,'de','',NULL,1,'2017-04-19 21:54:58','2017-04-20 20:46:51','9c908638-9cae-45f8-b252-df53c3541660'),
	(28,28,'de','',NULL,1,'2017-04-19 23:18:28','2017-07-19 09:58:51','9303bc89-2a5a-4a02-9136-858de2329063'),
	(29,29,'de','',NULL,1,'2017-04-19 23:18:28','2017-07-19 09:58:51','2425c8ea-a9a4-40d9-9be9-f2b74fdd78d8'),
	(30,30,'de','',NULL,1,'2017-04-19 23:18:28','2017-07-19 09:58:51','e8255174-b764-4a2c-b199-a2319d7ff9ed'),
	(31,31,'de','',NULL,1,'2017-04-19 23:18:28','2017-07-19 09:58:51','174d4b84-d662-4322-8cd1-5fb0f73f59c9'),
	(32,32,'de','',NULL,1,'2017-04-19 23:18:28','2017-07-19 09:58:51','8ed45b4a-2d89-4429-847c-5bc37cfcd4b8'),
	(33,33,'de','',NULL,1,'2017-04-19 23:18:28','2017-07-19 09:58:51','895377e7-ee94-4714-a09b-824c1d1d23a4'),
	(34,34,'de','',NULL,1,'2017-04-20 00:06:35','2017-07-19 09:58:51','35cca813-2e93-4e5d-8eb0-897fb21345ef'),
	(35,35,'de','',NULL,1,'2017-04-20 00:07:18','2017-07-19 09:58:51','d74f6750-ef63-4b79-810f-cdff406c1b73'),
	(36,36,'de','',NULL,1,'2017-04-20 00:07:18','2017-07-19 09:58:51','4214bfbd-5ee3-49ef-a21c-35879f8ed379'),
	(37,37,'de','',NULL,1,'2017-04-20 00:11:24','2017-07-19 09:58:51','7686c3cf-ed00-4ff2-b227-11965fb02c7d'),
	(38,38,'de','',NULL,1,'2017-04-20 00:11:24','2017-07-19 09:58:51','9cfe7ea0-823e-441c-adce-cfe6392c569b'),
	(39,39,'de','',NULL,1,'2017-04-20 00:11:24','2017-07-19 09:58:51','7e1cb961-1131-4edb-9c99-41f2faf3e30d'),
	(40,40,'de','',NULL,1,'2017-04-20 00:11:24','2017-07-19 09:58:51','d71061f0-d7d6-491d-ad1c-edf493976b69'),
	(49,49,'de','',NULL,1,'2017-04-20 09:21:50','2017-07-19 09:58:51','3e19ee6b-18df-4690-930b-17329cedd7b2'),
	(50,50,'de','',NULL,1,'2017-04-20 09:21:50','2017-07-19 09:58:51','a26cac71-a40a-4181-a9e1-907687589ac1'),
	(51,51,'de','',NULL,1,'2017-04-20 09:21:50','2017-07-19 09:58:51','0ea10db1-3598-4599-bd87-4f18a228e058'),
	(52,52,'de','',NULL,1,'2017-04-20 09:25:22','2017-07-19 09:58:51','f6a9f4bf-9219-4b68-8c10-b7614f6e3614'),
	(53,53,'de','',NULL,1,'2017-04-20 09:25:22','2017-07-19 09:58:51','6f0824aa-8c2c-4ddf-9264-b8eca51032d5'),
	(54,54,'de','',NULL,1,'2017-04-20 11:41:09','2017-07-19 09:58:51','39f812c9-802f-46cb-ba6a-ec905eda8895'),
	(55,55,'de','',NULL,1,'2017-04-20 11:41:09','2017-07-19 09:58:51','70522f66-27bf-4510-9897-cd5bf9468107'),
	(56,56,'de','',NULL,1,'2017-04-20 12:31:26','2017-07-19 09:58:51','df661912-402c-4620-8e16-953c9dbefc6c'),
	(57,57,'de','',NULL,1,'2017-04-20 12:31:26','2017-07-19 09:58:51','035da827-a41d-4bf3-beed-948dfdf36c2e'),
	(58,58,'de','',NULL,1,'2017-04-20 12:31:26','2017-07-19 09:58:52','1914f7e7-d39c-4550-88d1-f9d7334fbb4e'),
	(59,59,'de','',NULL,1,'2017-04-20 12:31:26','2017-07-19 09:58:52','5e5fd66a-b04b-4c8e-a222-f9c1dd6cc138'),
	(60,60,'de','',NULL,1,'2017-04-20 12:31:26','2017-07-19 09:58:52','059b8623-fe50-4e07-8258-bfedd9921412'),
	(61,61,'de','',NULL,1,'2017-04-20 12:52:30','2017-07-19 09:58:52','84fced02-e310-4e13-93ba-8998e2dbd1d1'),
	(62,62,'de','',NULL,1,'2017-04-20 12:52:30','2017-07-19 09:58:52','ed5596a6-9f2c-46af-8573-8df45585cff5'),
	(65,65,'de','',NULL,1,'2017-04-20 13:35:13','2017-07-19 09:58:52','4240cfeb-15d4-4fb9-bac2-ecad98ffd7d1'),
	(66,66,'de','',NULL,1,'2017-04-20 13:35:13','2017-07-19 09:58:52','828c4566-4e99-49cf-9132-671f87a843ea'),
	(68,68,'de','',NULL,1,'2017-04-20 13:44:03','2017-04-20 13:51:14','f96e686f-bd47-4b02-86d0-d100bc12b407'),
	(70,70,'de','',NULL,1,'2017-04-20 13:48:14','2017-04-20 13:51:15','14b7a88a-54eb-4e5a-9c99-c5c0da90f27a'),
	(71,71,'de','',NULL,1,'2017-04-20 13:52:06','2017-07-19 09:58:52','effce781-1d5e-4594-9d26-2acee178f4c6'),
	(72,72,'de','',NULL,1,'2017-04-20 13:52:06','2017-07-19 09:58:52','1ba4b7c4-78df-4bce-888e-653b7a189e28'),
	(73,73,'de','',NULL,1,'2017-04-20 14:00:53','2017-07-19 09:58:52','1d4153c9-7f52-4b23-96fd-6b781e74e6c9'),
	(74,74,'de','',NULL,1,'2017-04-20 14:00:53','2017-07-19 09:58:52','168b5de6-8635-484a-825f-68a03441e03f'),
	(75,75,'de','',NULL,1,'2017-04-20 14:00:53','2017-07-19 09:58:52','d3af4a3a-fb94-445b-bb38-28d6178cc962'),
	(76,76,'de','',NULL,1,'2017-04-20 14:00:53','2017-07-19 09:58:52','81a0722b-0b26-4f0a-82a1-836b401b4e70'),
	(77,77,'de','',NULL,1,'2017-04-20 14:00:53','2017-07-19 09:58:52','489c3a91-10ec-48ff-bb92-31bb2b3ede03'),
	(78,78,'de','',NULL,1,'2017-04-20 14:09:24','2017-07-19 09:58:52','5471cb68-23c5-4514-9053-2dfa4c4807b5'),
	(79,79,'de','',NULL,1,'2017-04-20 14:09:24','2017-07-19 09:58:52','ebf3863c-2b9d-4f5e-9897-9b18da613406'),
	(80,80,'de','',NULL,1,'2017-04-20 14:46:34','2017-07-19 09:58:51','1c714894-c1ec-4c0a-83ff-f01c7f17c026'),
	(81,81,'de','',NULL,1,'2017-04-20 14:46:34','2017-07-19 09:58:51','a3663324-b3bb-4b9f-ba8c-125d860613e3'),
	(82,82,'de','',NULL,1,'2017-04-20 15:34:51','2017-07-19 09:58:52','971d740d-d134-4888-85d2-6d0438cabac9'),
	(83,83,'de','',NULL,1,'2017-04-20 15:34:51','2017-07-19 09:58:52','9a0d350b-ece8-430e-b527-6e518e021489'),
	(84,84,'de','',NULL,1,'2017-04-20 15:34:51','2017-07-19 09:58:52','bbe7d532-2c80-4285-b6e5-42b89b6dfeed'),
	(85,85,'de','',NULL,1,'2017-04-20 15:34:51','2017-07-19 09:58:52','59fddf71-4da6-4eff-87cb-763b0aebffab'),
	(86,86,'de','',NULL,1,'2017-04-20 15:34:51','2017-07-19 09:58:52','6269a87d-eabd-4c4e-b60a-05ef9590b7f8'),
	(87,87,'de','',NULL,1,'2017-04-20 15:34:51','2017-07-19 09:58:52','19c39413-e8c0-42f2-b926-c63e4cf58e2f'),
	(88,88,'de','',NULL,1,'2017-04-20 15:34:51','2017-07-19 09:58:52','4279ed88-c27b-424a-91d0-d0a261f8180e'),
	(89,89,'de','',NULL,1,'2017-04-20 15:34:51','2017-07-19 09:58:52','2eab2310-ab05-40dd-be44-d87110925136'),
	(90,90,'de','',NULL,1,'2017-06-26 21:11:47','2017-07-19 09:58:51','a4f70b87-23ae-49e9-aa0d-08b8afe3ff93'),
	(91,91,'de','',NULL,1,'2017-06-26 21:11:47','2017-07-19 09:58:51','911353a8-f478-47a3-85da-ae2df4a031d7'),
	(92,92,'de','',NULL,1,'2017-06-26 21:11:47','2017-07-19 09:58:51','c6585dcd-19a8-4d8b-bbfe-e7816081070b'),
	(93,93,'de','',NULL,1,'2017-06-26 21:11:47','2017-07-19 09:58:51','30cffbeb-3329-4c90-a8fe-d25dbc03c987'),
	(94,94,'de','',NULL,1,'2017-06-26 21:11:47','2017-07-19 09:58:51','bb9d3f4e-a1f3-4362-a2d9-a01c1aea9a6c'),
	(95,95,'de','',NULL,1,'2017-06-26 21:11:47','2017-07-19 09:58:51','8c0cff75-37c1-45b7-9a4a-383a9437bcf2'),
	(110,110,'de','',NULL,1,'2017-07-19 09:26:57','2017-07-19 09:58:51','a797c83d-17e9-4b75-a657-12e729bdc212'),
	(111,111,'de','',NULL,1,'2017-07-19 09:26:57','2017-07-19 09:58:51','4350c482-b8c8-4de8-b88c-d73dd8411927'),
	(112,112,'de','',NULL,1,'2017-07-19 09:52:11','2017-07-19 09:58:52','5e0de102-9307-481e-b115-9c477c84480d'),
	(113,113,'de','',NULL,1,'2017-07-19 09:52:11','2017-07-19 09:58:52','f61bc5f8-0dfc-4807-8761-e9823fe76c48'),
	(114,114,'de','',NULL,1,'2017-09-03 17:01:51','2017-09-03 17:01:51','6ccea37f-9888-4742-96f8-3b0838afcadf'),
	(115,115,'de','',NULL,1,'2017-09-03 17:04:46','2017-09-03 17:04:46','424b2f70-bb00-41d7-8adb-c9e978f1d3b4'),
	(116,116,'de','',NULL,1,'2017-09-04 13:52:53','2017-09-04 13:52:53','21d055fc-31c0-4f33-b0fa-8f79436b43a5');

/*!40000 ALTER TABLE `craft_elements_i18n` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_emailmessages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_emailmessages`;

CREATE TABLE `craft_emailmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` char(150) COLLATE utf8_unicode_ci NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_emailmessages_key_locale_unq_idx` (`key`,`locale`),
  KEY `craft_emailmessages_locale_fk` (`locale`),
  CONSTRAINT `craft_emailmessages_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_entries`;

CREATE TABLE `craft_entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entries_sectionId_idx` (`sectionId`),
  KEY `craft_entries_typeId_idx` (`typeId`),
  KEY `craft_entries_postDate_idx` (`postDate`),
  KEY `craft_entries_expiryDate_idx` (`expiryDate`),
  KEY `craft_entries_authorId_fk` (`authorId`),
  CONSTRAINT `craft_entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_entries` WRITE;
/*!40000 ALTER TABLE `craft_entries` DISABLE KEYS */;

INSERT INTO `craft_entries` (`id`, `sectionId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(4,3,NULL,NULL,'2017-04-16 22:48:52',NULL,'2017-04-16 22:48:52','2017-04-16 22:48:52','77150553-bb5a-4f6d-9185-2f663ef161f1'),
	(5,4,NULL,NULL,'2017-04-16 22:48:52',NULL,'2017-04-16 22:48:52','2017-07-19 09:58:52','34d64afe-d272-4d07-b2d5-3fbb69a34f30');

/*!40000 ALTER TABLE `craft_entries` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_entrydrafts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_entrydrafts`;

CREATE TABLE `craft_entrydrafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` tinytext COLLATE utf8_unicode_ci,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entrydrafts_entryId_locale_idx` (`entryId`,`locale`),
  KEY `craft_entrydrafts_sectionId_fk` (`sectionId`),
  KEY `craft_entrydrafts_creatorId_fk` (`creatorId`),
  KEY `craft_entrydrafts_locale_fk` (`locale`),
  CONSTRAINT `craft_entrydrafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entrydrafts_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entrydrafts_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_entrydrafts_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_entrytypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_entrytypes`;

CREATE TABLE `craft_entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `titleLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Title',
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_entrytypes_name_sectionId_unq_idx` (`name`,`sectionId`),
  UNIQUE KEY `craft_entrytypes_handle_sectionId_unq_idx` (`handle`,`sectionId`),
  KEY `craft_entrytypes_sectionId_fk` (`sectionId`),
  KEY `craft_entrytypes_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_entrytypes` WRITE;
/*!40000 ALTER TABLE `craft_entrytypes` DISABLE KEYS */;

INSERT INTO `craft_entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleLabel`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(3,3,150,'Homepage','homepage',1,'Title',NULL,1,'2017-04-16 22:48:52','2017-06-08 16:56:29','5523e1a6-09ec-41da-8346-f234fc79a17a'),
	(4,4,151,'Modules','modules',1,'',NULL,1,'2017-04-16 22:48:52','2017-06-08 16:56:59','e4f17c23-e055-4d0e-b4b4-5d10bd234de1'),
	(5,5,154,'News','news',1,'Title',NULL,1,'2017-04-16 22:48:52','2017-06-08 17:01:54','a7735d3a-d13b-4fc1-8f2e-24edba816813'),
	(6,6,155,'Pages','pages',1,'Title',NULL,1,'2017-04-16 22:56:24','2017-06-08 17:02:16','9d1a8865-03bb-4839-aa69-17e31ede8053');

/*!40000 ALTER TABLE `craft_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_entryversions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_entryversions`;

CREATE TABLE `craft_entryversions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `num` smallint(6) unsigned NOT NULL,
  `notes` tinytext COLLATE utf8_unicode_ci,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_entryversions_entryId_locale_idx` (`entryId`,`locale`),
  KEY `craft_entryversions_sectionId_fk` (`sectionId`),
  KEY `craft_entryversions_creatorId_fk` (`creatorId`),
  KEY `craft_entryversions_locale_fk` (`locale`),
  CONSTRAINT `craft_entryversions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_entryversions_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_entryversions_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_entryversions_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_fieldgroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fieldgroups`;

CREATE TABLE `craft_fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fieldgroups_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_fieldgroups` WRITE;
/*!40000 ALTER TABLE `craft_fieldgroups` DISABLE KEYS */;

INSERT INTO `craft_fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(2,'Categories','2017-04-16 22:48:51','2017-04-16 22:48:51','9994af79-f80c-4ee6-ab9a-5bb8af9119f9'),
	(3,'Content Builder','2017-04-16 22:48:51','2017-04-16 22:48:51','9a10d5bc-f6cf-493f-94be-837733e97e5f'),
	(4,'Globals','2017-04-16 22:48:51','2017-04-16 22:48:51','83629bee-7cec-41c3-a3a9-4bfd86cbc4c7'),
	(5,'Grouped','2017-04-16 22:48:51','2017-04-16 22:48:51','1dde50f0-136a-46aa-b91e-309832204f97'),
	(6,'Plugins','2017-04-16 22:48:51','2017-04-16 22:48:51','26e4cfd0-f271-47b0-848f-5c3d9b15aa3c'),
	(7,'Settings','2017-04-16 22:48:52','2017-04-16 22:48:52','d57d0bfc-cfa0-46ab-8f76-9b7e592f8db4'),
	(8,'Singles','2017-04-16 22:48:52','2017-04-16 22:48:52','b3b74b0a-8327-470a-b835-e2e815eedc2d');

/*!40000 ALTER TABLE `craft_fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_fieldlayoutfields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fieldlayoutfields`;

CREATE TABLE `craft_fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  KEY `craft_fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  KEY `craft_fieldlayoutfields_tabId_fk` (`tabId`),
  KEY `craft_fieldlayoutfields_fieldId_fk` (`fieldId`),
  CONSTRAINT `craft_fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `craft_fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayoutfields` DISABLE KEYS */;

INSERT INTO `craft_fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(4,13,3,5,0,1,'2017-04-16 22:48:52','2017-04-16 22:48:52','a5a60fb6-6867-4ffc-97c5-b05de5376f25'),
	(5,13,3,6,0,2,'2017-04-16 22:48:52','2017-04-16 22:48:52','301ab85a-6f6a-4ee4-a986-ae4ea1100566'),
	(6,13,3,7,0,3,'2017-04-16 22:48:52','2017-04-16 22:48:52','be5300a4-4e44-4550-a245-a764e1d90acc'),
	(7,13,3,8,0,4,'2017-04-16 22:48:52','2017-04-16 22:48:52','586ac8f9-1203-4dad-bce2-f3db7d958e5c'),
	(8,13,3,9,0,5,'2017-04-16 22:48:52','2017-04-16 22:48:52','f1eaba51-ce33-4e56-867d-9b15654a3bab'),
	(9,13,3,10,0,6,'2017-04-16 22:48:52','2017-04-16 22:48:52','2ba6f639-8aaf-47aa-b2bc-0baf6ffe69c1'),
	(10,13,3,11,0,7,'2017-04-16 22:48:52','2017-04-16 22:48:52','30c7f104-656e-429b-b640-dcb7ab67e976'),
	(24,15,5,27,0,1,'2017-04-16 22:48:54','2017-04-16 22:48:54','3e4e0544-374f-4356-a314-f7dd3d81a166'),
	(25,15,5,28,0,2,'2017-04-16 22:48:54','2017-04-16 22:48:54','28a51620-9a0d-4d9a-827e-1f10ac365ae6'),
	(26,15,5,29,0,3,'2017-04-16 22:48:54','2017-04-16 22:48:54','19684494-7425-4bc6-aa45-f6152ffa3c7b'),
	(27,15,5,30,0,4,'2017-04-16 22:48:54','2017-04-16 22:48:54','2a584ce2-8e27-4f31-94ba-99d237bb95a5'),
	(65,29,19,86,0,1,'2017-04-16 22:49:01','2017-04-16 22:49:01','42e4156a-870f-4856-97ae-19e8dc94b919'),
	(263,142,178,50,0,1,'2017-04-19 22:01:54','2017-04-19 22:01:54','87f3b80d-b9e4-428b-acce-13207c617ada'),
	(268,145,181,26,0,1,'2017-06-08 16:52:41','2017-06-08 16:52:41','a69f2da6-d995-4b89-90d9-78b7c27c95d2'),
	(269,145,181,47,0,2,'2017-06-08 16:52:41','2017-06-08 16:52:41','98f7450a-dfc2-405f-b9b3-44d24ecb132c'),
	(270,145,181,101,0,3,'2017-06-08 16:52:41','2017-06-08 16:52:41','25ef97cb-b68e-467c-9e76-4b6c9d98bc86'),
	(271,146,182,26,0,1,'2017-06-08 16:52:56','2017-06-08 16:52:56','c9ee4cbf-5558-406d-93d7-ab351348a08b'),
	(272,146,182,47,0,2,'2017-06-08 16:52:56','2017-06-08 16:52:56','6d0e675a-f34c-4278-bdc4-48003c38becb'),
	(273,146,182,101,0,3,'2017-06-08 16:52:56','2017-06-08 16:52:56','42582d26-3bd2-4681-ae81-87a67c67d8ea'),
	(274,147,183,26,0,1,'2017-06-08 16:53:07','2017-06-08 16:53:07','996a8889-297f-4691-a8ef-e591f05b293d'),
	(275,147,183,47,0,2,'2017-06-08 16:53:07','2017-06-08 16:53:07','9645bd79-4b4f-443f-b4ad-26760d000a65'),
	(276,147,183,101,0,3,'2017-06-08 16:53:07','2017-06-08 16:53:07','d1549d5b-29ff-4bce-ac74-d469f49b2258'),
	(277,148,184,26,0,1,'2017-06-08 16:53:23','2017-06-08 16:53:23','83cf0d29-91f7-41cb-8461-68b0899cbe86'),
	(278,148,184,47,0,2,'2017-06-08 16:53:23','2017-06-08 16:53:23','e5ec4010-d139-43bb-b61c-6c01ee113fe4'),
	(279,148,184,101,0,3,'2017-06-08 16:53:23','2017-06-08 16:53:23','8e00ee54-8649-4902-af44-6c5a6505fd34'),
	(282,150,186,102,0,1,'2017-06-08 16:56:29','2017-06-08 16:56:29','f9252ed4-2ba3-4c22-9b98-417b18c71f6b'),
	(283,150,186,104,0,2,'2017-06-08 16:56:29','2017-06-08 16:56:29','75eacc82-d6af-4057-bb4a-8f0a0933f7ab'),
	(284,150,186,103,0,3,'2017-06-08 16:56:29','2017-06-08 16:56:29','1666c7d7-7cd4-48cf-951e-404aac90c188'),
	(285,151,187,102,0,1,'2017-06-08 16:56:59','2017-06-08 16:56:59','69f480b9-6d5b-4230-8093-c80c8e5e187a'),
	(286,151,187,104,0,2,'2017-06-08 16:56:59','2017-06-08 16:56:59','dc444ff4-e272-42fa-937f-72260fc36294'),
	(287,151,187,103,0,3,'2017-06-08 16:56:59','2017-06-08 16:56:59','7a97fb6c-febc-4961-ad08-992f3fd9b22d'),
	(288,151,187,100,0,4,'2017-06-08 16:56:59','2017-06-08 16:56:59','72a3397d-b0a5-4044-8823-0fe5abde6467'),
	(299,154,192,102,0,1,'2017-06-08 17:01:54','2017-06-08 17:01:54','8635494e-2d7f-4502-b178-234cfb496041'),
	(300,154,192,104,0,2,'2017-06-08 17:01:54','2017-06-08 17:01:54','0b80f296-6884-462a-82a5-4f65534d2408'),
	(301,154,192,103,0,3,'2017-06-08 17:01:54','2017-06-08 17:01:54','a05d2b3c-8f16-420f-acd7-3afaefec6539'),
	(302,154,192,100,0,4,'2017-06-08 17:01:54','2017-06-08 17:01:54','c694da42-9c32-4042-a667-729154d4435f'),
	(303,154,193,3,0,1,'2017-06-08 17:01:54','2017-06-08 17:01:54','fbb9780b-3189-4f61-9b30-352ad538396f'),
	(304,154,194,105,0,1,'2017-06-08 17:01:54','2017-06-08 17:01:54','aa9d599f-011e-4caf-ba1f-b50a93772e34'),
	(305,155,195,102,0,1,'2017-06-08 17:02:16','2017-06-08 17:02:16','f7c24be0-8672-46af-bd61-9320d336a3a9'),
	(306,155,195,104,0,2,'2017-06-08 17:02:16','2017-06-08 17:02:16','c0975034-2442-4e5f-aae8-e54fa264225b'),
	(307,155,195,103,0,3,'2017-06-08 17:02:16','2017-06-08 17:02:16','6f7b6778-a0e7-4ba5-9ea1-16e7bb7b89b7'),
	(308,155,195,100,0,4,'2017-06-08 17:02:16','2017-06-08 17:02:16','898932b8-03fc-4e7f-adb2-247d7b20fb56'),
	(309,155,196,106,0,1,'2017-06-08 17:02:16','2017-06-08 17:02:16','80a151b3-7077-496f-8d80-022c67e7991e'),
	(364,174,215,38,0,1,'2017-07-09 20:59:19','2017-07-09 20:59:19','e8348636-9967-4a59-a742-6d2118f1f793'),
	(365,174,215,39,0,2,'2017-07-09 20:59:19','2017-07-09 20:59:19','434ed0be-3fe4-430b-a39a-3e1d7a7df0b6'),
	(366,174,215,108,0,3,'2017-07-09 20:59:19','2017-07-09 20:59:19','4cf902e5-13b3-48c7-9a2c-c2719fdf903c'),
	(370,176,217,33,0,1,'2017-07-09 21:01:02','2017-07-09 21:01:02','1e94c341-731e-453b-b0b3-aa1ec339025b'),
	(371,176,217,34,0,2,'2017-07-09 21:01:02','2017-07-09 21:01:02','52d076b5-a179-4447-87fc-78c1f7bb8492'),
	(372,176,217,107,0,3,'2017-07-09 21:01:02','2017-07-09 21:01:02','c78cf485-5381-4723-b169-d8a748fa1b7d'),
	(373,177,218,74,0,1,'2017-07-09 21:01:25','2017-07-09 21:01:25','ba7760be-1a7c-4f84-a544-4a74611188fe'),
	(374,177,218,75,0,2,'2017-07-09 21:01:25','2017-07-09 21:01:25','ce96efc7-f60e-4cde-812b-89217c9f24e9'),
	(375,177,218,76,0,3,'2017-07-09 21:01:25','2017-07-09 21:01:25','434ef5e8-20aa-4208-8398-0bff5e102160'),
	(378,179,220,41,0,1,'2017-07-10 20:17:31','2017-07-10 20:17:31','2267b06a-15d9-4508-884d-6f0f80230a60'),
	(379,179,220,42,0,2,'2017-07-10 20:17:31','2017-07-10 20:17:31','e5b09b18-07fe-4e3b-8074-8f191bfb158a'),
	(396,185,226,53,0,1,'2017-07-11 05:23:58','2017-07-11 05:23:58','fa8e6b32-2d8e-438e-92aa-578b2061cb29'),
	(397,185,226,54,0,2,'2017-07-11 05:23:58','2017-07-11 05:23:58','ef9d2d02-0dd8-45fc-b500-6981f1718221'),
	(398,185,226,55,0,3,'2017-07-11 05:23:58','2017-07-11 05:23:58','70b116bb-7d8f-4098-8108-73d8309103da'),
	(399,185,226,109,0,4,'2017-07-11 05:23:58','2017-07-11 05:23:58','a7ae261a-28ca-4e29-9c1c-d79cd57c6b48'),
	(463,226,289,57,0,1,'2017-07-13 23:56:49','2017-07-13 23:56:49','543f3418-0d16-408f-a089-e26c3276c5a5'),
	(464,226,289,59,0,2,'2017-07-13 23:56:49','2017-07-13 23:56:49','e04fd8ef-1273-497f-a227-7ad905a1d812'),
	(484,232,295,61,0,1,'2017-07-14 01:54:34','2017-07-14 01:54:34','cc12aba1-5737-435e-b365-83451d6b20a6'),
	(485,232,295,62,0,2,'2017-07-14 01:54:34','2017-07-14 01:54:34','b02f4712-cf49-4bbc-bc04-0b9ef957d24b'),
	(486,232,295,63,0,3,'2017-07-14 01:54:34','2017-07-14 01:54:34','e1232537-a5b7-44ca-b8e8-f505e9e4dac3'),
	(555,274,359,65,0,1,'2017-07-16 21:40:21','2017-07-16 21:40:21','fea54800-7711-49b8-9aa0-cd04d08937f7'),
	(556,274,359,66,0,2,'2017-07-16 21:40:21','2017-07-16 21:40:21','9367b508-098d-4805-9561-ace31b6ad8d8'),
	(557,274,359,67,0,3,'2017-07-16 21:40:21','2017-07-16 21:40:21','0dd6c5a5-98c5-478b-a7b1-52cd04ca1ef5'),
	(558,274,359,68,0,4,'2017-07-16 21:40:21','2017-07-16 21:40:21','c31b2694-e00f-4392-bd32-a2372aa94aba'),
	(559,275,360,79,0,1,'2017-07-16 22:29:02','2017-07-16 22:29:02','73e31a32-6e25-4406-a546-2701373ece7b'),
	(560,275,360,80,0,2,'2017-07-16 22:29:02','2017-07-16 22:29:02','6e56e90f-ff82-419f-86b9-466e856fd3d2'),
	(562,277,362,82,0,1,'2017-07-16 22:47:29','2017-07-16 22:47:29','0be49eb9-94d3-4353-b7a8-886fbd44c4c1'),
	(564,279,364,70,0,1,'2017-07-16 23:07:37','2017-07-16 23:07:37','a224579c-4d79-40b8-9d99-2a6938cf43c1'),
	(565,280,365,45,0,1,'2017-07-17 21:09:19','2017-07-17 21:09:19','55b4fe9e-78f3-4bc3-b82c-746cc6fdf572'),
	(566,280,365,46,0,2,'2017-07-17 21:09:19','2017-07-17 21:09:19','aebc7fd2-d303-4c04-af3a-4efe81977090'),
	(567,281,366,111,0,1,'2017-07-17 21:09:59','2017-07-17 21:09:59','7a8d3a42-495e-4538-9f83-0cc3a3903184'),
	(568,281,366,112,0,2,'2017-07-17 21:09:59','2017-07-17 21:09:59','3d988bb3-c35c-4807-a066-0c5857f6f4ce'),
	(637,324,433,90,0,1,'2017-07-18 13:39:41','2017-07-18 13:39:41','95db83e6-4572-436d-a7e9-d60fe3d6670b'),
	(638,324,434,83,0,1,'2017-07-18 13:39:41','2017-07-18 13:39:41','3dddb697-cb4e-4b0a-a71c-9689470976c1'),
	(639,324,434,73,0,2,'2017-07-18 13:39:41','2017-07-18 13:39:41','7798d30c-e6e2-44d8-a8f2-cc9447746b88'),
	(640,326,436,93,0,1,'2017-07-18 13:39:41','2017-07-18 13:39:41','1f2b5992-2645-4782-a11c-feddef56c782'),
	(641,327,438,81,0,1,'2017-07-18 13:39:41','2017-07-18 13:39:41','5e6c6567-771f-487d-b5ce-b39a666aeefc'),
	(642,329,439,90,0,1,'2017-07-18 13:39:41','2017-07-18 13:39:41','dd90782f-b84d-4bac-b187-19f39bd39849'),
	(643,329,440,48,0,1,'2017-07-18 13:39:41','2017-07-18 13:39:41','a8cd7735-ffe3-47ca-a4e4-0dd50cf3a1a2'),
	(644,330,441,95,0,1,'2017-07-18 13:39:41','2017-07-18 13:39:41','302a6bc5-0226-45fe-ba10-0707cfeab0bb'),
	(645,331,442,95,0,1,'2017-07-18 13:39:41','2017-07-18 13:39:41','ea9f4f0b-b3e9-4f19-8cc0-03ab946f423d'),
	(646,333,443,94,0,1,'2017-07-18 13:39:41','2017-07-18 13:39:41','5d3dfe38-c5fc-4e15-a672-e1f8a8999bac'),
	(647,333,443,96,0,2,'2017-07-18 13:39:41','2017-07-18 13:39:41','017073b6-2f79-4d62-bd1a-d3c315f8b297'),
	(648,333,443,97,0,3,'2017-07-18 13:39:41','2017-07-18 13:39:41','8eccfa3c-c8e8-4dc9-bae2-52e80a124978'),
	(649,334,444,91,0,1,'2017-07-18 13:39:41','2017-07-18 13:39:41','a99faa9f-507a-4bf5-8698-ee617ed4eb7d'),
	(650,334,444,99,0,2,'2017-07-18 13:39:41','2017-07-18 13:39:41','feef6cd7-b552-4f08-baca-7f2a6e7109fc'),
	(651,334,445,52,0,1,'2017-07-18 13:39:41','2017-07-18 13:39:41','7977750f-7189-49cc-ab0a-d4026fb814ba'),
	(652,335,446,92,0,1,'2017-07-18 13:39:41','2017-07-18 13:39:41','a14de9cc-c3bb-4856-8bd4-cf9fbb5722cf'),
	(653,335,447,56,0,1,'2017-07-18 13:39:41','2017-07-18 13:39:41','2d3cac76-b63e-420a-98ab-8947abd83e64'),
	(654,336,448,92,0,1,'2017-07-18 13:39:41','2017-07-18 13:39:41','e7329d5a-2ad1-4ee5-bf86-86f5fa4eb01f'),
	(655,336,449,60,0,1,'2017-07-18 13:39:41','2017-07-18 13:39:41','7cb37253-bebb-40c4-bf35-aa2cb0103e3f'),
	(656,337,450,91,0,1,'2017-07-18 13:39:41','2017-07-18 13:39:41','9f8ab6dc-987b-4dbf-b5fc-1266e3d0d975'),
	(657,337,451,64,0,1,'2017-07-18 13:39:41','2017-07-18 13:39:41','bd495b99-9556-4a15-998f-945b0c30b2dd'),
	(658,338,452,92,0,1,'2017-07-18 13:39:41','2017-07-18 13:39:41','f6301424-94e7-4424-a490-51e3b08bd685'),
	(659,338,453,69,0,1,'2017-07-18 13:39:41','2017-07-18 13:39:41','581030b9-c19b-48a7-a38d-17ef199ff810'),
	(660,339,454,84,0,1,'2017-07-18 13:39:41','2017-07-18 13:39:41','c40e9dde-3759-4178-9d59-123bf64d04bd'),
	(661,339,455,32,0,1,'2017-07-18 13:39:41','2017-07-18 13:39:41','d414b341-ba97-41c0-b00d-afa9b86fe0e0'),
	(662,340,456,85,0,1,'2017-07-18 13:39:41','2017-07-18 13:39:41','e44b172f-5a16-4343-8b56-bf4f0ded65c5'),
	(663,340,457,37,0,1,'2017-07-18 13:39:41','2017-07-18 13:39:41','90b1270c-d87c-4e5a-aa60-4c36fe401b1a'),
	(664,341,458,88,0,1,'2017-07-18 13:39:41','2017-07-18 13:39:41','99f81700-7250-4431-b7ae-641a75f39658'),
	(665,341,459,40,0,1,'2017-07-18 13:39:41','2017-07-18 13:39:41','ceab1858-3e8f-4f16-9c94-6e214e27768f'),
	(666,342,460,89,0,1,'2017-07-18 13:39:41','2017-07-18 13:39:41','2521f6d1-7efd-44b4-80af-0a794c33e1f0'),
	(667,342,461,43,0,1,'2017-07-18 13:39:41','2017-07-18 13:39:41','06a0d456-adef-4945-86f3-bdbc3b6e8982'),
	(668,343,462,89,0,1,'2017-07-18 13:39:41','2017-07-18 13:39:41','b9d6e6b7-0b00-4b2e-b3b2-f1fdd7b8d499'),
	(669,343,463,110,0,1,'2017-07-18 13:39:41','2017-07-18 13:39:41','e9573c65-dd53-47df-9f3a-bab3c7bfed8e'),
	(670,344,465,77,0,1,'2017-07-18 13:39:42','2017-07-18 13:39:42','1d39f5eb-d3c3-4653-9e0b-84b127171510'),
	(671,345,466,114,1,1,'2017-09-03 17:01:51','2017-09-03 17:01:51','6a445c8a-17f6-4f60-a24b-e176928d4fe0'),
	(672,345,466,115,0,2,'2017-09-03 17:01:51','2017-09-03 17:01:51','33c1bee1-7cd6-4814-9c8f-3a04ca8c4901'),
	(673,345,466,116,1,3,'2017-09-03 17:01:51','2017-09-03 17:01:51','60fc1a24-1dab-420e-b0cb-537ef0833670'),
	(674,346,467,113,0,1,'2017-09-03 17:01:51','2017-09-03 17:01:51','a4f13447-2bf5-4ece-beaf-90d8f346c4f3'),
	(675,347,468,117,0,1,'2017-09-03 17:04:46','2017-09-03 17:04:46','9832270f-e13d-4879-82a2-e86bda6b0149'),
	(678,349,470,118,0,1,'2017-09-03 22:18:26','2017-09-03 22:18:26','c86a8187-7016-4be4-b9a9-d7706333cf2b'),
	(679,350,471,121,1,1,'2017-09-03 23:13:41','2017-09-03 23:13:41','dfa7b4c2-522d-4a41-8c9a-a6fb20ceca80'),
	(680,350,471,119,1,2,'2017-09-03 23:13:41','2017-09-03 23:13:41','367aeb79-30d4-4aec-a4e9-e80c1acb9e5d'),
	(681,350,471,120,1,3,'2017-09-03 23:13:41','2017-09-03 23:13:41','04ac44fa-214b-48bd-9e8e-7c9e1be65661'),
	(682,351,472,4,0,1,'2017-09-04 13:52:53','2017-09-04 13:52:53','777a27e7-f349-49c1-9662-ddd6fd887f98');

/*!40000 ALTER TABLE `craft_fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_fieldlayouts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fieldlayouts`;

CREATE TABLE `craft_fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fieldlayouts_type_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_fieldlayouts` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayouts` DISABLE KEYS */;

INSERT INTO `craft_fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(13,'SuperTable_Block','2017-04-16 22:48:52','2017-04-16 22:48:52','84ec66fe-438c-41c9-9ad6-d8551e9359c6'),
	(15,'SuperTable_Block','2017-04-16 22:48:54','2017-04-16 22:48:54','40d3ba27-29c7-4ddb-837f-2ab4f76c308e'),
	(29,'SuperTable_Block','2017-04-16 22:49:01','2017-04-16 22:49:01','8c830c2b-9863-4f78-a837-c6e34d7a3de6'),
	(58,'Category','2017-04-16 22:50:30','2017-04-16 22:50:30','f837bfa0-44b1-4e1f-9e0f-6d8477ec1af5'),
	(142,'SuperTable_Block','2017-04-19 22:01:54','2017-04-19 22:01:54','a61eef88-4be8-4159-bd7d-d8e39d8ae1d1'),
	(145,'Asset','2017-06-08 16:52:41','2017-06-08 16:52:41','bf2a7409-9446-42e0-9aa0-7279ec5873fc'),
	(146,'Asset','2017-06-08 16:52:56','2017-06-08 16:52:56','6a689320-d8b8-40f2-ac55-4b4236cc4665'),
	(147,'Asset','2017-06-08 16:53:07','2017-06-08 16:53:07','5c66a46e-0a45-4648-821f-8abe49ea963f'),
	(148,'Asset','2017-06-08 16:53:23','2017-06-08 16:53:23','a580c48e-806b-4790-b174-c8b718ab8cd2'),
	(150,'Entry','2017-06-08 16:56:29','2017-06-08 16:56:29','2a644b38-377d-40e3-b365-9d431421b87b'),
	(151,'Entry','2017-06-08 16:56:59','2017-06-08 16:56:59','8137bea5-712f-4bce-b8e9-381ff6fd1998'),
	(154,'Entry','2017-06-08 17:01:54','2017-06-08 17:01:54','7363fe0d-90ce-4115-978d-7fc126e561f6'),
	(155,'Entry','2017-06-08 17:02:16','2017-06-08 17:02:16','f2cb9f99-ce29-4588-a26c-479b51a6b23b'),
	(174,'SuperTable_Block','2017-07-09 20:59:19','2017-07-09 20:59:19','32bd2802-8600-46c3-ae61-4dec824b8761'),
	(176,'SuperTable_Block','2017-07-09 21:01:02','2017-07-09 21:01:02','8781bcfb-947e-4dd4-baca-33eb1d8f32bd'),
	(177,'SuperTable_Block','2017-07-09 21:01:25','2017-07-09 21:01:25','275ddf0a-5a60-45c6-a7dd-a94cf9168132'),
	(179,'SuperTable_Block','2017-07-10 20:17:31','2017-07-10 20:17:31','9a6013cc-a432-4cdd-88a6-eeac18af0afa'),
	(185,'SuperTable_Block','2017-07-11 05:23:58','2017-07-11 05:23:58','bdf780bd-a8f4-4ddb-8786-39b133c270bc'),
	(226,'SuperTable_Block','2017-07-13 23:56:49','2017-07-13 23:56:49','0c0530d7-adfe-4a4d-8999-794cc9c30bee'),
	(232,'SuperTable_Block','2017-07-14 01:54:34','2017-07-14 01:54:34','710058fe-d506-47a3-a623-6e608ff264da'),
	(274,'SuperTable_Block','2017-07-16 21:40:21','2017-07-16 21:40:21','98868214-d72a-43c1-a2c7-3db79246d56e'),
	(275,'SuperTable_Block','2017-07-16 22:29:02','2017-07-16 22:29:02','84bdcd63-1711-4272-a149-916ef44f1447'),
	(277,'SuperTable_Block','2017-07-16 22:47:29','2017-07-16 22:47:29','76fff6c6-5e8c-449c-bd56-db9844cf302b'),
	(279,'SuperTable_Block','2017-07-16 23:07:37','2017-07-16 23:07:37','7105c0ee-8076-4bea-a495-778f73bf46ff'),
	(280,'SuperTable_Block','2017-07-17 21:09:19','2017-07-17 21:09:19','ec5aa0ca-1607-4e1b-a43e-b867ee571ad3'),
	(281,'SuperTable_Block','2017-07-17 21:09:59','2017-07-17 21:09:59','56d62af0-73a0-4db9-8c4f-a835b2f05e3a'),
	(324,'Neo_Block','2017-07-18 13:39:41','2017-07-18 13:39:41','94dde2c1-48e1-4819-a429-d7c2fd69bd7f'),
	(325,'Neo_Block','2017-07-18 13:39:41','2017-07-18 13:39:41','0f50de4f-c0e7-4223-b33c-06e3179924dd'),
	(326,'Neo_Block','2017-07-18 13:39:41','2017-07-18 13:39:41','178613d8-a516-423e-b058-8f970595a29b'),
	(327,'Neo_Block','2017-07-18 13:39:41','2017-07-18 13:39:41','523b6e25-52f2-494f-b456-f3833f352f25'),
	(328,'Neo_Block','2017-07-18 13:39:41','2017-07-18 13:39:41','39248b50-2339-434d-a29f-0fbef4269d1e'),
	(329,'Neo_Block','2017-07-18 13:39:41','2017-07-18 13:39:41','611ba334-d550-42d4-b179-e41683142983'),
	(330,'Neo_Block','2017-07-18 13:39:41','2017-07-18 13:39:41','ebcc4631-59a7-4e72-b169-650aa86a5098'),
	(331,'Neo_Block','2017-07-18 13:39:41','2017-07-18 13:39:41','bccab11d-5e07-4e92-8064-6584f03be168'),
	(332,'Neo_Block','2017-07-18 13:39:41','2017-07-18 13:39:41','d2549256-4a17-4abb-9010-6229c62f4162'),
	(333,'Neo_Block','2017-07-18 13:39:41','2017-07-18 13:39:41','7b821b31-f873-435f-a8af-0000b81407d0'),
	(334,'Neo_Block','2017-07-18 13:39:41','2017-07-18 13:39:41','989c12ea-a617-452c-b624-5f4d6b81be70'),
	(335,'Neo_Block','2017-07-18 13:39:41','2017-07-18 13:39:41','3b524437-080d-490c-8a31-3248b55bad75'),
	(336,'Neo_Block','2017-07-18 13:39:41','2017-07-18 13:39:41','be0c0f69-b68d-4304-bc43-7a6ff23090ee'),
	(337,'Neo_Block','2017-07-18 13:39:41','2017-07-18 13:39:41','2c00f53b-2c75-497d-b2af-01eff8ba3a76'),
	(338,'Neo_Block','2017-07-18 13:39:41','2017-07-18 13:39:41','79401ef4-bae1-4247-b2ac-a9d97cb8d15d'),
	(339,'Neo_Block','2017-07-18 13:39:41','2017-07-18 13:39:41','0673e314-2772-40d3-a7e9-6a97cd0f82e9'),
	(340,'Neo_Block','2017-07-18 13:39:41','2017-07-18 13:39:41','6a36b6d0-1ac8-4890-922f-af235dae5119'),
	(341,'Neo_Block','2017-07-18 13:39:41','2017-07-18 13:39:41','c48709d8-04a5-4b5d-893c-280027d7c29f'),
	(342,'Neo_Block','2017-07-18 13:39:41','2017-07-18 13:39:41','556544ab-649e-47fd-8dc3-869348d163ba'),
	(343,'Neo_Block','2017-07-18 13:39:41','2017-07-18 13:39:41','ee7c2337-4ea6-4c63-a6bf-9909bc709106'),
	(344,'Neo_Block','2017-07-18 13:39:41','2017-07-18 13:39:41','0dbcd3b4-e563-4e8a-836e-afa5920632e9'),
	(345,'SuperTable_Block','2017-09-03 17:01:51','2017-09-03 17:01:51','0a4f4f34-fcd5-4a8b-a045-cfe778297e8c'),
	(346,'GlobalSet','2017-09-03 17:01:51','2017-09-03 17:01:51','5e89a7c0-e959-45e0-ad0e-06660c9accfe'),
	(347,'GlobalSet','2017-09-03 17:04:46','2017-09-03 17:04:46','b56e63d9-b586-4b3f-b3f9-2064260eb014'),
	(349,'GlobalSet','2017-09-03 22:18:26','2017-09-03 22:18:26','978c49c1-323f-4289-aa67-2924328be7b1'),
	(350,'SuperTable_Block','2017-09-03 23:13:41','2017-09-03 23:13:41','b2d47e2f-81d8-4edc-9793-48a85a895818'),
	(351,'GlobalSet','2017-09-04 13:52:53','2017-09-04 13:52:53','d8d6c3b7-2395-4779-86fb-49b5a61cf3a3');

/*!40000 ALTER TABLE `craft_fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_fieldlayouttabs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fieldlayouttabs`;

CREATE TABLE `craft_fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  KEY `craft_fieldlayouttabs_layoutId_fk` (`layoutId`),
  CONSTRAINT `craft_fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `craft_fieldlayouttabs` DISABLE KEYS */;

INSERT INTO `craft_fieldlayouttabs` (`id`, `layoutId`, `name`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(3,13,'Content',1,'2017-04-16 22:48:52','2017-04-16 22:48:52','ddf7ff43-0835-45db-b192-b99d96ae689b'),
	(5,15,'Content',1,'2017-04-16 22:48:54','2017-04-16 22:48:54','9514d65d-7e2c-4a92-9b9b-83e0b6441ba7'),
	(19,29,'Content',1,'2017-04-16 22:49:01','2017-04-16 22:49:01','566a1488-86d5-460c-9714-3452467cdbea'),
	(178,142,'Content',1,'2017-04-19 22:01:54','2017-04-19 22:01:54','5e88fbf7-4853-4ef5-8910-c7b7292c0fce'),
	(181,145,'Content',1,'2017-06-08 16:52:41','2017-06-08 16:52:41','db9f000f-7973-428d-b36d-f80a0f475d4f'),
	(182,146,'Content',1,'2017-06-08 16:52:56','2017-06-08 16:52:56','9f596612-4a2e-451f-880b-cad331c15c88'),
	(183,147,'Content',1,'2017-06-08 16:53:07','2017-06-08 16:53:07','55370456-e480-4454-8a19-1c1efa48e976'),
	(184,148,'Content',1,'2017-06-08 16:53:23','2017-06-08 16:53:23','845336c8-4ef5-4ef6-bef4-69a13451dc9b'),
	(186,150,'Content',1,'2017-06-08 16:56:29','2017-06-08 16:56:29','c4cfe3b7-9db7-49a6-bbd7-abdbae0544b8'),
	(187,151,'Content',1,'2017-06-08 16:56:59','2017-06-08 16:56:59','e4869d57-10b7-4588-bdfe-13c80fef84b5'),
	(192,154,'Content Neo',1,'2017-06-08 17:01:54','2017-06-08 17:01:54','ce20630c-1ef9-4533-97b9-4ddf7963988c'),
	(193,154,'Meta',2,'2017-06-08 17:01:54','2017-06-08 17:01:54','f7a789b1-c42a-41e7-a0f3-717e531f8b77'),
	(194,154,'SEO',3,'2017-06-08 17:01:54','2017-06-08 17:01:54','af44511f-a0fc-43d2-8ecc-8a030b2058f8'),
	(195,155,'Content',1,'2017-06-08 17:02:16','2017-06-08 17:02:16','81c0d4e4-db17-4658-83b2-7b04a2eac1f7'),
	(196,155,'SEO',2,'2017-06-08 17:02:16','2017-06-08 17:02:16','1e1087ed-1fe1-4c7a-8ee1-49f0ca233037'),
	(215,174,'Content',1,'2017-07-09 20:59:19','2017-07-09 20:59:19','31d34522-2d85-410d-b1cc-edf2b2818a78'),
	(217,176,'Content',1,'2017-07-09 21:01:02','2017-07-09 21:01:02','1828b52b-77d7-4e66-873e-12e2795bc64d'),
	(218,177,'Content',1,'2017-07-09 21:01:25','2017-07-09 21:01:25','29a8fcd7-6d49-4690-886d-5122549847a8'),
	(220,179,'Content',1,'2017-07-10 20:17:31','2017-07-10 20:17:31','ddde7470-e0d2-4254-9203-8d627f0c5237'),
	(226,185,'Content',1,'2017-07-11 05:23:58','2017-07-11 05:23:58','c93aa4dc-3b17-4e8b-ba11-3416d0c509a9'),
	(289,226,'Content',1,'2017-07-13 23:56:49','2017-07-13 23:56:49','aa59a5ea-0197-46d2-a484-d847289f4c08'),
	(295,232,'Content',1,'2017-07-14 01:54:34','2017-07-14 01:54:34','5ef3d9bd-4d99-4174-a281-f12fe460e9b9'),
	(359,274,'Content',1,'2017-07-16 21:40:21','2017-07-16 21:40:21','c5c0627e-9ed6-4ed9-b725-cfb386f342ad'),
	(360,275,'Content',1,'2017-07-16 22:29:02','2017-07-16 22:29:02','61df1092-c3cb-4ee1-b2ad-0d62da255012'),
	(362,277,'Content',1,'2017-07-16 22:47:29','2017-07-16 22:47:29','81220a35-accc-4d71-8bc9-c393c31506e5'),
	(364,279,'Content',1,'2017-07-16 23:07:37','2017-07-16 23:07:37','3fcf2391-57eb-46de-a240-12f20f2b4bee'),
	(365,280,'Content',1,'2017-07-17 21:09:19','2017-07-17 21:09:19','570c5e89-4ac8-4049-afe2-827828d4d2f0'),
	(366,281,'Content',1,'2017-07-17 21:09:59','2017-07-17 21:09:59','c8a0ff12-5cd7-409d-b761-aec20c3a3480'),
	(433,324,'Content',1,'2017-07-18 13:39:41','2017-07-18 13:39:41','74cd8928-2329-4f03-b157-be76f097a100'),
	(434,324,'Settings',2,'2017-07-18 13:39:41','2017-07-18 13:39:41','95141300-2fc6-4b28-a617-c14122fa2b06'),
	(435,325,'Content',1,'2017-07-18 13:39:41','2017-07-18 13:39:41','eaffc226-7726-4c42-9e8a-ce7104b3986f'),
	(436,326,'Content',1,'2017-07-18 13:39:41','2017-07-18 13:39:41','f752dacb-eab5-4f28-b9f5-00e174cee5c0'),
	(437,327,'Content',1,'2017-07-18 13:39:41','2017-07-18 13:39:41','2fd0921c-f82a-4a9a-bbb2-92e15b71a564'),
	(438,327,'Settings',2,'2017-07-18 13:39:41','2017-07-18 13:39:41','e91bf779-e86d-4314-8bb7-5590455a9eae'),
	(439,329,'Content',1,'2017-07-18 13:39:41','2017-07-18 13:39:41','1024d0f3-eeed-4667-b6ff-e6982c528c23'),
	(440,329,'Settings',2,'2017-07-18 13:39:41','2017-07-18 13:39:41','4de05dd0-2f81-4532-9fdb-9e6379ea73d8'),
	(441,330,'Content',1,'2017-07-18 13:39:41','2017-07-18 13:39:41','239cfd87-f7e7-46eb-b1b1-a25acbd6f6a8'),
	(442,331,'Content',1,'2017-07-18 13:39:41','2017-07-18 13:39:41','3099246b-8858-4ad7-9f4c-68169f5eda76'),
	(443,333,'Content',1,'2017-07-18 13:39:41','2017-07-18 13:39:41','90c16c31-8300-4c1c-b5d7-1fc77802f0f0'),
	(444,334,'Content',1,'2017-07-18 13:39:41','2017-07-18 13:39:41','80a1dcdf-ffe7-4b38-bd7d-34a470131742'),
	(445,334,'Settings',2,'2017-07-18 13:39:41','2017-07-18 13:39:41','4e695efa-f163-4c1c-b02c-3058f544d492'),
	(446,335,'Content',1,'2017-07-18 13:39:41','2017-07-18 13:39:41','10709abb-9b4f-4d20-aede-4f9e0f2d91ff'),
	(447,335,'Settings',2,'2017-07-18 13:39:41','2017-07-18 13:39:41','59cfbf4e-9b83-461d-8eac-cf0579cf1daa'),
	(448,336,'Content',1,'2017-07-18 13:39:41','2017-07-18 13:39:41','e434d40c-185d-4e35-8ff9-89a6d9d0606e'),
	(449,336,'Settings',2,'2017-07-18 13:39:41','2017-07-18 13:39:41','aac98135-630b-419f-8dae-913829f931c2'),
	(450,337,'Content',1,'2017-07-18 13:39:41','2017-07-18 13:39:41','815ad596-301f-45df-a36f-3b0c74c4e283'),
	(451,337,'Settings',2,'2017-07-18 13:39:41','2017-07-18 13:39:41','c2d68a8c-8ceb-4be8-872a-a4e0965ac1a1'),
	(452,338,'Content',1,'2017-07-18 13:39:41','2017-07-18 13:39:41','bab6ec76-27e2-4712-ba2e-d67e96e7a688'),
	(453,338,'Settings',2,'2017-07-18 13:39:41','2017-07-18 13:39:41','b98f8a4f-79aa-4c36-9493-0430235c6dd5'),
	(454,339,'Content',1,'2017-07-18 13:39:41','2017-07-18 13:39:41','40ff613b-5581-4a1a-9f66-711176473904'),
	(455,339,'Settings',2,'2017-07-18 13:39:41','2017-07-18 13:39:41','4bc093ed-00d6-4bd9-a68d-30d910984e3d'),
	(456,340,'Content',1,'2017-07-18 13:39:41','2017-07-18 13:39:41','d389f027-704e-4123-adfd-d977a5b82b19'),
	(457,340,'Settings',2,'2017-07-18 13:39:41','2017-07-18 13:39:41','aff38194-7cd6-4fd3-8e7a-a5b5fcfb21f2'),
	(458,341,'Content',1,'2017-07-18 13:39:41','2017-07-18 13:39:41','93456911-36b8-4370-92ab-e73d80218cd9'),
	(459,341,'Settings',2,'2017-07-18 13:39:41','2017-07-18 13:39:41','2aaa59e1-0fc2-4055-a4c2-7732f19c99bc'),
	(460,342,'Content',1,'2017-07-18 13:39:41','2017-07-18 13:39:41','c51b0ab2-c2c3-4be8-8c88-d43b600a505d'),
	(461,342,'Settings',2,'2017-07-18 13:39:41','2017-07-18 13:39:41','5435bcf1-e6d7-4306-a52f-e3a52907f325'),
	(462,343,'Content',1,'2017-07-18 13:39:41','2017-07-18 13:39:41','dc21e123-57c5-4bf0-a81e-e248f1f98f16'),
	(463,343,'Settings',2,'2017-07-18 13:39:41','2017-07-18 13:39:41','773a19e1-c8b0-45d8-96d8-16f9f5c04f8c'),
	(464,344,'Content',1,'2017-07-18 13:39:41','2017-07-18 13:39:41','6b7a1d29-c2f4-43f3-bbeb-52ff4722391c'),
	(465,344,'Settings',2,'2017-07-18 13:39:42','2017-07-18 13:39:42','147da5bc-e85f-4cab-b51b-eef47322c660'),
	(466,345,'Content',1,'2017-09-03 17:01:51','2017-09-03 17:01:51','c21293ca-e289-4c10-8b04-1383932a4375'),
	(467,346,'Content',1,'2017-09-03 17:01:51','2017-09-03 17:01:51','e74c11e9-4aa2-495c-9c2a-93e4d1c5c08c'),
	(468,347,'Content',1,'2017-09-03 17:04:46','2017-09-03 17:04:46','48fd8989-6e8f-4edf-98b1-0674be2e352b'),
	(470,349,'Content',1,'2017-09-03 22:18:26','2017-09-03 22:18:26','e8455e7d-5502-4f52-bc2d-98538e3573da'),
	(471,350,'Content',1,'2017-09-03 23:13:41','2017-09-03 23:13:41','2105440f-61e1-44b6-92a5-c914e0449d78'),
	(472,351,'Content',1,'2017-09-04 13:52:53','2017-09-04 13:52:53','49df5d86-3752-4e36-8564-df3035cecaed');

/*!40000 ALTER TABLE `craft_fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_fields`;

CREATE TABLE `craft_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(58) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `instructions` text COLLATE utf8_unicode_ci,
  `translatable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_fields_handle_context_unq_idx` (`handle`,`context`),
  KEY `craft_fields_context_idx` (`context`),
  KEY `craft_fields_groupId_fk` (`groupId`),
  CONSTRAINT `craft_fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_fields` WRITE;
/*!40000 ALTER TABLE `craft_fields` DISABLE KEYS */;

INSERT INTO `craft_fields` (`id`, `groupId`, `name`, `handle`, `context`, `instructions`, `translatable`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(3,2,'Category: Default','categoryDefault','global','',0,'Categories','{\"source\":\"default\",\"limit\":\"\",\"selectionLabel\":\"\"}','2017-04-16 22:48:52','2017-04-16 22:48:52','f99eb1e1-cf4f-4c6a-a6a9-c0b670f178eb'),
	(4,4,'Global: Contact','globalContact','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"},\"new4\":{\"width\":\"\"},\"new5\":{\"width\":\"\"},\"new6\":{\"width\":\"\"},\"new7\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-04-16 22:48:52','2017-04-16 22:48:52','775a80e1-a6c7-45e3-9b73-28c6c4af82bd'),
	(5,NULL,'Company','company','superTableBlockType:1','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:52','2017-04-16 22:48:52','2057f1f5-4c1a-47b6-93a6-cba4928e37f4'),
	(6,NULL,'Street','street','superTableBlockType:1','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:52','2017-04-16 22:48:52','ae9276a2-45c6-416e-912a-40b6138d5295'),
	(7,NULL,'Postal Code','postalCode','superTableBlockType:1','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:52','2017-04-16 22:48:52','700b3fab-6c34-4d52-91e3-7040a2b924c4'),
	(8,NULL,'Location','location','superTableBlockType:1','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:52','2017-04-16 22:48:52','dd655459-562b-407b-b61f-01b6e4769cdc'),
	(9,NULL,'Mail','mail','superTableBlockType:1','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:52','2017-04-16 22:48:52','58e879da-d437-452b-afcb-945da6296860'),
	(10,NULL,'Phone','phone','superTableBlockType:1','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:52','2017-04-16 22:48:52','40502cff-09b2-48d2-8a35-842a68042436'),
	(11,NULL,'Mobile Phone','mobilePhone','superTableBlockType:1','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:52','2017-04-16 22:48:52','5e0c3714-2202-4a5a-a017-6a36d2da3f8c'),
	(26,5,'Grouped: Caption','groupedCaption','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"},\"new4\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-04-16 22:48:53','2017-04-16 22:48:53','fafa7ae1-a36e-44e9-88e4-2f9daf4f9900'),
	(27,NULL,'Caption Title','captionTitle','superTableBlockType:3','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:54','2017-04-16 22:48:54','3f73e9e5-7181-4c97-9c4b-de0755a70f94'),
	(28,NULL,'Caption','caption','superTableBlockType:3','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":1,\"initialRows\":4}','2017-04-16 22:48:54','2017-04-16 22:48:54','f6e95218-fc09-4235-a491-471c1c2d3914'),
	(29,NULL,'Source','source','superTableBlockType:3','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:54','2017-04-16 22:48:54','d6d22381-2c84-4784-96fc-8564e6b5d384'),
	(30,NULL,'Source URL','sourceUrl','superTableBlockType:3','',0,'FruitLinkIt','{\"types\":[\"custom\"],\"defaultText\":\"\",\"allowCustomText\":\"\",\"allowTarget\":\"\",\"entrySources\":[],\"entrySelectionLabel\":\"Select an entry\",\"assetSources\":\"*\",\"assetSelectionLabel\":\"Select an asset\",\"categorySources\":\"*\",\"categorySelectionLabel\":\"Select a category\"}','2017-04-16 22:48:54','2017-04-16 22:48:54','39aa2cb6-f8c4-492f-8300-4f6291025bc0'),
	(31,6,'Plugin: Seomatic','pluginSeomatic','global','',0,'Seomatic_Meta','{\"assetSources\":\"*\",\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"WebPage\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoTitle\":\"\",\"seoTitleSourceChangeable\":\"1\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"singleIntroText\",\"seoDescription\":\"\",\"seoDescriptionSourceChangeable\":\"1\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoKeywords\":\"\",\"seoKeywordsSourceChangeable\":\"1\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"singleImageEntry\",\"seoImageIdSourceChangeable\":\"1\",\"seoImageTransform\":\"socialSharing\",\"twitterCardType\":\"summary_large_image\",\"twitterCardTypeChangeable\":\"1\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"singleImageEntry\",\"seoTwitterImageIdSourceChangeable\":\"1\",\"seoTwitterImageTransform\":\"socialSharing\",\"openGraphType\":\"\",\"openGraphTypeChangeable\":\"1\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"singleImageEntry\",\"seoFacebookImageIdSourceChangeable\":\"1\",\"seoFacebookImageTransform\":\"socialSharing\",\"robots\":\"\",\"robotsChangeable\":\"1\"}','2017-04-16 22:48:54','2017-06-08 17:00:43','07f85313-5d91-415c-9bd3-6cd0acf06af1'),
	(32,7,'Settings: Button','settingsButton','global','',0,'SuperTable','{\"columns\":{\"33\":{\"width\":\"\"},\"34\":{\"width\":\"\"},\"107\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null,\"minRows\":null}','2017-04-16 22:48:54','2017-07-09 21:01:02','08cd9e7a-9813-425d-a459-957dfbd8d3f4'),
	(33,NULL,'Style','style','superTableBlockType:4','',0,'Dropdown','{\"options\":[{\"label\":\"Primary\",\"value\":\"style-primary\",\"default\":\"1\"},{\"label\":\"Secondary\",\"value\":\"style-secondary\",\"default\":\"\"},{\"label\":\"Outline\",\"value\":\"style-outline\",\"default\":\"\"},{\"label\":\"Link\",\"value\":\"style-link\",\"default\":\"\"}]}','2017-04-16 22:48:54','2017-07-09 21:01:02','01c6ed96-507a-4b5b-b289-e724f15bb9f4'),
	(34,NULL,'Alignment','alignment','superTableBlockType:4','',0,'Dropdown','{\"options\":[{\"label\":\"Left\",\"value\":\"align-left\",\"default\":\"1\"},{\"label\":\"Center\",\"value\":\"align-center\",\"default\":\"\"},{\"label\":\"Right\",\"value\":\"align-right\",\"default\":\"\"},{\"label\":\"Full\",\"value\":\"align-full\",\"default\":\"\"}]}','2017-04-16 22:48:54','2017-07-09 21:01:02','3ef6503f-da31-4ba9-b345-afa2b7c8a582'),
	(37,7,'Settings: ButtonGroup','settingsButtonGroup','global','',0,'SuperTable','{\"columns\":{\"38\":{\"width\":\"\"},\"39\":{\"width\":\"\"},\"108\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null,\"minRows\":null}','2017-04-16 22:48:55','2017-07-09 20:59:19','2ce3ba09-a1bf-4a19-bafd-421b3114a1e9'),
	(38,NULL,'Style','style','superTableBlockType:5','',0,'Dropdown','{\"options\":[{\"label\":\"Primary\",\"value\":\"style-primary\",\"default\":\"1\"},{\"label\":\"Secondary\",\"value\":\"style-secondary\",\"default\":\"\"}]}','2017-04-16 22:48:55','2017-07-09 20:59:19','6c309da0-b686-4525-9228-a816b6fdfea4'),
	(39,NULL,'Alignment','alignment','superTableBlockType:5','',0,'Dropdown','{\"options\":[{\"label\":\"Left\",\"value\":\"align-left\",\"default\":\"1\"},{\"label\":\"Center\",\"value\":\"align-center\",\"default\":\"\"},{\"label\":\"Right\",\"value\":\"align-right\",\"default\":\"\"},{\"label\":\"Full\",\"value\":\"align-full\",\"default\":\"\"}]}','2017-04-16 22:48:55','2017-07-09 20:59:19','006f2f65-036f-4194-9eb3-40aab320f0a7'),
	(40,7,'Settings: Definition List','settingsDefinitionList','global','',0,'SuperTable','{\"columns\":{\"41\":{\"width\":\"\"},\"42\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null,\"minRows\":null}','2017-04-16 22:48:55','2017-07-10 20:17:31','415cfc65-b315-494c-8c28-97cf7bac58e9'),
	(41,NULL,'Ratio','ratio','superTableBlockType:6','',0,'Dropdown','{\"options\":[{\"label\":\"1:1\",\"value\":\"ratio-50-50\",\"default\":\"1\"},{\"label\":\"1:2\",\"value\":\"ratio-33-66\",\"default\":\"\"},{\"label\":\"1:3\",\"value\":\"ratio-25-75\",\"default\":\"\"}]}','2017-04-16 22:48:55','2017-07-10 20:17:31','161f4ffe-b03e-41ae-b6aa-5e6a9b397493'),
	(42,NULL,'Layout','layout','superTableBlockType:6','',0,'Dropdown','{\"options\":[{\"label\":\"Table\",\"value\":\"layout-table\",\"default\":\"1\"},{\"label\":\"Row\",\"value\":\"layout-row\",\"default\":\"\"}]}','2017-04-16 22:48:55','2017-07-10 20:17:31','0d5a23e5-8449-462c-bfc3-d5b9fe45f3b7'),
	(43,7,'Settings: Embed','settingsEmbed','global','',0,'SuperTable','{\"columns\":{\"45\":{\"width\":\"\"},\"46\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null,\"minRows\":null}','2017-04-16 22:48:55','2017-07-17 21:09:19','e53396bc-f7a9-48f6-b84d-d0688ec3e36c'),
	(45,NULL,'Position','position','superTableBlockType:7','',0,'Dropdown','{\"options\":[{\"label\":\"Left\",\"value\":\"align-left\",\"default\":\"1\"},{\"label\":\"Center\",\"value\":\"align-center\",\"default\":\"\"},{\"label\":\"Right\",\"value\":\"align-right\",\"default\":\"\"}]}','2017-04-16 22:48:56','2017-07-17 21:09:19','a536303f-28f8-44ce-a714-7016c49cbefd'),
	(46,NULL,'Width','width','superTableBlockType:7','',0,'Dropdown','{\"options\":[{\"label\":\"Full\",\"value\":\"width-100\",\"default\":\"1\"},{\"label\":\"Three Quarter\",\"value\":\"width-75\",\"default\":\"\"},{\"label\":\"Half\",\"value\":\"width-50\",\"default\":\"\"}]}','2017-04-16 22:48:56','2017-07-17 21:09:19','0a23214e-c6eb-43ae-ba97-6687d0c41bc2'),
	(47,7,'Settings: Focal Point','settingsFocalPoint','global','',0,'FocalPointField_FocalPoint','{\"defaultFocalPoint\":\"50% 50%\"}','2017-04-16 22:48:56','2017-04-16 22:48:56','56b4e0bb-3648-4872-a635-41125c6d0fd5'),
	(48,7,'Settings: Headline','settingsHeadline','global','',0,'SuperTable','{\"columns\":{\"50\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-04-16 22:48:56','2017-04-19 22:01:54','0cc564f2-f3aa-4195-acfe-e2d440c35d1f'),
	(50,NULL,'Size','size','superTableBlockType:8','',0,'Dropdown','{\"options\":[{\"label\":\"H2\",\"value\":\"h2\",\"default\":\"1\"},{\"label\":\"H3\",\"value\":\"h3\",\"default\":\"\"},{\"label\":\"H4\",\"value\":\"h4\",\"default\":\"\"},{\"label\":\"H5\",\"value\":\"h5\",\"default\":\"\"},{\"label\":\"H6\",\"value\":\"h6\",\"default\":\"\"}]}','2017-04-16 22:48:57','2017-04-19 22:01:54','e762c338-786b-4e81-89c6-bb58d32ebc28'),
	(52,7,'Settings: Image Cover','settingsImageCover','global','',0,'SuperTable','{\"columns\":{\"53\":{\"width\":\"\"},\"54\":{\"width\":\"\"},\"55\":{\"width\":\"\"},\"109\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null,\"minRows\":null}','2017-04-16 22:48:57','2017-07-11 05:23:58','209881bb-a426-47e6-aaa2-79354a549e58'),
	(53,NULL,'Background Position','backgroundPosition','superTableBlockType:9','',0,'Dropdown','{\"options\":[{\"label\":\"Focalpoint\",\"value\":\"focalpoint\",\"default\":\"1\"},{\"label\":\"Left : Top\",\"value\":\"0% 0%\",\"default\":\"\"},{\"label\":\"Left : Center\",\"value\":\"0% 50%\",\"default\":\"\"},{\"label\":\"Left : Bottom\",\"value\":\"0% 100%\",\"default\":\"\"},{\"label\":\"Center : Top\",\"value\":\"50% 0%\",\"default\":\"\"},{\"label\":\"Center : Center\",\"value\":\"50% 50%\",\"default\":\"\"},{\"label\":\"Center : Bottom\",\"value\":\"50% 100%\",\"default\":\"\"},{\"label\":\"Right : Top\",\"value\":\"100% 0%\",\"default\":\"\"},{\"label\":\"Right : Center\",\"value\":\"100% 50%\",\"default\":\"\"},{\"label\":\"Right : Bottom\",\"value\":\"100% 100%\",\"default\":\"\"}]}','2017-04-16 22:48:57','2017-07-11 05:23:58','bdd100ab-144e-4264-a75a-b5e6cb7c3350'),
	(54,NULL,'Text Vertical Position','textVerticalPosition','superTableBlockType:9','',0,'Dropdown','{\"options\":[{\"label\":\"Top\",\"value\":\"textV-top\",\"default\":\"\"},{\"label\":\"Center\",\"value\":\"textV-center\",\"default\":\"\"},{\"label\":\"Bottom\",\"value\":\"textV-bottom\",\"default\":\"1\"}]}','2017-04-16 22:48:57','2017-07-11 05:23:58','332b34bc-c8e4-4ae5-8bc1-b4a1d403aaf2'),
	(55,NULL,'Text Alignment','textAlignment','superTableBlockType:9','',0,'Dropdown','{\"options\":[{\"label\":\"Left\",\"value\":\"textH-left\",\"default\":\"\"},{\"label\":\"Center\",\"value\":\"textH-center\",\"default\":\"1\"},{\"label\":\"Right\",\"value\":\"textH-right\",\"default\":\"\"}]}','2017-04-16 22:48:57','2017-07-11 05:23:58','80e5dc50-61d7-4a7c-b1d9-8591cde2c6d9'),
	(56,7,'Settings: Image Gallery','settingsImageGallery','global','',0,'SuperTable','{\"columns\":{\"57\":{\"width\":\"\"},\"59\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null,\"minRows\":null}','2017-04-16 22:48:57','2017-07-13 23:56:49','21cf9e06-e54a-49e8-8799-c46f1308abcb'),
	(57,NULL,'Colums','columns','superTableBlockType:10','',0,'Dropdown','{\"options\":[{\"label\":\"6\",\"value\":\"columns-6\",\"default\":\"1\"},{\"label\":\"5\",\"value\":\"columns-5\",\"default\":\"\"},{\"label\":\"4\",\"value\":\"columns-4\",\"default\":\"\"},{\"label\":\"3\",\"value\":\"columns-3\",\"default\":\"\"},{\"label\":\"2\",\"value\":\"columns-2\",\"default\":\"\"}]}','2017-04-16 22:48:57','2017-07-13 23:56:49','72e6effe-f568-4a11-8038-6d64a548ee83'),
	(59,NULL,'Thumbs Ratio','thumbsRatio','superTableBlockType:10','',0,'Dropdown','{\"options\":[{\"label\":\"Landscape\",\"value\":\"landscape\",\"default\":\"\"},{\"label\":\"Square\",\"value\":\"square\",\"default\":\"1\"},{\"label\":\"Portrait\",\"value\":\"portrait\",\"default\":\"\"}]}','2017-04-16 22:48:58','2017-07-13 23:56:49','812a3f7a-45d9-4351-8bb3-7a11f5aeb371'),
	(60,7,'Settings: Image Grid','settingsImageGrid','global','',0,'SuperTable','{\"columns\":{\"61\":{\"width\":\"\"},\"62\":{\"width\":\"\"},\"63\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null,\"minRows\":null}','2017-04-16 22:48:58','2017-07-14 01:54:34','b0f61e15-eec0-4227-b19b-3db8252c752c'),
	(61,NULL,'Caption','caption','superTableBlockType:11','',0,'Lightswitch','{\"default\":\"\"}','2017-04-16 22:48:58','2017-07-14 01:54:34','364a21c0-c4fd-4da0-a2c0-f9f83fb5233e'),
	(62,NULL,'Columns','columns','superTableBlockType:11','',0,'Dropdown','{\"options\":[{\"label\":\"3\",\"value\":\"columns-3\",\"default\":\"\"},{\"label\":\"2\",\"value\":\"columns-2\",\"default\":\"1\"},{\"label\":\"1\",\"value\":\"columns-1\",\"default\":\"\"}]}','2017-04-16 22:48:58','2017-07-14 01:54:34','6cf16dcf-f649-464d-9be3-f40daefb1333'),
	(63,NULL,'Ratio','ratio','superTableBlockType:11','',0,'Dropdown','{\"options\":[{\"label\":\"Landscape\",\"value\":\"landscape\",\"default\":\"\"},{\"label\":\"Square\",\"value\":\"square\",\"default\":\"1\"},{\"label\":\"Portrait\",\"value\":\"portrait\",\"default\":\"\"},{\"label\":\"Auto\",\"value\":\"auto\",\"default\":\"\"}]}','2017-04-16 22:48:58','2017-07-14 01:54:34','81d289bd-9d5d-49fd-93a4-9dff38fa9966'),
	(64,7,'Settings: Image Single','settingsImageSingle','global','',0,'SuperTable','{\"columns\":{\"65\":{\"width\":\"\"},\"66\":{\"width\":\"\"},\"67\":{\"width\":\"\"},\"68\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null,\"minRows\":null}','2017-04-16 22:48:58','2017-07-16 21:40:21','810871ff-93b3-4f1d-a8ff-8e3743dd8361'),
	(65,NULL,'Caption','caption','superTableBlockType:12','Soll eine Caption angezeigt werden?',0,'Lightswitch','{\"default\":\"\"}','2017-04-16 22:48:58','2017-07-16 21:40:21','674b8645-5a09-44f1-9b6c-d7f73179886f'),
	(66,NULL,'Alignment','alignment','superTableBlockType:12','Wie soll das Bild ausgerichtet sein? Greift nicht wenn es bei dem Modul \"RichText Marginals\" genutzt wird. ',0,'Dropdown','{\"options\":[{\"label\":\"Left\",\"value\":\"align-left\",\"default\":\"\"},{\"label\":\"Center\",\"value\":\"align-center\",\"default\":\"1\"},{\"label\":\"Right\",\"value\":\"align-right\",\"default\":\"\"}]}','2017-04-16 22:48:59','2017-07-16 21:40:21','2bedac5a-5b13-49ef-92d0-91478e203fe7'),
	(67,NULL,'Ratio','ratio','superTableBlockType:12','Welches Seitenverhältnis soll das Bild haben? Auto nimmt das ursprüngliche Seitenverhältnis vom Bild. ',0,'Dropdown','{\"options\":[{\"label\":\"Landscape\",\"value\":\"landscape\",\"default\":\"1\"},{\"label\":\"Square\",\"value\":\"square\",\"default\":\"\"},{\"label\":\"Portrait\",\"value\":\"portrait\",\"default\":\"\"},{\"label\":\"Auto\",\"value\":\"auto\",\"default\":\"\"}]}','2017-04-16 22:48:59','2017-07-16 21:40:21','5c9b3f7d-b541-4f5a-b514-cfc65f52ef7b'),
	(68,NULL,'Width','width','superTableBlockType:12','Über wie viele Spalten soll sich das Bild erstrecken? Greift nicht wenn es bei dem Modul \"RichText Marginals\" genutzt wird. ',0,'Dropdown','{\"options\":[{\"label\":\"Full Width\",\"value\":\"columns-100\",\"default\":\"\"},{\"label\":\"12 Columns\",\"value\":\"columns-12\",\"default\":\"1\"},{\"label\":\"9 Columns\",\"value\":\"columns-9\",\"default\":\"\"},{\"label\":\"6 Columns\",\"value\":\"columns-6\",\"default\":\"\"}]}','2017-04-16 22:48:59','2017-07-16 21:40:21','2661efb8-eb33-45be-8b5b-bd92ce47d06b'),
	(69,7,'Settings: Image Slider','settingsImageSlider','global','',0,'SuperTable','{\"columns\":{\"70\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null,\"minRows\":null}','2017-04-16 22:48:59','2017-07-16 23:07:37','cd018358-a1a4-40d0-a332-1cba4dfbc14e'),
	(70,NULL,'ratio','ratio','superTableBlockType:13','',0,'Dropdown','{\"options\":[{\"label\":\"Landscape\",\"value\":\"landscape\",\"default\":\"1\"},{\"label\":\"Square\",\"value\":\"square\",\"default\":\"\"},{\"label\":\"Portrait\",\"value\":\"portrait\",\"default\":\"\"}]}','2017-04-16 22:48:59','2017-07-16 23:07:37','0be4f25a-452b-4c08-914d-ce1cb40d71f6'),
	(73,7,'Settings: Section','settingsSection','global','',0,'SuperTable','{\"columns\":{\"74\":{\"width\":\"\"},\"75\":{\"width\":\"\"},\"76\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Section Options\",\"maxRows\":null,\"minRows\":null}','2017-04-16 22:48:59','2017-07-09 21:01:25','8fabec04-d56b-4b9e-9387-759a5a223433'),
	(74,NULL,'Background Color','backgroundColor','superTableBlockType:14','',0,'Dropdown','{\"options\":[{\"label\":\"None\",\"value\":\"backgroundColor-none\",\"default\":\"1\"},{\"label\":\"Black\",\"value\":\"backgroundColor-black\",\"default\":\"\"},{\"label\":\"White\",\"value\":\"backgroundColor-white\",\"default\":\"\"}]}','2017-04-16 22:49:00','2017-07-09 21:01:25','f8094dfe-0a52-4bc0-bd65-f3628d1a10d9'),
	(75,NULL,'Width','width','superTableBlockType:14','',0,'Dropdown','{\"options\":[{\"label\":\"Content Width\",\"value\":\"width-content\",\"default\":\"1\"},{\"label\":\"Full Width\",\"value\":\"width-full\",\"default\":\"\"}]}','2017-04-16 22:49:00','2017-07-09 21:01:25','9fc896ef-e002-4809-805e-bc7c64740e7a'),
	(76,NULL,'Padding Vertical','paddingVertical','superTableBlockType:14','',0,'Dropdown','{\"options\":[{\"label\":\"Small\",\"value\":\"paddingVertical-small\",\"default\":\"1\"},{\"label\":\"Medium\",\"value\":\"paddingVertical-medium\",\"default\":\"\"},{\"label\":\"Large\",\"value\":\"paddingVertical-large\",\"default\":\"\"},{\"label\":\"None\",\"value\":\"paddingVertical-none\",\"default\":\"\"}]}','2017-04-16 22:49:00','2017-07-09 21:01:25','21fe272b-40cb-43da-933f-d55c4ecdb2ff'),
	(77,7,'Settings: Separator','settingsSeparator','global','',0,'SuperTable','{\"columns\":{\"79\":{\"width\":\"\"},\"80\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null,\"minRows\":null}','2017-04-16 22:49:00','2017-07-16 22:29:01','1c16da1a-9828-49c5-9e0b-1aee38fbfbed'),
	(79,NULL,'Style','style','superTableBlockType:15','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"style-default\",\"default\":\"1\"}]}','2017-04-16 22:49:00','2017-07-16 22:29:01','f16ffbfa-5ac1-4106-b2a9-788bb96cb649'),
	(80,NULL,'Margin Vertical','marginVertical','superTableBlockType:15','',0,'Dropdown','{\"options\":[{\"label\":\"Small\",\"value\":\"marginVertical-small\",\"default\":\"1\"},{\"label\":\"Medium\",\"value\":\"marginVertical-medium\",\"default\":\"\"},{\"label\":\"Large\",\"value\":\"marginVertical-large\",\"default\":\"\"},{\"label\":\"None\",\"value\":\"marginVertical-none\",\"default\":\"\"}]}','2017-04-16 22:49:00','2017-07-16 22:29:01','1fcf5028-579b-41eb-8c3f-57c23c97f15f'),
	(81,7,'Settings: Two Columns','settingsTwoColumns','global','',0,'SuperTable','{\"columns\":{\"82\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null,\"minRows\":null}','2017-04-16 22:49:00','2017-07-16 22:47:29','18802973-8832-41e0-a612-0e29b2c9487c'),
	(82,NULL,'Ratio','ratio','superTableBlockType:16','Wie soll das Spaltenverhältnis sein?',0,'Dropdown','{\"options\":[{\"label\":\"1:1\",\"value\":\"ratio-50-50\",\"default\":\"1\"},{\"label\":\"2:1\",\"value\":\"ratio-66-33\",\"default\":\"\"},{\"label\":\"3:1\",\"value\":\"ratio-75-25\",\"default\":\"\"},{\"label\":\"1:3\",\"value\":\"ratio-25-75\",\"default\":\"\"},{\"label\":\"1:2\",\"value\":\"ratio-33-66\",\"default\":\"\"}]}','2017-04-16 22:49:01','2017-07-16 22:47:29','8f8d6b41-1126-47ed-9021-55a3edaee831'),
	(83,8,'Single: Anchor','singleAnchor','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:49:01','2017-04-16 22:49:01','dd3cf74d-e16d-4a66-b61c-dacf217067c9'),
	(84,8,'Single: Button','singleButton','global','',0,'FruitLinkIt','{\"types\":[\"email\",\"tel\",\"custom\",\"entry\",\"category\",\"asset\"],\"defaultText\":\"Click here\",\"allowCustomText\":1,\"allowTarget\":1,\"entrySources\":[],\"entrySelectionLabel\":\"Select an entry\",\"assetSources\":\"*\",\"assetSelectionLabel\":\"Select an asset\",\"categorySources\":\"*\",\"categorySelectionLabel\":\"Select a category\"}','2017-04-16 22:49:01','2017-04-16 22:49:01','8177593b-8cee-481a-854d-bfd5adc54c09'),
	(85,8,'Single: Button Group','singleButtonGroup','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":null,\"selectionLabel\":\"Add a Button\",\"maxRows\":5}','2017-04-16 22:49:01','2017-04-16 22:49:01','994107ce-abe4-4651-aa03-00bd619cd9f9'),
	(86,NULL,'Button','button','superTableBlockType:17','',0,'FruitLinkIt','{\"types\":[\"email\",\"tel\",\"custom\",\"entry\",\"category\",\"asset\"],\"defaultText\":\"\",\"allowCustomText\":1,\"allowTarget\":1,\"entrySources\":[],\"entrySelectionLabel\":\"Select an entry\",\"assetSources\":\"*\",\"assetSelectionLabel\":\"Select an asset\",\"categorySources\":\"*\",\"categorySelectionLabel\":\"Select a category\"}','2017-04-16 22:49:01','2017-04-16 22:49:01','51e3766b-5805-45eb-9140-a8bcb61048d5'),
	(87,8,'Single: Code','singleCode','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":1,\"initialRows\":8}','2017-04-16 22:49:02','2017-04-16 22:49:02','0c6beed0-c301-4bcc-b324-87a47d76d1cc'),
	(88,8,'Single: Definition List','singleDefinitionList','global','',0,'Table','{\"columns\":{\"col1\":{\"heading\":\"Definition Term\",\"handle\":\"definitionTerm\",\"width\":\"\",\"type\":\"singleline\"},\"col2\":{\"heading\":\"Definition Description\",\"handle\":\"definitionDescription\",\"width\":\"\",\"type\":\"singleline\"}},\"defaults\":{\"row1\":{\"col1\":\"\",\"col2\":\"\"}}}','2017-04-16 22:49:02','2017-04-16 22:49:02','cd553829-4aea-4a8a-88de-d33d8ec628e2'),
	(89,8,'Single: Embed Code','singleEmbedCode','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":1,\"initialRows\":2}','2017-04-16 22:49:02','2017-04-16 22:49:02','00e69e8a-9cfd-4fd2-953a-27efe4ecc6cc'),
	(90,8,'Single: Headline','singleHeadline','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:49:02','2017-04-16 22:49:02','3ef9aa49-1347-43d9-ab83-e5d017f535f6'),
	(91,8,'Single: Image','singleImage','global','',0,'Assets','{\"useSingleFolder\":1,\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":1,\"allowedKinds\":[\"image\"],\"limit\":1,\"viewMode\":\"list\",\"selectionLabel\":\"Add an Image\"}','2017-04-16 22:49:02','2017-04-16 22:49:02','3f8d6749-4752-43ac-8c4b-c114bdb261dd'),
	(92,8,'Single: Images','singleImages','global','',0,'Assets','{\"useSingleFolder\":1,\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":1,\"allowedKinds\":[\"image\"],\"limit\":\"\",\"viewMode\":\"list\",\"selectionLabel\":\"Add an Image\"}','2017-04-16 22:49:02','2017-04-16 22:49:02','a68296a9-b5fa-450a-a6c3-2a92ddac6bb3'),
	(93,8,'Single: Label','singleLabel','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:49:02','2017-04-16 22:49:02','e3341790-52a1-4fab-ba84-1e9157f4f0cf'),
	(94,8,'Single: Quote','singleQuote','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":1,\"initialRows\":4}','2017-04-16 22:49:02','2017-04-16 22:49:02','717862d4-82be-413f-8ab2-03d6515f6b2e'),
	(95,8,'Single: Rich Text','singleRichText','global','',0,'RichText','{\"configFile\":\"Custom.json\",\"availableAssetSources\":\"*\",\"availableTransforms\":\"*\",\"cleanupHtml\":1,\"purifyHtml\":1,\"columnType\":\"text\"}','2017-04-16 22:49:02','2017-04-16 22:49:02','f85c7165-6da7-44a9-928c-57095d6f6cfe'),
	(96,8,'Single: Source','singleSource','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:49:03','2017-04-16 22:49:03','ca0751da-0f25-4028-9e3d-17cdee2d809c'),
	(97,8,'Single: Source Url','singleSourceUrl','global','',0,'FruitLinkIt','{\"types\":[\"custom\"],\"defaultText\":\"\",\"allowCustomText\":1,\"allowTarget\":\"\",\"entrySources\":[],\"entrySelectionLabel\":\"Select an entry\",\"assetSources\":\"*\",\"assetSelectionLabel\":\"Select an asset\",\"categorySources\":\"*\",\"categorySelectionLabel\":\"Select a category\"}','2017-04-16 22:49:03','2017-04-16 22:49:03','28ac9431-3120-41a6-a177-85a8f047d82f'),
	(98,8,'Single: Subline','singleSubline','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:49:03','2017-04-16 22:49:03','9e2275b6-c045-4134-96b7-7320ffac648d'),
	(99,8,'Single: Text','singleText','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:49:03','2017-04-16 22:49:03','93e95a04-5244-4b57-aed4-575f7a4e1bcf'),
	(100,3,'Content Builder: Neo','contentBuilderNeo','global','',0,'Neo','{\"maxBlocks\":null}','2017-04-16 22:49:03','2017-07-18 13:39:41','aab66a18-eccb-4d87-9ce7-41dbac12dc72'),
	(101,6,'Plugin: Preparse Dominant Color','pluginPreparseDominantColor','global','',0,'PreparseField_Preparse','{\"fieldTwig\":\"{% spaceless %}\\r\\n  {% if asset|length %}\\r\\n    {% set color = craft.imager.getDominantColor(asset) %}\\r\\n    {{ color }}\\r\\n  {% endif %}\\r\\n{% endspaceless %}\",\"columnType\":\"text\",\"decimals\":\"0\",\"parseBeforeSave\":\"1\",\"parseOnMove\":\"1\",\"showField\":\"1\",\"allowSelect\":\"1\"}','2017-06-08 16:49:28','2017-06-08 17:06:13','02fa3799-a387-49ce-9f87-94c1b5811fb5'),
	(102,8,'Single: Seo Title','singleSeoTitle','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\"}','2017-06-08 16:52:25','2017-06-08 16:52:25','7381bf3c-30ee-4168-8152-7318c3b122b3'),
	(103,8,'Single: Image Entry','singleImageEntry','global','',0,'Assets','{\"useSingleFolder\":\"1\",\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"limit\":\"1\",\"viewMode\":\"list\",\"selectionLabel\":\"\"}','2017-06-08 16:54:33','2017-06-08 16:54:33','02bb0686-b937-4fca-aa2c-4961bb513870'),
	(104,8,'Single: Intro Text','singleIntroText','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"1\",\"initialRows\":\"8\"}','2017-06-08 16:56:11','2017-06-08 16:56:11','468fde0f-8d8d-4ffd-9fef-595ae367e4ae'),
	(105,6,'Plugin: Seomatic News','pluginSeomaticNews','global','',0,'Seomatic_Meta','{\"assetSources\":\"*\",\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"WebPage\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoTitle\":\"\",\"seoTitleSourceChangeable\":1,\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"singleIntroText\",\"seoDescription\":\"\",\"seoDescriptionSourceChangeable\":1,\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoKeywords\":\"\",\"seoKeywordsSourceChangeable\":1,\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"singleImageEntry\",\"seoImageIdSourceChangeable\":1,\"seoImageTransform\":\"socialSharing\",\"twitterCardType\":\"summary_large_image\",\"twitterCardTypeChangeable\":1,\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"singleImageEntry\",\"seoTwitterImageIdSourceChangeable\":1,\"seoTwitterImageTransform\":\"socialSharing\",\"openGraphType\":\"\",\"openGraphTypeChangeable\":1,\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"singleImageEntry\",\"seoFacebookImageIdSourceChangeable\":1,\"seoFacebookImageTransform\":\"socialSharing\",\"robots\":\"\",\"robotsChangeable\":1}','2017-06-08 17:01:21','2017-06-08 17:01:21','53c3e6cf-eee8-4b5c-a1c2-fe963a16cf5b'),
	(106,6,'Plugin: Seomatic Pages','pluginSeomaticPages','global','',0,'Seomatic_Meta','{\"assetSources\":\"*\",\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"WebPage\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoTitle\":\"\",\"seoTitleSourceChangeable\":1,\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"singleIntroText\",\"seoDescription\":\"\",\"seoDescriptionSourceChangeable\":1,\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoKeywords\":\"\",\"seoKeywordsSourceChangeable\":1,\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"singleImageEntry\",\"seoImageIdSourceChangeable\":1,\"seoImageTransform\":\"socialSharing\",\"twitterCardType\":\"summary_large_image\",\"twitterCardTypeChangeable\":1,\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"singleImageEntry\",\"seoTwitterImageIdSourceChangeable\":1,\"seoTwitterImageTransform\":\"socialSharing\",\"openGraphType\":\"\",\"openGraphTypeChangeable\":1,\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"singleImageEntry\",\"seoFacebookImageIdSourceChangeable\":1,\"seoFacebookImageTransform\":\"socialSharing\",\"robots\":\"\",\"robotsChangeable\":1}','2017-06-08 17:01:36','2017-06-08 17:01:36','1e5834f3-c420-4ea3-94f8-da9ffdb4e5df'),
	(107,NULL,'Size','size','superTableBlockType:4','',0,'Dropdown','{\"options\":[{\"label\":\"Small\",\"value\":\"size-small\",\"default\":\"\"},{\"label\":\"Large\",\"value\":\"size-large\",\"default\":\"1\"},{\"label\":\"Pill\",\"value\":\"size-pill\",\"default\":\"\"}]}','2017-06-26 20:39:35','2017-07-09 21:01:02','7cc9e456-79f7-4c70-8703-9455b217fa5b'),
	(108,NULL,'Size','size','superTableBlockType:5','',0,'Dropdown','{\"options\":[{\"label\":\"Small\",\"value\":\"size-small\",\"default\":\"\"},{\"label\":\"Large\",\"value\":\"size-large\",\"default\":\"1\"},{\"label\":\"Pill\",\"value\":\"size-pill\",\"default\":\"\"}]}','2017-06-27 20:06:09','2017-07-09 20:59:19','17373364-b52d-41f9-a902-aa89e861bffe'),
	(109,NULL,'Text Color','textColor','superTableBlockType:9','',0,'Dropdown','{\"options\":[{\"label\":\"White\",\"value\":\"textColor-white\",\"default\":\"1\"},{\"label\":\"Black\",\"value\":\"textColor-black\",\"default\":\"\"}]}','2017-07-11 05:22:54','2017-07-11 05:23:58','2c8a0cde-ace6-43dd-b679-675ed8d22771'),
	(110,7,'Settings: Video','settingsVideo','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Add a row\",\"maxRows\":null,\"minRows\":null}','2017-07-17 21:09:59','2017-07-17 21:09:59','be8e9d7e-11b1-4fe7-bb90-dd79d1353739'),
	(111,NULL,'Position','position','superTableBlockType:18','',0,'Dropdown','{\"options\":[{\"label\":\"Left\",\"value\":\"align-left\",\"default\":1},{\"label\":\"Center\",\"value\":\"align-center\",\"default\":\"\"},{\"label\":\"Right\",\"value\":\"align-right\",\"default\":\"\"}]}','2017-07-17 21:09:59','2017-07-17 21:09:59','3a542dd6-2c7d-46e0-b54f-74b2ab05b290'),
	(112,NULL,'Width','width','superTableBlockType:18','',0,'Dropdown','{\"options\":[{\"label\":\"Full\",\"value\":\"width-100\",\"default\":1},{\"label\":\"Three Quarter\",\"value\":\"width-75\",\"default\":\"\"},{\"label\":\"Half\",\"value\":\"width-50\",\"default\":\"\"}]}','2017-07-17 21:09:59','2017-07-17 21:09:59','68ba88a3-9f2e-42ad-9c8e-a099964acb56'),
	(113,4,'Global: Third Party Snippets','globalThirdPartySnippets','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":null,\"selectionLabel\":\"Add a row\",\"maxRows\":null,\"minRows\":null}','2017-09-03 17:01:51','2017-09-03 17:01:51','160ad338-5d40-4eca-8426-25687816cae3'),
	(114,NULL,'Snippet Name','snippetName','superTableBlockType:19','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-09-03 17:01:51','2017-09-03 17:01:51','25bcc791-f1e7-4d49-80e1-e6722b57df21'),
	(115,NULL,'Snippet Status','snippetStatus','superTableBlockType:19','',0,'Lightswitch','{\"default\":\"\"}','2017-09-03 17:01:51','2017-09-03 17:01:51','0772389e-ac64-4e72-b3ce-c0d7e956308c'),
	(116,NULL,'Snippet Code','snippetCode','superTableBlockType:19','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":1,\"initialRows\":8}','2017-09-03 17:01:51','2017-09-03 17:01:51','277452ec-8a9d-4928-b719-05693ad57a32'),
	(117,4,'Global: Google Analytics','globalGoogleAnalytics','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-09-03 17:04:46','2017-09-03 17:04:46','f44f8bbe-a0be-4d8f-8448-871371d0fea8'),
	(118,4,'Global: Social Networks','globalSocialNetworks','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"119\":{\"width\":\"\"},\"120\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":null,\"selectionLabel\":\"Add a row\",\"maxRows\":null,\"minRows\":null}','2017-09-03 22:18:05','2017-09-03 23:13:41','1f2d1f75-8b19-45f8-9e43-e9002e4be19f'),
	(119,NULL,'Profil Name','profilName','superTableBlockType:20','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-09-03 22:18:05','2017-09-03 23:13:41','cc689563-5972-487f-8b0a-e2d5ac4c1ccf'),
	(120,NULL,'Profil Url','profilUrl','superTableBlockType:20','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-09-03 22:18:05','2017-09-03 23:13:41','14b3e157-7f9b-4b6b-89a6-7f0a9b6b7b32'),
	(121,NULL,'Network Name','networkName','superTableBlockType:20','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-09-03 23:13:41','2017-09-03 23:13:41','d2749079-c35a-4fa2-a375-03eb36b15c40');

/*!40000 ALTER TABLE `craft_fields` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_globalsets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_globalsets`;

CREATE TABLE `craft_globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_globalsets_name_unq_idx` (`name`),
  UNIQUE KEY `craft_globalsets_handle_unq_idx` (`handle`),
  KEY `craft_globalsets_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_globalsets` WRITE;
/*!40000 ALTER TABLE `craft_globalsets` DISABLE KEYS */;

INSERT INTO `craft_globalsets` (`id`, `name`, `handle`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(6,'Social Networks','socialNetworks',349,'2017-04-16 22:49:03','2017-09-03 22:18:26','6f8165d1-2636-4d74-96d7-9d86cf9f6774'),
	(114,'Third Party Snippets','thirdPartySnippets',346,'2017-09-03 17:01:51','2017-09-03 17:01:51','e8bc7f12-5612-4839-b717-5d79c9f3d49a'),
	(115,'Google Analytics','googleAnalytics',347,'2017-09-03 17:04:46','2017-09-03 17:04:46','f683e91c-d38c-4e16-ae41-1d3d1b17835d'),
	(116,'Contact','contact',351,'2017-09-04 13:52:53','2017-09-04 13:52:53','4c3b255b-6a8a-4ce8-8678-1265388ccb9b');

/*!40000 ALTER TABLE `craft_globalsets` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_info`;

CREATE TABLE `craft_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `edition` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `siteUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timezone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `on` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maintenance` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_info` WRITE;
/*!40000 ALTER TABLE `craft_info` DISABLE KEYS */;

INSERT INTO `craft_info` (`id`, `version`, `schemaVersion`, `edition`, `siteName`, `siteUrl`, `timezone`, `on`, `maintenance`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'2.6.2986','2.6.10',2,'Baukasten','http://baukasten.dev','UTC',1,0,'2017-04-16 21:53:40','2017-07-13 23:44:07','66d3ce2a-d695-463f-af51-9364c16014bf');

/*!40000 ALTER TABLE `craft_info` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_locales
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_locales`;

CREATE TABLE `craft_locales` (
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`locale`),
  KEY `craft_locales_sortOrder_idx` (`sortOrder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_locales` WRITE;
/*!40000 ALTER TABLE `craft_locales` DISABLE KEYS */;

INSERT INTO `craft_locales` (`locale`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	('de',1,'2017-04-16 21:53:40','2017-04-16 21:53:40','5ba3eb5a-8d4d-450a-be3f-a67d9deb0281');

/*!40000 ALTER TABLE `craft_locales` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_matrixblocks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_matrixblocks`;

CREATE TABLE `craft_matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `ownerLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_matrixblocks_ownerId_idx` (`ownerId`),
  KEY `craft_matrixblocks_fieldId_idx` (`fieldId`),
  KEY `craft_matrixblocks_typeId_idx` (`typeId`),
  KEY `craft_matrixblocks_sortOrder_idx` (`sortOrder`),
  KEY `craft_matrixblocks_ownerLocale_fk` (`ownerLocale`),
  CONSTRAINT `craft_matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocks_ownerLocale_fk` FOREIGN KEY (`ownerLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_matrixblocktypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_matrixblocktypes`;

CREATE TABLE `craft_matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  UNIQUE KEY `craft_matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  KEY `craft_matrixblocktypes_fieldId_fk` (`fieldId`),
  KEY `craft_matrixblocktypes_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_migrations`;

CREATE TABLE `craft_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pluginId` int(11) DEFAULT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_migrations_version_unq_idx` (`version`),
  KEY `craft_migrations_pluginId_fk` (`pluginId`),
  CONSTRAINT `craft_migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `craft_plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_migrations` WRITE;
/*!40000 ALTER TABLE `craft_migrations` DISABLE KEYS */;

INSERT INTO `craft_migrations` (`id`, `pluginId`, `version`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,NULL,'m000000_000000_base','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','34c86331-352c-422d-91cb-91bee8e0775a'),
	(2,NULL,'m140730_000001_add_filename_and_format_to_transformindex','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','82e65bc6-1d36-418f-848c-cd4e63760e9b'),
	(3,NULL,'m140815_000001_add_format_to_transforms','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','b1d89579-cd57-45a2-b9a8-ea5515840e73'),
	(4,NULL,'m140822_000001_allow_more_than_128_items_per_field','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','50d74475-24b3-496a-97f3-45f52decf189'),
	(5,NULL,'m140829_000001_single_title_formats','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','882a17a3-4d21-4254-9993-071bcf510740'),
	(6,NULL,'m140831_000001_extended_cache_keys','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','a398483c-2ba3-4402-8c12-25e08d31161f'),
	(7,NULL,'m140922_000001_delete_orphaned_matrix_blocks','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','3e688e6b-5238-4412-8c55-e7c4a84a2f28'),
	(8,NULL,'m141008_000001_elements_index_tune','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','77d11847-afa9-44bb-814f-3e581b12bde7'),
	(9,NULL,'m141009_000001_assets_source_handle','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','a613dcd1-f095-4e72-93a9-479c94330386'),
	(10,NULL,'m141024_000001_field_layout_tabs','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','d341e12b-0567-40a0-b85d-189a347e99a0'),
	(11,NULL,'m141030_000000_plugin_schema_versions','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','b4ce151b-8ada-479f-b9e4-775c68df3459'),
	(12,NULL,'m141030_000001_drop_structure_move_permission','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','3aa2db26-80a4-40ff-991a-5691e7b6f71b'),
	(13,NULL,'m141103_000001_tag_titles','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','c7c3a5ff-080a-464b-8e25-9ee1d30a1e5d'),
	(14,NULL,'m141109_000001_user_status_shuffle','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','3eaa99f3-02d0-409b-91f7-b3f2fb7cdabb'),
	(15,NULL,'m141126_000001_user_week_start_day','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','7cad0efe-4733-4bf2-ad5b-f505ff80596a'),
	(16,NULL,'m150210_000001_adjust_user_photo_size','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','faf56ab2-19fa-46bc-b04c-2f8d2ad19f0b'),
	(17,NULL,'m150724_000001_adjust_quality_settings','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','bc12216d-99ff-4b8d-b758-f138be0f9a1c'),
	(18,NULL,'m150827_000000_element_index_settings','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','40b83042-36cc-48e5-8556-bceecc610c3d'),
	(19,NULL,'m150918_000001_add_colspan_to_widgets','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','843fee34-28ed-46c0-b10a-e44edf9310bb'),
	(20,NULL,'m151007_000000_clear_asset_caches','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','0313d1dd-2e9d-4cfd-862f-a3b52b9bfff1'),
	(21,NULL,'m151109_000000_text_url_formats','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','ea7ceee5-b55d-4b5d-af20-4a437e9d0cdd'),
	(22,NULL,'m151110_000000_move_logo','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','d3183561-c7ef-418e-a56c-411af2b4e19b'),
	(23,NULL,'m151117_000000_adjust_image_widthheight','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','0c1d5844-7ca2-4011-8433-122da5ab8bd8'),
	(24,NULL,'m151127_000000_clear_license_key_status','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','62832846-b3ab-4270-b486-94062525412e'),
	(25,NULL,'m151127_000000_plugin_license_keys','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','a41e443d-36ff-4807-b89f-5b4eb4b9b90b'),
	(26,NULL,'m151130_000000_update_pt_widget_feeds','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','c7976a29-16a0-4818-8d72-d2ddf027efc9'),
	(27,NULL,'m160114_000000_asset_sources_public_url_default_true','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','113ef289-b71c-433c-9626-831a478139f7'),
	(28,NULL,'m160223_000000_sortorder_to_smallint','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','6bafb16d-671a-4750-99dd-5fcdddd19099'),
	(29,NULL,'m160229_000000_set_default_entry_statuses','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','ceda5daf-f712-4ba6-95ea-79e0f82daa0c'),
	(30,NULL,'m160304_000000_client_permissions','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','1a0b1be4-4ff6-42a5-93f4-8ec502eabd84'),
	(31,NULL,'m160322_000000_asset_filesize','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','0b81a941-5551-4551-a856-8b30fb157881'),
	(32,NULL,'m160503_000000_orphaned_fieldlayouts','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','4afdf993-8b62-4d4e-8712-bdaa93c85587'),
	(33,NULL,'m160510_000000_tasksettings','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','31db222e-d762-467c-91bc-4e82e0158d35'),
	(34,NULL,'m160829_000000_pending_user_content_cleanup','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','488b69ed-f175-45c0-ad85-571bcb596f14'),
	(35,NULL,'m160830_000000_asset_index_uri_increase','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','91d935fb-53aa-477c-8c22-18e5f4aefa2a'),
	(36,NULL,'m160919_000000_usergroup_handle_title_unique','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','9edeb9b6-db43-4280-aa21-c3b3dbbe481d'),
	(37,NULL,'m161108_000000_new_version_format','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','32ac0d42-b8d2-4193-84a6-2122a6bd01a8'),
	(38,NULL,'m161109_000000_index_shuffle','2017-04-16 21:53:40','2017-04-16 21:53:40','2017-04-16 21:53:40','35b918cc-d481-49ad-8dc9-e821b590162a'),
	(40,6,'m160208_010101_FruitLinkIt_UpdateExistingLinkItFields','2017-04-16 22:11:59','2017-04-16 22:11:59','2017-04-16 22:11:59','5d9f4d1e-77dd-489b-a0ce-2217af684917'),
	(41,8,'m160428_202308_Neo_UpdateBlockLevels','2017-04-16 22:42:26','2017-04-16 22:42:26','2017-04-16 22:42:26','28b4f3c3-4794-48fc-9964-31f1180d1bb6'),
	(42,8,'m160515_005002_Neo_UpdateBlockStructure','2017-04-16 22:42:26','2017-04-16 22:42:26','2017-04-16 22:42:26','7e50a633-057e-4116-9626-a722d764e655'),
	(43,8,'m160605_191540_Neo_UpdateBlockStructureLocales','2017-04-16 22:42:26','2017-04-16 22:42:26','2017-04-16 22:42:26','a01e6062-f7dd-4581-af3f-34b11779a86d'),
	(44,8,'m161029_230849_Neo_AddMaxChildBlocksSetting','2017-04-16 22:42:26','2017-04-16 22:42:26','2017-04-16 22:42:26','3a738e9b-8675-40e4-9f9a-2cd8fba7039b'),
	(45,10,'m150901_144609_superTable_fixForContentTables','2017-04-16 22:42:40','2017-04-16 22:42:40','2017-04-16 22:42:40','ec32b640-a9b3-45bb-aa19-ab8bc227b734'),
	(46,12,'m151225_000000_seomatic_addHumansField','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','3a3af2fd-ee9a-4e60-a239-41319426a39b'),
	(47,12,'m151226_000000_seomatic_addTwitterFacebookFields','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','b82521da-6324-4546-8eac-efeadb43fa9f'),
	(48,12,'m160101_000000_seomatic_addRobotsFields','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','eb34fb5e-0551-42e2-a7b4-44ab9a589179'),
	(49,12,'m160111_000000_seomatic_addTitleFields','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','eff3382f-d57b-4334-81cf-c419ae091a4b'),
	(50,12,'m160122_000000_seomatic_addTypeFields','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','588c7cd0-a6b6-4fe7-89d4-4965d7326dd3'),
	(51,12,'m160123_000000_seomatic_addOpeningHours','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','a0cb30be-7399-44c3-9d31-db4c35e27c68'),
	(52,12,'m160202_000000_seomatic_addSocialHandles','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','28a03ec3-ca7a-48d6-9a85-8a7d4e6c28f3'),
	(53,12,'m160204_000000_seomatic_addGoogleAnalytics','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','4d16eae5-214d-4b30-9cd7-20ccfdae5f9a'),
	(54,12,'m160205_000000_seomatic_addResturantMenu','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','61ab347a-f412-465d-bb26-7a737cc36960'),
	(55,12,'m160206_000000_seomatic_addGoogleAnalyticsPlugins','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','bd3764ab-3a48-450e-a962-2e34b9bd1536'),
	(56,12,'m160206_000000_seomatic_addGoogleAnalyticsSendPageView','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','aa75c945-f817-4ea7-82b2-96938d3bc096'),
	(57,12,'m160209_000000_seomatic_alterDescriptionsColumns','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','6c6259a9-e2a3-4739-bbd4-d78af1d977d8'),
	(58,12,'m160209_000001_seomatic_addRobotsTxt','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','1e02082b-fc8a-498c-8302-82123d370fcc'),
	(59,12,'m160227_000000_seomatic_addFacebookAppId','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','9c8c0eab-b647-4240-99c7-be71a1eae2ed'),
	(60,12,'m160416_000000_seomatic_addContactPoints','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','32a00fbd-2954-46d5-a16b-40c6d15c4b7e'),
	(61,12,'m160509_000000_seomatic_addSiteLinksBing','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','a61e8b4b-196d-4ddd-97cc-b18d4db31e9c'),
	(62,12,'m160707_000000_seomatic_addGoogleTagManager','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','e335e873-8c05-4bb3-b7a3-4aa115a9aceb'),
	(63,12,'m160715_000000_seomatic_addSeoImageTransforms','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','0f3c67fb-2faf-49d9-adbd-b7a3a81cb5a7'),
	(64,12,'m160723_000000_seomatic_addSeoMainEntityOfPage','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','be4201f6-457f-4a7c-becb-ddaed38eda2a'),
	(65,12,'m160724_000000_seomatic_addSeoMainEntityCategory','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','7ecf241f-01d6-4d1a-a599-dbe86834994b'),
	(66,12,'m160811_000000_seomatic_addVimeo','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','5a8d8f58-d777-48df-a944-557004d51735'),
	(67,12,'m160904_000000_seomatic_addTwitterFacebookImages','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','54bd54a7-7390-497c-9584-c21020f1ebb1'),
	(68,12,'m161220_000000_seomatic_addPriceRange','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','73cded4b-2617-4c06-bdea-ee407d29cf00'),
	(69,12,'m170212_000000_seomatic_addGoogleAnalyticsAnonymizeIp','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','269348bf-3426-49be-911f-8f14cd491b00'),
	(70,12,'m170212_000000_seomatic_addWikipedia','2017-04-16 22:43:59','2017-04-16 22:43:59','2017-04-16 22:43:59','89c6faca-1d72-4e6f-b5f9-37bdfca82ad8'),
	(71,NULL,'m170612_000000_route_index_shuffle','2017-06-26 20:04:33','2017-06-26 20:04:33','2017-06-26 20:04:33','a072f9a8-5192-48cd-9d3e-d45becaaaada');

/*!40000 ALTER TABLE `craft_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_neoblocks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_neoblocks`;

CREATE TABLE `craft_neoblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `collapsed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ownerLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_neoblocks_ownerId_idx` (`ownerId`),
  KEY `craft_neoblocks_fieldId_idx` (`fieldId`),
  KEY `craft_neoblocks_typeId_idx` (`typeId`),
  KEY `craft_neoblocks_collapsed_idx` (`collapsed`),
  KEY `craft_neoblocks_ownerLocale_fk` (`ownerLocale`),
  CONSTRAINT `craft_neoblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_neoblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_neoblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_neoblocks_ownerLocale_fk` FOREIGN KEY (`ownerLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_neoblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_neoblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_neoblocks` WRITE;
/*!40000 ALTER TABLE `craft_neoblocks` DISABLE KEYS */;

INSERT INTO `craft_neoblocks` (`id`, `ownerId`, `fieldId`, `typeId`, `collapsed`, `ownerLocale`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(7,5,100,16,0,NULL,'2017-04-17 02:19:23','2017-07-19 09:58:51','196dea1c-8c7d-457a-ae0b-38979e4ddf3e'),
	(9,5,100,1,0,NULL,'2017-04-17 18:45:37','2017-07-19 09:58:51','f3e57361-5754-4e41-9dc1-585bb4fb60e3'),
	(15,5,100,13,0,NULL,'2017-04-17 18:46:20','2017-07-19 09:58:51','b27ace01-bba4-4847-a822-388934bf27fb'),
	(20,5,100,6,0,NULL,'2017-04-19 21:20:00','2017-07-19 09:58:51','d4ee806e-a3b0-4417-9fd6-9989f7f76d64'),
	(22,5,100,7,0,NULL,'2017-04-19 21:28:03','2017-07-19 09:58:51','9fa71e09-fa60-4232-bac9-8338911bce54'),
	(28,5,100,8,0,NULL,'2017-04-19 23:18:28','2017-07-19 09:58:51','75c7e55c-5145-483f-8dfc-b3561df31957'),
	(29,5,100,9,0,NULL,'2017-04-19 23:18:28','2017-07-19 09:58:51','37c07392-e243-4524-93b3-d8ed60b2c4d6'),
	(30,5,100,10,0,NULL,'2017-04-19 23:18:28','2017-07-19 09:58:51','87277df6-1dc2-4995-a13b-6737a0acfb32'),
	(31,5,100,9,0,NULL,'2017-04-19 23:18:28','2017-07-19 09:58:51','c90498d5-7db5-4baa-8db3-ff8f6f5a7815'),
	(32,5,100,14,0,NULL,'2017-04-19 23:18:28','2017-07-19 09:58:51','02a79d50-d679-4175-89da-5e896af3c55e'),
	(34,5,100,10,0,NULL,'2017-04-20 00:06:35','2017-07-19 09:58:51','d8229f8f-d7e7-4ae3-8ccb-bf17e203c1ce'),
	(35,5,100,14,0,NULL,'2017-04-20 00:07:18','2017-07-19 09:58:51','d8629fe5-98cc-4c9d-a6b6-35c553ab1e56'),
	(37,5,100,1,0,NULL,'2017-04-20 00:11:24','2017-07-19 09:58:51','aad4713d-8867-4882-a12a-ae53ebfb6577'),
	(39,5,100,11,0,NULL,'2017-04-20 00:11:24','2017-07-19 09:58:51','02bdcb53-20eb-4184-acda-d9a14110c8ad'),
	(49,5,100,1,0,NULL,'2017-04-20 09:21:50','2017-07-19 09:58:51','fba18f06-1294-42c5-898d-c138f0f25dce'),
	(51,5,100,7,0,NULL,'2017-04-20 09:21:50','2017-07-19 09:58:51','fcc6e200-42d0-45c4-b019-9d87c3038a6e'),
	(52,5,100,12,0,NULL,'2017-04-20 09:25:22','2017-07-19 09:58:51','23ff035d-ebe6-44de-82fb-9e5251b7b4f4'),
	(54,5,100,15,0,NULL,'2017-04-20 11:41:09','2017-07-19 09:58:51','331f6200-6888-4175-b3b2-5330d2b3dbe2'),
	(56,5,100,17,0,NULL,'2017-04-20 12:31:26','2017-07-19 09:58:52','60b59514-9baa-45b3-a4fd-a86168f671ca'),
	(61,5,100,18,0,NULL,'2017-04-20 12:52:30','2017-07-19 09:58:52','23218fcb-4f9e-4f7e-9503-677894373b2d'),
	(65,5,100,19,0,NULL,'2017-04-20 13:35:13','2017-07-19 09:58:52','fbf79742-64c3-4d8a-b172-f492d5a08378'),
	(71,5,100,20,0,NULL,'2017-04-20 13:52:06','2017-07-19 09:58:52','54a02015-dba3-48b9-90e3-8bbf353060e4'),
	(73,5,100,2,0,NULL,'2017-04-20 14:00:53','2017-07-19 09:58:52','74dc24ac-bd61-4805-a5b1-7461ce218a6c'),
	(74,5,100,3,0,NULL,'2017-04-20 14:00:53','2017-07-19 09:58:52','3fa82bf1-5e74-4d29-ad4a-9c21e15b1007'),
	(75,5,100,7,0,NULL,'2017-04-20 14:00:53','2017-07-19 09:58:52','2d72be88-c83b-4be5-b218-f68048577636'),
	(76,5,100,3,0,NULL,'2017-04-20 14:00:53','2017-07-19 09:58:52','f2db6af4-877f-4c2f-9b30-f8a393a05e68'),
	(77,5,100,7,0,NULL,'2017-04-20 14:00:53','2017-07-19 09:58:52','3dfcdf42-2370-4193-8589-e10e1b3dd1ed'),
	(78,5,100,14,0,NULL,'2017-04-20 14:09:24','2017-07-19 09:58:52','f25bec82-7e33-4c98-820c-65bf3298073d'),
	(80,5,100,15,0,NULL,'2017-04-20 14:46:34','2017-07-19 09:58:51','37649b33-d2fb-4e18-b55e-074ed260c8ba'),
	(82,5,100,4,0,NULL,'2017-04-20 15:34:51','2017-07-19 09:58:52','ee40c976-f52c-4c11-83c7-06032193d785'),
	(84,5,100,5,0,NULL,'2017-04-20 15:34:51','2017-07-19 09:58:52','3c164f29-07bf-4dac-85c0-12136dd99c95'),
	(85,5,100,7,0,NULL,'2017-04-20 15:34:51','2017-07-19 09:58:52','d7163a01-765b-4c40-98e4-99d27b084f59'),
	(86,5,100,5,0,NULL,'2017-04-20 15:34:51','2017-07-19 09:58:52','2f777ebf-5437-464c-9d72-4816118bb656'),
	(87,5,100,7,0,NULL,'2017-04-20 15:34:51','2017-07-19 09:58:52','0fcec56e-af90-4af0-b356-b7db3f95447d'),
	(88,5,100,14,0,NULL,'2017-04-20 15:34:51','2017-07-19 09:58:52','576c101a-9e54-43d8-9247-636cdc0b5ae2'),
	(90,5,100,16,0,NULL,'2017-06-26 21:11:47','2017-07-19 09:58:51','d20e84ee-319c-4a3b-af06-55a64e1b5127'),
	(92,5,100,16,0,NULL,'2017-06-26 21:11:47','2017-07-19 09:58:51','acf4e3e9-5e6f-48b9-987e-c9a32f263585'),
	(94,5,100,16,0,NULL,'2017-06-26 21:11:47','2017-07-19 09:58:51','3cc12389-40ca-4146-897f-1b2636462858'),
	(110,5,100,14,0,NULL,'2017-07-19 09:26:57','2017-07-19 09:58:51','6d74e3ac-f6c7-41a3-bc3a-6b1d1b303a5e'),
	(112,5,100,21,0,NULL,'2017-07-19 09:52:11','2017-07-19 09:58:52','01f9386c-fb4f-4571-8a01-dfd8bd39dbf8');

/*!40000 ALTER TABLE `craft_neoblocks` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_neoblockstructures
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_neoblockstructures`;

CREATE TABLE `craft_neoblockstructures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `ownerLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_neoblockstructures_structureId_idx` (`structureId`),
  KEY `craft_neoblockstructures_ownerId_idx` (`ownerId`),
  KEY `craft_neoblockstructures_fieldId_idx` (`fieldId`),
  KEY `craft_neoblockstructures_ownerLocale_fk` (`ownerLocale`),
  CONSTRAINT `craft_neoblockstructures_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_neoblockstructures_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_neoblockstructures_ownerLocale_fk` FOREIGN KEY (`ownerLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_neoblockstructures_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_neoblockstructures` WRITE;
/*!40000 ALTER TABLE `craft_neoblockstructures` DISABLE KEYS */;

INSERT INTO `craft_neoblockstructures` (`id`, `structureId`, `ownerId`, `fieldId`, `ownerLocale`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(203,205,5,100,NULL,'2017-07-19 09:58:51','2017-07-19 09:58:51','f0b860da-2180-47c7-83c4-c33b6638bcf3');

/*!40000 ALTER TABLE `craft_neoblockstructures` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_neoblocktypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_neoblocktypes`;

CREATE TABLE `craft_neoblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `maxBlocks` int(10) DEFAULT '0',
  `maxChildBlocks` int(10) DEFAULT '0',
  `childBlocks` text COLLATE utf8_unicode_ci,
  `topLevel` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_neoblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  UNIQUE KEY `craft_neoblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  KEY `craft_neoblocktypes_fieldId_fk` (`fieldId`),
  KEY `craft_neoblocktypes_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_neoblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_neoblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_neoblocktypes` WRITE;
/*!40000 ALTER TABLE `craft_neoblocktypes` DISABLE KEYS */;

INSERT INTO `craft_neoblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `name`, `handle`, `maxBlocks`, `maxChildBlocks`, `childBlocks`, `topLevel`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,100,324,'Content Section','contentSection',NULL,NULL,'',1,2,'2017-04-16 22:49:03','2017-07-18 13:39:41','78239f04-f35e-4486-96c0-22ce83005e52'),
	(2,100,325,'Accordion','accordion',NULL,NULL,'[\"accordionContent\"]',1,3,'2017-04-16 22:49:03','2017-07-18 13:39:41','24a92ae0-ef4c-47ff-a4bf-ae9c7b51a842'),
	(3,100,326,'Accordion Content','accordionContent',NULL,NULL,'[\"twoColumns\",\"headline\",\"richText\",\"quote\",\"imageGallery\",\"imageGrid\",\"imageSingle\",\"button\",\"buttonGroup\",\"definitionList\",\"embed\",\"separator\"]',0,4,'2017-04-16 22:49:03','2017-07-18 13:39:41','a1f6f60c-322b-4f9f-be18-92641e5fc621'),
	(4,100,327,'Two Columns','twoColumns',NULL,2,'[\"column\"]',1,5,'2017-04-16 22:49:03','2017-07-18 13:39:41','923a02f6-5448-4c01-9658-a53002677da6'),
	(5,100,328,'Column','column',NULL,NULL,'[\"headline\",\"richText\",\"imageSingle\",\"button\",\"embed\",\"separator\"]',0,6,'2017-04-16 22:49:03','2017-07-18 13:39:41','aa8ae593-add3-41fc-acf3-99656f120965'),
	(6,100,329,'Headline','headline',NULL,NULL,'',1,8,'2017-04-16 22:49:03','2017-07-18 13:39:41','17fd7dce-492b-46c0-9e31-1349ede5974d'),
	(7,100,330,'Rich Text','richText',NULL,2,'',1,9,'2017-04-16 22:49:03','2017-07-18 13:39:41','7ac911e0-9050-4a42-9973-4fd2254979d7'),
	(8,100,331,'Rich Text Marginals','richTextMarginals',NULL,2,'[\"marginalColumn\"]',1,10,'2017-04-16 22:49:03','2017-07-18 13:39:41','6766b9e5-47e3-419e-9b4f-747380865009'),
	(9,100,332,'Marginal Column','marginalColumn',NULL,1,'[\"quote\",\"imageSingle\"]',0,11,'2017-04-16 22:49:03','2017-07-18 13:39:41','3474dff3-8e0f-40cb-bd85-0959acab99b8'),
	(10,100,333,'Quote','quote',NULL,NULL,'',1,12,'2017-04-16 22:49:03','2017-07-18 13:39:41','0f31b23d-9cf9-4af2-9177-da772cb61534'),
	(11,100,334,'Image Cover','imageCover',NULL,NULL,'',1,14,'2017-04-16 22:49:03','2017-07-18 13:39:41','eff1c786-4c77-49ca-b177-873fbd713465'),
	(12,100,335,'Image Gallery','imageGallery',NULL,NULL,'',1,15,'2017-04-16 22:49:03','2017-07-18 13:39:41','1052add9-8383-4344-9c8e-b17abd59adeb'),
	(13,100,336,'Image Grid','imageGrid',NULL,NULL,'',1,16,'2017-04-16 22:49:03','2017-07-18 13:39:41','e9cda3a8-9c3b-45e8-888f-98fa13cb219d'),
	(14,100,337,'Image Single','imageSingle',NULL,NULL,'',1,17,'2017-04-16 22:49:03','2017-07-18 13:39:41','875dae98-1d96-4528-a3d2-d5a72b4664d2'),
	(15,100,338,'Image Slider','imageSlider',NULL,NULL,'',1,18,'2017-04-16 22:49:03','2017-07-18 13:39:41','996e77e7-6822-4714-af11-eede05096719'),
	(16,100,339,'Button','button',NULL,NULL,'',1,20,'2017-04-16 22:49:03','2017-07-18 13:39:41','5fb03a9b-975c-4e05-adcf-ccfeeebeafec'),
	(17,100,340,'Button Group','buttonGroup',NULL,5,'',1,21,'2017-04-16 22:49:03','2017-07-18 13:39:41','208ab3ca-885d-44a5-aa88-7b31cb15ba25'),
	(18,100,341,'Definition List','definitionList',NULL,NULL,'',1,23,'2017-04-16 22:49:03','2017-07-18 13:39:41','a7c26f72-f741-4679-95bf-26e52968fee4'),
	(19,100,342,'Embed','embed',NULL,NULL,'',1,24,'2017-04-16 22:49:03','2017-07-18 13:39:41','bfdd8ca2-35d6-4716-8f16-120127bb8dbc'),
	(20,100,344,'Separator','separator',NULL,NULL,'',1,26,'2017-04-16 22:49:03','2017-07-18 13:39:42','c1b095f7-15f7-48b1-9cad-8cdf7a67c07e'),
	(21,100,343,'Video','video',NULL,NULL,'',1,25,'2017-07-17 21:14:18','2017-07-18 13:39:41','36b7155b-53fe-44ae-9990-f9c463c275e4');

/*!40000 ALTER TABLE `craft_neoblocktypes` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_neogroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_neogroups`;

CREATE TABLE `craft_neogroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_neogroups_fieldId_fk` (`fieldId`),
  CONSTRAINT `craft_neogroups_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_neogroups` WRITE;
/*!40000 ALTER TABLE `craft_neogroups` DISABLE KEYS */;

INSERT INTO `craft_neogroups` (`id`, `fieldId`, `name`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(51,100,'Content Wrapper',1,'2017-07-18 13:39:42','2017-07-18 13:39:42','b47c44a2-e815-42df-869a-1afb3ac943ce'),
	(52,100,'Text Modules',7,'2017-07-18 13:39:42','2017-07-18 13:39:42','5a423c9d-46de-41a6-b7bb-e5100d273b56'),
	(53,100,'Image Modules',13,'2017-07-18 13:39:42','2017-07-18 13:39:42','6a738d2f-ae10-465f-8f0c-3ef7c2351ac9'),
	(54,100,'Button Modules',19,'2017-07-18 13:39:42','2017-07-18 13:39:42','3efb71cd-5d94-4caa-9b40-ce83672138c3'),
	(55,100,'More Modules…',22,'2017-07-18 13:39:42','2017-07-18 13:39:42','5d8a0eb0-2fa8-4923-8c63-91511c23aa2d');

/*!40000 ALTER TABLE `craft_neogroups` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_plugins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_plugins`;

CREATE TABLE `craft_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `licenseKey` char(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `settings` text COLLATE utf8_unicode_ci,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_plugins` WRITE;
/*!40000 ALTER TABLE `craft_plugins` DISABLE KEYS */;

INSERT INTO `craft_plugins` (`id`, `class`, `version`, `schemaVersion`, `licenseKey`, `licenseKeyStatus`, `enabled`, `settings`, `installDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(2,'Cookies','1.0.4','1.0.0',NULL,'unknown',1,NULL,'2017-04-16 22:11:44','2017-04-16 22:11:44','2017-07-13 23:43:26','ef47ceba-51a6-4565-90bd-bfc199022e6c'),
	(3,'FocalPointField','1.0.2',NULL,NULL,'unknown',1,NULL,'2017-04-16 22:11:48','2017-04-16 22:11:48','2017-07-13 23:43:26','4e64b877-25c4-4f86-91ff-a5e3109b4e2f'),
	(4,'Imager','1.6.3','1.0.0',NULL,'unknown',1,NULL,'2017-04-16 22:11:50','2017-04-16 22:11:50','2017-09-03 17:03:14','0cff012d-6717-4a58-aa39-51268d2dbe80'),
	(5,'Kint','1.1.0','1.0.0',NULL,'unknown',1,NULL,'2017-04-16 22:11:55','2017-04-16 22:11:55','2017-07-13 23:43:26','f101513d-d2bd-4990-a866-6ad089964b4a'),
	(6,'FruitLinkIt','2.3.4','2.3.0',NULL,'unknown',1,NULL,'2017-04-16 22:11:59','2017-04-16 22:11:59','2017-07-13 23:43:26','47ace0df-f9d6-49c2-9647-788d50e2e275'),
	(7,'Minify','1.1.2','1.0.0',NULL,'unknown',1,NULL,'2017-04-16 22:42:23','2017-04-16 22:42:23','2017-07-13 23:43:26','16bd2799-b641-4981-a41c-0e3392a48d5a'),
	(8,'Neo','1.4.1','1.4.1',NULL,'unknown',1,NULL,'2017-04-16 22:42:26','2017-04-16 22:42:26','2017-07-13 23:43:26','70d7e5dd-2268-40a4-85f3-a7ab5dcf34cc'),
	(9,'SidebarEnhancer','1.0.9','1.0.0',NULL,'unknown',1,NULL,'2017-04-16 22:42:33','2017-04-16 22:42:33','2017-07-13 23:43:26','217a761d-a45d-4d67-8ee2-7cbd11ac91c4'),
	(10,'SuperTable','1.0.5','1.0.0',NULL,'unknown',1,NULL,'2017-04-16 22:42:40','2017-04-16 22:42:40','2017-07-13 23:43:26','196c672e-f9cb-444f-b32c-f399bca73a78'),
	(11,'TheArchitect','1.6.0','1.6.0',NULL,'unknown',1,NULL,'2017-04-16 22:42:43','2017-04-16 22:42:43','2017-07-13 23:43:26','fb4f3140-f2f7-4c99-9257-087a3f99f655'),
	(12,'Seomatic','1.1.50','1.1.25',NULL,'unknown',1,NULL,'2017-04-16 22:43:59','2017-04-16 22:43:59','2017-09-03 17:03:14','7dcd03d0-54c8-47ed-b618-e93935503345'),
	(14,'PreparseField','0.3.6','1.0.0',NULL,'unknown',1,NULL,'2017-06-08 16:47:59','2017-06-08 16:47:59','2017-07-13 23:43:26','76418ae9-5d26-4856-ae7d-4ea1d49288b1'),
	(15,'BaukastenNeoStyles','1.0.0','1.0.0',NULL,'unknown',1,NULL,'2017-07-04 11:34:48','2017-07-04 11:34:48','2017-07-13 23:43:26','a2295b7f-3859-4a8c-ab5c-6630ba90c54a'),
	(16,'CpFieldLinks','1.2.2','1.0',NULL,'unknown',1,NULL,'2017-07-17 21:20:11','2017-07-17 21:20:11','2017-07-17 21:20:11','4766608d-4053-4413-a74e-1bc3ca584459');

/*!40000 ALTER TABLE `craft_plugins` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_rackspaceaccess
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_rackspaceaccess`;

CREATE TABLE `craft_rackspaceaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `connectionKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `storageUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cdnUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_rackspaceaccess_connectionKey_unq_idx` (`connectionKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_relations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_relations`;

CREATE TABLE `craft_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_relations_fieldId_sourceId_sourceLocale_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceLocale`,`targetId`),
  KEY `craft_relations_sourceId_fk` (`sourceId`),
  KEY `craft_relations_sourceLocale_fk` (`sourceLocale`),
  KEY `craft_relations_targetId_fk` (`targetId`),
  CONSTRAINT `craft_relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_relations_sourceLocale_fk` FOREIGN KEY (`sourceLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_relations` WRITE;
/*!40000 ALTER TABLE `craft_relations` DISABLE KEYS */;

INSERT INTO `craft_relations` (`id`, `fieldId`, `sourceId`, `sourceLocale`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(3365,92,15,NULL,11,1,'2017-07-19 09:58:51','2017-07-19 09:58:51','404cba50-d2fa-4dc1-b128-1239d247a2f8'),
	(3366,92,15,NULL,12,2,'2017-07-19 09:58:51','2017-07-19 09:58:51','e588c045-6137-42cc-ab0a-c3d4f4d6013b'),
	(3367,92,15,NULL,13,3,'2017-07-19 09:58:51','2017-07-19 09:58:51','45c3d1c5-c355-4d71-a090-bd4b6b155827'),
	(3368,92,15,NULL,14,4,'2017-07-19 09:58:51','2017-07-19 09:58:51','e6c27b9f-bbb0-410b-9ed8-8b5bc76bd22f'),
	(3369,91,32,NULL,14,1,'2017-07-19 09:58:51','2017-07-19 09:58:51','29364d39-6a66-4e84-9840-80ecdf7b44df'),
	(3370,91,35,NULL,11,1,'2017-07-19 09:58:51','2017-07-19 09:58:51','a2cf28e7-2063-4271-acf6-563e0b429bc9'),
	(3371,91,39,NULL,12,1,'2017-07-19 09:58:51','2017-07-19 09:58:51','581a40ab-ffd6-4350-b655-9b098a669396'),
	(3372,91,110,NULL,14,1,'2017-07-19 09:58:51','2017-07-19 09:58:51','555dfbc5-f13e-4ac4-9f6a-76c3dcd03704'),
	(3373,92,52,NULL,11,1,'2017-07-19 09:58:51','2017-07-19 09:58:51','a39edbfd-baf9-40cb-beee-da3a616c72d8'),
	(3374,92,52,NULL,12,2,'2017-07-19 09:58:51','2017-07-19 09:58:51','abfd644d-e62a-47c4-98e8-4398b0bd6ba6'),
	(3375,92,52,NULL,13,3,'2017-07-19 09:58:51','2017-07-19 09:58:51','f861c907-8996-45aa-b5de-d63165ec6b9e'),
	(3376,92,52,NULL,14,4,'2017-07-19 09:58:51','2017-07-19 09:58:51','7371d43c-7e62-41db-8aa0-97806b1ba743'),
	(3377,92,54,NULL,11,1,'2017-07-19 09:58:51','2017-07-19 09:58:51','d96cd640-24f1-4604-af6e-55c2bea4d758'),
	(3378,92,54,NULL,12,2,'2017-07-19 09:58:51','2017-07-19 09:58:51','0786d522-5441-4a72-865b-69798f35b83f'),
	(3379,92,54,NULL,13,3,'2017-07-19 09:58:51','2017-07-19 09:58:51','e6dcba70-eb9d-486f-b565-a1101414fc8d'),
	(3380,92,54,NULL,14,4,'2017-07-19 09:58:51','2017-07-19 09:58:51','c48777e4-260e-4101-81eb-0244d29e077e'),
	(3381,92,80,NULL,11,1,'2017-07-19 09:58:51','2017-07-19 09:58:51','6ebd9514-1a84-4f5b-a0b6-fb507a2e3f98'),
	(3382,92,80,NULL,12,2,'2017-07-19 09:58:51','2017-07-19 09:58:51','96eec04e-eef4-440e-aa75-2f8c61e5ed38'),
	(3383,92,80,NULL,13,3,'2017-07-19 09:58:51','2017-07-19 09:58:51','1bab5466-b8a6-457a-8a9d-f4a1440cbdf1'),
	(3384,92,80,NULL,14,4,'2017-07-19 09:58:51','2017-07-19 09:58:51','782b4126-639e-44ce-8447-bbf6332b9cbe'),
	(3385,91,78,NULL,13,1,'2017-07-19 09:58:52','2017-07-19 09:58:52','af0ab5ed-cf7b-4132-9659-05aa785d7864'),
	(3386,91,88,NULL,11,1,'2017-07-19 09:58:52','2017-07-19 09:58:52','09781f55-d352-4695-a27f-a9b3f7539eb6');

/*!40000 ALTER TABLE `craft_relations` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_routes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_routes`;

CREATE TABLE `craft_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `urlParts` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `urlPattern` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_routes_locale_idx` (`locale`),
  KEY `craft_routes_urlPattern_idx` (`urlPattern`),
  CONSTRAINT `craft_routes_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_searchindex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_searchindex`;

CREATE TABLE `craft_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`locale`),
  FULLTEXT KEY `craft_searchindex_keywords_idx` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_searchindex` WRITE;
/*!40000 ALTER TABLE `craft_searchindex` DISABLE KEYS */;

INSERT INTO `craft_searchindex` (`elementId`, `attribute`, `fieldId`, `locale`, `keywords`)
VALUES
	(1,'username',0,'de',' superuser '),
	(1,'firstname',0,'de',''),
	(1,'lastname',0,'de',''),
	(1,'fullname',0,'de',''),
	(1,'email',0,'de',' mail domain com '),
	(1,'slug',0,'de',''),
	(10,'slug',0,'de',''),
	(8,'slug',0,'de',''),
	(9,'field',90,'de',''),
	(9,'field',98,'de',''),
	(9,'field',83,'de',''),
	(9,'field',73,'de',' backgroundcolor none paddingvertical small width content '),
	(9,'slug',0,'de',''),
	(10,'field',74,'de',' backgroundcolor none '),
	(10,'field',75,'de',' width content '),
	(10,'field',76,'de',' paddingvertical small '),
	(8,'field',36,'de',' iconsample '),
	(6,'field',12,'de',''),
	(6,'slug',0,'de',''),
	(5,'field',100,'de',''),
	(7,'field',84,'de',' entry 5 click here home '),
	(7,'field',32,'de',' align left size small style primary '),
	(7,'slug',0,'de',''),
	(8,'field',33,'de',' style primary '),
	(8,'field',34,'de',' align left '),
	(8,'field',35,'de',' 0 '),
	(5,'title',0,'de',' modules '),
	(5,'slug',0,'de',' modules '),
	(4,'slug',0,'de',' homepage '),
	(4,'title',0,'de',' homepage '),
	(11,'field',26,'de',' lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue caption title max mustermann custom http google com '),
	(11,'field',47,'de',' 52 43% 34 78% '),
	(11,'filename',0,'de',' image_01 jpg '),
	(11,'extension',0,'de',' jpg '),
	(11,'kind',0,'de',' image '),
	(11,'slug',0,'de',' home 01 '),
	(11,'title',0,'de',' image 01 '),
	(12,'field',26,'de',' caption title '),
	(12,'field',47,'de',' 26 76% 45 37% '),
	(12,'filename',0,'de',' image_02 jpg '),
	(12,'extension',0,'de',' jpg '),
	(12,'kind',0,'de',' image '),
	(12,'slug',0,'de',' home 02 '),
	(12,'title',0,'de',' image 02 '),
	(13,'field',26,'de',' lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue '),
	(13,'field',47,'de',' 60 43% 52 08% '),
	(13,'filename',0,'de',' image_03 jpg '),
	(13,'extension',0,'de',' jpg '),
	(13,'kind',0,'de',' image '),
	(13,'slug',0,'de',' home 03 '),
	(13,'title',0,'de',' image 03 '),
	(14,'field',26,'de',' ex vix dicat discere partiendo at ignota corpora mei posse percipitur mea ut at doming commodo deseruisse sit eu diceret fabulas eligendi vix sea nostrum scriptorem ad quo cu eius tollit instructior caption '),
	(14,'field',47,'de',' 55 43% 31 07% '),
	(14,'filename',0,'de',' image_04 jpg '),
	(14,'extension',0,'de',' jpg '),
	(14,'kind',0,'de',' image '),
	(14,'slug',0,'de',' home 04 '),
	(14,'title',0,'de',' image 04 '),
	(15,'field',92,'de',' image 01 image 02 image 03 image 04 '),
	(15,'field',60,'de',' 1 columns 3 landscape '),
	(15,'slug',0,'de',''),
	(16,'field',61,'de',' 1 '),
	(16,'field',62,'de',' columns 3 '),
	(16,'field',63,'de',' landscape '),
	(16,'slug',0,'de',''),
	(17,'field',27,'de',' caption title '),
	(17,'field',28,'de',' lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue '),
	(17,'field',29,'de',' max mustermann '),
	(17,'field',30,'de',' custom http google com '),
	(17,'slug',0,'de',''),
	(18,'field',27,'de',' caption title '),
	(18,'field',28,'de',''),
	(18,'field',29,'de',''),
	(18,'field',30,'de',''),
	(18,'slug',0,'de',''),
	(19,'field',27,'de',''),
	(19,'field',28,'de',' lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue '),
	(19,'field',29,'de',''),
	(19,'field',30,'de',''),
	(19,'slug',0,'de',''),
	(20,'field',90,'de',' das ist eine headline '),
	(20,'field',48,'de',' h2 '),
	(20,'slug',0,'de',''),
	(21,'field',50,'de',' h2 '),
	(21,'slug',0,'de',''),
	(22,'field',95,'de',' lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue lorem ipsum dolor sit amet consectetur adipiscing elit lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue lorem ipsum dolor sit amet consectetur adipiscing elit phasellus quis lectus metus at posuere neque sed pharetra nibh eget orci convallis at posuere leo convallis sed blandit augue vitae augue scelerisque bibendum vivamus sit amet libero turpis non venenatis urna in blandit odio convallis suscipit venenatis ante ipsum cursus augue '),
	(22,'slug',0,'de',''),
	(28,'field',95,'de',' lorem ipsum dolor sit amet quas appetere qui te vel ne enim putent tractatos ullum inani et duo per placerat ocurreret te eos diceret accumsan in qui no viderer vivendum facilisi pro illud possim legimus at illum sonet numquam id vis ei accumsan nominati eos nam suas admodum ancillae ne nullam noster scribentur per cu te duis consetetur adipiscing pri mollis deseruisse te mei cu euismod singulis suavitate eam ex eos purto similique an eum fabellas adolescens dolor signiferumque cum id dicunt cetero detracto mea ei ex dico dolor vis splendide vituperatoribus cu usu ei mea posse sonet labores ad duo veritus intellegam alterum appellantur vix et vis dissentiet repudiandae eu decore integre principes per ei id vim stet mentitum repudiandae pri mentitum qualisque ea ex usu augue viderer suscipit ea vel mucius graecis mentitum perfecto eu duo duo eu ipsum urbanitas eruditi recteque abhorreant ius et omnes dolore debitis vel ei an inani copiosae nec audiam sanctus nostrum est ea assum iuvaret mea id an populo iriure interesset sit eum quas zril nostrum ei est no esse illum falli doming vix no no pri causae petentium id vocibus volutpat deterruisset usu vocibus verterem sed ne usu ne similique temporibus ex vix dicat discere partiendo at ignota corpora mei posse percipitur mea ut at doming commodo deseruisse sit eu diceret fabulas eligendi vix sea nostrum scriptorem ad quo cu eius tollit instructior '),
	(27,'slug',0,'de',''),
	(27,'field',30,'de',''),
	(27,'field',29,'de',''),
	(27,'field',28,'de',' ex vix dicat discere partiendo at ignota corpora mei posse percipitur mea ut at doming commodo deseruisse sit eu diceret fabulas eligendi vix sea nostrum scriptorem ad quo cu eius tollit instructior '),
	(27,'field',27,'de',' caption '),
	(28,'slug',0,'de',''),
	(29,'slug',0,'de',''),
	(30,'field',94,'de',' an populo iriure interesset sit eum quas zril nostrum ei est no esse illum falli doming vix no '),
	(34,'field',94,'de',' an populo iriure interesset sit eum quas zril nostrum ei est no esse illum falli doming vix no no pri causae petentium id vocibus volutpat deterruisset usu vocibus verterem sed ne usu ne similique temporibus ex vix dicat discere partiendo at ignota corpora mei posse percipitur mea ut at doming commodo deseruisse sit eu diceret fabulas eligendi vix sea nostrum scriptorem ad quo cu eius tollit instructior '),
	(30,'field',96,'de',' max mustermann '),
	(30,'field',97,'de',' custom http google com yo '),
	(30,'slug',0,'de',''),
	(31,'slug',0,'de',''),
	(32,'field',91,'de',' image 04 '),
	(32,'field',64,'de',' align left 1 portrait columns 100 '),
	(32,'slug',0,'de',''),
	(33,'field',65,'de',' 1 '),
	(33,'field',66,'de',' align left '),
	(33,'field',67,'de',' portrait '),
	(33,'field',68,'de',' columns 100 '),
	(33,'slug',0,'de',''),
	(34,'field',96,'de',' max mustermann '),
	(34,'field',97,'de',' custom http google com '),
	(34,'slug',0,'de',''),
	(35,'field',91,'de',' image 01 '),
	(35,'field',64,'de',' align left 1 landscape columns 100 '),
	(35,'slug',0,'de',''),
	(36,'field',65,'de',' 1 '),
	(36,'field',66,'de',' align left '),
	(36,'field',67,'de',' landscape '),
	(36,'field',68,'de',' columns 100 '),
	(36,'slug',0,'de',''),
	(37,'field',90,'de',''),
	(37,'field',98,'de',''),
	(37,'field',83,'de',''),
	(37,'field',73,'de',' backgroundcolor none paddingvertical small width full '),
	(37,'slug',0,'de',''),
	(38,'field',74,'de',' backgroundcolor none '),
	(38,'field',75,'de',' width full '),
	(38,'field',76,'de',' paddingvertical small '),
	(38,'slug',0,'de',''),
	(39,'field',91,'de',' image 02 '),
	(39,'field',99,'de',' mimi the cat '),
	(39,'field',52,'de',' focalpoint texth left textcolor white textv top '),
	(39,'slug',0,'de',''),
	(40,'field',53,'de',' focalpoint '),
	(40,'field',54,'de',' textv top '),
	(40,'field',55,'de',' texth left '),
	(40,'slug',0,'de',''),
	(50,'field',75,'de',' width content '),
	(50,'field',76,'de',' paddingvertical small '),
	(50,'slug',0,'de',''),
	(51,'field',95,'de',' lorem ipsum dolor sit amet quas appetere qui te vel ne enim putent tractatos ullum inani et duo per placerat ocurreret te eos diceret accumsan in qui no viderer vivendum facilisi pro illud possim legimus at illum sonet numquam id vis ei accumsan nominati eos nam suas admodum ancillae ne nullam noster scribentur per cu te duis consetetur adipiscing pri mollis deseruisse te mei cu euismod singulis suavitate eam ex eos purto similique an eum fabellas adolescens dolor signiferumque cum id dicunt cetero detracto mea ei ex dico dolor vis splendide vituperatoribus cu usu ei mea posse sonet labores ad duo veritus intellegam alterum appellantur vix et vis dissentiet repudiandae eu decore integre principes per ei id vim stet mentitum repudiandae pri mentitum qualisque ea ex usu augue viderer suscipit ea vel mucius graecis mentitum perfecto eu duo duo eu ipsum urbanitas eruditi recteque abhorreant ius et omnes dolore debitis vel ei an inani copiosae nec audiam sanctus nostrum est ea assum iuvaret mea id an populo iriure interesset sit eum quas zril nostrum ei est no esse illum falli doming vix no no pri causae petentium id vocibus volutpat deterruisset usu vocibus verterem sed ne usu ne similique temporibus ex vix dicat discere partiendo at ignota corpora mei posse percipitur mea ut at doming commodo deseruisse sit eu diceret fabulas eligendi vix sea nostrum scriptorem ad quo cu eius tollit instructior '),
	(50,'field',74,'de',' backgroundcolor none '),
	(49,'slug',0,'de',''),
	(49,'field',83,'de',''),
	(49,'field',73,'de',' backgroundcolor none paddingvertical small width content '),
	(49,'field',98,'de',''),
	(49,'field',90,'de',''),
	(51,'slug',0,'de',''),
	(52,'field',92,'de',' image 01 image 02 image 03 image 04 '),
	(52,'field',56,'de',' columns 6 landscape '),
	(52,'slug',0,'de',''),
	(53,'field',57,'de',' columns 6 '),
	(53,'field',59,'de',' landscape '),
	(53,'slug',0,'de',''),
	(54,'field',92,'de',' image 01 image 02 image 03 image 04 '),
	(54,'field',69,'de',' square '),
	(54,'slug',0,'de',''),
	(55,'field',70,'de',' square '),
	(55,'slug',0,'de',''),
	(56,'field',85,'de',' entry 4 home entry 5 modules entry 4 click me '),
	(56,'field',37,'de',' align left size small style primary '),
	(56,'slug',0,'de',''),
	(57,'field',86,'de',' entry 4 home '),
	(57,'slug',0,'de',''),
	(58,'field',86,'de',' entry 5 modules '),
	(58,'slug',0,'de',''),
	(59,'field',86,'de',' entry 4 click me '),
	(59,'slug',0,'de',''),
	(60,'field',38,'de',' style primary '),
	(60,'field',39,'de',' align left '),
	(60,'slug',0,'de',''),
	(61,'field',88,'de',' term 1 lorem ipsum dolor sit amet quas appetere qui te vel ne enim putent tractatos ullum inani et duo per placerat ocurreret te eos diceret accumsan in qui no viderer vivendum facilisi pro illud possim legimus at illum sonet numquam id vis ei accumsan nominati eos nam suas admodum ancillae ne nullam noster scribentur per cu te duis consetetur adipiscing pri term 1 lorem ipsum dolor sit amet quas appetere qui te vel ne enim putent tractatos ullum inani et duo per placerat ocurreret te eos diceret accumsan in qui no viderer vivendum facilisi pro illud possim legimus at illum sonet numquam id vis ei accumsan nominati eos nam suas admodum ancillae ne nullam noster scribentur per cu te duis consetetur adipiscing pri term 2 lorem ipsum dolor sit amet quas appetere qui te vel ne enim putent tractatos ullum inani et duo per placerat ocurreret te eos diceret accumsan in qui no viderer vivendum facilisi pro illud possim legimus at illum sonet numquam id vis ei accumsan nominati eos nam suas admodum ancillae ne nullam noster scribentur per cu te duis consetetur adipiscing pri term 2 lorem ipsum dolor sit amet quas appetere qui te vel ne enim putent tractatos ullum inani et duo per placerat ocurreret te eos diceret accumsan in qui no viderer vivendum facilisi pro illud possim legimus at illum sonet numquam id vis ei accumsan nominati eos nam suas admodum ancillae ne nullam noster scribentur per cu te duis consetetur adipiscing pri term 3 lorem ipsum dolor sit amet quas appetere qui te vel ne enim putent tractatos ullum inani et duo per placerat ocurreret te eos diceret accumsan in qui no viderer vivendum facilisi pro illud possim legimus at illum sonet numquam id vis ei accumsan nominati eos nam suas admodum ancillae ne nullam noster scribentur per cu te duis consetetur adipiscing pri term 3 lorem ipsum dolor sit amet quas appetere qui te vel ne enim putent tractatos ullum inani et duo per placerat ocurreret te eos diceret accumsan in qui no viderer vivendum facilisi pro illud possim legimus at illum sonet numquam id vis ei accumsan nominati eos nam suas admodum ancillae ne nullam noster scribentur per cu te duis consetetur adipiscing pri term 4 lorem ipsum dolor sit amet quas appetere qui te vel ne enim putent tractatos ullum inani et duo per placerat ocurreret te eos diceret accumsan in qui no viderer vivendum facilisi pro illud possim legimus at illum sonet numquam id vis ei accumsan nominati eos nam suas admodum ancillae ne nullam noster scribentur per cu te duis consetetur adipiscing pri term 4 lorem ipsum dolor sit amet quas appetere qui te vel ne enim putent tractatos ullum inani et duo per placerat ocurreret te eos diceret accumsan in qui no viderer vivendum facilisi pro illud possim legimus at illum sonet numquam id vis ei accumsan nominati eos nam suas admodum ancillae ne nullam noster scribentur per cu te duis consetetur adipiscing pri term 5 lorem ipsum dolor sit amet quas appetere qui te vel ne enim putent tractatos ullum inani et duo per placerat ocurreret te eos diceret accumsan in qui no viderer vivendum facilisi pro illud possim legimus at illum sonet numquam id vis ei accumsan nominati eos nam suas admodum ancillae ne nullam noster scribentur per cu te duis consetetur adipiscing pri term 5 lorem ipsum dolor sit amet quas appetere qui te vel ne enim putent tractatos ullum inani et duo per placerat ocurreret te eos diceret accumsan in qui no viderer vivendum facilisi pro illud possim legimus at illum sonet numquam id vis ei accumsan nominati eos nam suas admodum ancillae ne nullam noster scribentur per cu te duis consetetur adipiscing pri '),
	(61,'field',40,'de',' layout table ratio 50 50 '),
	(61,'slug',0,'de',''),
	(62,'field',41,'de',' ratio 50 50 '),
	(62,'field',42,'de',' layout table '),
	(62,'slug',0,'de',''),
	(65,'field',89,'de',''),
	(72,'field',79,'de',' style default '),
	(71,'slug',0,'de',''),
	(68,'field',78,'de',' 0 '),
	(68,'field',79,'de',' default '),
	(68,'field',80,'de',' default '),
	(68,'slug',0,'de',''),
	(71,'field',77,'de',' marginvertical medium style default '),
	(70,'field',78,'de',' 0 '),
	(70,'field',79,'de',' default '),
	(65,'field',43,'de',' align left width 100 '),
	(65,'slug',0,'de',''),
	(66,'field',44,'de',' 0 '),
	(66,'field',45,'de',' align left '),
	(66,'field',46,'de',' width 100 '),
	(66,'slug',0,'de',''),
	(70,'field',80,'de',' large '),
	(70,'slug',0,'de',''),
	(72,'field',80,'de',' marginvertical medium '),
	(72,'slug',0,'de',''),
	(73,'slug',0,'de',''),
	(74,'field',93,'de',' accordion '),
	(74,'slug',0,'de',''),
	(75,'field',95,'de',' lorem ipsum dolor sit amet quas appetere qui te vel ne enim putent tractatos ullum inani et duo per placerat ocurreret te eos diceret accumsan in qui no viderer vivendum facilisi pro illud possim legimus at illum sonet numquam id vis ei accumsan nominati eos nam suas admodum ancillae ne nullam noster scribentur per cu te duis consetetur adipiscing pri mollis deseruisse te mei cu euismod singulis suavitate eam ex eos purto similique an eum fabellas adolescens dolor signiferumque cum id dicunt cetero detracto mea ei ex dico dolor vis splendide vituperatoribus cu usu ei mea posse sonet labores ad duo veritus intellegam alterum appellantur vix et vis dissentiet repudiandae eu decore integre principes per ei id vim stet mentitum repudiandae pri mentitum qualisque ea ex usu augue viderer suscipit ea vel mucius graecis mentitum perfecto eu duo duo eu ipsum urbanitas eruditi recteque abhorreant ius et omnes dolore debitis vel ei an inani copiosae nec audiam sanctus nostrum est ea assum iuvaret mea id an populo iriure interesset sit eum quas zril nostrum ei est no esse illum falli doming vix no no pri causae petentium id vocibus volutpat deterruisset usu vocibus verterem sed ne usu ne similique temporibus ex vix dicat discere partiendo at ignota corpora mei posse percipitur mea ut at doming commodo deseruisse sit eu diceret fabulas eligendi vix sea nostrum scriptorem ad quo cu eius tollit instructior '),
	(75,'slug',0,'de',''),
	(76,'field',93,'de',' ein weiteres label '),
	(76,'slug',0,'de',''),
	(77,'field',95,'de',' lorem ipsum dolor sit amet quas appetere qui te vel ne enim putent tractatos ullum inani et duo per placerat ocurreret te eos diceret accumsan in qui no viderer vivendum facilisi pro illud possim legimus at illum sonet numquam id vis ei accumsan nominati eos nam suas admodum ancillae ne nullam noster scribentur per cu te duis consetetur adipiscing pri mollis deseruisse te mei cu euismod singulis suavitate eam ex eos purto similique an eum fabellas adolescens dolor signiferumque cum id dicunt cetero detracto mea ei ex dico dolor vis splendide vituperatoribus cu usu ei mea posse sonet labores ad duo veritus intellegam alterum appellantur vix et vis dissentiet repudiandae eu decore integre principes per ei id vim stet mentitum repudiandae pri mentitum qualisque ea ex usu augue viderer suscipit ea vel mucius graecis mentitum perfecto eu duo duo eu ipsum urbanitas eruditi recteque abhorreant ius et omnes dolore debitis vel ei an inani copiosae nec audiam sanctus nostrum est ea assum iuvaret mea id '),
	(77,'slug',0,'de',''),
	(78,'field',91,'de',' image 03 '),
	(78,'field',64,'de',' align left 0 landscape columns 100 '),
	(78,'slug',0,'de',''),
	(79,'field',65,'de',' 0 '),
	(79,'field',66,'de',' align left '),
	(79,'field',67,'de',' landscape '),
	(79,'field',68,'de',' columns 100 '),
	(79,'slug',0,'de',''),
	(80,'field',92,'de',' image 01 image 02 image 03 image 04 '),
	(80,'field',69,'de',' landscape '),
	(80,'slug',0,'de',''),
	(81,'field',70,'de',' landscape '),
	(81,'slug',0,'de',''),
	(82,'field',81,'de',' ratio 50 50 '),
	(82,'slug',0,'de',''),
	(83,'field',82,'de',' ratio 50 50 '),
	(83,'slug',0,'de',''),
	(84,'slug',0,'de',''),
	(85,'field',95,'de',' lorem ipsum dolor sit amet quas appetere qui te vel ne enim putent tractatos ullum inani et duo per placerat ocurreret te eos diceret accumsan in qui no viderer vivendum facilisi pro illud possim legimus at illum sonet numquam id vis ei accumsan nominati eos nam suas admodum ancillae ne nullam noster scribentur per cu te duis consetetur adipiscing pri mollis deseruisse te mei cu euismod singulis suavitate eam ex eos purto similique an eum fabellas adolescens dolor signiferumque cum id dicunt cetero detracto mea ei ex dico dolor vis splendide vituperatoribus cu usu ei mea posse sonet labores ad duo veritus intellegam alterum appellantur vix et vis dissentiet repudiandae eu decore integre principes per ei id vim stet mentitum repudiandae pri mentitum qualisque ea ex usu augue viderer suscipit ea vel mucius graecis mentitum perfecto eu duo duo eu ipsum urbanitas eruditi recteque abhorreant ius et omnes dolore debitis vel ei an inani copiosae nec audiam sanctus nostrum est ea assum iuvaret mea id an populo iriure interesset sit eum quas zril nostrum ei est no esse illum falli doming vix no no pri causae petentium id vocibus volutpat deterruisset usu vocibus verterem sed ne usu ne similique temporibus ex vix dicat discere partiendo at ignota corpora mei posse percipitur mea ut at doming commodo deseruisse sit eu diceret fabulas eligendi vix sea nostrum scriptorem ad quo cu eius tollit instructior '),
	(85,'slug',0,'de',''),
	(86,'slug',0,'de',''),
	(87,'field',95,'de',' an populo iriure interesset sit eum quas zril nostrum ei est no esse illum falli doming vix no no pri causae petentium id vocibus volutpat deterruisset usu vocibus verterem sed ne usu ne similique temporibus ex vix dicat discere partiendo at ignota corpora mei posse percipitur mea ut at doming commodo deseruisse sit eu diceret fabulas eligendi vix sea nostrum scriptorem ad quo cu eius tollit instructior '),
	(87,'slug',0,'de',''),
	(88,'field',91,'de',' image 01 '),
	(88,'field',64,'de',' align left 0 landscape columns 100 '),
	(88,'slug',0,'de',''),
	(89,'field',65,'de',' 0 '),
	(89,'field',66,'de',' align left '),
	(89,'field',67,'de',' landscape '),
	(89,'field',68,'de',' columns 100 '),
	(89,'slug',0,'de',''),
	(11,'field',101,'de',' 3d372f '),
	(12,'field',101,'de',' a7a7a7 '),
	(13,'field',101,'de',' 656565 '),
	(14,'field',101,'de',' c7c7c7 '),
	(5,'field',102,'de',''),
	(5,'field',104,'de',''),
	(5,'field',103,'de',''),
	(8,'field',107,'de',' size small '),
	(90,'field',84,'de',' entry 5 click here home '),
	(90,'field',32,'de',' align center size small style secondary '),
	(90,'slug',0,'de',''),
	(91,'field',33,'de',' style secondary '),
	(91,'field',34,'de',' align center '),
	(91,'field',107,'de',' size small '),
	(91,'slug',0,'de',''),
	(92,'field',84,'de',' entry 5 click here home '),
	(92,'field',32,'de',' align right size small style outline '),
	(92,'slug',0,'de',''),
	(93,'field',33,'de',' style outline '),
	(93,'field',34,'de',' align right '),
	(93,'field',107,'de',' size small '),
	(93,'slug',0,'de',''),
	(94,'field',84,'de',' entry 5 click here home '),
	(94,'field',32,'de',' align full size pill style link '),
	(94,'slug',0,'de',''),
	(95,'field',33,'de',' style link '),
	(95,'field',34,'de',' align full '),
	(95,'field',107,'de',' size pill '),
	(95,'slug',0,'de',''),
	(60,'field',108,'de',' size small '),
	(40,'field',109,'de',' textcolor white '),
	(113,'slug',0,'de',''),
	(112,'slug',0,'de',''),
	(113,'field',111,'de',' align center '),
	(113,'field',112,'de',' width 100 '),
	(112,'field',89,'de',''),
	(112,'field',110,'de',' align center width 100 '),
	(110,'field',91,'de',' image 04 '),
	(110,'field',64,'de',' align center 1 landscape columns 100 '),
	(110,'slug',0,'de',''),
	(111,'field',65,'de',' 1 '),
	(111,'field',66,'de',' align center '),
	(111,'field',67,'de',' landscape '),
	(111,'field',68,'de',' columns 100 '),
	(111,'slug',0,'de',''),
	(114,'field',113,'de',''),
	(114,'slug',0,'de',''),
	(115,'field',117,'de',''),
	(115,'slug',0,'de',''),
	(6,'field',118,'de',''),
	(116,'field',4,'de',''),
	(116,'slug',0,'de','');

/*!40000 ALTER TABLE `craft_searchindex` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_sections`;

CREATE TABLE `craft_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `hasUrls` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enableVersioning` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_sections_name_unq_idx` (`name`),
  UNIQUE KEY `craft_sections_handle_unq_idx` (`handle`),
  KEY `craft_sections_structureId_fk` (`structureId`),
  CONSTRAINT `craft_sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_sections` WRITE;
/*!40000 ALTER TABLE `craft_sections` DISABLE KEYS */;

INSERT INTO `craft_sections` (`id`, `structureId`, `name`, `handle`, `type`, `hasUrls`, `template`, `enableVersioning`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(3,NULL,'Homepage','homepage','single',1,'index',0,'2017-04-16 22:48:52','2017-04-16 22:48:52','18ce4035-f866-4843-8748-e27173a3a8f8'),
	(4,NULL,'Modules','modules','single',1,'modules',0,'2017-04-16 22:48:52','2017-04-16 22:48:52','0fe1fe7e-9e1d-432b-9401-fa46118d05f4'),
	(5,NULL,'News','news','channel',1,'channels/news/_entry',1,'2017-04-16 22:48:52','2017-04-16 22:56:28','222d6ea4-e3a8-4270-8dae-597e1c1f38d4'),
	(6,2,'Pages','pages','structure',1,'structures/pages/_entry',1,'2017-04-16 22:56:24','2017-04-16 22:56:24','ad6b7331-f1d3-44a9-b70f-24214262a47b');

/*!40000 ALTER TABLE `craft_sections` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_sections_i18n
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_sections_i18n`;

CREATE TABLE `craft_sections_i18n` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `enabledByDefault` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `urlFormat` text COLLATE utf8_unicode_ci,
  `nestedUrlFormat` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_sections_i18n_sectionId_locale_unq_idx` (`sectionId`,`locale`),
  KEY `craft_sections_i18n_locale_fk` (`locale`),
  CONSTRAINT `craft_sections_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_sections_i18n_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_sections_i18n` WRITE;
/*!40000 ALTER TABLE `craft_sections_i18n` DISABLE KEYS */;

INSERT INTO `craft_sections_i18n` (`id`, `sectionId`, `locale`, `enabledByDefault`, `urlFormat`, `nestedUrlFormat`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(3,3,'de',1,'__home__',NULL,'2017-04-16 22:48:52','2017-04-16 22:48:52','8ac9640e-87a2-45f7-b83b-049ba0bf403d'),
	(4,4,'de',1,'modules',NULL,'2017-04-16 22:48:52','2017-04-16 22:48:52','0405acd3-102d-46ef-b580-bd0a9d068f4d'),
	(5,5,'de',0,'n/{slug}',NULL,'2017-04-16 22:48:52','2017-04-16 22:53:42','746a5783-5275-4025-9255-047aeab14ceb'),
	(6,6,'de',0,'p/{slug}','{parent.uri}/{slug}','2017-04-16 22:56:24','2017-04-16 22:56:24','9ac9729b-5fda-42ca-9777-90aa49b58024');

/*!40000 ALTER TABLE `craft_sections_i18n` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_seomatic_meta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_seomatic_meta`;

CREATE TABLE `craft_seomatic_meta` (
  `id` int(11) NOT NULL,
  `seoImageId` int(11) DEFAULT NULL,
  `seoTwitterImageId` int(11) DEFAULT NULL,
  `seoFacebookImageId` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'de',
  `elementId` int(10) DEFAULT '0',
  `metaType` enum('default','template') COLLATE utf8_unicode_ci DEFAULT 'template',
  `metaPath` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `seoMainEntityCategory` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `seoMainEntityOfPage` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `seoTitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `seoDescription` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `seoKeywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `seoImageTransform` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `seoFacebookImageTransform` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `seoTwitterImageTransform` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `twitterCardType` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'summary',
  `openGraphType` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'website',
  `robots` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_seomatic_meta_seoImageId_fk` (`seoImageId`),
  KEY `craft_seomatic_meta_seoTwitterImageId_fk` (`seoTwitterImageId`),
  KEY `craft_seomatic_meta_seoFacebookImageId_fk` (`seoFacebookImageId`),
  CONSTRAINT `craft_seomatic_meta_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_seomatic_meta_seoFacebookImageId_fk` FOREIGN KEY (`seoFacebookImageId`) REFERENCES `craft_assetfiles` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_seomatic_meta_seoImageId_fk` FOREIGN KEY (`seoImageId`) REFERENCES `craft_assetfiles` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_seomatic_meta_seoTwitterImageId_fk` FOREIGN KEY (`seoTwitterImageId`) REFERENCES `craft_assetfiles` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_seomatic_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_seomatic_settings`;

CREATE TABLE `craft_seomatic_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteSeoImageId` int(11) DEFAULT NULL,
  `siteSeoTwitterImageId` int(11) DEFAULT NULL,
  `siteSeoFacebookImageId` int(11) DEFAULT NULL,
  `genericOwnerImageId` int(11) DEFAULT NULL,
  `genericCreatorImageId` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `siteSeoName` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `siteSeoTitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `siteSeoTitleSeparator` varchar(10) COLLATE utf8_unicode_ci DEFAULT '|',
  `siteSeoTitlePlacement` enum('before','after','none') COLLATE utf8_unicode_ci DEFAULT 'after',
  `siteSeoDescription` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `siteSeoKeywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `siteSeoImageTransform` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `siteSeoFacebookImageTransform` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `siteSeoTwitterImageTransform` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `siteTwitterCardType` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `siteOpenGraphType` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `siteRobots` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `siteRobotsTxt` text COLLATE utf8_unicode_ci,
  `siteLinksSearchTargets` text COLLATE utf8_unicode_ci,
  `siteLinksQueryInput` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `googleSiteVerification` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `bingSiteVerification` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `googleAnalyticsUID` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `googleTagManagerID` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `googleAnalyticsSendPageview` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `googleAnalyticsAdvertising` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `googleAnalyticsEcommerce` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `googleAnalyticsEEcommerce` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `googleAnalyticsLinkAttribution` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `googleAnalyticsLinker` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `googleAnalyticsAnonymizeIp` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteOwnerType` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `siteOwnerSubType` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `siteOwnerSpecificType` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerName` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerAlternateName` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerDescription` varchar(1024) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerTelephone` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerStreetAddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerAddressLocality` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerAddressRegion` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerPostalCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerAddressCountry` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerGeoLatitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericOwnerGeoLongitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationOwnerDuns` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationOwnerFounder` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationOwnerFoundingDate` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationOwnerFoundingLocation` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationOwnerContactPoints` text COLLATE utf8_unicode_ci,
  `localBusinessPriceRange` varchar(10) COLLATE utf8_unicode_ci DEFAULT '$$$',
  `localBusinessOwnerOpeningHours` text COLLATE utf8_unicode_ci,
  `corporationOwnerTickerSymbol` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `restaurantOwnerServesCuisine` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `restaurantOwnerMenuUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `restaurantOwnerReservationsUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `personOwnerGender` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `personOwnerBirthPlace` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `twitterHandle` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `facebookHandle` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `facebookProfileId` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `facebookAppId` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `linkedInHandle` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `googlePlusHandle` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `youtubeHandle` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `youtubeChannelHandle` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `instagramHandle` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `pinterestHandle` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `githubHandle` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `vimeoHandle` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `wikipediaUrl` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `siteCreatorType` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `siteCreatorSubType` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `siteCreatorSpecificType` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorName` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorAlternateName` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorDescription` varchar(1024) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorTelephone` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorStreetAddress` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorAddressLocality` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorAddressRegion` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorPostalCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorAddressCountry` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorGeoLatitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorGeoLongitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationCreatorDuns` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationCreatorFounder` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationCreatorFoundingDate` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationCreatorFoundingLocation` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `organizationCreatorContactPoints` text COLLATE utf8_unicode_ci,
  `localBusinessCreatorOpeningHours` text COLLATE utf8_unicode_ci,
  `corporationCreatorTickerSymbol` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `restaurantCreatorServesCuisine` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `restaurantCreatorMenuUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `restaurantCreatorReservationsUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `personCreatorGender` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `personCreatorBirthPlace` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `genericCreatorHumansTxt` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_seomatic_settings_siteSeoImageId_fk` (`siteSeoImageId`),
  KEY `craft_seomatic_settings_siteSeoTwitterImageId_fk` (`siteSeoTwitterImageId`),
  KEY `craft_seomatic_settings_siteSeoFacebookImageId_fk` (`siteSeoFacebookImageId`),
  KEY `craft_seomatic_settings_genericOwnerImageId_fk` (`genericOwnerImageId`),
  KEY `craft_seomatic_settings_genericCreatorImageId_fk` (`genericCreatorImageId`),
  CONSTRAINT `craft_seomatic_settings_genericCreatorImageId_fk` FOREIGN KEY (`genericCreatorImageId`) REFERENCES `craft_assetfiles` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_seomatic_settings_genericOwnerImageId_fk` FOREIGN KEY (`genericOwnerImageId`) REFERENCES `craft_assetfiles` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_seomatic_settings_siteSeoFacebookImageId_fk` FOREIGN KEY (`siteSeoFacebookImageId`) REFERENCES `craft_assetfiles` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_seomatic_settings_siteSeoImageId_fk` FOREIGN KEY (`siteSeoImageId`) REFERENCES `craft_assetfiles` (`id`) ON DELETE SET NULL,
  CONSTRAINT `craft_seomatic_settings_siteSeoTwitterImageId_fk` FOREIGN KEY (`siteSeoTwitterImageId`) REFERENCES `craft_assetfiles` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_seomatic_settings` WRITE;
/*!40000 ALTER TABLE `craft_seomatic_settings` DISABLE KEYS */;

INSERT INTO `craft_seomatic_settings` (`id`, `siteSeoImageId`, `siteSeoTwitterImageId`, `siteSeoFacebookImageId`, `genericOwnerImageId`, `genericCreatorImageId`, `locale`, `siteSeoName`, `siteSeoTitle`, `siteSeoTitleSeparator`, `siteSeoTitlePlacement`, `siteSeoDescription`, `siteSeoKeywords`, `siteSeoImageTransform`, `siteSeoFacebookImageTransform`, `siteSeoTwitterImageTransform`, `siteTwitterCardType`, `siteOpenGraphType`, `siteRobots`, `siteRobotsTxt`, `siteLinksSearchTargets`, `siteLinksQueryInput`, `googleSiteVerification`, `bingSiteVerification`, `googleAnalyticsUID`, `googleTagManagerID`, `googleAnalyticsSendPageview`, `googleAnalyticsAdvertising`, `googleAnalyticsEcommerce`, `googleAnalyticsEEcommerce`, `googleAnalyticsLinkAttribution`, `googleAnalyticsLinker`, `googleAnalyticsAnonymizeIp`, `siteOwnerType`, `siteOwnerSubType`, `siteOwnerSpecificType`, `genericOwnerName`, `genericOwnerAlternateName`, `genericOwnerDescription`, `genericOwnerUrl`, `genericOwnerTelephone`, `genericOwnerEmail`, `genericOwnerStreetAddress`, `genericOwnerAddressLocality`, `genericOwnerAddressRegion`, `genericOwnerPostalCode`, `genericOwnerAddressCountry`, `genericOwnerGeoLatitude`, `genericOwnerGeoLongitude`, `organizationOwnerDuns`, `organizationOwnerFounder`, `organizationOwnerFoundingDate`, `organizationOwnerFoundingLocation`, `organizationOwnerContactPoints`, `localBusinessPriceRange`, `localBusinessOwnerOpeningHours`, `corporationOwnerTickerSymbol`, `restaurantOwnerServesCuisine`, `restaurantOwnerMenuUrl`, `restaurantOwnerReservationsUrl`, `personOwnerGender`, `personOwnerBirthPlace`, `twitterHandle`, `facebookHandle`, `facebookProfileId`, `facebookAppId`, `linkedInHandle`, `googlePlusHandle`, `youtubeHandle`, `youtubeChannelHandle`, `instagramHandle`, `pinterestHandle`, `githubHandle`, `vimeoHandle`, `wikipediaUrl`, `siteCreatorType`, `siteCreatorSubType`, `siteCreatorSpecificType`, `genericCreatorName`, `genericCreatorAlternateName`, `genericCreatorDescription`, `genericCreatorUrl`, `genericCreatorTelephone`, `genericCreatorEmail`, `genericCreatorStreetAddress`, `genericCreatorAddressLocality`, `genericCreatorAddressRegion`, `genericCreatorPostalCode`, `genericCreatorAddressCountry`, `genericCreatorGeoLatitude`, `genericCreatorGeoLongitude`, `organizationCreatorDuns`, `organizationCreatorFounder`, `organizationCreatorFoundingDate`, `organizationCreatorFoundingLocation`, `organizationCreatorContactPoints`, `localBusinessCreatorOpeningHours`, `corporationCreatorTickerSymbol`, `restaurantCreatorServesCuisine`, `restaurantCreatorMenuUrl`, `restaurantCreatorReservationsUrl`, `personCreatorGender`, `personCreatorBirthPlace`, `genericCreatorHumansTxt`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,NULL,NULL,NULL,NULL,NULL,'de','CB Modules','This is the default global title of the site pages.','|','after','This is the default global natural language description of the content on the site pages.','default,global,comma-separated,keywords','','','','summary','website','','# robots.txt for {{ siteUrl }}\n\nSitemap: {{ siteUrl |trim(\'/\') }}/sitemap.xml\n\n# Don\'t allow web crawlers to index Craft\n\nUser-agent: *\nDisallow: /craft/\n','','','','','','',1,0,0,0,0,0,0,'Organization','Corporation','','CB Modules','','','http://cbmodules.dev/','','','','','','','','','','','','','','','$$$','','','','','','','','','','','','','','','','','','','','','Organization','Corporation','','','','','','','','','','','','','','','','','','','','','','','','','','','/* TEAM */\n\n{% if seomaticCreator.name is defined and seomaticCreator.name %}\nCreator: {{ seomaticCreator.name }}\n{% endif %}\n{% if seomaticCreator.url is defined and seomaticCreator.url %}\nURL: {{ seomaticCreator.url }}\n{% endif %}\n{% if seomaticCreator.description is defined and seomaticCreator.description %}\nDescription: {{ seomaticCreator.description }}\n{% endif %}\n\n/* THANKS */\n\nPixel & Tonic - https://pixelandtonic.com\n\n/* SITE */\n\nStandards: HTML5, CSS3\nComponents: Craft CMS, Yii, PHP, Javascript, SEOmatic','2017-04-16 23:05:29','2017-04-16 23:05:29','fce4ae7f-6daa-4b68-9d2f-b83927bf3974');

/*!40000 ALTER TABLE `craft_seomatic_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_sessions`;

CREATE TABLE `craft_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_sessions_uid_idx` (`uid`),
  KEY `craft_sessions_token_idx` (`token`),
  KEY `craft_sessions_dateUpdated_idx` (`dateUpdated`),
  KEY `craft_sessions_userId_fk` (`userId`),
  CONSTRAINT `craft_sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_sessions` WRITE;
/*!40000 ALTER TABLE `craft_sessions` DISABLE KEYS */;

INSERT INTO `craft_sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(2,1,'3be99f73365e1e42df8113004e408a2405de5011czozMjoiZ2RfZ0xYZXVrZENkNTBoNXJvOHNjZmFtMkltMExaS3kiOw==','2017-04-16 22:06:52','2017-04-17 15:04:03','19036233-290c-41cc-b605-c1fdf1a3761f'),
	(3,1,'7658c0e254ae030491cff7f33b86209c69cdd5c5czozMjoiY3VIZ1Z5cF9uY2xZelRvRnM0X3haY35YfnZXanVuUX4iOw==','2017-04-20 08:59:17','2017-04-20 08:59:17','df086c6e-caf9-423f-aefb-3cfc97d767e7'),
	(4,1,'2a72da73a8f0f02f4fa8dda82f0574e82bed65a8czozMjoifmZEYUtxbVNRNEthemlyU28yb2tSNmszNzJsQm9ybEQiOw==','2017-04-20 20:45:08','2017-04-20 20:45:08','1d08f149-54fa-45d7-948e-03aff0cb2505'),
	(5,1,'91dd50a4ae7c537c47104cac4ebfb5f2becd6cc9czozMjoiSkpPa1I3Y1o3ZWE4Y1IxVEhnN2VxX0xRSXZ4cVZnZVgiOw==','2017-06-08 08:14:24','2017-06-08 08:14:24','f8516d8d-4d2f-42aa-bbfc-acac967df969'),
	(6,1,'03f627c6ada59e0886ca73e17d3043a342d37745czozMjoicUUzY3hLNjQ4RHdhNW03MWI3d2hwdkZ4dV9MX350WkgiOw==','2017-06-08 16:44:27','2017-06-08 16:44:27','4454c7eb-8a65-4022-9217-f01eb08ba54d'),
	(7,1,'c06640432ae1ce0c8d1b4933b334ca72839e51d9czozMjoiMFlQTG1iWU1FTGhKcHlTOEN0M2xZbUJtazQ3TEtCQ0wiOw==','2017-06-27 19:55:23','2017-06-27 19:55:23','40258c59-6c2b-4183-983f-416bbc938ec3'),
	(8,1,'24a4b2571b4a4a8a62cd1628b4de948ebfb4c31cczozMjoiRkdFNnowYkl+b3QxZWRLODNJZDBoNmxySlV4aW1JMmYiOw==','2017-06-28 20:56:58','2017-06-28 20:56:58','4a878c1a-ce12-4c2b-8911-2d0360b7ef89'),
	(9,1,'04bee619031c6648ff6aae12ed0cacd447df1dc4czozMjoib1FYdnhocWdBY0RKWjRrOVJOWGs1Y1QyNGQ3STRudkIiOw==','2017-06-29 21:11:00','2017-06-29 21:11:00','d5594251-1323-4f49-8f77-5257eb4bcb20'),
	(10,1,'0842a74ba8e37e336da864e3fd3baeb462919d59czozMjoiQ2RoSEtya090ZERMNDNDX3FkaH5wdUpHWG1ZN1BRfjQiOw==','2017-07-02 16:19:32','2017-07-02 16:19:32','50d4125d-185a-4dc5-919c-44ca8a68fc00'),
	(11,1,'57792a44c1af739427680fa67df79b18ae0522a7czozMjoiTWtMZXlmYzN3dkJ0bkFlekNPYXBCTnd6WWFhMjJfVTQiOw==','2017-07-04 11:22:18','2017-07-04 11:22:18','73752054-d57d-4b24-b296-088319353142'),
	(12,1,'08759bc66775fe3e88bdd7f31ee2112671dd450dczozMjoiQ3BsTGROVjA0aXREV2pDQ25ERkFadkNYVDRBcWNfSkQiOw==','2017-07-08 19:57:57','2017-07-08 19:57:57','4da015c5-725c-4316-8af5-36e7f389061a'),
	(13,1,'705880e8daed19a57b1bd6e89dc30ab7ba5bc01bczozMjoiM3NDbk9qbl9ib2lSdVR1dlV3MUVKUXFJT2NWTW1QOWwiOw==','2017-07-09 08:41:17','2017-07-09 08:41:17','bac6e578-37d0-4259-8fbd-b72aef239355'),
	(14,1,'f6da516973941f17877c10d045165467155ffff3czozMjoiZFlYNkVYV1MxNUF3X0JiRlFLRTNYbWFaVjhzb1llQ2wiOw==','2017-07-09 20:24:04','2017-07-09 20:24:04','d4b27313-ac2b-41df-bf37-16de110ed210'),
	(15,1,'10d55d38fbe4d486d09c928c812789a6a9301893czozMjoiTG1sQlpEQmFJcFRvTG9nWWJyanpBbGVDeUV3SXoxNzAiOw==','2017-07-09 23:29:30','2017-07-09 23:29:30','eed9a8d4-4631-41b6-a6a2-2cbb0f6c558d'),
	(16,1,'c56de89440085730cc66ce8cb389a5d8fc7387dfczozMjoiQURKaGFReHpZNUdfWE5qdXN2d0lUNzBkYUZqc1hLWFMiOw==','2017-07-10 20:12:36','2017-07-10 20:12:36','4079742d-65b1-4918-a11f-f481eff70abc'),
	(17,1,'643a9c87678818ac82fb284da6b9c9f8dc313e4cczozMjoiUF9mcFlEV2swS2VrX1NOTzZkYjZwU3JUeHRMVzZvcmsiOw==','2017-07-11 05:06:02','2017-07-11 05:06:02','f0c67c98-ccc1-445c-8e1b-026805cf17ba'),
	(18,1,'1ab9af5f6317f25b9097819618624910b4a03466czozMjoiQkM5TXQ4N2RnZG5zQ01vYlZMWkk1dGN1UnJINGpaeVEiOw==','2017-07-13 22:07:37','2017-07-13 22:07:37','f5881f52-ecad-4817-8e3b-95f8e914d29f'),
	(19,1,'81382a11eaeceb6dccfb97514f860db6f03d0546czozMjoiSUtTeDd4bXhTV1FFdDhPTW9HVDVBMX4zWXFTfmVBcnYiOw==','2017-07-17 09:26:30','2017-07-17 09:26:30','37e5e98f-50f2-4333-a2d5-d438b4ac7778'),
	(20,1,'91016cd4d16d240a64879458377717acdf3898c8czozMjoiTVlQb2VsbDhjY1ZrVXhRVnQwYmNlejhFVHB0ZEZyYWEiOw==','2017-07-17 11:48:48','2017-07-17 11:48:48','0e82f500-2f78-481f-aac3-3d0e5baf2c3c'),
	(21,1,'3becad57b122feaf6f116a2a72cb4da7e4963a0dczozMjoiS2M2TjlhT2ZZb3JnOHl0R3hUV2Y5b2lnaF9NNjNTMkUiOw==','2017-07-18 13:39:04','2017-07-18 13:39:04','43da224f-c330-4684-8a98-7cfcf8aa59bd'),
	(22,1,'996e93a57c19606d2118db22fe9676d474f65acbczozMjoid3BsMjk5dmpPTDVKMndQaUdST1pGfmN6TzByZFduRGsiOw==','2017-07-19 08:31:59','2017-07-19 08:31:59','a79554a5-8ecb-48f0-8306-711a5cc6fe5c'),
	(23,1,'6e532e7b8cbab6a5ab7b24f86d7dc530d209b790czozMjoiSnZnMTFmejlMY35tRERsc2o2YW5DTXpVMUl+R1VQd2EiOw==','2017-08-29 21:02:49','2017-08-29 21:02:49','337fb151-eee1-4792-8406-b9aa3765fcc1'),
	(24,1,'c0fd86a033a481dda57298beb6afd4e9c84ed86eczozMjoieG5qcG5jc3JJZnlQX3FGWH5WT2l1TF9Rb2VvdTRGclkiOw==','2017-09-03 17:01:12','2017-09-03 17:01:12','bf526696-ca3f-4f10-b5d8-2043f8f7029e'),
	(25,1,'b97f97c7a4e07f793ed9161303929703d12b6c35czozMjoiQUZOcGhFRk1JYm5xWGJiamY4NFF4Sjk0clAwS2xHb2EiOw==','2017-09-03 22:17:49','2017-09-03 22:17:49','ffdbea25-d3c9-48a1-b2f7-8fa177a17d39'),
	(26,1,'27f87fa5092f53d00938bfc2521f567c5826dc37czozMjoiNFM2bmY3Zl9YaUpqV284eXR1UlZsaVpQY1NzQUtkdW0iOw==','2017-09-04 13:49:04','2017-09-04 13:49:04','19d79f07-18c7-4f7d-813a-d4be3043ce72');

/*!40000 ALTER TABLE `craft_sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_shunnedmessages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_shunnedmessages`;

CREATE TABLE `craft_shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_shunnedmessages_userId_message_unq_idx` (`userId`,`message`),
  CONSTRAINT `craft_shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_structureelements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_structureelements`;

CREATE TABLE `craft_structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  KEY `craft_structureelements_root_idx` (`root`),
  KEY `craft_structureelements_lft_idx` (`lft`),
  KEY `craft_structureelements_rgt_idx` (`rgt`),
  KEY `craft_structureelements_level_idx` (`level`),
  KEY `craft_structureelements_elementId_fk` (`elementId`),
  CONSTRAINT `craft_structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_structureelements` WRITE;
/*!40000 ALTER TABLE `craft_structureelements` DISABLE KEYS */;

INSERT INTO `craft_structureelements` (`id`, `structureId`, `elementId`, `root`, `lft`, `rgt`, `level`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(6199,205,NULL,6199,1,82,0,'2017-07-19 09:58:51','2017-07-19 09:58:51','7abb0eb7-6031-4243-a3a7-868ffb8b41fc'),
	(6200,205,9,6199,2,3,1,'2017-07-19 09:58:51','2017-07-19 09:58:51','07b8bcdc-a4f0-48ba-a372-1016442a702b'),
	(6201,205,20,6199,4,5,1,'2017-07-19 09:58:51','2017-07-19 09:58:51','592f1584-e22d-486e-86c7-ee7eba8fa2b3'),
	(6202,205,22,6199,6,7,1,'2017-07-19 09:58:51','2017-07-19 09:58:51','1e0cc3c9-912a-4bfc-acd6-2341ae93300b'),
	(6203,205,7,6199,8,9,1,'2017-07-19 09:58:51','2017-07-19 09:58:51','bf70aa91-962b-4368-9936-8ac19c2ad83c'),
	(6204,205,90,6199,10,11,1,'2017-07-19 09:58:51','2017-07-19 09:58:51','34564d01-052e-4134-8b9d-ba2f2528d8de'),
	(6205,205,92,6199,12,13,1,'2017-07-19 09:58:51','2017-07-19 09:58:51','dd47465f-2c70-4651-887a-44bc5d5dfa6a'),
	(6206,205,94,6199,14,15,1,'2017-07-19 09:58:51','2017-07-19 09:58:51','e89cac58-3cc8-47ff-a8a9-8fa705e3d9e1'),
	(6207,205,15,6199,16,17,1,'2017-07-19 09:58:51','2017-07-19 09:58:51','65c98ff3-2df6-4e07-9854-188e659833dc'),
	(6208,205,28,6199,18,27,1,'2017-07-19 09:58:51','2017-07-19 09:58:51','8bf71035-fcab-48f9-b4f3-098ff09db7ad'),
	(6209,205,29,6199,19,22,2,'2017-07-19 09:58:51','2017-07-19 09:58:51','c2caadc6-4a1c-4dd4-823e-24eb6dc98c7d'),
	(6210,205,30,6199,20,21,3,'2017-07-19 09:58:51','2017-07-19 09:58:51','e2713c89-ce79-45b9-ad19-844ba3ca4c2e'),
	(6211,205,31,6199,23,26,2,'2017-07-19 09:58:51','2017-07-19 09:58:51','1bae5e87-7eb0-4e8e-afd1-41cd0c3103bd'),
	(6212,205,32,6199,24,25,3,'2017-07-19 09:58:51','2017-07-19 09:58:51','96da23a7-42b5-443c-8b7f-bb1866b55d9b'),
	(6213,205,34,6199,28,29,1,'2017-07-19 09:58:51','2017-07-19 09:58:51','261b0a20-1ee1-4d72-ae1c-5fe05be1054b'),
	(6214,205,35,6199,30,31,1,'2017-07-19 09:58:51','2017-07-19 09:58:51','724a7262-3c89-4e8f-a24e-1bacb45b6298'),
	(6215,205,37,6199,32,33,1,'2017-07-19 09:58:51','2017-07-19 09:58:51','c74ff20d-a9b0-4a1a-8057-83c3ce098965'),
	(6216,205,39,6199,34,35,1,'2017-07-19 09:58:51','2017-07-19 09:58:51','c1bdd5f3-86dc-45a4-8f4d-80a21a789f7e'),
	(6217,205,110,6199,36,37,1,'2017-07-19 09:58:51','2017-07-19 09:58:51','51402342-8776-4e10-be74-cdcdbec0345a'),
	(6218,205,49,6199,38,39,1,'2017-07-19 09:58:51','2017-07-19 09:58:51','407a07f7-5d52-41bc-abd7-81f0989a4fe7'),
	(6219,205,51,6199,40,41,1,'2017-07-19 09:58:51','2017-07-19 09:58:51','b130676a-7002-4b62-af8c-41bc09e33122'),
	(6220,205,52,6199,42,43,1,'2017-07-19 09:58:51','2017-07-19 09:58:51','0e87f30a-06ad-4a1c-ad37-9c0888c20d39'),
	(6221,205,54,6199,44,45,1,'2017-07-19 09:58:51','2017-07-19 09:58:51','0af7e4fe-9980-4929-bdf0-f8430a0a52aa'),
	(6222,205,80,6199,46,47,1,'2017-07-19 09:58:51','2017-07-19 09:58:51','7113a5c0-af97-40ed-aa79-caea35467ff5'),
	(6223,205,56,6199,48,49,1,'2017-07-19 09:58:52','2017-07-19 09:58:52','ff6fc2e7-b608-410e-9782-3974dfceb430'),
	(6224,205,61,6199,50,51,1,'2017-07-19 09:58:52','2017-07-19 09:58:52','05355dfe-5773-467b-9628-7ac75be3d041'),
	(6225,205,65,6199,52,53,1,'2017-07-19 09:58:52','2017-07-19 09:58:52','8b9688b4-871f-418b-9e62-8988cf7e6ae5'),
	(6226,205,71,6199,54,55,1,'2017-07-19 09:58:52','2017-07-19 09:58:52','b7d1c99f-7d30-459c-88b1-0bf2572d8dd0'),
	(6227,205,112,6199,56,57,1,'2017-07-19 09:58:52','2017-07-19 09:58:52','be83e12b-858b-4ed6-86c5-46fad556f043'),
	(6228,205,73,6199,58,69,1,'2017-07-19 09:58:52','2017-07-19 09:58:52','e4c3d06a-04a5-4c95-b83d-0f7b4ebc0768'),
	(6229,205,74,6199,59,62,2,'2017-07-19 09:58:52','2017-07-19 09:58:52','9a8ca1eb-b6da-47d2-9482-58625a085a1b'),
	(6230,205,75,6199,60,61,3,'2017-07-19 09:58:52','2017-07-19 09:58:52','30b9d329-811c-4570-b1a3-c8fd0fd23abf'),
	(6231,205,76,6199,63,68,2,'2017-07-19 09:58:52','2017-07-19 09:58:52','b5461a84-99f2-41f2-908d-5e017b6b43d7'),
	(6232,205,77,6199,64,65,3,'2017-07-19 09:58:52','2017-07-19 09:58:52','cb1bd95c-feba-42a4-b114-3a5c23e19ab3'),
	(6233,205,78,6199,66,67,3,'2017-07-19 09:58:52','2017-07-19 09:58:52','f4227019-e0cb-4ac2-93e0-65c02bce533c'),
	(6234,205,82,6199,70,81,1,'2017-07-19 09:58:52','2017-07-19 09:58:52','1f5dcae4-b95a-43fe-b801-e912ccf4fd13'),
	(6235,205,84,6199,71,74,2,'2017-07-19 09:58:52','2017-07-19 09:58:52','131007bf-b570-4559-a1ec-648da79a4fd9'),
	(6236,205,85,6199,72,73,3,'2017-07-19 09:58:52','2017-07-19 09:58:52','33de5f51-dceb-4496-a041-732fd0f75bef'),
	(6237,205,86,6199,75,80,2,'2017-07-19 09:58:52','2017-07-19 09:58:52','1d6a7ea6-f1d5-4f81-ba6a-b1d34339f01c'),
	(6238,205,87,6199,76,77,3,'2017-07-19 09:58:52','2017-07-19 09:58:52','420ced62-e1b9-4a62-b3a0-74f4ec4b556c'),
	(6239,205,88,6199,78,79,3,'2017-07-19 09:58:52','2017-07-19 09:58:52','f4ddfb5c-2b25-4cd3-8293-0965defa4341');

/*!40000 ALTER TABLE `craft_structureelements` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_structures
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_structures`;

CREATE TABLE `craft_structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_structures` WRITE;
/*!40000 ALTER TABLE `craft_structures` DISABLE KEYS */;

INSERT INTO `craft_structures` (`id`, `maxLevels`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,NULL,'2017-04-16 22:50:30','2017-04-16 22:50:30','1a4b9299-b069-4a7b-8c00-29504646e00f'),
	(2,NULL,'2017-04-16 22:56:24','2017-04-16 22:56:24','b851dd62-a4ec-48ae-af65-c381d767cd41'),
	(205,NULL,'2017-07-19 09:58:51','2017-07-19 09:58:51','bb1765d1-e882-42c9-8511-23b011d2720c');

/*!40000 ALTER TABLE `craft_structures` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertableblocks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertableblocks`;

CREATE TABLE `craft_supertableblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `ownerLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_supertableblocks_ownerId_idx` (`ownerId`),
  KEY `craft_supertableblocks_fieldId_idx` (`fieldId`),
  KEY `craft_supertableblocks_typeId_idx` (`typeId`),
  KEY `craft_supertableblocks_sortOrder_idx` (`sortOrder`),
  KEY `craft_supertableblocks_ownerLocale_fk` (`ownerLocale`),
  CONSTRAINT `craft_supertableblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertableblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertableblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertableblocks_ownerLocale_fk` FOREIGN KEY (`ownerLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `craft_supertableblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_supertableblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertableblocks` WRITE;
/*!40000 ALTER TABLE `craft_supertableblocks` DISABLE KEYS */;

INSERT INTO `craft_supertableblocks` (`id`, `ownerId`, `fieldId`, `typeId`, `sortOrder`, `ownerLocale`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(8,7,32,4,1,NULL,'2017-04-17 02:19:23','2017-07-19 09:58:51','027674bc-cd19-480f-976b-3762e477311e'),
	(10,9,73,14,1,NULL,'2017-04-17 18:45:37','2017-07-19 09:58:51','716e0bae-0fe7-44a8-abae-40833cf09e14'),
	(16,15,60,11,1,NULL,'2017-04-17 18:46:20','2017-07-19 09:58:51','b6ae3c4c-3e18-40b8-9d4e-028694eafb8e'),
	(17,11,26,3,1,NULL,'2017-04-19 20:53:27','2017-04-20 20:46:13','9ff02bf2-4085-4b8f-8c1b-9adbe2121c68'),
	(18,12,26,3,1,NULL,'2017-04-19 20:53:40','2017-04-20 20:46:27','64ddbaa9-4c4f-44ed-a50f-7e28cc608534'),
	(19,13,26,3,1,NULL,'2017-04-19 20:54:05','2017-04-20 20:46:41','a194e57d-e587-4684-8d23-ebfce60eca14'),
	(21,20,48,8,1,NULL,'2017-04-19 21:20:00','2017-07-19 09:58:51','f2090d3f-3f2d-40af-b0b6-5d29fa392fea'),
	(27,14,26,3,1,NULL,'2017-04-19 21:54:58','2017-04-20 20:46:51','130a4be6-ae58-426d-92c3-ad2dbe6839b5'),
	(33,32,64,12,1,NULL,'2017-04-19 23:18:28','2017-07-19 09:58:51','9b3fe3fc-4661-43cc-9f2e-3a209cb25194'),
	(36,35,64,12,1,NULL,'2017-04-20 00:07:18','2017-07-19 09:58:51','ff3ba4bb-a419-414f-98da-2e859b33a8c7'),
	(38,37,73,14,1,NULL,'2017-04-20 00:11:24','2017-07-19 09:58:51','e567e63f-aa4c-40a7-a0d9-435ef0cafab2'),
	(40,39,52,9,1,NULL,'2017-04-20 00:11:24','2017-07-19 09:58:51','dafcd97e-d2bf-459b-b94a-3ba3c3d7cc63'),
	(50,49,73,14,1,NULL,'2017-04-20 09:21:50','2017-07-19 09:58:51','d715e41e-890f-4c6a-8b0b-9e308acf449b'),
	(53,52,56,10,1,NULL,'2017-04-20 09:25:22','2017-07-19 09:58:51','3e3ea3aa-a0c0-40ff-9c95-418114f64b26'),
	(55,54,69,13,1,NULL,'2017-04-20 11:41:09','2017-07-19 09:58:51','055a010b-8c6b-4d53-a3da-a14496cb56ee'),
	(57,56,85,17,1,NULL,'2017-04-20 12:31:26','2017-07-19 09:58:51','8769045f-b540-44f0-b4df-61ee386c79dd'),
	(58,56,85,17,2,NULL,'2017-04-20 12:31:26','2017-07-19 09:58:52','ed3bd47e-4df8-4e8f-a082-a3c73e950007'),
	(59,56,85,17,3,NULL,'2017-04-20 12:31:26','2017-07-19 09:58:52','d7c8e26c-53c5-421c-809d-3c8bfb479739'),
	(60,56,37,5,1,NULL,'2017-04-20 12:31:26','2017-07-19 09:58:52','4ef791f5-8b31-447b-834a-5e223c2ed487'),
	(62,61,40,6,1,NULL,'2017-04-20 12:52:30','2017-07-19 09:58:52','d9d28d75-db9f-446c-ac84-59b8c5865bdb'),
	(66,65,43,7,1,NULL,'2017-04-20 13:35:13','2017-07-19 09:58:52','a505e3dc-b417-47a8-b170-8f20a29b78fe'),
	(72,71,77,15,1,NULL,'2017-04-20 13:52:06','2017-07-19 09:58:52','c3a933cf-8bab-41d0-b01f-eddca5c776d6'),
	(79,78,64,12,1,NULL,'2017-04-20 14:09:24','2017-07-19 09:58:52','3c61dc3c-714a-4d50-8ce9-0b0fbb7d9b85'),
	(81,80,69,13,1,NULL,'2017-04-20 14:46:34','2017-07-19 09:58:51','64bbe9a3-4dd2-45e9-99c2-024f509cb9f6'),
	(83,82,81,16,1,NULL,'2017-04-20 15:34:51','2017-07-19 09:58:52','d6160337-8554-49e8-ad77-3c2d47836577'),
	(89,88,64,12,1,NULL,'2017-04-20 15:34:51','2017-07-19 09:58:52','4a88d0bd-5c64-4f31-805e-2dfcfceadb67'),
	(91,90,32,4,1,NULL,'2017-06-26 21:11:47','2017-07-19 09:58:51','a2f2d60b-d346-487e-b3e9-cf6681583474'),
	(93,92,32,4,1,NULL,'2017-06-26 21:11:47','2017-07-19 09:58:51','3e47c314-92c9-4a46-a4be-25dad4c4de7b'),
	(95,94,32,4,1,NULL,'2017-06-26 21:11:47','2017-07-19 09:58:51','f350ca81-3e75-4afe-a7ad-2873b9cafe34'),
	(111,110,64,12,1,NULL,'2017-07-19 09:26:57','2017-07-19 09:58:51','349e87ee-4237-4839-b3ce-d580454cb4df'),
	(113,112,110,18,1,NULL,'2017-07-19 09:52:11','2017-07-19 09:58:52','ff24d478-5b4e-4f1b-b871-c7c9a3b5b9d1');

/*!40000 ALTER TABLE `craft_supertableblocks` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertableblocktypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertableblocktypes`;

CREATE TABLE `craft_supertableblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_supertableblocktypes_fieldId_fk` (`fieldId`),
  KEY `craft_supertableblocktypes_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_supertableblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertableblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertableblocktypes` WRITE;
/*!40000 ALTER TABLE `craft_supertableblocktypes` DISABLE KEYS */;

INSERT INTO `craft_supertableblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,4,13,'2017-04-16 22:48:52','2017-04-16 22:48:52','60bdee99-32b1-4e4b-850a-6708d326c322'),
	(3,26,15,'2017-04-16 22:48:53','2017-04-16 22:48:54','98ceb5ec-625b-4040-b42a-64ca1806af25'),
	(4,32,176,'2017-04-16 22:48:54','2017-07-09 21:01:02','3dd66ead-99ef-432f-84f7-d0e15ef8b4a6'),
	(5,37,174,'2017-04-16 22:48:55','2017-07-09 20:59:19','6709c019-9bb8-4c24-a0f5-2ae0f5390eee'),
	(6,40,179,'2017-04-16 22:48:55','2017-07-10 20:17:31','cd2d37bf-dcf2-41b4-b0af-63c411272c09'),
	(7,43,280,'2017-04-16 22:48:56','2017-07-17 21:09:19','6ea0042c-9175-409d-8e9e-5653aac81b3d'),
	(8,48,142,'2017-04-16 22:48:56','2017-04-19 22:01:54','d24e51f5-0e6e-452d-b8cd-08f1de33fb44'),
	(9,52,185,'2017-04-16 22:48:57','2017-07-11 05:23:58','1af0637f-91eb-490a-b106-970749c29d88'),
	(10,56,226,'2017-04-16 22:48:57','2017-07-13 23:56:49','c2c345f5-b507-4b2f-b880-0d00c2d2528c'),
	(11,60,232,'2017-04-16 22:48:58','2017-07-14 01:54:34','29078bf3-96e3-48fb-af00-9bb3fe011899'),
	(12,64,274,'2017-04-16 22:48:58','2017-07-16 21:40:21','9ff59a2c-435b-49f6-b637-88b187d27e61'),
	(13,69,279,'2017-04-16 22:48:59','2017-07-16 23:07:37','e5bb65e6-af3c-4894-86b3-0a3255563865'),
	(14,73,177,'2017-04-16 22:49:00','2017-07-09 21:01:25','c2262ae1-52ac-47b8-a956-55ba97b2d301'),
	(15,77,275,'2017-04-16 22:49:00','2017-07-16 22:29:02','4e35ee79-fc78-4e89-b876-0f4ead3020ce'),
	(16,81,277,'2017-04-16 22:49:01','2017-07-16 22:47:29','3c7280e4-a978-4ff4-9bb4-d538384284ed'),
	(17,85,29,'2017-04-16 22:49:01','2017-04-16 22:49:01','90a4cf47-bc1f-453a-b62b-5b2bd78817df'),
	(18,110,281,'2017-07-17 21:09:59','2017-07-17 21:09:59','6160979f-f7f9-4a0c-a8ca-9b3993574d5d'),
	(19,113,345,'2017-09-03 17:01:51','2017-09-03 17:01:51','fd52ce8f-d9ed-4be7-8f50-fadb9bea6508'),
	(20,118,350,'2017-09-03 22:18:05','2017-09-03 23:13:41','fcb67307-0395-4283-8ef8-0de4220673e5');

/*!40000 ALTER TABLE `craft_supertableblocktypes` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_globalcontact
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_globalcontact`;

CREATE TABLE `craft_supertablecontent_globalcontact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_company` text COLLATE utf8_unicode_ci,
  `field_street` text COLLATE utf8_unicode_ci,
  `field_postalCode` text COLLATE utf8_unicode_ci,
  `field_location` text COLLATE utf8_unicode_ci,
  `field_mail` text COLLATE utf8_unicode_ci,
  `field_phone` text COLLATE utf8_unicode_ci,
  `field_mobilePhone` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_globalcontact_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_globalcontact_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_globalcontact_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_globalcontact_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_globalsocialnetworks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_globalsocialnetworks`;

CREATE TABLE `craft_supertablecontent_globalsocialnetworks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_profilName` text COLLATE utf8_unicode_ci,
  `field_profilUrl` text COLLATE utf8_unicode_ci,
  `field_networkName` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_globalsocialnetwor_elementI_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_globalsocialnetworks_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_globalsocialnetworks_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_globalsocialnetworks_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_globalthirdpartysnippets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_globalthirdpartysnippets`;

CREATE TABLE `craft_supertablecontent_globalthirdpartysnippets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_snippetName` text COLLATE utf8_unicode_ci,
  `field_snippetStatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_snippetCode` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craf_supertableconte_globalthirdpartysnipp_elementI_local_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_globalthirdpartysnippets_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_globalthirdpartysnippets_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_globalthirdpartysnippets_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_groupedcaption
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_groupedcaption`;

CREATE TABLE `craft_supertablecontent_groupedcaption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_captionTitle` text COLLATE utf8_unicode_ci,
  `field_caption` text COLLATE utf8_unicode_ci,
  `field_source` text COLLATE utf8_unicode_ci,
  `field_sourceUrl` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_groupedcaption_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_groupedcaption_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_groupedcaption_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_groupedcaption_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_groupedcaption` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_groupedcaption` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_groupedcaption` (`id`, `elementId`, `locale`, `field_captionTitle`, `field_caption`, `field_source`, `field_sourceUrl`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,17,'de','Caption Title','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.','Max Mustermann','{\"type\":\"custom\",\"custom\":\"http:\\/\\/google.com\"}','2017-04-19 20:53:27','2017-04-20 20:46:13','4e5d332c-6e74-4bf6-aa89-1f18562c719b'),
	(2,18,'de','Caption Title','','','','2017-04-19 20:53:40','2017-04-20 20:46:27','a28bc77b-c920-4bcd-8905-0a83fcec52b5'),
	(3,19,'de','','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis lectus metus, at posuere neque. Sed pharetra nibh eget orci convallis at posuere leo convallis. Sed blandit augue vitae augue scelerisque bibendum. Vivamus sit amet libero turpis, non venenatis urna. In blandit, odio convallis suscipit venenatis, ante ipsum cursus augue.','','','2017-04-19 20:54:05','2017-04-20 20:46:41','ec7fcc8c-829b-4d5f-961f-ce70b99efb43'),
	(4,27,'de','Caption','Ex vix dicat discere partiendo, at ignota corpora mei, posse percipitur mea ut. At doming commodo deseruisse sit, eu diceret fabulas eligendi vix, sea nostrum scriptorem ad! Quo cu eius tollit instructior. ','','','2017-04-19 21:54:58','2017-04-20 20:46:51','63c8e5e7-15e0-4ac8-b004-d4cdbb32255c');

/*!40000 ALTER TABLE `craft_supertablecontent_groupedcaption` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_settingsbutton
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingsbutton`;

CREATE TABLE `craft_supertablecontent_settingsbutton` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'style-primary',
  `field_alignment` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'align-left',
  `field_size` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'size-large',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_settingsbutton_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingsbutton_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingsbutton_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingsbutton_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_settingsbutton` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_settingsbutton` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_settingsbutton` (`id`, `elementId`, `locale`, `field_style`, `field_alignment`, `field_size`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,8,'de','style-primary','align-left','size-small','2017-04-17 02:19:23','2017-07-19 09:58:51','61d1ea0e-aa22-47d1-8f33-df17a9bd1677'),
	(2,91,'de','style-secondary','align-center','size-small','2017-06-26 21:11:47','2017-07-19 09:58:51','c565257a-0d99-47aa-8382-dca27d1c7d35'),
	(3,93,'de','style-outline','align-right','size-small','2017-06-26 21:11:47','2017-07-19 09:58:51','1c4bd2cd-3990-467a-aaba-ac33737484ba'),
	(4,95,'de','style-link','align-full','size-pill','2017-06-26 21:11:47','2017-07-19 09:58:51','2172ccd0-8b11-400a-9799-97387e7dae4d');

/*!40000 ALTER TABLE `craft_supertablecontent_settingsbutton` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_settingsbuttongroup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingsbuttongroup`;

CREATE TABLE `craft_supertablecontent_settingsbuttongroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'style-primary',
  `field_alignment` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'align-left',
  `field_size` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'size-large',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_settingsbuttongrou_elementI_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingsbuttongroup_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingsbuttongroup_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingsbuttongroup_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_settingsbuttongroup` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_settingsbuttongroup` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_settingsbuttongroup` (`id`, `elementId`, `locale`, `field_style`, `field_alignment`, `field_size`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,60,'de','style-primary','align-left','size-small','2017-04-20 12:31:26','2017-07-19 09:58:52','1dcafaec-bf78-4b8e-ba82-3c2a722a4517');

/*!40000 ALTER TABLE `craft_supertablecontent_settingsbuttongroup` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_settingsdefinitionlist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingsdefinitionlist`;

CREATE TABLE `craft_supertablecontent_settingsdefinitionlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_ratio` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'ratio-50-50',
  `field_layout` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'layout-table',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craf_supertableconte_settingsdefinitionli_elementI_local_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingsdefinitionlist_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingsdefinitionlist_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingsdefinitionlist_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_settingsdefinitionlist` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_settingsdefinitionlist` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_settingsdefinitionlist` (`id`, `elementId`, `locale`, `field_ratio`, `field_layout`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,62,'de','ratio-50-50','layout-table','2017-04-20 12:52:30','2017-07-19 09:58:52','06c92c5b-7ef2-4e57-a65a-bb8f2c6b2d41');

/*!40000 ALTER TABLE `craft_supertablecontent_settingsdefinitionlist` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_settingsembed
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingsembed`;

CREATE TABLE `craft_supertablecontent_settingsembed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_position` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'align-left',
  `field_width` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'width-100',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_settingsembed_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingsembed_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingsembed_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingsembed_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_settingsembed` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_settingsembed` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_settingsembed` (`id`, `elementId`, `locale`, `field_position`, `field_width`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(2,66,'de','align-left','width-100','2017-04-20 13:35:13','2017-07-19 09:58:52','dd97d782-315a-40eb-a6b8-ba0aa5dfde38');

/*!40000 ALTER TABLE `craft_supertablecontent_settingsembed` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_settingsheadline
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingsheadline`;

CREATE TABLE `craft_supertablecontent_settingsheadline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_size` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'h2',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_settingsheadline_elementId_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingsheadline_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingsheadline_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingsheadline_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_settingsheadline` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_settingsheadline` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_settingsheadline` (`id`, `elementId`, `locale`, `field_size`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,21,'de','h2','2017-04-19 21:20:00','2017-07-19 09:58:51','d13adbf8-351a-4238-930b-8a390af01aa2');

/*!40000 ALTER TABLE `craft_supertablecontent_settingsheadline` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_settingsimagecover
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingsimagecover`;

CREATE TABLE `craft_supertablecontent_settingsimagecover` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_backgroundPosition` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'focalpoint',
  `field_textVerticalPosition` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'textV-bottom',
  `field_textAlignment` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'textH-center',
  `field_textColor` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'textColor-white',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_settingsimagecove_elementId_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingsimagecover_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingsimagecover_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingsimagecover_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_settingsimagecover` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_settingsimagecover` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_settingsimagecover` (`id`, `elementId`, `locale`, `field_backgroundPosition`, `field_textVerticalPosition`, `field_textAlignment`, `field_textColor`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,40,'de','focalpoint','textV-top','textH-left','textColor-white','2017-04-20 00:11:24','2017-07-19 09:58:51','1cd9941c-f762-45d0-b58b-afa93b0e048e');

/*!40000 ALTER TABLE `craft_supertablecontent_settingsimagecover` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_settingsimagegallery
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingsimagegallery`;

CREATE TABLE `craft_supertablecontent_settingsimagegallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_columns` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'columns-6',
  `field_thumbsRatio` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'square',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_settingsimagegalle_elementI_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingsimagegallery_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingsimagegallery_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingsimagegallery_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_settingsimagegallery` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_settingsimagegallery` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_settingsimagegallery` (`id`, `elementId`, `locale`, `field_columns`, `field_thumbsRatio`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,53,'de','columns-6','landscape','2017-04-20 09:25:22','2017-07-19 09:58:51','a7a8d121-8288-4439-9df9-a4e7918f645d');

/*!40000 ALTER TABLE `craft_supertablecontent_settingsimagegallery` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_settingsimagegrid
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingsimagegrid`;

CREATE TABLE `craft_supertablecontent_settingsimagegrid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_caption` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_columns` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'columns-2',
  `field_ratio` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'square',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_settingsimagegri_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingsimagegrid_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingsimagegrid_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingsimagegrid_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_settingsimagegrid` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_settingsimagegrid` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_settingsimagegrid` (`id`, `elementId`, `locale`, `field_caption`, `field_columns`, `field_ratio`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,16,'de',1,'columns-3','landscape','2017-04-17 18:46:20','2017-07-19 09:58:51','1e2b9bed-ba37-407b-b290-a2a159eff857');

/*!40000 ALTER TABLE `craft_supertablecontent_settingsimagegrid` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_settingsimagesingle
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingsimagesingle`;

CREATE TABLE `craft_supertablecontent_settingsimagesingle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_caption` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_alignment` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'align-center',
  `field_ratio` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'landscape',
  `field_width` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'columns-12',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_settingsimagesingl_elementI_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingsimagesingle_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingsimagesingle_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingsimagesingle_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_settingsimagesingle` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_settingsimagesingle` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_settingsimagesingle` (`id`, `elementId`, `locale`, `field_caption`, `field_alignment`, `field_ratio`, `field_width`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,33,'de',1,'align-left','portrait','columns-100','2017-04-19 23:18:28','2017-07-19 09:58:51','d9010369-5b70-4460-88e7-7264caf4963b'),
	(2,36,'de',1,'align-left','landscape','columns-100','2017-04-20 00:07:18','2017-07-19 09:58:51','240585a9-42ee-4c65-8ceb-2ae46506819e'),
	(3,79,'de',0,'align-left','landscape','columns-100','2017-04-20 14:09:24','2017-07-19 09:58:52','33e01805-6dfb-49f1-aa66-4b44a00022b6'),
	(4,89,'de',0,'align-left','landscape','columns-100','2017-04-20 15:34:51','2017-07-19 09:58:52','03bd1a0e-50a4-451a-a499-2c0249509ba3'),
	(6,111,'de',1,'align-center','landscape','columns-100','2017-07-19 09:26:57','2017-07-19 09:58:51','85189004-b3b0-45c7-a352-3af8c335c5c7');

/*!40000 ALTER TABLE `craft_supertablecontent_settingsimagesingle` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_settingsimageslider
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingsimageslider`;

CREATE TABLE `craft_supertablecontent_settingsimageslider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_ratio` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'landscape',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_settingsimageslide_elementI_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingsimageslider_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingsimageslider_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingsimageslider_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_settingsimageslider` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_settingsimageslider` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_settingsimageslider` (`id`, `elementId`, `locale`, `field_ratio`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,55,'de','square','2017-04-20 11:41:09','2017-07-19 09:58:51','d8bfc65b-a5ac-4d31-a7e7-b4ae444b27f5'),
	(2,81,'de','landscape','2017-04-20 14:46:34','2017-07-19 09:58:51','c9d00b35-3a14-4f92-9112-7bf677c1bf86');

/*!40000 ALTER TABLE `craft_supertablecontent_settingsimageslider` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_settingssection
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingssection`;

CREATE TABLE `craft_supertablecontent_settingssection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_backgroundColor` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'backgroundColor-none',
  `field_width` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'width-content',
  `field_paddingVertical` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'paddingVertical-small',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_settingssection_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingssection_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingssection_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingssection_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_settingssection` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_settingssection` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_settingssection` (`id`, `elementId`, `locale`, `field_backgroundColor`, `field_width`, `field_paddingVertical`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,10,'de','backgroundColor-none','width-content','paddingVertical-small','2017-04-17 18:45:37','2017-07-19 09:58:51','9d1f7977-87a2-4b47-8c17-cb7bd432e41b'),
	(2,38,'de','backgroundColor-none','width-full','paddingVertical-small','2017-04-20 00:11:24','2017-07-19 09:58:51','571929b1-41e0-41e4-baee-464a86fb67dc'),
	(3,50,'de','backgroundColor-none','width-content','paddingVertical-small','2017-04-20 09:21:50','2017-07-19 09:58:51','2daa06a5-1848-4ea5-bc2d-e67b159e3431');

/*!40000 ALTER TABLE `craft_supertablecontent_settingssection` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_settingsseparator
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingsseparator`;

CREATE TABLE `craft_supertablecontent_settingsseparator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'style-default',
  `field_marginVertical` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'marginVertical-small',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_settingsseparato_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingsseparator_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingsseparator_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingsseparator_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_settingsseparator` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_settingsseparator` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_settingsseparator` (`id`, `elementId`, `locale`, `field_style`, `field_marginVertical`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,68,'de','default','default','2017-04-20 13:44:03','2017-04-20 13:51:14','cb85d910-b474-4357-93de-72dad15da8f3'),
	(2,70,'de','default','large','2017-04-20 13:48:14','2017-04-20 13:51:15','b73ff22e-98eb-4a08-942b-8fcb7b979b61'),
	(3,72,'de','style-default','marginVertical-medium','2017-04-20 13:52:06','2017-07-19 09:58:52','801b1bba-a43a-4c33-82de-a539dea96f25');

/*!40000 ALTER TABLE `craft_supertablecontent_settingsseparator` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_settingstwocolumns
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingstwocolumns`;

CREATE TABLE `craft_supertablecontent_settingstwocolumns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_ratio` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'ratio-50-50',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_settingstwocolumn_elementId_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingstwocolumns_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingstwocolumns_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingstwocolumns_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_settingstwocolumns` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_settingstwocolumns` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_settingstwocolumns` (`id`, `elementId`, `locale`, `field_ratio`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,83,'de','ratio-50-50','2017-04-20 15:34:51','2017-07-19 09:58:52','0a36ddf6-3579-427c-8782-cf6a23975381');

/*!40000 ALTER TABLE `craft_supertablecontent_settingstwocolumns` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_settingsvideo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingsvideo`;

CREATE TABLE `craft_supertablecontent_settingsvideo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_position` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'align-left',
  `field_width` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'width-100',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_settingsvideo_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingsvideo_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingsvideo_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingsvideo_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_settingsvideo` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_settingsvideo` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_settingsvideo` (`id`, `elementId`, `locale`, `field_position`, `field_width`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,113,'de','align-center','width-100','2017-07-19 09:52:11','2017-07-19 09:58:52','0199a777-1c45-4779-982a-5d32aa1b0067');

/*!40000 ALTER TABLE `craft_supertablecontent_settingsvideo` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_supertablecontent_singlebuttongroup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_singlebuttongroup`;

CREATE TABLE `craft_supertablecontent_singlebuttongroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_button` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_singlebuttongrou_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_singlebuttongroup_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_singlebuttongroup_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_singlebuttongroup_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_singlebuttongroup` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_singlebuttongroup` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_singlebuttongroup` (`id`, `elementId`, `locale`, `field_button`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,57,'de','{\"type\":\"entry\",\"email\":\"\",\"tel\":\"\",\"custom\":\"\",\"entry\":[\"4\"],\"asset\":\"\",\"category\":\"\",\"customText\":\"Home\",\"target\":\"\"}','2017-04-20 12:31:26','2017-07-19 09:58:51','b498187d-4824-4123-9181-035aa2bd5733'),
	(2,58,'de','{\"type\":\"entry\",\"email\":\"\",\"tel\":\"\",\"custom\":\"\",\"entry\":[\"5\"],\"asset\":\"\",\"category\":\"\",\"customText\":\"Modules\",\"target\":\"\"}','2017-04-20 12:31:26','2017-07-19 09:58:52','969d7111-d597-4baa-b13c-1d0635055591'),
	(3,59,'de','{\"type\":\"entry\",\"email\":\"\",\"tel\":\"\",\"custom\":\"\",\"entry\":[\"4\"],\"asset\":\"\",\"category\":\"\",\"customText\":\"Click me\",\"target\":\"\"}','2017-04-20 12:31:26','2017-07-19 09:58:52','95c2238a-27d2-42ad-8e7c-cdf3036d49e5');

/*!40000 ALTER TABLE `craft_supertablecontent_singlebuttongroup` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_systemsettings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_systemsettings`;

CREATE TABLE `craft_systemsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_systemsettings_category_unq_idx` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_systemsettings` WRITE;
/*!40000 ALTER TABLE `craft_systemsettings` DISABLE KEYS */;

INSERT INTO `craft_systemsettings` (`id`, `category`, `settings`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'email','{\"protocol\":\"php\",\"emailAddress\":\"davidhellmann.com@gmail.com\",\"senderName\":\"CB Modules\"}','2017-04-16 21:53:45','2017-04-16 21:53:45','e533a2a9-277f-4f3f-8efa-0a8260e46c45');

/*!40000 ALTER TABLE `craft_systemsettings` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_taggroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_taggroups`;

CREATE TABLE `craft_taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_taggroups_name_unq_idx` (`name`),
  UNIQUE KEY `craft_taggroups_handle_unq_idx` (`handle`),
  KEY `craft_taggroups_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `craft_taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_tags`;

CREATE TABLE `craft_tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_tags_groupId_fk` (`groupId`),
  CONSTRAINT `craft_tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_tags_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_tasks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_tasks`;

CREATE TABLE `craft_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `currentStep` int(11) unsigned DEFAULT NULL,
  `totalSteps` int(11) unsigned DEFAULT NULL,
  `status` enum('pending','error','running') COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` mediumtext COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_tasks_root_idx` (`root`),
  KEY `craft_tasks_lft_idx` (`lft`),
  KEY `craft_tasks_rgt_idx` (`rgt`),
  KEY `craft_tasks_level_idx` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_templatecachecriteria
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_templatecachecriteria`;

CREATE TABLE `craft_templatecachecriteria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `criteria` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_templatecachecriteria_cacheId_fk` (`cacheId`),
  KEY `craft_templatecachecriteria_type_idx` (`type`),
  CONSTRAINT `craft_templatecachecriteria_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_templatecacheelements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_templatecacheelements`;

CREATE TABLE `craft_templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  KEY `craft_templatecacheelements_cacheId_fk` (`cacheId`),
  KEY `craft_templatecacheelements_elementId_fk` (`elementId`),
  CONSTRAINT `craft_templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_templatecaches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_templatecaches`;

CREATE TABLE `craft_templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `craft_templatecaches_expiryDate_cacheKey_locale_path_idx` (`expiryDate`,`cacheKey`,`locale`,`path`),
  KEY `craft_templatecaches_locale_fk` (`locale`),
  CONSTRAINT `craft_templatecaches_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_tokens`;

CREATE TABLE `craft_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_tokens_token_unq_idx` (`token`),
  KEY `craft_tokens_expiryDate_idx` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_usergroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_usergroups`;

CREATE TABLE `craft_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_usergroups_name_unq_idx` (`name`),
  UNIQUE KEY `craft_usergroups_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_usergroups_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_usergroups_users`;

CREATE TABLE `craft_usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  KEY `craft_usergroups_users_userId_fk` (`userId`),
  CONSTRAINT `craft_usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_userpermissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_userpermissions`;

CREATE TABLE `craft_userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_userpermissions_usergroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_userpermissions_usergroups`;

CREATE TABLE `craft_userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  KEY `craft_userpermissions_usergroups_groupId_fk` (`groupId`),
  CONSTRAINT `craft_userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_userpermissions_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_userpermissions_users`;

CREATE TABLE `craft_userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  KEY `craft_userpermissions_users_userId_fk` (`userId`),
  CONSTRAINT `craft_userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_users`;

CREATE TABLE `craft_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preferredLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weekStartDay` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `client` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `suspended` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pending` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `archived` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIPAddress` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(4) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `verificationCode` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_users_username_unq_idx` (`username`),
  UNIQUE KEY `craft_users_email_unq_idx` (`email`),
  KEY `craft_users_verificationCode_idx` (`verificationCode`),
  KEY `craft_users_uid_idx` (`uid`),
  KEY `craft_users_preferredLocale_fk` (`preferredLocale`),
  CONSTRAINT `craft_users_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_users_preferredLocale_fk` FOREIGN KEY (`preferredLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_users` WRITE;
/*!40000 ALTER TABLE `craft_users` DISABLE KEYS */;

INSERT INTO `craft_users` (`id`, `username`, `photo`, `firstName`, `lastName`, `email`, `password`, `preferredLocale`, `weekStartDay`, `admin`, `client`, `locked`, `suspended`, `pending`, `archived`, `lastLoginDate`, `lastLoginAttemptIPAddress`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'superuser',NULL,'','','mail@domain.com','$2y$13$XiQ7RMMV2PbU.93SnT4rv.AFs4ahr0H3kEH1D6iMq86GjfyoOUA86',NULL,1,1,0,0,0,0,0,'2017-09-04 13:49:04','::1',NULL,NULL,'2017-07-08 19:57:50',NULL,NULL,NULL,NULL,0,'2017-04-16 21:53:42','2017-04-16 21:53:42','2017-09-04 13:49:04','df730679-fa87-4b60-991e-9e821fddf5f8');

/*!40000 ALTER TABLE `craft_users` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_widgets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_widgets`;

CREATE TABLE `craft_widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(4) unsigned DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craft_widgets_userId_fk` (`userId`),
  CONSTRAINT `craft_widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_widgets` WRITE;
/*!40000 ALTER TABLE `craft_widgets` DISABLE KEYS */;

INSERT INTO `craft_widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'RecentEntries',1,NULL,NULL,1,'2017-04-16 21:53:48','2017-04-16 21:53:48','a0486e93-9906-4a43-8a41-87655110a763'),
	(2,1,'GetHelp',2,NULL,NULL,1,'2017-04-16 21:53:48','2017-04-16 21:53:48','47393184-ed49-4cac-b467-072bb668e2e5'),
	(3,1,'Updates',3,NULL,NULL,1,'2017-04-16 21:53:48','2017-04-16 21:53:48','698a2a43-9adc-46de-b45d-49f310a68567'),
	(4,1,'Feed',4,NULL,'{\"url\":\"https:\\/\\/craftcms.com\\/news.rss\",\"title\":\"Craft News\"}',1,'2017-04-16 21:53:48','2017-04-16 21:53:48','a8e4e8ba-f896-402a-a164-65f1774b6793');

/*!40000 ALTER TABLE `craft_widgets` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
