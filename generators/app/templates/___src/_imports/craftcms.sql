# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.6.35)
# Datenbank: db12345678_baukasten
# Erstellt am: 2017-12-05 14:32:24 +0000
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
	(1,'Site Images','siteImages','Local','{\"path\":\"{uploadPath}images\\/\",\"publicURLs\":\"1\",\"url\":\"{uploadUrl}images\\/\"}',1,617,'2017-04-16 22:48:52','2017-11-17 15:05:46','ff0b5648-f1d6-418e-ba27-5075ee7ed5ca'),
	(2,'Site Downloads','siteDownloads','Local','{\"path\":\"{uploadPath}downloads\\/\",\"publicURLs\":\"1\",\"url\":\"{uploadUrl}downloads\\/\"}',2,618,'2017-04-16 22:48:52','2017-11-17 15:05:54','8f7efc74-2340-4272-aeda-5ed035ef86ed'),
	(3,'Site Graphics','siteGraphics','Local','{\"path\":\"{uploadPath}graphics\\/\",\"publicURLs\":\"1\",\"url\":\"{uploadUrl}graphics\\/\"}',3,619,'2017-04-16 22:48:52','2017-11-17 15:05:59','e8bc61b2-50c2-490c-9613-acb241ba431f'),
	(4,'Site Users','siteUsers','Local','{\"path\":\"{uploadPath}users\\/\",\"publicURLs\":\"1\",\"url\":\"{uploadUrl}users\\/\"}',4,620,'2017-04-16 22:48:52','2017-11-17 15:06:04','c2ff7f4c-55dc-4a42-93d4-59505cda75f0');

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
	(1,11,'image_01.jpg',NULL,'_300xAUTO_crop_center-center',1,1,1,'2017-11-22 23:39:18','2017-11-22 23:39:18','2017-11-22 23:39:18','f2f1b329-cf01-4299-98df-cc4bb1902953');

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
	(1,'Social Sharing','socialSharing','crop','center-center',630,1200,NULL,100,'2017-06-08 17:00:05','2017-06-08 17:00:05','2017-06-08 17:00:05','882d9ee5-f123-4c50-84b5-43e17f3e8c6f'),
	(2,'Social Sharing Twitter','socialSharingTwitter','crop','center-center',600,1120,NULL,NULL,'2017-10-08 17:20:35','2017-10-08 17:20:35','2017-10-08 17:20:35','d2c6dd76-f91d-4d22-b188-e5beaaf60099');

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

LOCK TABLES `craft_categories` WRITE;
/*!40000 ALTER TABLE `craft_categories` DISABLE KEYS */;

INSERT INTO `craft_categories` (`id`, `groupId`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(122,1,'2017-09-24 14:07:04','2017-09-24 14:07:04','f6ac7a6a-679c-42a8-ac24-f35fdbb59823');

/*!40000 ALTER TABLE `craft_categories` ENABLE KEYS */;
UNLOCK TABLES;


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
	(1,1,616,'Topics','topics',1,'_taxonomy','2017-04-16 22:50:30','2017-11-16 01:40:24','188f3c4d-2d6c-46be-9c65-903ac3db6c76');

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
	(1,1,'de','topic/{slug}',NULL,'2017-04-16 22:50:30','2017-11-11 16:48:08','099a53d9-25b6-48e6-8d42-cc29c06ffa2a');

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
  `field_pluginSeomaticHome` text COLLATE utf8_unicode_ci,
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
  `field_pluginSeomaticArticles` text COLLATE utf8_unicode_ci,
  `field_pluginSeomaticPages` text COLLATE utf8_unicode_ci,
  `field_globalGoogleAnalytics` text COLLATE utf8_unicode_ci,
  `field_singleLink` text COLLATE utf8_unicode_ci,
  `field_imageCaption` text COLLATE utf8_unicode_ci,
  `field_imageCaptionHeadline` text COLLATE utf8_unicode_ci,
  `field_imageSource` text COLLATE utf8_unicode_ci,
  `field_imageSourceUrl` text COLLATE utf8_unicode_ci,
  `field_settingsDominantColorOverwrite` text COLLATE utf8_unicode_ci,
  `field_singlePlainText` text COLLATE utf8_unicode_ci,
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

INSERT INTO `craft_content` (`id`, `elementId`, `locale`, `title`, `field_pluginSeomaticHome`, `field_settingsFocalPoint`, `field_singleAnchor`, `field_singleButton`, `field_singleCode`, `field_singleDefinitionList`, `field_singleEmbedCode`, `field_singleHeadline`, `field_singleLabel`, `field_singleQuote`, `field_singleRichText`, `field_singleSource`, `field_singleSourceUrl`, `field_singleSubline`, `field_singleText`, `field_pluginPreparseDominantColor`, `field_singleSeoTitle`, `field_singleIntroText`, `field_pluginSeomaticArticles`, `field_pluginSeomaticPages`, `field_globalGoogleAnalytics`, `field_singleLink`, `field_imageCaption`, `field_imageCaptionHeadline`, `field_imageSource`, `field_imageSourceUrl`, `field_settingsDominantColorOverwrite`, `field_singlePlainText`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-16 21:53:42','2017-09-03 17:05:28','d0823a0f-a07f-4750-aae2-c64b5131b2c5'),
	(4,4,'de','Homepage',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-16 22:48:52','2017-04-16 22:48:52','33215c87-bbc0-45fa-8e1c-adb0601eaa92'),
	(5,5,'de','Modules Content Builder',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-16 22:48:52','2017-12-02 22:10:55','1b8d64a7-32b4-4dd0-9b86-eee90214b9af'),
	(6,6,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-16 22:49:03','2017-09-03 22:18:26','59c70a0e-77ae-46fb-8f2a-00ff9bf4dd8f'),
	(9,11,'de','Image 01',NULL,'52.43% 34.78%',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'#3d372f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-17 18:46:13','2017-06-08 17:04:47','58b7be95-b740-43dc-9da0-403ccb510ded'),
	(10,12,'de','Image 02',NULL,'26.76% 45.37%',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'#a7a7a7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-17 18:46:14','2017-06-08 17:05:09','4b04ecc5-c7a8-4917-9955-0249ad6c39c0'),
	(11,13,'de','Image 03',NULL,'60.43% 52.08%',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'#656565',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-17 18:46:15','2017-06-08 17:05:26','1f2ec258-2381-4ab3-a2e0-95862b64e8dc'),
	(12,14,'de','Image 04',NULL,'55.43% 31.07%',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'#c7c7c7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-17 18:46:16','2017-06-08 17:05:44','64eabe10-07c0-41b0-bfe8-5639673636c0'),
	(73,114,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-03 17:01:51','2017-09-24 22:09:52','6f1695ea-94f2-41e3-bde3-94afe6da500a'),
	(74,115,'de',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-03 17:04:46','2017-09-24 22:15:50','a6b5f670-97c7-4dde-ac9d-95c6fdc1607a'),
	(75,116,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-04 13:52:53','2017-09-04 13:52:53','14275065-6515-4fdc-8cdc-a9007ec7fcdd'),
	(76,117,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-19 22:48:00','2017-09-19 22:48:00','b254503d-07ae-45f3-8a97-d0effb020fa0'),
	(78,119,'de','Articles',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,'{\"id\":null,\"enabled\":1,\"archived\":0,\"locale\":\"de\",\"localeEnabled\":1,\"slug\":null,\"uri\":null,\"dateCreated\":null,\"dateUpdated\":null,\"root\":null,\"lft\":null,\"rgt\":null,\"level\":null,\"searchScore\":null,\"elementId\":0,\"metaType\":\"template\",\"metaPath\":\"\",\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"WebPage\",\"seoTitle\":\"Articles\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImageTransform\":\"socialSharing\",\"seoFacebookImageTransform\":\"socialSharing\",\"seoTwitterImageTransform\":\"socialSharing\",\"twitterCardType\":\"summary_large_image\",\"openGraphType\":\"\",\"robots\":\"\",\"seoImageId\":\"\",\"seoTwitterImageId\":\"\",\"seoFacebookImageId\":\"\",\"canonicalUrlOverride\":\"\",\"seoTitleUnparsed\":\"News\",\"seoDescriptionUnparsed\":\"\",\"seoKeywordsUnparsed\":\"\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"singleIntroText\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"singleImageEntry\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"singleImageEntry\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"singleImageEntry\",\"seoCommerceVariants\":null,\"__model__\":\"Craft\\\\Seomatic_MetaFieldModel\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-24 13:57:35','2017-11-16 01:13:48','f8a7cec8-1605-4c15-b8be-3438a2f6286d'),
	(79,120,'de','Welcome to Baukasten',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','An populo iriure interesset sit! Eum quas zril nostrum ei. Est no esse illum, falli doming vix no? No pri causae petentium! Id vocibus volutpat deterruisset usu, vocibus verterem sed ne, usu ne similique temporibus! Ex vix dicat discere partiendo, at ignota corpora mei, posse percipitur mea ut. At doming commodo deseruisse sit, eu diceret fabulas eligendi vix, sea nostrum scriptorem ad! Quo cu eius tollit instructior.','{\"id\":null,\"enabled\":1,\"archived\":0,\"locale\":\"de\",\"localeEnabled\":1,\"slug\":null,\"uri\":null,\"dateCreated\":null,\"dateUpdated\":null,\"root\":null,\"lft\":null,\"rgt\":null,\"level\":null,\"searchScore\":null,\"elementId\":0,\"metaType\":\"template\",\"metaPath\":\"\",\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"WebPage\",\"seoTitle\":\"Welcome to Baukasten\",\"seoDescription\":\"An populo iriure interesset sit! Eum quas zril nostrum ei. Est no esse illum, falli doming vix no? No pri causae petentium! Id vocibus volutpat deterruisset\\u2026\",\"seoKeywords\":\"\",\"seoImageTransform\":\"socialSharing\",\"seoFacebookImageTransform\":\"socialSharing\",\"seoTwitterImageTransform\":\"socialSharing\",\"twitterCardType\":\"summary_large_image\",\"openGraphType\":\"\",\"robots\":\"\",\"seoImageId\":\"11\",\"seoTwitterImageId\":\"11\",\"seoFacebookImageId\":\"11\",\"canonicalUrlOverride\":\"\",\"seoTitleUnparsed\":\"Welcome\",\"seoDescriptionUnparsed\":\"An populo iriure interesset sit! Eum quas zril nostrum ei. Est no esse illum, falli doming vix no? No pri causae petentium! Id vocibus volutpat deterruisset\\u2026\",\"seoKeywordsUnparsed\":\"\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"singleIntroText\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"singleImageEntry\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"singleImageEntry\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"singleImageEntry\",\"seoCommerceVariants\":null,\"__model__\":\"Craft\\\\Seomatic_MetaFieldModel\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-24 14:03:04','2017-11-16 01:13:07','4346a6d7-dd8d-4a20-b18d-bd231e3daaae'),
	(80,121,'de','Example News Entry',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','Lorem ipsum dolor sit amet, quas appetere qui te, vel ne enim putent tractatos, ullum inani et duo. Per placerat ocurreret te, eos diceret accumsan in? Qui no viderer vivendum facilisi, pro illud possim legimus at. Illum sonet numquam id vis. Ei accumsan nominati eos? Nam suas admodum ancillae ne? Nullam noster scribentur per cu, te duis consetetur adipiscing pri? Mollis deseruisse te mei. Cu euismod singulis suavitate eam. Ex eos purto similique, an eum fabellas adolescens! Dolor signiferumque cum id. Dicunt cetero detracto mea ei?','{\"id\":null,\"enabled\":1,\"archived\":0,\"locale\":\"de\",\"localeEnabled\":1,\"slug\":null,\"uri\":null,\"dateCreated\":null,\"dateUpdated\":null,\"root\":null,\"lft\":null,\"rgt\":null,\"level\":null,\"searchScore\":null,\"elementId\":0,\"metaType\":\"template\",\"metaPath\":\"\",\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"WebPage\",\"seoTitle\":\"Example News Entry\",\"seoDescription\":\"Lorem ipsum dolor sit amet, quas appetere qui te, vel ne enim putent tractatos, ullum inani et duo. Per placerat ocurreret te, eos diceret accumsan in? Qui no\\u2026\",\"seoKeywords\":\"\",\"seoImageTransform\":\"socialSharing\",\"seoFacebookImageTransform\":\"socialSharing\",\"seoTwitterImageTransform\":\"socialSharing\",\"twitterCardType\":\"summary_large_image\",\"openGraphType\":\"\",\"robots\":\"\",\"seoImageId\":\"12\",\"seoTwitterImageId\":\"12\",\"seoFacebookImageId\":\"12\",\"canonicalUrlOverride\":\"\",\"seoTitleUnparsed\":\"Example News Entry\",\"seoDescriptionUnparsed\":\"Lorem ipsum dolor sit amet, quas appetere qui te, vel ne enim putent tractatos, ullum inani et duo. Per placerat ocurreret te, eos diceret accumsan in? Qui no\\u2026\",\"seoKeywordsUnparsed\":\"\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"singleIntroText\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"singleImageEntry\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"singleImageEntry\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"singleImageEntry\",\"seoCommerceVariants\":null,\"__model__\":\"Craft\\\\Seomatic_MetaFieldModel\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-24 14:04:22','2017-11-16 01:13:07','ae693cfd-b3eb-47a2-8ce4-9a1b6e6bcf29'),
	(81,122,'de','Example',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-24 14:07:04','2017-09-24 14:07:04','b4eca969-2149-4aa0-840b-b7d98eece5d0'),
	(82,123,'de','Another News Example',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','Ex dico dolor vis, splendide vituperatoribus cu usu, ei mea posse sonet labores! Ad duo veritus intellegam, alterum appellantur vix et. Vis dissentiet repudiandae eu, decore integre principes per ei. Id vim stet mentitum repudiandae, pri mentitum qualisque ea, ex usu augue viderer suscipit. Ea vel mucius graecis, mentitum perfecto eu duo, duo eu ipsum urbanitas. Eruditi recteque abhorreant ius et, omnes dolore debitis vel ei? An inani copiosae nec, audiam sanctus nostrum est ea? Assum iuvaret mea id.','{\"id\":null,\"enabled\":1,\"archived\":0,\"locale\":\"de\",\"localeEnabled\":1,\"slug\":null,\"uri\":null,\"dateCreated\":null,\"dateUpdated\":null,\"root\":null,\"lft\":null,\"rgt\":null,\"level\":null,\"searchScore\":null,\"elementId\":0,\"metaType\":\"template\",\"metaPath\":\"\",\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"WebPage\",\"seoTitle\":\"Another News Example\",\"seoDescription\":\"Ex dico dolor vis, splendide vituperatoribus cu usu, ei mea posse sonet labores! Ad duo veritus intellegam, alterum appellantur vix et. Vis dissentiet\\u2026\",\"seoKeywords\":\"\",\"seoImageTransform\":\"socialSharing\",\"seoFacebookImageTransform\":\"socialSharing\",\"seoTwitterImageTransform\":\"socialSharing\",\"twitterCardType\":\"summary_large_image\",\"openGraphType\":\"\",\"robots\":\"\",\"seoImageId\":\"13\",\"seoTwitterImageId\":\"13\",\"seoFacebookImageId\":\"13\",\"canonicalUrlOverride\":\"\",\"seoTitleUnparsed\":\"Another News Example\",\"seoDescriptionUnparsed\":\"Ex dico dolor vis, splendide vituperatoribus cu usu, ei mea posse sonet labores! Ad duo veritus intellegam, alterum appellantur vix et. Vis dissentiet\\u2026\",\"seoKeywordsUnparsed\":\"\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"singleIntroText\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"singleImageEntry\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"singleImageEntry\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"singleImageEntry\",\"seoCommerceVariants\":null,\"__model__\":\"Craft\\\\Seomatic_MetaFieldModel\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-24 14:09:32','2017-11-16 01:13:07','73d57c0f-8691-4673-b40f-3e1fda4aea9b'),
	(83,124,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-01 23:35:02','2017-12-02 21:51:59','6a3ad223-34a2-4b73-8a8c-047f97595503'),
	(84,126,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'H2: The quick brown fox jumps over the lazy dog',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-01 23:35:02','2017-12-02 21:51:59','c6aba85b-4673-425e-990b-8fc6389791de'),
	(85,128,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'H3: The quick brown fox jumps over the lazy dog',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-01 23:52:57','2017-12-02 21:51:59','28063759-1d55-4fc3-a2d9-97d1c593a076'),
	(86,130,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'H4: The quick brown fox jumps over the lazy dog',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-01 23:52:57','2017-12-02 21:51:59','4ec39e6e-c7ef-485d-a468-dbefca8c3d03'),
	(87,132,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'H5: The quick brown fox jumps over the lazy dog',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-01 23:52:57','2017-12-02 21:51:59','6856ca13-6c16-4851-b055-446d43287fad'),
	(88,134,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'H6: The quick brown fox jumps over the lazy dog',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-01 23:52:58','2017-12-02 21:51:59','6b155927-60e4-4cf6-be25-bb4d62ed32b9'),
	(89,136,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-01 23:54:50','2017-12-02 21:51:59','dacc6911-d69b-4e0d-8a1b-12814ea33964'),
	(90,138,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, quas appetere qui te, vel ne enim putent tractatos, ullum inani et duo. Per placerat ocurreret te, eos diceret accumsan in? Qui no viderer vivendum facilisi, pro illud possim legimus at. Illum sonet numquam id vis. Ei accumsan nominati eos? Nam suas admodum ancillae ne? Nullam noster scribentur per cu, te duis consetetur adipiscing pri? Mollis deseruisse te mei. Cu euismod singulis suavitate eam. Ex eos purto similique, an eum fabellas adolescens! Dolor signiferumque cum id. Dicunt cetero detracto mea ei? Ex dico dolor vis, splendide vituperatoribus cu usu, ei mea posse sonet labores! Ad duo veritus intellegam, alterum appellantur vix et. Vis dissentiet repudiandae eu, decore integre principes per ei. Id vim stet mentitum repudiandae, pri mentitum qualisque ea, ex usu augue viderer suscipit. Ea vel mucius graecis, mentitum perfecto eu duo, duo eu ipsum urbanitas. Eruditi recteque abhorreant ius et, omnes dolore debitis vel ei? An inani copiosae nec, audiam sanctus nostrum est ea? Assum iuvaret mea id.</p>\n<p><strong>An populo iriure interesset sit! Eum quas zril nostrum ei. Est no esse illum, falli doming vix no? No pri causae petentium! Id vocibus volutpat deterruisset usu, vocibus verterem sed ne, usu ne similique temporibus! Ex vix dicat discere partiendo, at ignota corpora mei, posse percipitur mea ut. At doming commodo deseruisse sit, eu diceret fabulas eligendi vix, sea nostrum scriptorem ad! Quo cu eius tollit instructior.</strong></p>\n<p><em>Lorem ipsum dolor sit amet, quas appetere qui te, vel ne enim putent tractatos, ullum inani et duo. Per placerat ocurreret te, eos diceret accumsan in? Qui no viderer vivendum facilisi, pro illud possim legimus at. Illum sonet numquam id vis. Ei accumsan nominati eos? Nam suas admodum ancillae ne? Nullam noster scribentur per cu, te duis consetetur adipiscing pri? Mollis deseruisse te mei. Cu euismod singulis suavitate eam. Ex eos purto similique, an eum fabellas adolescens! Dolor signiferumque cum id. Dicunt cetero detracto mea ei? Ex dico dolor vis, splendide vituperatoribus cu usu, ei mea posse sonet labores! Ad duo veritus intellegam, alterum appellantur vix et. Vis dissentiet repudiandae eu, decore integre principes per ei. Id vim stet mentitum repudiandae, pri mentitum qualisque ea, ex usu augue viderer suscipit. Ea vel mucius graecis, mentitum perfecto eu duo, duo eu ipsum urbanitas. Eruditi recteque abhorreant ius et, omnes dolore debitis vel ei? An inani copiosae nec, audiam sanctus nostrum est ea? Assum iuvaret mea id.</em></p>\n<p><del>An populo iriure interesset sit! Eum quas zril nostrum ei. Est no esse illum, falli doming vix no? No pri causae petentium! Id vocibus volutpat deterruisset usu, vocibus verterem sed ne, usu ne similique temporibus! Ex vix dicat discere partiendo, at ignota corpora mei, posse percipitur mea ut. At doming commodo deseruisse sit, eu diceret fabulas eligendi vix, sea nostrum scriptorem ad! Quo cu eius tollit instructior.</del></p>\n<ul><li>Lorem ipsum dolor sit amet, quas appetere qui te, </li><li>vel ne enim putent tractatos, ullum inani et duo. </li><li>Per placerat ocurreret te, eos diceret accumsan in? <ul><li>Qui no viderer vivendum facilisi, pro illud possim legimus at. </li><li>Illum sonet numquam id vis. Ei accumsan nominati eos? <ul><li>Nam suas admodum ancillae ne? Nullam noster scribentur per cu, </li><li>te duis consetetur adipiscing pri? Mollis deseruisse te mei. </li></ul><ul><li>Cu euismod singulis suavitate eam. Ex eos purto similique, an eum fabellas adolescens! </li></ul></li><li>Dolor signiferumque cum id. Dicunt cetero detracto mea ei? Ex dico dolor vis, splendide vituperatoribus cu usu, </li></ul></li><li>ei mea posse sonet labores! Ad duo veritus intellegam, alterum appellantur vix et. Vis dissentiet repudiandae eu, decore integre principes per ei. Id vim stet mentitum repudiandae, pri mentitum qualisque ea, ex usu augue viderer suscipit. Ea vel mucius graecis, mentitum perfecto eu duo, duo eu ipsum urbanitas. Eruditi recteque abhorreant ius et, omnes dolore debitis vel ei? An inani copiosae nec, audiam sanctus nostrum est ea? Assum iuvaret mea id.</li></ul><ol><li>Dolor signiferumque cum id. Dicunt cetero detracto mea ei? </li><li>Ex dico dolor vis, splendide vituperatoribus cu usu, ei mea posse sonet labores! </li><li>Ad duo veritus intellegam, alterum appellantur vix et. Vis dissentiet repudiandae eu, <ol><li>decore integre principes per ei. Id vim stet mentitum repudiandae, pri mentitum qualisque ea, </li><li>ex usu augue viderer suscipit. Ea vel mucius graecis, mentitum perfecto eu duo, duo eu ipsum urbanitas. </li><li>Eruditi recteque abhorreant ius et, omnes dolore debitis vel ei? <ol><li>An inani copiosae nec, audiam sanctus nostrum est ea? </li><li>Assum iuvaret mea id.</li></ol></li></ol></li><li>Cu euismod singulis suavitate eam. Ex eos purto similique, an eum fabellas adolescens! </li><li>Dolor signiferumque cum id. Dicunt cetero detracto mea ei? Ex dico dolor vis, splendide vituperatoribus cu usu, ei mea posse sonet labores! Ad duo veritus intellegam, alterum appellantur vix et. Vis dissentiet repudiandae eu, decore integre principes per ei. Id vim stet mentitum repudiandae, pri mentitum qualisque ea, </li><li>ex usu augue viderer suscipit. Ea vel mucius graecis, mentitum perfecto eu duo, </li><li>duo eu ipsum urbanitas. Eruditi recteque abhorreant ius et, </li><li>omnes dolore debitis vel ei? An inani copiosae nec, </li><li>audiam sanctus nostrum est ea? Assum iuvaret mea id.</li></ol><p>An populo iriure interesset sit! Eum quas zril nostrum ei. Est no esse illum, falli doming vix no? No pri causae petentium! Id vocibus volutpat deterruisset usu, vocibus verterem sed ne, usu ne similique temporibus! Ex vix dicat discere partiendo, at ignota corpora mei, posse percipitur mea ut. At doming commodo deseruisse sit, eu diceret fabulas eligendi vix, sea nostrum scriptorem ad! Quo cu eius tollit instructior.</p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-01 23:54:50','2017-12-02 21:51:59','8cc828f4-c026-4465-a673-c2f899de7f34'),
	(92,141,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-01 23:59:18','2017-12-02 21:51:59','85f2d904-9a84-4f94-a682-02f14330dcc3'),
	(93,143,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, quas appetere qui te, vel ne enim putent tractatos, ullum inani et duo. Per placerat ocurreret te, eos diceret accumsan in? Qui no viderer vivendum facilisi, pro illud possim legimus at. Illum sonet numquam id vis. Ei accumsan nominati eos? Nam suas admodum ancillae ne? Nullam noster scribentur per cu, te duis consetetur adipiscing pri? Mollis deseruisse te mei. Cu euismod singulis suavitate eam. Ex eos purto similique, an eum fabellas adolescens! Dolor signiferumque cum id. Dicunt cetero detracto mea ei? Ex dico dolor vis, splendide vituperatoribus cu usu, ei mea posse sonet labores! Ad duo veritus intellegam, alterum appellantur vix et. Vis dissentiet repudiandae eu, decore integre principes per ei. Id vim stet mentitum repudiandae, pri mentitum qualisque ea, ex usu augue viderer suscipit. Ea vel mucius graecis, mentitum perfecto eu duo, duo eu ipsum urbanitas. Eruditi recteque abhorreant ius et, omnes dolore debitis vel ei? An inani copiosae nec, audiam sanctus nostrum est ea? Assum iuvaret mea id.</p>\n<p>An populo iriure interesset sit! Eum quas zril nostrum ei. Est no esse illum, falli doming vix no? No pri causae petentium! Id vocibus volutpat deterruisset usu, vocibus verterem sed ne, usu ne similique temporibus! Ex vix dicat discere partiendo, at ignota corpora mei, posse percipitur mea ut. At doming commodo deseruisse sit, eu diceret fabulas eligendi vix, sea nostrum scriptorem ad! Quo cu eius tollit instructior.</p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-02 00:10:11','2017-12-02 21:51:59','68379713-f616-4148-a2fd-13cb4d394ff4'),
	(96,146,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-02 00:24:38','2017-12-02 21:51:59','4cce348c-2f45-44f5-8ba9-3cc90b0e396a'),
	(98,149,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-02 00:38:12','2017-12-02 21:51:59','fd32ae10-15e8-4578-9290-6768305bf52a'),
	(99,150,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'An populo iriure interesset sit! Eum quas zril nostrum ei. Est no esse illum, falli doming vix no? ','2017-12-02 00:38:12','2017-12-02 21:51:59','8737f3f9-cea1-44bd-b9d8-46c20af732ee'),
	(100,151,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-02 00:40:40','2017-12-02 21:51:59','11b95bbe-6b2c-4544-acba-02ffdd0edd8b'),
	(103,155,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-02 02:19:07','2017-12-02 21:51:59','b977db73-3b11-4933-aedf-6aa05b3dedb8'),
	(104,157,'de','Modules Content Builder Nested',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-02 21:52:39','2017-12-02 22:10:57','e356492a-8d55-4590-8f2f-27ae078141a8'),
	(105,158,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','c8ba4fa9-47cf-4907-a84d-3ab8990caa0d'),
	(106,160,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'H2: The quick brown fox jumps over the lazy dog',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','c57b7049-58bd-4b19-a895-4803a0fc936e'),
	(107,162,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'H3: The quick brown fox jumps over the lazy dog',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','5ce1bed6-7784-47d0-a218-e6463a2eeaa0'),
	(108,164,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'H4: The quick brown fox jumps over the lazy dog',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','a955195d-308c-44b8-b592-89066d8e5ee3'),
	(109,166,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'H5: The quick brown fox jumps over the lazy dog',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','c7f448b1-e241-484e-996c-c08c2801c9c0'),
	(110,168,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'H6: The quick brown fox jumps over the lazy dog',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','9186c586-f79a-405e-9068-2f0a2a80716c'),
	(111,170,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, quas appetere qui te, vel ne enim putent tractatos, ullum inani et duo. Per placerat ocurreret te, eos diceret accumsan in? Qui no viderer vivendum facilisi, pro illud possim legimus at. Illum sonet numquam id vis. Ei accumsan nominati eos? Nam suas admodum ancillae ne? Nullam noster scribentur per cu, te duis consetetur adipiscing pri? Mollis deseruisse te mei. Cu euismod singulis suavitate eam. Ex eos purto similique, an eum fabellas adolescens! Dolor signiferumque cum id. Dicunt cetero detracto mea ei? Ex dico dolor vis, splendide vituperatoribus cu usu, ei mea posse sonet labores! Ad duo veritus intellegam, alterum appellantur vix et. Vis dissentiet repudiandae eu, decore integre principes per ei. Id vim stet mentitum repudiandae, pri mentitum qualisque ea, ex usu augue viderer suscipit. Ea vel mucius graecis, mentitum perfecto eu duo, duo eu ipsum urbanitas. Eruditi recteque abhorreant ius et, omnes dolore debitis vel ei? An inani copiosae nec, audiam sanctus nostrum est ea? Assum iuvaret mea id.</p>\n<p><strong>An populo iriure interesset sit! Eum quas zril nostrum ei. Est no esse illum, falli doming vix no? No pri causae petentium! Id vocibus volutpat deterruisset usu, vocibus verterem sed ne, usu ne similique temporibus! Ex vix dicat discere partiendo, at ignota corpora mei, posse percipitur mea ut. At doming commodo deseruisse sit, eu diceret fabulas eligendi vix, sea nostrum scriptorem ad! Quo cu eius tollit instructior.</strong></p>\n<p><em>Lorem ipsum dolor sit amet, quas appetere qui te, vel ne enim putent tractatos, ullum inani et duo. Per placerat ocurreret te, eos diceret accumsan in? Qui no viderer vivendum facilisi, pro illud possim legimus at. Illum sonet numquam id vis. Ei accumsan nominati eos? Nam suas admodum ancillae ne? Nullam noster scribentur per cu, te duis consetetur adipiscing pri? Mollis deseruisse te mei. Cu euismod singulis suavitate eam. Ex eos purto similique, an eum fabellas adolescens! Dolor signiferumque cum id. Dicunt cetero detracto mea ei? Ex dico dolor vis, splendide vituperatoribus cu usu, ei mea posse sonet labores! Ad duo veritus intellegam, alterum appellantur vix et. Vis dissentiet repudiandae eu, decore integre principes per ei. Id vim stet mentitum repudiandae, pri mentitum qualisque ea, ex usu augue viderer suscipit. Ea vel mucius graecis, mentitum perfecto eu duo, duo eu ipsum urbanitas. Eruditi recteque abhorreant ius et, omnes dolore debitis vel ei? An inani copiosae nec, audiam sanctus nostrum est ea? Assum iuvaret mea id.</em></p>\n<p><del>An populo iriure interesset sit! Eum quas zril nostrum ei. Est no esse illum, falli doming vix no? No pri causae petentium! Id vocibus volutpat deterruisset usu, vocibus verterem sed ne, usu ne similique temporibus! Ex vix dicat discere partiendo, at ignota corpora mei, posse percipitur mea ut. At doming commodo deseruisse sit, eu diceret fabulas eligendi vix, sea nostrum scriptorem ad! Quo cu eius tollit instructior.</del></p>\n<ul><li>Lorem ipsum dolor sit amet, quas appetere qui te, </li><li>vel ne enim putent tractatos, ullum inani et duo. </li><li>Per placerat ocurreret te, eos diceret accumsan in? <ul><li>Qui no viderer vivendum facilisi, pro illud possim legimus at. </li><li>Illum sonet numquam id vis. Ei accumsan nominati eos? <ul><li>Nam suas admodum ancillae ne? Nullam noster scribentur per cu, </li><li>te duis consetetur adipiscing pri? Mollis deseruisse te mei. </li></ul><ul><li>Cu euismod singulis suavitate eam. Ex eos purto similique, an eum fabellas adolescens! </li></ul></li><li>Dolor signiferumque cum id. Dicunt cetero detracto mea ei? Ex dico dolor vis, splendide vituperatoribus cu usu, </li></ul></li><li>ei mea posse sonet labores! Ad duo veritus intellegam, alterum appellantur vix et. Vis dissentiet repudiandae eu, decore integre principes per ei. Id vim stet mentitum repudiandae, pri mentitum qualisque ea, ex usu augue viderer suscipit. Ea vel mucius graecis, mentitum perfecto eu duo, duo eu ipsum urbanitas. Eruditi recteque abhorreant ius et, omnes dolore debitis vel ei? An inani copiosae nec, audiam sanctus nostrum est ea? Assum iuvaret mea id.</li></ul><ol><li>Dolor signiferumque cum id. Dicunt cetero detracto mea ei? </li><li>Ex dico dolor vis, splendide vituperatoribus cu usu, ei mea posse sonet labores! </li><li>Ad duo veritus intellegam, alterum appellantur vix et. Vis dissentiet repudiandae eu, <ol><li>decore integre principes per ei. Id vim stet mentitum repudiandae, pri mentitum qualisque ea, </li><li>ex usu augue viderer suscipit. Ea vel mucius graecis, mentitum perfecto eu duo, duo eu ipsum urbanitas. </li><li>Eruditi recteque abhorreant ius et, omnes dolore debitis vel ei? <ol><li>An inani copiosae nec, audiam sanctus nostrum est ea? </li><li>Assum iuvaret mea id.</li></ol></li></ol></li><li>Cu euismod singulis suavitate eam. Ex eos purto similique, an eum fabellas adolescens! </li><li>Dolor signiferumque cum id. Dicunt cetero detracto mea ei? Ex dico dolor vis, splendide vituperatoribus cu usu, ei mea posse sonet labores! Ad duo veritus intellegam, alterum appellantur vix et. Vis dissentiet repudiandae eu, decore integre principes per ei. Id vim stet mentitum repudiandae, pri mentitum qualisque ea, </li><li>ex usu augue viderer suscipit. Ea vel mucius graecis, mentitum perfecto eu duo, </li><li>duo eu ipsum urbanitas. Eruditi recteque abhorreant ius et, </li><li>omnes dolore debitis vel ei? An inani copiosae nec, </li><li>audiam sanctus nostrum est ea? Assum iuvaret mea id.</li></ol><p>An populo iriure interesset sit! Eum quas zril nostrum ei. Est no esse illum, falli doming vix no? No pri causae petentium! Id vocibus volutpat deterruisset usu, vocibus verterem sed ne, usu ne similique temporibus! Ex vix dicat discere partiendo, at ignota corpora mei, posse percipitur mea ut. At doming commodo deseruisse sit, eu diceret fabulas eligendi vix, sea nostrum scriptorem ad! Quo cu eius tollit instructior.</p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','f352f8f2-abdb-4ee6-bea1-6b8849543506'),
	(112,171,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','12f5984d-663e-4793-9e87-cdeb48a430b6'),
	(113,173,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','fcf49ad5-e2a5-47c7-b857-950fa6c50751'),
	(114,175,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','60a2b192-f602-492a-a2db-9bd8a8785420'),
	(115,177,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, quas appetere qui te, vel ne enim putent tractatos, ullum inani et duo. Per placerat ocurreret te, eos diceret accumsan in? Qui no viderer vivendum facilisi, pro illud possim legimus at. Illum sonet numquam id vis. Ei accumsan nominati eos? Nam suas admodum ancillae ne? Nullam noster scribentur per cu, te duis consetetur adipiscing pri? Mollis deseruisse te mei. Cu euismod singulis suavitate eam. Ex eos purto similique, an eum fabellas adolescens! Dolor signiferumque cum id. Dicunt cetero detracto mea ei? Ex dico dolor vis, splendide vituperatoribus cu usu, ei mea posse sonet labores! Ad duo veritus intellegam, alterum appellantur vix et. Vis dissentiet repudiandae eu, decore integre principes per ei. Id vim stet mentitum repudiandae, pri mentitum qualisque ea, ex usu augue viderer suscipit. Ea vel mucius graecis, mentitum perfecto eu duo, duo eu ipsum urbanitas. Eruditi recteque abhorreant ius et, omnes dolore debitis vel ei? An inani copiosae nec, audiam sanctus nostrum est ea? Assum iuvaret mea id.</p>\n<p>An populo iriure interesset sit! Eum quas zril nostrum ei. Est no esse illum, falli doming vix no? No pri causae petentium! Id vocibus volutpat deterruisset usu, vocibus verterem sed ne, usu ne similique temporibus! Ex vix dicat discere partiendo, at ignota corpora mei, posse percipitur mea ut. At doming commodo deseruisse sit, eu diceret fabulas eligendi vix, sea nostrum scriptorem ad! Quo cu eius tollit instructior.</p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','bd50bd0a-30f8-4b85-ae57-3bf595f576c0'),
	(116,178,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','96e4f80c-283d-4259-9eae-ae340cdad9dc'),
	(117,179,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'An populo iriure interesset sit! Eum quas zril nostrum ei. Est no esse illum, falli doming vix no? ','2017-12-02 21:52:40','2017-12-02 22:10:57','d2e46f83-5c0d-4df9-b4bd-51a62cef1287'),
	(118,180,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','38947df5-f14c-41cd-bb67-7add97d8d52e'),
	(119,181,'de',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','cf42adf5-d597-4581-83f7-65c6aea87d45');

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
	(5,'Entry',1,0,'2017-04-16 22:48:52','2017-12-02 22:10:55','1528fa5d-880c-4c02-990a-f8c773f5eb9e'),
	(6,'GlobalSet',1,0,'2017-04-16 22:49:03','2017-09-03 22:18:26','05e2ebe3-b333-4020-8e73-24d7e5c9c0de'),
	(11,'Asset',1,0,'2017-04-17 18:46:13','2017-06-08 17:04:47','ae4b1200-1d3f-43dc-9a13-9e6c32e1ffd3'),
	(12,'Asset',1,0,'2017-04-17 18:46:14','2017-06-08 17:05:09','3ad031c9-8a24-4183-b5be-077478ef3454'),
	(13,'Asset',1,0,'2017-04-17 18:46:15','2017-06-08 17:05:26','f92cb31e-d450-463d-95bc-288009105b0b'),
	(14,'Asset',1,0,'2017-04-17 18:46:16','2017-06-08 17:05:44','ce7ca515-c1a7-4b37-805b-484a247e20ae'),
	(68,'SuperTable_Block',1,0,'2017-04-20 13:44:03','2017-04-20 13:51:14','6f3915b5-28fc-407b-8fc8-5750458fb90c'),
	(70,'SuperTable_Block',1,0,'2017-04-20 13:48:14','2017-04-20 13:51:15','e124bd04-78b4-4163-b583-54462071ee32'),
	(114,'GlobalSet',1,0,'2017-09-03 17:01:51','2017-09-24 22:09:52','243864ae-aeb1-4653-97ac-bce25fd90247'),
	(115,'GlobalSet',1,0,'2017-09-03 17:04:46','2017-09-24 22:15:50','22da85df-2311-4d6e-9b72-22025b60f561'),
	(116,'GlobalSet',1,0,'2017-09-04 13:52:53','2017-09-04 13:52:53','dff7bcd7-9a27-4046-9e49-893ed4627760'),
	(117,'GlobalSet',1,0,'2017-09-19 22:48:00','2017-09-19 22:48:00','a11d1247-1379-4a3c-8386-64b46d6136ea'),
	(119,'Entry',1,0,'2017-09-24 13:57:35','2017-11-16 01:13:48','c778d2cb-caec-4054-930a-5eece2cdb2ce'),
	(120,'Entry',1,0,'2017-09-24 14:03:04','2017-11-16 01:13:07','fc788d63-e556-425b-a3c8-9eff2dd74836'),
	(121,'Entry',1,0,'2017-09-24 14:04:22','2017-11-16 01:13:07','c129643a-7cfe-45d9-a3c4-b2f8b95622d4'),
	(122,'Category',1,0,'2017-09-24 14:07:04','2017-09-24 14:07:04','a52f1e9b-d2ad-431f-b65f-82671abe6f6c'),
	(123,'Entry',1,0,'2017-09-24 14:09:32','2017-11-16 01:13:07','b4a77fb7-285b-4552-9d98-8292ba6b49a3'),
	(124,'Neo_Block',1,0,'2017-12-01 23:35:02','2017-12-02 21:51:59','29b7bf21-d49c-452c-9c78-699a6c4902b2'),
	(125,'SuperTable_Block',1,0,'2017-12-01 23:35:02','2017-12-02 21:51:59','b7e38e2e-36b5-4607-a261-de4e8632b71f'),
	(126,'Neo_Block',1,0,'2017-12-01 23:35:02','2017-12-02 21:51:59','fada4cb2-8d89-451d-8550-06ef13c23884'),
	(127,'SuperTable_Block',1,0,'2017-12-01 23:35:02','2017-12-02 21:51:59','721440b0-3dd3-41aa-ab70-acdeef72d1c6'),
	(128,'Neo_Block',1,0,'2017-12-01 23:52:57','2017-12-02 21:51:59','088afcd1-eee4-4c5e-b2eb-eeaa1c9478b1'),
	(129,'SuperTable_Block',1,0,'2017-12-01 23:52:57','2017-12-02 21:51:59','5e3d79c5-50d9-493b-b53f-4629f4b7ad0c'),
	(130,'Neo_Block',1,0,'2017-12-01 23:52:57','2017-12-02 21:51:59','4f84e272-7b09-4c5a-ba17-2497e70acb5e'),
	(131,'SuperTable_Block',1,0,'2017-12-01 23:52:57','2017-12-02 21:51:59','cd06efbb-f354-4a6e-b12e-d38b0341a7fa'),
	(132,'Neo_Block',1,0,'2017-12-01 23:52:57','2017-12-02 21:51:59','9ce3bc6f-6fba-4d7d-a3f7-890e0e2837d5'),
	(133,'SuperTable_Block',1,0,'2017-12-01 23:52:57','2017-12-02 21:51:59','006cac9b-f931-455f-a55f-23e4be456847'),
	(134,'Neo_Block',1,0,'2017-12-01 23:52:58','2017-12-02 21:51:59','7f71b990-36cc-4aee-9090-85b4264127d6'),
	(135,'SuperTable_Block',1,0,'2017-12-01 23:52:58','2017-12-02 21:51:59','7611b344-a30e-4ecf-a734-7ed6e6fe9e17'),
	(136,'Neo_Block',1,0,'2017-12-01 23:54:50','2017-12-02 21:51:59','f21277e4-b512-480b-997d-27da8bcc5149'),
	(137,'SuperTable_Block',1,0,'2017-12-01 23:54:50','2017-12-02 21:51:59','e9761a00-5f2d-4177-9d22-948d49afb2f3'),
	(138,'Neo_Block',1,0,'2017-12-01 23:54:50','2017-12-02 21:51:59','ef2cd2c0-b397-4d5e-af18-d99c151ce994'),
	(141,'Neo_Block',1,0,'2017-12-01 23:59:18','2017-12-02 21:51:59','c101779c-1bf1-4dce-8f23-c8c09287f746'),
	(142,'SuperTable_Block',1,0,'2017-12-01 23:59:18','2017-12-02 21:51:59','1a514800-7172-4a3c-ae63-8edceb6a7049'),
	(143,'Neo_Block',1,0,'2017-12-02 00:10:11','2017-12-02 21:51:59','48eb47db-56fe-4d0f-ac8b-6eba4ed3a1fd'),
	(146,'Neo_Block',1,0,'2017-12-02 00:24:38','2017-12-02 21:51:59','030da490-7fa7-4488-86db-ae18dad3b869'),
	(147,'SuperTable_Block',1,0,'2017-12-02 00:24:38','2017-12-02 21:51:59','d444effd-dda1-4c86-ab56-8abd26cd78c1'),
	(149,'Neo_Block',1,0,'2017-12-02 00:38:12','2017-12-02 21:51:59','b4b44564-9e80-4a75-8a76-77b6540fbc60'),
	(150,'Neo_Block',1,0,'2017-12-02 00:38:12','2017-12-02 21:51:59','17f9f79e-7ba4-41a3-8450-ba4cc47585f4'),
	(151,'Neo_Block',1,0,'2017-12-02 00:40:40','2017-12-02 21:51:59','68c54752-af3a-4d6c-8ca4-03823fb7f66e'),
	(155,'Neo_Block',1,0,'2017-12-02 02:19:07','2017-12-02 21:51:59','e23f7644-75c6-40d9-ae71-a933c5ecec4b'),
	(156,'SuperTable_Block',1,0,'2017-12-02 21:13:44','2017-12-02 21:51:59','7de8f709-5f69-485a-8f97-d87d88de5860'),
	(157,'Entry',1,0,'2017-12-02 21:52:39','2017-12-02 22:10:57','05559ce0-083c-4fea-9544-c66e562ecba0'),
	(158,'Neo_Block',1,0,'2017-12-02 21:52:40','2017-12-02 22:10:57','6a1f67ac-3d5a-4f96-b14f-ce68ae6797e5'),
	(159,'SuperTable_Block',1,0,'2017-12-02 21:52:40','2017-12-02 22:10:57','c23ac2a3-a526-42c8-bd20-d606f98422b1'),
	(160,'Neo_Block',1,0,'2017-12-02 21:52:40','2017-12-02 22:10:57','1c1c977b-e3f5-476b-95ae-0bd376721b1f'),
	(161,'SuperTable_Block',1,0,'2017-12-02 21:52:40','2017-12-02 22:10:57','d8efb5f6-6efc-4054-a606-64047add0f3c'),
	(162,'Neo_Block',1,0,'2017-12-02 21:52:40','2017-12-02 22:10:57','e6011401-407e-4689-8dd7-e763226d0b3b'),
	(163,'SuperTable_Block',1,0,'2017-12-02 21:52:40','2017-12-02 22:10:57','17cb4147-50db-4b0d-9e2d-12e9d162ab75'),
	(164,'Neo_Block',1,0,'2017-12-02 21:52:40','2017-12-02 22:10:57','ac637db0-d5ed-4b3c-861c-c3609f791b7e'),
	(165,'SuperTable_Block',1,0,'2017-12-02 21:52:40','2017-12-02 22:10:57','d36c7758-986b-4a24-9ca4-d7a29116dd02'),
	(166,'Neo_Block',1,0,'2017-12-02 21:52:40','2017-12-02 22:10:57','9fbcebc9-c48e-4446-97c6-6385b6448477'),
	(167,'SuperTable_Block',1,0,'2017-12-02 21:52:40','2017-12-02 22:10:57','d2c21383-d8ad-4f3a-b608-87b853981578'),
	(168,'Neo_Block',1,0,'2017-12-02 21:52:40','2017-12-02 22:10:57','2467afd3-766b-48e4-ad06-3ae24b6b9b8b'),
	(169,'SuperTable_Block',1,0,'2017-12-02 21:52:40','2017-12-02 22:10:57','8b25789d-943c-4c99-a6d2-f437979c9bff'),
	(170,'Neo_Block',1,0,'2017-12-02 21:52:40','2017-12-02 22:10:57','50b25abc-836b-40b0-80ef-83623ac61cf0'),
	(171,'Neo_Block',1,0,'2017-12-02 21:52:40','2017-12-02 22:10:57','d33e5f2d-396b-4072-ba92-8fcc68c9142b'),
	(172,'SuperTable_Block',1,0,'2017-12-02 21:52:40','2017-12-02 22:10:57','8b113959-26bd-45df-bb39-fe5d8526e907'),
	(173,'Neo_Block',1,0,'2017-12-02 21:52:40','2017-12-02 22:10:57','fd2ab57f-a223-438a-80d7-1186a8ba8377'),
	(174,'SuperTable_Block',1,0,'2017-12-02 21:52:40','2017-12-02 22:10:57','2f9cc13b-fb4e-4ddb-86c5-6e1b3c2a1817'),
	(175,'Neo_Block',1,0,'2017-12-02 21:52:40','2017-12-02 22:10:57','8795af65-5590-4fdf-981f-b350c82bfb41'),
	(176,'SuperTable_Block',1,0,'2017-12-02 21:52:40','2017-12-02 22:10:57','069106e1-7dce-48b7-84c3-fa251faa6af9'),
	(177,'Neo_Block',1,0,'2017-12-02 21:52:40','2017-12-02 22:10:57','2964c03b-1629-4fb1-8116-64cece684aac'),
	(178,'Neo_Block',1,0,'2017-12-02 21:52:40','2017-12-02 22:10:57','09700d77-d945-4967-8753-5123d63cbfd9'),
	(179,'Neo_Block',1,0,'2017-12-02 21:52:40','2017-12-02 22:10:57','0075bd5f-cebd-4505-8290-f41e427a9d9c'),
	(180,'Neo_Block',1,0,'2017-12-02 21:52:40','2017-12-02 22:10:57','3c417210-38d6-4408-85d5-cce9c31c2cdd'),
	(181,'Neo_Block',1,0,'2017-12-02 21:52:40','2017-12-02 22:10:57','badd2bfb-e690-4065-86f0-512605d06188'),
	(182,'SuperTable_Block',1,0,'2017-12-02 21:52:40','2017-12-02 22:10:57','c461932e-0c49-42ff-a0f7-a015b010af5c');

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
	(5,5,'de','modules-content-builder','dev/modules-content-builder',1,'2017-04-16 22:48:52','2017-12-02 22:10:55','4c07ed46-b518-48cf-90cb-44c91579600c'),
	(6,6,'de','',NULL,1,'2017-04-16 22:49:03','2017-09-03 22:18:26','fd02fd31-754a-410a-8ff2-4b579d1cd428'),
	(11,11,'de','home-01',NULL,1,'2017-04-17 18:46:13','2017-06-08 17:04:47','f0777221-993b-410f-8a65-6b5f11438166'),
	(12,12,'de','home-02',NULL,1,'2017-04-17 18:46:14','2017-06-08 17:05:09','bb9b7b7e-eac5-4709-9681-78e682853075'),
	(13,13,'de','home-03',NULL,1,'2017-04-17 18:46:15','2017-06-08 17:05:26','2a99d309-e8bc-4479-b234-7ee202f49ae4'),
	(14,14,'de','home-04',NULL,1,'2017-04-17 18:46:16','2017-06-08 17:05:44','261a0f74-2957-400b-8d57-f9f133a6a034'),
	(68,68,'de','',NULL,1,'2017-04-20 13:44:03','2017-04-20 13:51:14','f96e686f-bd47-4b02-86d0-d100bc12b407'),
	(70,70,'de','',NULL,1,'2017-04-20 13:48:14','2017-04-20 13:51:15','14b7a88a-54eb-4e5a-9c99-c5c0da90f27a'),
	(114,114,'de','',NULL,1,'2017-09-03 17:01:51','2017-09-24 22:09:52','6ccea37f-9888-4742-96f8-3b0838afcadf'),
	(115,115,'de','',NULL,1,'2017-09-03 17:04:46','2017-09-24 22:15:50','424b2f70-bb00-41d7-8adb-c9e978f1d3b4'),
	(116,116,'de','',NULL,1,'2017-09-04 13:52:53','2017-09-04 13:52:53','21d055fc-31c0-4f33-b0fa-8f79436b43a5'),
	(117,117,'de','',NULL,1,'2017-09-19 22:48:00','2017-09-19 22:48:00','e542527c-41e5-481b-9867-0b43df77847f'),
	(119,119,'de','articles','articles',1,'2017-09-24 13:57:35','2017-11-16 01:13:48','18eff1f4-9113-44f5-8e5b-411b50f2ca87'),
	(120,120,'de','welcome','article/welcome',1,'2017-09-24 14:03:04','2017-11-16 01:13:07','072c2261-0732-4667-b32e-fd5da9240cdb'),
	(121,121,'de','example-news-entry','article/example-news-entry',1,'2017-09-24 14:04:22','2017-11-16 01:13:07','189e646d-5aa9-40d9-9696-42039d8e41f8'),
	(122,122,'de','example','topic/example',1,'2017-09-24 14:07:04','2017-11-11 16:48:08','ffbf0167-9133-49f4-bea7-b079be78b15f'),
	(123,123,'de','another-news-example','article/another-news-example',1,'2017-09-24 14:09:32','2017-11-16 01:13:07','eeaf19b8-bdce-4e8a-8064-18d8afa8fca2'),
	(124,124,'de','',NULL,1,'2017-12-01 23:35:02','2017-12-02 21:51:59','5e574766-9e28-4901-86b7-98e35ad55fbd'),
	(125,125,'de','',NULL,1,'2017-12-01 23:35:02','2017-12-02 21:51:59','3a5233ed-233d-4921-b4b0-83bbc90fb3c0'),
	(126,126,'de','',NULL,1,'2017-12-01 23:35:02','2017-12-02 21:51:59','22e048d6-4b19-4a65-bbd7-a3bb89827464'),
	(127,127,'de','',NULL,1,'2017-12-01 23:35:02','2017-12-02 21:51:59','294c49c3-6bd4-46e5-989d-2f4705b77d95'),
	(128,128,'de','',NULL,1,'2017-12-01 23:52:57','2017-12-02 21:51:59','f96ba7f4-a151-4a95-beb8-b825c1cf6cdb'),
	(129,129,'de','',NULL,1,'2017-12-01 23:52:57','2017-12-02 21:51:59','5cb6e0a5-4bd2-42e8-b5be-13922bcecbdf'),
	(130,130,'de','',NULL,1,'2017-12-01 23:52:57','2017-12-02 21:51:59','cd080abe-2b40-44b2-8209-7b8d7223a6a7'),
	(131,131,'de','',NULL,1,'2017-12-01 23:52:57','2017-12-02 21:51:59','b141a2bb-6cb1-49d3-9f94-ce67263704c3'),
	(132,132,'de','',NULL,1,'2017-12-01 23:52:57','2017-12-02 21:51:59','a4a0126a-fc9e-44e1-9dea-11ffea410584'),
	(133,133,'de','',NULL,1,'2017-12-01 23:52:57','2017-12-02 21:51:59','395ecf39-504b-4c60-b2ac-9f3b2049267d'),
	(134,134,'de','',NULL,1,'2017-12-01 23:52:58','2017-12-02 21:51:59','fd98c847-5006-48ee-a4bb-cc6c21aa8492'),
	(135,135,'de','',NULL,1,'2017-12-01 23:52:58','2017-12-02 21:51:59','5a73da29-09df-4837-a8ba-5c01d221491e'),
	(136,136,'de','',NULL,1,'2017-12-01 23:54:50','2017-12-02 21:51:59','2b38ed79-a106-40d0-92f4-d910a9049dd8'),
	(137,137,'de','',NULL,1,'2017-12-01 23:54:50','2017-12-02 21:51:59','7cb8f844-17a9-42e4-ac3c-f399ece53d3c'),
	(138,138,'de','',NULL,1,'2017-12-01 23:54:50','2017-12-02 21:51:59','0e5afca0-51b4-4a2e-9bc6-8724adc34bcf'),
	(141,141,'de','',NULL,1,'2017-12-01 23:59:18','2017-12-02 21:51:59','ecb09f67-7f9b-409c-ab60-3130c320afc9'),
	(142,142,'de','',NULL,1,'2017-12-01 23:59:18','2017-12-02 21:51:59','127016c5-7757-4a8b-8c98-59ca0baa86cc'),
	(143,143,'de','',NULL,1,'2017-12-02 00:10:11','2017-12-02 21:51:59','d6eb53a2-3fb2-454f-9735-1a5b49b9f4d9'),
	(146,146,'de','',NULL,1,'2017-12-02 00:24:38','2017-12-02 21:51:59','7d361ccc-c833-417e-9007-880f1f7cfbb8'),
	(147,147,'de','',NULL,1,'2017-12-02 00:24:38','2017-12-02 21:51:59','256107ad-c47f-4b3a-a92c-1e8cc94d5d14'),
	(149,149,'de','',NULL,1,'2017-12-02 00:38:12','2017-12-02 21:51:59','cc144e13-5fe7-4fa6-a3b9-2dfd639878a3'),
	(150,150,'de','',NULL,1,'2017-12-02 00:38:12','2017-12-02 21:51:59','3ab94370-9bdd-477f-9b32-90c3f9c2c690'),
	(151,151,'de','',NULL,1,'2017-12-02 00:40:40','2017-12-02 21:51:59','50e7afa8-1959-4219-82d6-1608cfc394c1'),
	(155,155,'de','',NULL,1,'2017-12-02 02:19:07','2017-12-02 21:51:59','b8884b6b-5f81-4fd4-81e9-8b4d8906967e'),
	(156,156,'de','',NULL,1,'2017-12-02 21:13:44','2017-12-02 21:51:59','ab60e7e0-bbd4-4ce6-88b3-39008cf95544'),
	(157,157,'de','modules-content-builder-nested','dev/modules-content-builder-nested',1,'2017-12-02 21:52:39','2017-12-02 22:10:57','b134da32-22e5-4be7-b769-4e9adb61fc37'),
	(158,158,'de','',NULL,1,'2017-12-02 21:52:40','2017-12-02 22:10:57','e2e4772b-4a6f-4059-92c6-0f62ef1b04d5'),
	(159,159,'de','',NULL,1,'2017-12-02 21:52:40','2017-12-02 22:10:57','e9acbe8a-7d30-4956-a9c3-af6ee6e1bb58'),
	(160,160,'de','',NULL,1,'2017-12-02 21:52:40','2017-12-02 22:10:57','305a6d99-7945-4b95-adce-a54ea91f2c82'),
	(161,161,'de','',NULL,1,'2017-12-02 21:52:40','2017-12-02 22:10:57','07026132-4e39-45d0-a82c-5fff7b3813fa'),
	(162,162,'de','',NULL,1,'2017-12-02 21:52:40','2017-12-02 22:10:57','4bc141b6-50b3-40a3-88e1-83b462a6fb8b'),
	(163,163,'de','',NULL,1,'2017-12-02 21:52:40','2017-12-02 22:10:57','91679adc-b16c-4128-8bc3-ca22bd11fff9'),
	(164,164,'de','',NULL,1,'2017-12-02 21:52:40','2017-12-02 22:10:57','60bb4582-831d-4964-b70a-12f162099732'),
	(165,165,'de','',NULL,1,'2017-12-02 21:52:40','2017-12-02 22:10:57','2b1a9b02-e6c3-4d61-a833-2721a3a8c7a5'),
	(166,166,'de','',NULL,1,'2017-12-02 21:52:40','2017-12-02 22:10:57','b2c666c5-8a85-495e-b4bd-9d0049d268c9'),
	(167,167,'de','',NULL,1,'2017-12-02 21:52:40','2017-12-02 22:10:57','d929182e-786d-4a52-8f2c-65f85e388c69'),
	(168,168,'de','',NULL,1,'2017-12-02 21:52:40','2017-12-02 22:10:57','5f8952f5-6fd1-4262-9355-1f7c948dc646'),
	(169,169,'de','',NULL,1,'2017-12-02 21:52:40','2017-12-02 22:10:57','caba53dd-27f6-41ea-bba0-4abec547cb08'),
	(170,170,'de','',NULL,1,'2017-12-02 21:52:40','2017-12-02 22:10:57','8a0f0306-d417-4d18-ac5c-35fd6771e0f5'),
	(171,171,'de','',NULL,1,'2017-12-02 21:52:40','2017-12-02 22:10:57','434525d4-7ce9-4ce1-b46a-a4bfc6b060fa'),
	(172,172,'de','',NULL,1,'2017-12-02 21:52:40','2017-12-02 22:10:57','cdc849f6-09ed-4ad4-b6a0-fd6046448fa7'),
	(173,173,'de','',NULL,1,'2017-12-02 21:52:40','2017-12-02 22:10:57','d2cee8c0-b746-4bf2-a3dd-7eb581dcbacc'),
	(174,174,'de','',NULL,1,'2017-12-02 21:52:40','2017-12-02 22:10:57','47bad02f-8d5d-4a59-b7ba-782e240d723d'),
	(175,175,'de','',NULL,1,'2017-12-02 21:52:40','2017-12-02 22:10:57','528522a0-2165-418a-a7bb-cd1da63eee7a'),
	(176,176,'de','',NULL,1,'2017-12-02 21:52:40','2017-12-02 22:10:57','2a37abc6-eb4a-433f-9102-1372b33ca248'),
	(177,177,'de','',NULL,1,'2017-12-02 21:52:40','2017-12-02 22:10:57','0b2cc2ce-6dd1-45f5-ac59-7abc338ae719'),
	(178,178,'de','',NULL,1,'2017-12-02 21:52:40','2017-12-02 22:10:57','31890e7d-a56f-474a-b854-36d736b0435b'),
	(179,179,'de','',NULL,1,'2017-12-02 21:52:40','2017-12-02 22:10:57','400274b3-b3dc-40c6-80a0-01b8f72218b4'),
	(180,180,'de','',NULL,1,'2017-12-02 21:52:40','2017-12-02 22:10:57','151fe481-6ca3-4634-bdc4-40d3444cff1e'),
	(181,181,'de','',NULL,1,'2017-12-02 21:52:40','2017-12-02 22:10:57','00a7a689-114c-47d6-80a9-717cf01b4817'),
	(182,182,'de','',NULL,1,'2017-12-02 21:52:40','2017-12-02 22:10:57','59bc526a-c67c-400e-be41-c9cb2911c606');

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
	(5,4,4,1,'2017-12-01 23:16:00',NULL,'2017-04-16 22:48:52','2017-12-02 21:51:59','34d64afe-d272-4d07-b2d5-3fbb69a34f30'),
	(119,6,8,1,'2017-09-24 13:57:00',NULL,'2017-09-24 13:57:35','2017-11-11 16:55:20','90fe2fea-fe0c-4e1b-94c5-a4cd025dd3fa'),
	(120,5,5,1,'2017-09-24 14:03:00',NULL,'2017-09-24 14:03:04','2017-09-24 14:08:40','feda2cfa-7d70-4003-a184-781e64cadc5c'),
	(121,5,5,1,'2017-09-24 14:04:00',NULL,'2017-09-24 14:04:22','2017-09-24 14:09:50','ce0d5440-9eb2-4089-9f6c-04fd08247ce2'),
	(123,5,5,1,'2017-09-24 14:09:37',NULL,'2017-09-24 14:09:32','2017-09-24 14:09:37','529e2f6b-5f9c-42a8-8d53-d852545493b2'),
	(157,4,9,1,'2017-12-01 23:16:00',NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','8a248378-bb51-40d5-97e1-4eb1346e5944');

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
	(3,3,535,'Homepage','homepage',1,'Title',NULL,1,'2017-04-16 22:48:52','2017-11-11 16:36:57','5523e1a6-09ec-41da-8346-f234fc79a17a'),
	(4,4,786,'Modules CB','modulesCB',1,'',NULL,1,'2017-04-16 22:48:52','2017-12-02 21:48:30','e4f17c23-e055-4d0e-b4b4-5d10bd234de1'),
	(5,5,614,'Default','default',1,'Title',NULL,1,'2017-04-16 22:48:52','2017-11-16 00:56:28','a7735d3a-d13b-4fc1-8f2e-24edba816813'),
	(6,6,615,'Default','default',1,'Title',NULL,1,'2017-04-16 22:56:24','2017-11-16 00:57:23','9d1a8865-03bb-4839-aa69-17e31ede8053'),
	(8,6,536,'Articles','articles',1,'Title',NULL,2,'2017-09-24 13:56:56','2017-11-11 16:38:03','1c8b733c-b769-40b0-8256-fbb6e152b0fe'),
	(9,4,787,'Modules CB Nested','modulesCBNested',1,'',NULL,2,'2017-12-02 21:50:32','2017-12-02 21:50:32','70242c47-fa9e-4905-924b-40dc2229d67d');

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

LOCK TABLES `craft_entryversions` WRITE;
/*!40000 ALTER TABLE `craft_entryversions` DISABLE KEYS */;

INSERT INTO `craft_entryversions` (`id`, `entryId`, `sectionId`, `creatorId`, `locale`, `num`, `notes`, `data`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,119,6,1,'de',1,'','{\"typeId\":\"8\",\"authorId\":\"1\",\"title\":\"News\",\"slug\":\"news\",\"postDate\":1506261455,\"expiryDate\":null,\"enabled\":1,\"parentId\":\"\",\"fields\":{\"100\":\"\",\"106\":{\"seoMainEntityCategory\":\"CreativeWork\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoTitleUnparsed\":\"\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"singleIntroText\",\"seoDescriptionUnparsed\":\"\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoKeywordsUnparsed\":\"\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"singleImageEntry\",\"seoImageId\":\"\",\"seoImageTransform\":\"socialSharing\",\"canonicalUrlOverride\":\"\",\"twitterCardType\":\"summary_large_image\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"singleImageEntry\",\"seoTwitterImageId\":\"\",\"seoTwitterImageTransform\":\"socialSharing\",\"openGraphType\":\"\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"singleImageEntry\",\"seoFacebookImageId\":\"\",\"seoFacebookImageTransform\":\"socialSharing\",\"robots\":\"\"},\"103\":\"\",\"104\":\"\",\"102\":\"\"}}','2017-09-24 13:57:35','2017-09-24 13:57:35','3639855f-c9f1-43f8-a92a-963021372339'),
	(2,120,5,1,'de',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Welcome\",\"slug\":\"welcome\",\"postDate\":1506261784,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"100\":\"\",\"105\":{\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"WebPage\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoTitleUnparsed\":\"\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"singleIntroText\",\"seoDescriptionUnparsed\":\"\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoKeywordsUnparsed\":\"\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"singleImageEntry\",\"seoImageId\":\"\",\"seoImageTransform\":\"socialSharing\",\"canonicalUrlOverride\":\"\",\"twitterCardType\":\"summary_large_image\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"singleImageEntry\",\"seoTwitterImageId\":\"\",\"seoTwitterImageTransform\":\"socialSharing\",\"openGraphType\":\"\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"singleImageEntry\",\"seoFacebookImageId\":\"\",\"seoFacebookImageTransform\":\"socialSharing\",\"robots\":\"\"},\"103\":[\"11\"],\"104\":\"An populo iriure interesset sit! Eum quas zril nostrum ei. Est no esse illum, falli doming vix no? No pri causae petentium! Id vocibus volutpat deterruisset usu, vocibus verterem sed ne, usu ne similique temporibus! Ex vix dicat discere partiendo, at ignota corpora mei, posse percipitur mea ut. At doming commodo deseruisse sit, eu diceret fabulas eligendi vix, sea nostrum scriptorem ad! Quo cu eius tollit instructior.\",\"102\":\"\"}}','2017-09-24 14:03:04','2017-09-24 14:03:04','66c6764c-3109-4a06-88ca-006573f9cdbc'),
	(3,121,5,1,'de',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Example News Entry\",\"slug\":\"example-news-entry\",\"postDate\":null,\"expiryDate\":null,\"enabled\":0,\"parentId\":null,\"fields\":{\"100\":\"\",\"105\":{\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"WebPage\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoTitleUnparsed\":\"\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"singleIntroText\",\"seoDescriptionUnparsed\":\"\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoKeywordsUnparsed\":\"\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"singleImageEntry\",\"seoImageId\":\"\",\"seoImageTransform\":\"socialSharing\",\"canonicalUrlOverride\":\"\",\"twitterCardType\":\"summary_large_image\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"singleImageEntry\",\"seoTwitterImageId\":\"\",\"seoTwitterImageTransform\":\"socialSharing\",\"openGraphType\":\"\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"singleImageEntry\",\"seoFacebookImageId\":\"\",\"seoFacebookImageTransform\":\"socialSharing\",\"robots\":\"\"},\"103\":[\"11\"],\"104\":\"Lorem ipsum dolor sit amet, quas appetere qui te, vel ne enim putent tractatos, ullum inani et duo. Per placerat ocurreret te, eos diceret accumsan in? Qui no viderer vivendum facilisi, pro illud possim legimus at. Illum sonet numquam id vis. Ei accumsan nominati eos? Nam suas admodum ancillae ne? Nullam noster scribentur per cu, te duis consetetur adipiscing pri? Mollis deseruisse te mei. Cu euismod singulis suavitate eam. Ex eos purto similique, an eum fabellas adolescens! Dolor signiferumque cum id. Dicunt cetero detracto mea ei?\",\"102\":\"\"}}','2017-09-24 14:04:22','2017-09-24 14:04:22','54c4a6fd-5065-4530-9936-eba73b637194'),
	(4,121,5,1,'de',2,'','{\"typeId\":\"5\",\"authorId\":\"1\",\"title\":\"Example News Entry\",\"slug\":\"example-news-entry\",\"postDate\":1506261866,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"100\":\"\",\"105\":{\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"WebPage\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoTitleUnparsed\":\"Example News Entry\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"singleIntroText\",\"seoDescriptionUnparsed\":\"Lorem ipsum dolor sit amet, quas appetere qui te, vel ne enim putent tractatos, ullum inani et duo. Per placerat ocurreret te, eos diceret accumsan in? Qui no\\u2026\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoKeywordsUnparsed\":\"\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"singleImageEntry\",\"seoImageId\":[\"11\"],\"seoImageTransform\":\"socialSharing\",\"canonicalUrlOverride\":\"\",\"twitterCardType\":\"summary_large_image\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"singleImageEntry\",\"seoTwitterImageId\":[\"11\"],\"seoTwitterImageTransform\":\"socialSharing\",\"openGraphType\":\"\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"singleImageEntry\",\"seoFacebookImageId\":[\"11\"],\"seoFacebookImageTransform\":\"socialSharing\",\"robots\":\"\"},\"103\":[\"11\"],\"104\":\"Lorem ipsum dolor sit amet, quas appetere qui te, vel ne enim putent tractatos, ullum inani et duo. Per placerat ocurreret te, eos diceret accumsan in? Qui no viderer vivendum facilisi, pro illud possim legimus at. Illum sonet numquam id vis. Ei accumsan nominati eos? Nam suas admodum ancillae ne? Nullam noster scribentur per cu, te duis consetetur adipiscing pri? Mollis deseruisse te mei. Cu euismod singulis suavitate eam. Ex eos purto similique, an eum fabellas adolescens! Dolor signiferumque cum id. Dicunt cetero detracto mea ei?\",\"102\":\"\"}}','2017-09-24 14:04:27','2017-09-24 14:04:27','42fb8558-ae79-44ae-9110-b016a75ed7ef'),
	(5,121,5,1,'de',3,'','{\"typeId\":\"5\",\"authorId\":\"1\",\"title\":\"Example News Entry\",\"slug\":\"example-news-entry\",\"postDate\":1506261840,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"3\":[\"122\"],\"100\":\"\",\"105\":{\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"WebPage\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoTitleUnparsed\":\"Example News Entry\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"singleIntroText\",\"seoDescriptionUnparsed\":\"Lorem ipsum dolor sit amet, quas appetere qui te, vel ne enim putent tractatos, ullum inani et duo. Per placerat ocurreret te, eos diceret accumsan in? Qui no\\u2026\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoKeywordsUnparsed\":\"\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"singleImageEntry\",\"seoImageId\":[\"11\"],\"seoImageTransform\":\"socialSharing\",\"canonicalUrlOverride\":\"\",\"twitterCardType\":\"summary_large_image\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"singleImageEntry\",\"seoTwitterImageId\":[\"11\"],\"seoTwitterImageTransform\":\"socialSharing\",\"openGraphType\":\"\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"singleImageEntry\",\"seoFacebookImageId\":[\"11\"],\"seoFacebookImageTransform\":\"socialSharing\",\"robots\":\"\"},\"103\":[\"11\"],\"104\":\"Lorem ipsum dolor sit amet, quas appetere qui te, vel ne enim putent tractatos, ullum inani et duo. Per placerat ocurreret te, eos diceret accumsan in? Qui no viderer vivendum facilisi, pro illud possim legimus at. Illum sonet numquam id vis. Ei accumsan nominati eos? Nam suas admodum ancillae ne? Nullam noster scribentur per cu, te duis consetetur adipiscing pri? Mollis deseruisse te mei. Cu euismod singulis suavitate eam. Ex eos purto similique, an eum fabellas adolescens! Dolor signiferumque cum id. Dicunt cetero detracto mea ei?\",\"102\":\"\"}}','2017-09-24 14:07:15','2017-09-24 14:07:15','9a1d5167-957e-4239-af77-e72d1f8f48b4'),
	(6,121,5,1,'de',4,'','{\"typeId\":\"5\",\"authorId\":\"1\",\"title\":\"Example News Entry\",\"slug\":\"example-news-entry\",\"postDate\":1506261840,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"3\":[\"122\"],\"100\":\"\",\"105\":{\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"WebPage\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoTitleUnparsed\":\"Example News Entry\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"singleIntroText\",\"seoDescriptionUnparsed\":\"Lorem ipsum dolor sit amet, quas appetere qui te, vel ne enim putent tractatos, ullum inani et duo. Per placerat ocurreret te, eos diceret accumsan in? Qui no\\u2026\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoKeywordsUnparsed\":\"\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"singleImageEntry\",\"seoImageId\":[\"11\"],\"seoImageTransform\":\"socialSharing\",\"canonicalUrlOverride\":\"\",\"twitterCardType\":\"summary_large_image\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"singleImageEntry\",\"seoTwitterImageId\":[\"11\"],\"seoTwitterImageTransform\":\"socialSharing\",\"openGraphType\":\"\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"singleImageEntry\",\"seoFacebookImageId\":[\"11\"],\"seoFacebookImageTransform\":\"socialSharing\",\"robots\":\"\"},\"103\":[\"11\"],\"104\":\"Lorem ipsum dolor sit amet, quas appetere qui te, vel ne enim putent tractatos, ullum inani et duo. Per placerat ocurreret te, eos diceret accumsan in? Qui no viderer vivendum facilisi, pro illud possim legimus at. Illum sonet numquam id vis. Ei accumsan nominati eos? Nam suas admodum ancillae ne? Nullam noster scribentur per cu, te duis consetetur adipiscing pri? Mollis deseruisse te mei. Cu euismod singulis suavitate eam. Ex eos purto similique, an eum fabellas adolescens! Dolor signiferumque cum id. Dicunt cetero detracto mea ei?\",\"102\":\"\"}}','2017-09-24 14:08:09','2017-09-24 14:08:09','8e6b37db-aa5e-4e10-8b68-75ee4dca50f5'),
	(7,120,5,1,'de',2,'','{\"typeId\":\"5\",\"authorId\":\"1\",\"title\":\"Welcome to Baukasten\",\"slug\":\"welcome\",\"postDate\":1506261780,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"3\":[\"122\"],\"100\":\"\",\"105\":{\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"WebPage\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoTitleUnparsed\":\"Welcome\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"singleIntroText\",\"seoDescriptionUnparsed\":\"An populo iriure interesset sit! Eum quas zril nostrum ei. Est no esse illum, falli doming vix no? No pri causae petentium! Id vocibus volutpat deterruisset\\u2026\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoKeywordsUnparsed\":\"\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"singleImageEntry\",\"seoImageId\":[\"11\"],\"seoImageTransform\":\"socialSharing\",\"canonicalUrlOverride\":\"\",\"twitterCardType\":\"summary_large_image\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"singleImageEntry\",\"seoTwitterImageId\":[\"11\"],\"seoTwitterImageTransform\":\"socialSharing\",\"openGraphType\":\"\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"singleImageEntry\",\"seoFacebookImageId\":[\"11\"],\"seoFacebookImageTransform\":\"socialSharing\",\"robots\":\"\"},\"103\":[\"11\"],\"104\":\"An populo iriure interesset sit! Eum quas zril nostrum ei. Est no esse illum, falli doming vix no? No pri causae petentium! Id vocibus volutpat deterruisset usu, vocibus verterem sed ne, usu ne similique temporibus! Ex vix dicat discere partiendo, at ignota corpora mei, posse percipitur mea ut. At doming commodo deseruisse sit, eu diceret fabulas eligendi vix, sea nostrum scriptorem ad! Quo cu eius tollit instructior.\",\"102\":\"\"}}','2017-09-24 14:08:30','2017-09-24 14:08:30','32585afe-840f-480b-9329-8ca11441714b'),
	(8,120,5,1,'de',3,'','{\"typeId\":\"5\",\"authorId\":\"1\",\"title\":\"Welcome to Baukasten\",\"slug\":\"welcome\",\"postDate\":1506261780,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"3\":[\"122\"],\"100\":\"\",\"105\":{\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"WebPage\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoTitleUnparsed\":\"Welcome\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"singleIntroText\",\"seoDescriptionUnparsed\":\"An populo iriure interesset sit! Eum quas zril nostrum ei. Est no esse illum, falli doming vix no? No pri causae petentium! Id vocibus volutpat deterruisset\\u2026\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoKeywordsUnparsed\":\"\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"singleImageEntry\",\"seoImageId\":[\"11\"],\"seoImageTransform\":\"socialSharing\",\"canonicalUrlOverride\":\"\",\"twitterCardType\":\"summary_large_image\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"singleImageEntry\",\"seoTwitterImageId\":[\"11\"],\"seoTwitterImageTransform\":\"socialSharing\",\"openGraphType\":\"\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"singleImageEntry\",\"seoFacebookImageId\":[\"11\"],\"seoFacebookImageTransform\":\"socialSharing\",\"robots\":\"\"},\"103\":[\"11\"],\"104\":\"An populo iriure interesset sit! Eum quas zril nostrum ei. Est no esse illum, falli doming vix no? No pri causae petentium! Id vocibus volutpat deterruisset usu, vocibus verterem sed ne, usu ne similique temporibus! Ex vix dicat discere partiendo, at ignota corpora mei, posse percipitur mea ut. At doming commodo deseruisse sit, eu diceret fabulas eligendi vix, sea nostrum scriptorem ad! Quo cu eius tollit instructior.\",\"102\":\"\"}}','2017-09-24 14:08:40','2017-09-24 14:08:40','3ed21f94-829f-410c-92c3-54e20207a33d'),
	(9,123,5,1,'de',1,'','{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Another News Example\",\"slug\":\"another-news-example\",\"postDate\":null,\"expiryDate\":null,\"enabled\":0,\"parentId\":null,\"fields\":{\"3\":[\"122\"],\"100\":\"\",\"105\":{\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"WebPage\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoTitleUnparsed\":\"\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"singleIntroText\",\"seoDescriptionUnparsed\":\"\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoKeywordsUnparsed\":\"\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"singleImageEntry\",\"seoImageId\":\"\",\"seoImageTransform\":\"socialSharing\",\"canonicalUrlOverride\":\"\",\"twitterCardType\":\"summary_large_image\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"singleImageEntry\",\"seoTwitterImageId\":\"\",\"seoTwitterImageTransform\":\"socialSharing\",\"openGraphType\":\"\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"singleImageEntry\",\"seoFacebookImageId\":\"\",\"seoFacebookImageTransform\":\"socialSharing\",\"robots\":\"\"},\"103\":[\"13\"],\"104\":\"Ex dico dolor vis, splendide vituperatoribus cu usu, ei mea posse sonet labores! Ad duo veritus intellegam, alterum appellantur vix et. Vis dissentiet repudiandae eu, decore integre principes per ei. Id vim stet mentitum repudiandae, pri mentitum qualisque ea, ex usu augue viderer suscipit. Ea vel mucius graecis, mentitum perfecto eu duo, duo eu ipsum urbanitas. Eruditi recteque abhorreant ius et, omnes dolore debitis vel ei? An inani copiosae nec, audiam sanctus nostrum est ea? Assum iuvaret mea id.\",\"102\":\"\"}}','2017-09-24 14:09:32','2017-09-24 14:09:32','5b98b5d5-0891-483e-9dd4-d6e340f7889c'),
	(10,123,5,1,'de',2,'','{\"typeId\":\"5\",\"authorId\":\"1\",\"title\":\"Another News Example\",\"slug\":\"another-news-example\",\"postDate\":1506262177,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"3\":[\"122\"],\"100\":\"\",\"105\":{\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"WebPage\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoTitleUnparsed\":\"Another News Example\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"singleIntroText\",\"seoDescriptionUnparsed\":\"Ex dico dolor vis, splendide vituperatoribus cu usu, ei mea posse sonet labores! Ad duo veritus intellegam, alterum appellantur vix et. Vis dissentiet\\u2026\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoKeywordsUnparsed\":\"\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"singleImageEntry\",\"seoImageId\":[\"13\"],\"seoImageTransform\":\"socialSharing\",\"canonicalUrlOverride\":\"\",\"twitterCardType\":\"summary_large_image\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"singleImageEntry\",\"seoTwitterImageId\":[\"13\"],\"seoTwitterImageTransform\":\"socialSharing\",\"openGraphType\":\"\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"singleImageEntry\",\"seoFacebookImageId\":[\"13\"],\"seoFacebookImageTransform\":\"socialSharing\",\"robots\":\"\"},\"103\":[\"13\"],\"104\":\"Ex dico dolor vis, splendide vituperatoribus cu usu, ei mea posse sonet labores! Ad duo veritus intellegam, alterum appellantur vix et. Vis dissentiet repudiandae eu, decore integre principes per ei. Id vim stet mentitum repudiandae, pri mentitum qualisque ea, ex usu augue viderer suscipit. Ea vel mucius graecis, mentitum perfecto eu duo, duo eu ipsum urbanitas. Eruditi recteque abhorreant ius et, omnes dolore debitis vel ei? An inani copiosae nec, audiam sanctus nostrum est ea? Assum iuvaret mea id.\",\"102\":\"\"}}','2017-09-24 14:09:37','2017-09-24 14:09:37','cf3cfd8e-fd95-42c4-9d71-17c41f9200ef'),
	(11,121,5,1,'de',5,'','{\"typeId\":\"5\",\"authorId\":\"1\",\"title\":\"Example News Entry\",\"slug\":\"example-news-entry\",\"postDate\":1506261840,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"3\":[\"122\"],\"100\":\"\",\"105\":{\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"WebPage\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoTitleUnparsed\":\"Example News Entry\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"singleIntroText\",\"seoDescriptionUnparsed\":\"Lorem ipsum dolor sit amet, quas appetere qui te, vel ne enim putent tractatos, ullum inani et duo. Per placerat ocurreret te, eos diceret accumsan in? Qui no\\u2026\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoKeywordsUnparsed\":\"\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"singleImageEntry\",\"seoImageId\":[\"11\"],\"seoImageTransform\":\"socialSharing\",\"canonicalUrlOverride\":\"\",\"twitterCardType\":\"summary_large_image\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"singleImageEntry\",\"seoTwitterImageId\":[\"11\"],\"seoTwitterImageTransform\":\"socialSharing\",\"openGraphType\":\"\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"singleImageEntry\",\"seoFacebookImageId\":[\"11\"],\"seoFacebookImageTransform\":\"socialSharing\",\"robots\":\"\"},\"103\":[\"12\"],\"104\":\"Lorem ipsum dolor sit amet, quas appetere qui te, vel ne enim putent tractatos, ullum inani et duo. Per placerat ocurreret te, eos diceret accumsan in? Qui no viderer vivendum facilisi, pro illud possim legimus at. Illum sonet numquam id vis. Ei accumsan nominati eos? Nam suas admodum ancillae ne? Nullam noster scribentur per cu, te duis consetetur adipiscing pri? Mollis deseruisse te mei. Cu euismod singulis suavitate eam. Ex eos purto similique, an eum fabellas adolescens! Dolor signiferumque cum id. Dicunt cetero detracto mea ei?\",\"102\":\"\"}}','2017-09-24 14:09:50','2017-09-24 14:09:50','5c94bdc0-f3cc-46fd-9f6e-69a2c048ebd2'),
	(12,119,6,1,'de',2,'','{\"typeId\":\"8\",\"authorId\":\"1\",\"title\":\"News\",\"slug\":\"news\",\"postDate\":1506261420,\"expiryDate\":null,\"enabled\":1,\"parentId\":\"\",\"fields\":{\"100\":\"\",\"106\":{\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"WebPage\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoTitleUnparsed\":\"News\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"singleIntroText\",\"seoDescriptionUnparsed\":\"\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoKeywordsUnparsed\":\"\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"singleImageEntry\",\"seoImageId\":\"\",\"seoImageTransform\":\"socialSharing\",\"canonicalUrlOverride\":\"\",\"twitterCardType\":\"summary_large_image\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"singleImageEntry\",\"seoTwitterImageId\":\"\",\"seoTwitterImageTransform\":\"socialSharing\",\"openGraphType\":\"\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"singleImageEntry\",\"seoFacebookImageId\":\"\",\"seoFacebookImageTransform\":\"socialSharing\",\"robots\":\"\"},\"103\":\"\",\"104\":\"\",\"102\":\"\"}}','2017-09-24 14:18:14','2017-09-24 14:18:14','7b43844c-c933-4e89-9080-8f7002e55878'),
	(13,119,6,1,'de',3,'','{\"typeId\":\"8\",\"authorId\":\"1\",\"title\":\"Articles\",\"slug\":\"articles\",\"postDate\":1506261420,\"expiryDate\":null,\"enabled\":1,\"parentId\":\"\",\"fields\":{\"100\":\"\",\"106\":{\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"WebPage\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoTitleUnparsed\":\"News\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"singleIntroText\",\"seoDescriptionUnparsed\":\"\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoKeywordsUnparsed\":\"\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"singleImageEntry\",\"seoImageId\":\"\",\"seoImageTransform\":\"socialSharing\",\"canonicalUrlOverride\":\"\",\"twitterCardType\":\"summary_large_image\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"singleImageEntry\",\"seoTwitterImageId\":\"\",\"seoTwitterImageTransform\":\"socialSharing\",\"openGraphType\":\"\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"singleImageEntry\",\"seoFacebookImageId\":\"\",\"seoFacebookImageTransform\":\"socialSharing\",\"robots\":\"\"},\"103\":\"\",\"104\":\"\",\"102\":\"\"}}','2017-11-11 16:55:20','2017-11-11 16:55:20','ff9530a3-87c4-4110-925e-5804a410111a');

/*!40000 ALTER TABLE `craft_entryversions` ENABLE KEYS */;
UNLOCK TABLES;


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
	(6,'Plugins','2017-04-16 22:48:51','2017-04-16 22:48:51','26e4cfd0-f271-47b0-848f-5c3d9b15aa3c'),
	(7,'Settings','2017-04-16 22:48:52','2017-04-16 22:48:52','d57d0bfc-cfa0-46ab-8f76-9b7e592f8db4'),
	(8,'Singles','2017-04-16 22:48:52','2017-04-16 22:48:52','b3b74b0a-8327-470a-b835-e2e815eedc2d'),
	(9,'Images','2017-10-17 22:12:40','2017-10-17 22:12:40','5efd0640-9776-41c4-8066-559735c96041');

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
	(263,142,178,50,0,1,'2017-04-19 22:01:54','2017-04-19 22:01:54','87f3b80d-b9e4-428b-acce-13207c617ada'),
	(396,185,226,53,0,1,'2017-07-11 05:23:58','2017-07-11 05:23:58','fa8e6b32-2d8e-438e-92aa-578b2061cb29'),
	(397,185,226,54,0,2,'2017-07-11 05:23:58','2017-07-11 05:23:58','ef9d2d02-0dd8-45fc-b500-6981f1718221'),
	(398,185,226,55,0,3,'2017-07-11 05:23:58','2017-07-11 05:23:58','70b116bb-7d8f-4098-8108-73d8309103da'),
	(399,185,226,109,0,4,'2017-07-11 05:23:58','2017-07-11 05:23:58','a7ae261a-28ca-4e29-9c1c-d79cd57c6b48'),
	(671,345,466,114,1,1,'2017-09-03 17:01:51','2017-09-03 17:01:51','6a445c8a-17f6-4f60-a24b-e176928d4fe0'),
	(672,345,466,115,0,2,'2017-09-03 17:01:51','2017-09-03 17:01:51','33c1bee1-7cd6-4814-9c8f-3a04ca8c4901'),
	(673,345,466,116,1,3,'2017-09-03 17:01:51','2017-09-03 17:01:51','60fc1a24-1dab-420e-b0cb-537ef0833670'),
	(674,346,467,113,0,1,'2017-09-03 17:01:51','2017-09-03 17:01:51','a4f13447-2bf5-4ece-beaf-90d8f346c4f3'),
	(678,349,470,118,0,1,'2017-09-03 22:18:26','2017-09-03 22:18:26','c86a8187-7016-4be4-b9a9-d7706333cf2b'),
	(679,350,471,121,1,1,'2017-09-03 23:13:41','2017-09-03 23:13:41','dfa7b4c2-522d-4a41-8c9a-a6fb20ceca80'),
	(680,350,471,119,1,2,'2017-09-03 23:13:41','2017-09-03 23:13:41','367aeb79-30d4-4aec-a4e9-e80c1acb9e5d'),
	(681,350,471,120,1,3,'2017-09-03 23:13:41','2017-09-03 23:13:41','04ac44fa-214b-48bd-9e8e-7c9e1be65661'),
	(682,351,472,4,0,1,'2017-09-04 13:52:53','2017-09-04 13:52:53','777a27e7-f349-49c1-9662-ddd6fd887f98'),
	(683,352,473,122,0,1,'2017-09-19 22:48:00','2017-09-19 22:48:00','1802d630-7003-48c4-a92f-7d31202e00f3'),
	(709,362,488,117,0,1,'2017-09-24 22:15:48','2017-09-24 22:15:48','179c7545-e1fb-44ca-9f01-306c4c32e6bc'),
	(790,412,563,38,0,1,'2017-10-17 21:54:36','2017-10-17 21:54:36','6dc69252-3323-4eba-85ca-3ce0cc4f3d65'),
	(791,413,564,33,0,1,'2017-10-17 21:55:50','2017-10-17 21:55:50','7c188198-e64a-4e36-b224-8b6c58a5bccd'),
	(849,448,617,86,0,1,'2017-10-17 22:05:08','2017-10-17 22:05:08','3260f023-6099-46dd-be87-daf6a86c2bdf'),
	(974,512,717,41,0,1,'2017-10-17 22:18:40','2017-10-17 22:18:40','9d10e1c0-0e0d-447a-b21e-fe82b5182079'),
	(975,512,717,42,0,2,'2017-10-17 22:18:40','2017-10-17 22:18:40','3e8144cd-56b0-464a-a508-7d2beb823f62'),
	(1016,535,754,102,0,1,'2017-11-11 16:36:57','2017-11-11 16:36:57','2355946a-d76e-41c6-9f0e-49214d8c4c9a'),
	(1017,535,754,104,0,2,'2017-11-11 16:36:57','2017-11-11 16:36:57','cb3bf14d-433c-4105-bbcf-0f61fe96fabe'),
	(1018,535,755,103,0,1,'2017-11-11 16:36:57','2017-11-11 16:36:57','8e254846-ccdc-4721-871e-604dc661e376'),
	(1019,535,756,31,0,1,'2017-11-11 16:36:57','2017-11-11 16:36:57','35c90937-0470-4914-99b3-53f41bb07a09'),
	(1020,536,757,102,0,1,'2017-11-11 16:38:03','2017-11-11 16:38:03','30cb5501-4d38-4144-b695-a03bd8d88d82'),
	(1021,536,757,104,0,2,'2017-11-11 16:38:03','2017-11-11 16:38:03','817b1846-e5fb-40bf-96bf-56b6f2282eff'),
	(1022,536,757,100,0,3,'2017-11-11 16:38:03','2017-11-11 16:38:03','5a215d06-eb8e-44fe-9b52-dac241943217'),
	(1023,536,758,103,0,1,'2017-11-11 16:38:03','2017-11-11 16:38:03','089ccbd4-bd7f-4c6e-a5ce-127457899389'),
	(1024,536,759,106,0,1,'2017-11-11 16:38:03','2017-11-11 16:38:03','e350497c-c9d1-4e53-8582-c705937b583b'),
	(1143,614,877,102,0,1,'2017-11-16 00:56:28','2017-11-16 00:56:28','69a96b67-a3e3-4bb6-a063-2dbf9e8c948a'),
	(1144,614,877,104,0,2,'2017-11-16 00:56:28','2017-11-16 00:56:28','566fccfa-d332-4db0-8b6a-b8c2b3d6e239'),
	(1145,614,877,100,0,3,'2017-11-16 00:56:28','2017-11-16 00:56:28','02c45233-b91b-42ce-bbaf-134854f43887'),
	(1146,614,878,103,0,1,'2017-11-16 00:56:28','2017-11-16 00:56:28','000e3125-bb28-4fe6-aa1c-133bf4f14eaf'),
	(1147,614,878,3,0,2,'2017-11-16 00:56:28','2017-11-16 00:56:28','760979a5-1a05-4bbc-91c5-fe20a49c9113'),
	(1148,614,879,105,0,1,'2017-11-16 00:56:28','2017-11-16 00:56:28','ba69fc44-3cda-4aca-987c-b28585a29fa5'),
	(1149,615,880,102,0,1,'2017-11-16 00:57:23','2017-11-16 00:57:23','08116b98-0032-4bc9-a354-aca9bedf3f4b'),
	(1150,615,880,104,0,2,'2017-11-16 00:57:23','2017-11-16 00:57:23','a67d0dca-5274-473b-99ee-1fa0cf879556'),
	(1151,615,880,100,0,3,'2017-11-16 00:57:23','2017-11-16 00:57:23','04987d62-e1b2-4cf5-ae72-7d29fdfcd57e'),
	(1152,615,881,103,0,1,'2017-11-16 00:57:23','2017-11-16 00:57:23','49ff9180-1004-499d-a447-b8a1ab574cbf'),
	(1153,615,882,106,0,1,'2017-11-16 00:57:23','2017-11-16 00:57:23','4753389e-1df3-4195-ab1d-5b6f40ee6074'),
	(1154,617,883,128,0,1,'2017-11-17 15:05:46','2017-11-17 15:05:46','c4c63507-09ed-4aa4-83fb-58317aa70691'),
	(1155,617,883,127,0,2,'2017-11-17 15:05:46','2017-11-17 15:05:46','be70618f-94a0-4530-8970-5d9873c697cb'),
	(1156,617,883,129,0,3,'2017-11-17 15:05:46','2017-11-17 15:05:46','38f6c1f9-1901-4650-92b5-92cbfb3f468d'),
	(1157,617,883,130,0,4,'2017-11-17 15:05:46','2017-11-17 15:05:46','bd526a29-3a31-40e5-93be-976617d15ac3'),
	(1158,617,883,47,0,5,'2017-11-17 15:05:46','2017-11-17 15:05:46','676c82cd-b94d-4bcd-a6bc-217d84fa6d77'),
	(1159,617,883,101,0,6,'2017-11-17 15:05:46','2017-11-17 15:05:46','4c31b3d9-f7f1-4386-a56c-475c5efc0f0d'),
	(1160,617,883,131,0,7,'2017-11-17 15:05:46','2017-11-17 15:05:46','65c40762-7818-4081-8dfc-c52615681c82'),
	(1161,618,884,128,0,1,'2017-11-17 15:05:54','2017-11-17 15:05:54','d8954fce-f14e-4f1a-afcd-edd6074366f2'),
	(1162,618,884,127,0,2,'2017-11-17 15:05:54','2017-11-17 15:05:54','d5600103-88a4-458e-8bd9-d6d7e6d0c7a7'),
	(1163,618,884,129,0,3,'2017-11-17 15:05:54','2017-11-17 15:05:54','92b97a5b-da25-4523-80b2-8a0cfd0b3908'),
	(1164,618,884,130,0,4,'2017-11-17 15:05:54','2017-11-17 15:05:54','8ffb0ee7-05eb-4bbf-9564-3d555c2a0591'),
	(1165,618,884,47,0,5,'2017-11-17 15:05:54','2017-11-17 15:05:54','4208ae73-bf56-451b-822e-e867e5751855'),
	(1166,618,884,101,0,6,'2017-11-17 15:05:54','2017-11-17 15:05:54','53f9ff68-4919-4ddc-a28a-0d6955e97410'),
	(1167,618,884,131,0,7,'2017-11-17 15:05:54','2017-11-17 15:05:54','372360fc-776c-4981-bc43-7c28f36f9254'),
	(1168,619,885,128,0,1,'2017-11-17 15:05:59','2017-11-17 15:05:59','af6383cd-98a6-4bcd-a655-e985804055a2'),
	(1169,619,885,127,0,2,'2017-11-17 15:05:59','2017-11-17 15:05:59','c9c1fe28-6ccc-4b64-a18e-293c651fd2e2'),
	(1170,619,885,129,0,3,'2017-11-17 15:05:59','2017-11-17 15:05:59','aa972162-3886-47a2-a81e-c9beae1e5716'),
	(1171,619,885,130,0,4,'2017-11-17 15:05:59','2017-11-17 15:05:59','c704b22d-d018-4f08-9e3e-5be06934f2cd'),
	(1172,619,885,47,0,5,'2017-11-17 15:05:59','2017-11-17 15:05:59','a4118581-5905-4c0a-ba20-2f7c8bc37624'),
	(1173,619,885,101,0,6,'2017-11-17 15:05:59','2017-11-17 15:05:59','72a6341e-15d6-45a4-a3ce-47b8616ca8e7'),
	(1174,619,885,131,0,7,'2017-11-17 15:05:59','2017-11-17 15:05:59','8fbf3cf1-9546-48eb-9049-57ccb31142bc'),
	(1175,620,886,128,0,1,'2017-11-17 15:06:04','2017-11-17 15:06:04','2d8c2cd3-dd03-46a1-b39f-910f195d1798'),
	(1176,620,886,127,0,2,'2017-11-17 15:06:04','2017-11-17 15:06:04','cfabb9d3-8da0-4854-a14a-cbb6f030562a'),
	(1177,620,886,129,0,3,'2017-11-17 15:06:04','2017-11-17 15:06:04','ee2d18d6-6774-4422-ba84-d0a7e1763ccb'),
	(1178,620,886,130,0,4,'2017-11-17 15:06:04','2017-11-17 15:06:04','b79e2459-7e36-4d4d-b9c1-494c8cce7320'),
	(1179,620,886,47,0,5,'2017-11-17 15:06:04','2017-11-17 15:06:04','32648b5e-959c-4d6c-9923-90d5f5facc39'),
	(1180,620,886,101,0,6,'2017-11-17 15:06:04','2017-11-17 15:06:04','ffe39f63-9850-4ac1-bdd4-229f6a4f932c'),
	(1181,620,886,131,0,7,'2017-11-17 15:06:04','2017-11-17 15:06:04','aeccff07-1e7c-491a-838a-38ba5221da97'),
	(1182,621,887,79,0,1,'2017-11-19 22:48:55','2017-11-19 22:48:55','430cdfa0-5c17-46fa-a15b-9fc86937c59e'),
	(1183,621,887,80,0,2,'2017-11-19 22:48:55','2017-11-19 22:48:55','04d28fbd-0331-41f6-b618-a8388d48afc2'),
	(1184,622,888,45,0,1,'2017-11-19 22:51:37','2017-11-19 22:51:37','dac0e709-5f7e-4a20-af1b-2717474acef8'),
	(1185,622,888,46,0,2,'2017-11-19 22:51:37','2017-11-19 22:51:37','92f7ebe2-4c15-4e40-b003-cf8edb50f748'),
	(1186,623,889,59,0,1,'2017-11-19 23:00:56','2017-11-19 23:00:56','c1ee0a5c-46ee-46bb-8220-3b5487bc5128'),
	(1187,624,890,61,0,1,'2017-11-19 23:02:00','2017-11-19 23:02:00','6fa86408-32fc-4f16-93c1-ee42b206cc69'),
	(1188,624,890,62,0,2,'2017-11-19 23:02:00','2017-11-19 23:02:00','235684ac-1081-4861-8958-b2a897615861'),
	(1189,624,890,63,0,3,'2017-11-19 23:02:00','2017-11-19 23:02:00','56495dde-e617-4fcf-91ab-3651f303e913'),
	(1198,627,893,70,0,1,'2017-11-19 23:36:46','2017-11-19 23:36:46','20d842f3-2931-43b9-8718-7428fd31b965'),
	(1199,628,894,65,0,1,'2017-11-19 23:48:00','2017-11-19 23:48:00','3e7ee08b-b73f-402b-a50e-9f4967e2b906'),
	(1200,628,894,66,0,2,'2017-11-19 23:48:00','2017-11-19 23:48:00','c4dd8965-c4b3-4bc4-8e30-8f3f7ff98bbe'),
	(1201,628,894,67,0,3,'2017-11-19 23:48:00','2017-11-19 23:48:00','e0653d3d-ca5e-4fe3-8e16-a7550f919820'),
	(1202,628,894,68,0,4,'2017-11-19 23:48:00','2017-11-19 23:48:00','e448c5c6-eb06-4d2c-bee0-c912da9277e8'),
	(1415,767,1106,73,0,1,'2017-12-02 02:20:07','2017-12-02 02:20:07','a774c9e7-e551-4deb-94d9-c1b4bc938ec5'),
	(1416,769,1108,93,0,1,'2017-12-02 02:20:07','2017-12-02 02:20:07','6bf26fc2-841a-45cb-9133-98f76cb8edcd'),
	(1417,770,1109,90,0,1,'2017-12-02 02:20:07','2017-12-02 02:20:07','82fe04c5-4722-444f-a055-49d3a6142789'),
	(1418,770,1110,48,0,1,'2017-12-02 02:20:07','2017-12-02 02:20:07','3831c3fb-9965-4047-abb6-2d3cf32c34b3'),
	(1419,771,1111,95,0,1,'2017-12-02 02:20:07','2017-12-02 02:20:07','d8f55565-415d-4849-9175-425409935c26'),
	(1420,772,1112,132,0,1,'2017-12-02 02:20:07','2017-12-02 02:20:07','ccdf8d0d-4a47-4157-8fec-533308faa46e'),
	(1421,773,1113,95,0,1,'2017-12-02 02:20:07','2017-12-02 02:20:07','41476f67-4582-4497-81bc-9435eaffd1ad'),
	(1422,775,1114,91,0,1,'2017-12-02 02:20:07','2017-12-02 02:20:07','94016181-0437-42a1-a205-fa8182f7662e'),
	(1423,775,1115,64,0,1,'2017-12-02 02:20:07','2017-12-02 02:20:07','2a1f55da-29da-4f41-886a-c05f6e3f56b0'),
	(1424,776,1116,94,0,1,'2017-12-02 02:20:07','2017-12-02 02:20:07','ea334c04-f8ab-45b1-87f7-9e6bf3c0366f'),
	(1425,776,1116,96,0,2,'2017-12-02 02:20:07','2017-12-02 02:20:07','a36765f5-11ad-4ea1-94b8-3c72c150dc7f'),
	(1426,776,1116,97,0,3,'2017-12-02 02:20:07','2017-12-02 02:20:07','0ffce8ab-cbfe-433a-b35a-77294f2b107f'),
	(1427,777,1117,88,0,1,'2017-12-02 02:20:07','2017-12-02 02:20:07','2efe962c-80e4-4f0a-b51f-5651b73ff830'),
	(1428,777,1118,40,0,1,'2017-12-02 02:20:07','2017-12-02 02:20:07','ba3b75d3-af67-4cd0-a577-87b1b740e624'),
	(1429,778,1119,91,0,1,'2017-12-02 02:20:07','2017-12-02 02:20:07','f4493108-7f85-4f48-97d8-fca1eb48b4b0'),
	(1430,778,1119,99,0,2,'2017-12-02 02:20:07','2017-12-02 02:20:07','27ed1893-b50b-4b52-9439-dd2c5bb38c7c'),
	(1431,778,1120,52,0,1,'2017-12-02 02:20:07','2017-12-02 02:20:07','6e7804a2-6348-44ca-b438-515cfd53eb02'),
	(1432,779,1121,92,0,1,'2017-12-02 02:20:07','2017-12-02 02:20:07','4218f60f-2434-4d09-ac52-eea3cfb7d673'),
	(1433,779,1122,56,0,1,'2017-12-02 02:20:07','2017-12-02 02:20:07','473f0aec-c1a0-4ed4-986b-19334bda720a'),
	(1434,780,1123,92,0,1,'2017-12-02 02:20:07','2017-12-02 02:20:07','186bb401-61a4-491a-bdb9-43ccea295b4a'),
	(1435,780,1124,60,0,1,'2017-12-02 02:20:07','2017-12-02 02:20:07','2ee9f8d2-1c46-4812-9972-405bdebe4ae7'),
	(1436,781,1125,91,0,1,'2017-12-02 02:20:07','2017-12-02 02:20:07','e78afca4-ba5f-4a61-b950-98eab825e5d8'),
	(1437,781,1126,64,0,1,'2017-12-02 02:20:07','2017-12-02 02:20:07','3ae97db7-34d9-4601-8556-6b9314db85b9'),
	(1438,782,1127,92,0,1,'2017-12-02 02:20:07','2017-12-02 02:20:07','1e817606-f169-49c1-a2b0-1497462526fd'),
	(1439,782,1128,69,0,1,'2017-12-02 02:20:07','2017-12-02 02:20:07','44898882-97f5-4241-a2ed-64b4acfe8c5e'),
	(1440,783,1129,89,0,1,'2017-12-02 02:20:07','2017-12-02 02:20:07','4640a953-8307-4704-b83a-843920262476'),
	(1441,783,1130,43,0,1,'2017-12-02 02:20:07','2017-12-02 02:20:07','0f8d4521-f5a2-451e-bdce-4b8c5a21353c'),
	(1442,784,1132,77,0,1,'2017-12-02 02:20:07','2017-12-02 02:20:07','2846614c-e398-4e16-bb7f-270f3f8f25a8'),
	(1443,785,1133,75,0,1,'2017-12-02 21:13:29','2017-12-02 21:13:29','8de6c912-dd77-41ee-9825-9b11aceae172'),
	(1444,785,1133,76,0,2,'2017-12-02 21:13:29','2017-12-02 21:13:29','ac71a4a2-c5f3-4b48-bc8e-ab146061b1c6'),
	(1445,785,1133,133,0,3,'2017-12-02 21:13:29','2017-12-02 21:13:29','a4bdef58-15f3-4c1e-95f7-c1c94a5d349c'),
	(1446,786,1134,102,0,1,'2017-12-02 21:48:30','2017-12-02 21:48:30','a48186d5-93d6-4269-9def-efc450ffe1aa'),
	(1447,786,1134,104,0,2,'2017-12-02 21:48:30','2017-12-02 21:48:30','18aaa6a1-cf31-454e-988e-7081ef479981'),
	(1448,786,1134,100,0,3,'2017-12-02 21:48:30','2017-12-02 21:48:30','286f9bff-27cd-4279-8ec5-e245feee6cf1'),
	(1449,786,1135,103,0,1,'2017-12-02 21:48:30','2017-12-02 21:48:30','5cbd2ab4-fdc6-4930-8a79-8f142f2813b3'),
	(1450,787,1136,102,0,1,'2017-12-02 21:50:32','2017-12-02 21:50:32','cc941885-ad7a-4847-8966-55db39ab182f'),
	(1451,787,1136,104,0,2,'2017-12-02 21:50:32','2017-12-02 21:50:32','73a5e1dd-71b2-4695-baf1-b240f8bde9e9'),
	(1452,787,1136,100,0,3,'2017-12-02 21:50:32','2017-12-02 21:50:32','5db6db36-4a6e-4c34-9116-a542ec44b14f'),
	(1453,787,1137,103,0,1,'2017-12-02 21:50:32','2017-12-02 21:50:32','682d9a9b-c551-4259-a6d9-ceb2d35b62d3');

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
	(142,'SuperTable_Block','2017-04-19 22:01:54','2017-04-19 22:01:54','a61eef88-4be8-4159-bd7d-d8e39d8ae1d1'),
	(185,'SuperTable_Block','2017-07-11 05:23:58','2017-07-11 05:23:58','bdf780bd-a8f4-4ddb-8786-39b133c270bc'),
	(345,'SuperTable_Block','2017-09-03 17:01:51','2017-09-03 17:01:51','0a4f4f34-fcd5-4a8b-a045-cfe778297e8c'),
	(346,'GlobalSet','2017-09-03 17:01:51','2017-09-03 17:01:51','5e89a7c0-e959-45e0-ad0e-06660c9accfe'),
	(349,'GlobalSet','2017-09-03 22:18:26','2017-09-03 22:18:26','978c49c1-323f-4289-aa67-2924328be7b1'),
	(350,'SuperTable_Block','2017-09-03 23:13:41','2017-09-03 23:13:41','b2d47e2f-81d8-4edc-9793-48a85a895818'),
	(351,'GlobalSet','2017-09-04 13:52:53','2017-09-04 13:52:53','d8d6c3b7-2395-4779-86fb-49b5a61cf3a3'),
	(352,'GlobalSet','2017-09-19 22:48:00','2017-09-19 22:48:00','258e09de-7a5c-43c6-b01d-ac524a37a1d2'),
	(362,'GlobalSet','2017-09-24 22:15:48','2017-09-24 22:15:48','83801cf4-1d9f-4553-95d3-9b7d5e1ed1f2'),
	(412,'SuperTable_Block','2017-10-17 21:54:36','2017-10-17 21:54:36','4689e44b-b146-4b8f-989b-e6b7e57a74f1'),
	(413,'SuperTable_Block','2017-10-17 21:55:50','2017-10-17 21:55:50','d64a6dd2-9c42-42a0-917a-61605d4420cd'),
	(448,'SuperTable_Block','2017-10-17 22:05:08','2017-10-17 22:05:08','db8889ba-f07f-4d1e-b65e-66fc4565dff3'),
	(512,'SuperTable_Block','2017-10-17 22:18:40','2017-10-17 22:18:40','07ba55ec-0bc9-401e-aa74-6c99de26c251'),
	(535,'Entry','2017-11-11 16:36:57','2017-11-11 16:36:57','d0f50fe4-be61-4c3c-999e-8685e31e6499'),
	(536,'Entry','2017-11-11 16:38:03','2017-11-11 16:38:03','1668254c-cd30-4fba-a615-d04ce00de0ec'),
	(614,'Entry','2017-11-16 00:56:28','2017-11-16 00:56:28','1117f5ca-830b-4d3d-98f4-465ceaf9a562'),
	(615,'Entry','2017-11-16 00:57:23','2017-11-16 00:57:23','5da24398-82b2-4831-8b20-459ed7435bbc'),
	(616,'Category','2017-11-16 01:40:24','2017-11-16 01:40:24','9896ce71-2135-4908-ab6c-7782fdb6023f'),
	(617,'Asset','2017-11-17 15:05:46','2017-11-17 15:05:46','fdbcdcac-ae9b-4c78-99ab-453b8fd37465'),
	(618,'Asset','2017-11-17 15:05:54','2017-11-17 15:05:54','b7a4e9d4-d108-44d9-bf81-485eff9e6e0d'),
	(619,'Asset','2017-11-17 15:05:59','2017-11-17 15:05:59','def35a01-b726-4e5a-a924-12464aa99e82'),
	(620,'Asset','2017-11-17 15:06:04','2017-11-17 15:06:04','e898e9d9-19ef-46d9-9a8e-9436ae3ac224'),
	(621,'SuperTable_Block','2017-11-19 22:48:55','2017-11-19 22:48:55','3f9ded68-3d7f-4f5f-8784-b003f65f83b1'),
	(622,'SuperTable_Block','2017-11-19 22:51:37','2017-11-19 22:51:37','581da9a2-502b-410a-b980-f890d124ba0e'),
	(623,'SuperTable_Block','2017-11-19 23:00:56','2017-11-19 23:00:56','470adc46-0cb9-47de-ab69-752f9128e8e2'),
	(624,'SuperTable_Block','2017-11-19 23:02:00','2017-11-19 23:02:00','9250ca27-803b-4ab5-9ec3-021ebfa9dd03'),
	(627,'SuperTable_Block','2017-11-19 23:36:46','2017-11-19 23:36:46','1d7b9637-6b4b-459e-bbdf-c6df043c452b'),
	(628,'SuperTable_Block','2017-11-19 23:48:00','2017-11-19 23:48:00','9b8298b2-f462-41d7-967f-7f813c8a1e1b'),
	(767,'Neo_Block','2017-12-02 02:20:07','2017-12-02 02:20:07','10824c5c-d5e6-4149-8c7b-1610c8329a77'),
	(768,'Neo_Block','2017-12-02 02:20:07','2017-12-02 02:20:07','4270f071-08d8-4fbb-9999-47f6ee599ee9'),
	(769,'Neo_Block','2017-12-02 02:20:07','2017-12-02 02:20:07','78ed051b-4c38-43de-a5ce-3c327a2e310f'),
	(770,'Neo_Block','2017-12-02 02:20:07','2017-12-02 02:20:07','6a407c04-7ae1-42b6-b683-bd5445811efe'),
	(771,'Neo_Block','2017-12-02 02:20:07','2017-12-02 02:20:07','3cc73764-7807-4a2c-b4c2-e40c2cb9afea'),
	(772,'Neo_Block','2017-12-02 02:20:07','2017-12-02 02:20:07','379f8a87-da24-4c07-b9b7-a419c17eb898'),
	(773,'Neo_Block','2017-12-02 02:20:07','2017-12-02 02:20:07','26775e12-44f2-464a-9763-c70e3367b8e7'),
	(774,'Neo_Block','2017-12-02 02:20:07','2017-12-02 02:20:07','3c3a5669-73fc-407e-9521-00864f73187b'),
	(775,'Neo_Block','2017-12-02 02:20:07','2017-12-02 02:20:07','b80e9f89-6d1a-480b-a808-731d1cc4842c'),
	(776,'Neo_Block','2017-12-02 02:20:07','2017-12-02 02:20:07','1f402e74-09d4-4b5f-8f87-302158a1f7c2'),
	(777,'Neo_Block','2017-12-02 02:20:07','2017-12-02 02:20:07','1e71bf01-40f2-4b41-8bda-6613a72ef2ba'),
	(778,'Neo_Block','2017-12-02 02:20:07','2017-12-02 02:20:07','45a2efdd-da74-4be0-850c-a709d54a82ed'),
	(779,'Neo_Block','2017-12-02 02:20:07','2017-12-02 02:20:07','93b26fe5-5b96-4f45-94e6-7ebbd8de7f7b'),
	(780,'Neo_Block','2017-12-02 02:20:07','2017-12-02 02:20:07','31abafad-fbf5-407d-90a1-7ee527e4f9cf'),
	(781,'Neo_Block','2017-12-02 02:20:07','2017-12-02 02:20:07','bb5dd66e-faa8-40e1-9ee2-e17196d95e0b'),
	(782,'Neo_Block','2017-12-02 02:20:07','2017-12-02 02:20:07','9916e9f8-c257-4215-ae65-4bfd8c119ab5'),
	(783,'Neo_Block','2017-12-02 02:20:07','2017-12-02 02:20:07','3562dfed-3f8e-4155-bb58-df5e9c3983d0'),
	(784,'Neo_Block','2017-12-02 02:20:07','2017-12-02 02:20:07','8971b59b-0d9c-4285-850e-5adb23aacf93'),
	(785,'SuperTable_Block','2017-12-02 21:13:29','2017-12-02 21:13:29','c7911b20-9eef-454c-bdf4-ce7fdc978b0b'),
	(786,'Entry','2017-12-02 21:48:30','2017-12-02 21:48:30','1076ba2c-3d72-4407-92ba-7db98cc97552'),
	(787,'Entry','2017-12-02 21:50:32','2017-12-02 21:50:32','b72b5e6b-2988-413c-b55f-c7f12e844f51');

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
	(178,142,'Content',1,'2017-04-19 22:01:54','2017-04-19 22:01:54','5e88fbf7-4853-4ef5-8910-c7b7292c0fce'),
	(226,185,'Content',1,'2017-07-11 05:23:58','2017-07-11 05:23:58','c93aa4dc-3b17-4e8b-ba11-3416d0c509a9'),
	(466,345,'Content',1,'2017-09-03 17:01:51','2017-09-03 17:01:51','c21293ca-e289-4c10-8b04-1383932a4375'),
	(467,346,'Content',1,'2017-09-03 17:01:51','2017-09-03 17:01:51','e74c11e9-4aa2-495c-9c2a-93e4d1c5c08c'),
	(470,349,'Content',1,'2017-09-03 22:18:26','2017-09-03 22:18:26','e8455e7d-5502-4f52-bc2d-98538e3573da'),
	(471,350,'Content',1,'2017-09-03 23:13:41','2017-09-03 23:13:41','2105440f-61e1-44b6-92a5-c914e0449d78'),
	(472,351,'Content',1,'2017-09-04 13:52:53','2017-09-04 13:52:53','49df5d86-3752-4e36-8564-df3035cecaed'),
	(473,352,'Content',1,'2017-09-19 22:48:00','2017-09-19 22:48:00','90e0cfa4-456a-40e4-97bb-0924c72f8ee8'),
	(488,362,'Content',1,'2017-09-24 22:15:48','2017-09-24 22:15:48','d4d32474-c128-4f13-8143-8d7f93de4248'),
	(563,412,'Content',1,'2017-10-17 21:54:36','2017-10-17 21:54:36','0b153c9f-fd25-461c-bdcd-e0b69050c160'),
	(564,413,'Content',1,'2017-10-17 21:55:50','2017-10-17 21:55:50','935b95ab-2549-4334-bf5f-d36510032824'),
	(617,448,'Content',1,'2017-10-17 22:05:08','2017-10-17 22:05:08','01fc925c-7d25-4678-90ce-0cdfd7e4e89c'),
	(717,512,'Content',1,'2017-10-17 22:18:40','2017-10-17 22:18:40','edb17a97-9697-45d9-84d8-e237d2fa5952'),
	(754,535,'Content',1,'2017-11-11 16:36:57','2017-11-11 16:36:57','c2f85ac9-146c-4d1e-ba70-9c496545c439'),
	(755,535,'Meta',2,'2017-11-11 16:36:57','2017-11-11 16:36:57','193e3f8e-7a33-4935-8ad4-85bf83c1557b'),
	(756,535,'SEO',3,'2017-11-11 16:36:57','2017-11-11 16:36:57','167a6884-bfbe-468e-ade6-41b85af2d693'),
	(757,536,'Content',1,'2017-11-11 16:38:03','2017-11-11 16:38:03','f78234f1-892b-442b-8362-2f42e15796c5'),
	(758,536,'Meta',2,'2017-11-11 16:38:03','2017-11-11 16:38:03','80fc09e6-21c3-4404-8099-e061e6f18d78'),
	(759,536,'SEO',3,'2017-11-11 16:38:03','2017-11-11 16:38:03','287f2c0e-07d4-478b-9eae-0ee3e8ab43eb'),
	(877,614,'Content Neo',1,'2017-11-16 00:56:28','2017-11-16 00:56:28','e0f14026-f51a-4dae-a4b8-4869a9edb48f'),
	(878,614,'Meta',2,'2017-11-16 00:56:28','2017-11-16 00:56:28','9befe4c5-2df0-4b7a-b0c8-5fb4c4de2a8b'),
	(879,614,'SEO',3,'2017-11-16 00:56:28','2017-11-16 00:56:28','f1dd0831-4f2e-4c1f-adef-4bc6effea2f7'),
	(880,615,'Content',1,'2017-11-16 00:57:23','2017-11-16 00:57:23','93474512-40c1-4ef6-ae84-7ac43b451378'),
	(881,615,'Meta',2,'2017-11-16 00:57:23','2017-11-16 00:57:23','52617256-c18e-4f60-8f48-8fe64deeec25'),
	(882,615,'SEO',3,'2017-11-16 00:57:23','2017-11-16 00:57:23','e23616d2-13b6-44d8-8792-264ad0afe3f6'),
	(883,617,'Content',1,'2017-11-17 15:05:46','2017-11-17 15:05:46','8c5f0813-a217-441f-8303-a21599c9a75f'),
	(884,618,'Content',1,'2017-11-17 15:05:54','2017-11-17 15:05:54','bdce94a7-06e9-497a-bfd5-6898fc3b21c3'),
	(885,619,'Content',1,'2017-11-17 15:05:59','2017-11-17 15:05:59','e7f962d5-d307-49bd-ac46-b73f76e9c717'),
	(886,620,'Content',1,'2017-11-17 15:06:04','2017-11-17 15:06:04','656b034f-e8c8-4868-bec7-38e371752693'),
	(887,621,'Content',1,'2017-11-19 22:48:55','2017-11-19 22:48:55','10ed248a-5d61-40c9-9873-9adee7012dde'),
	(888,622,'Content',1,'2017-11-19 22:51:37','2017-11-19 22:51:37','a05a6bff-2f9a-4ab7-8113-fbcabba6fd3c'),
	(889,623,'Content',1,'2017-11-19 23:00:56','2017-11-19 23:00:56','98f3d5cd-9bf1-44c5-b5a0-8e5cad0ecb91'),
	(890,624,'Content',1,'2017-11-19 23:02:00','2017-11-19 23:02:00','aec864a5-93d2-4787-8d23-d3cd0ceaa066'),
	(893,627,'Content',1,'2017-11-19 23:36:46','2017-11-19 23:36:46','b609d08d-da2e-4716-b96f-7e6dc09d83a6'),
	(894,628,'Content',1,'2017-11-19 23:48:00','2017-11-19 23:48:00','e138bcaa-ecc5-4b72-83ab-67b719f6593a'),
	(1105,767,'Content',1,'2017-12-02 02:20:07','2017-12-02 02:20:07','165ac669-74c5-4cb3-a62a-83c085cb0fd0'),
	(1106,767,'Settings',2,'2017-12-02 02:20:07','2017-12-02 02:20:07','ef98d721-e835-405c-9e7d-050df1721b0e'),
	(1107,768,'Content',1,'2017-12-02 02:20:07','2017-12-02 02:20:07','f5bdf313-8214-4eb6-8ca0-7c6312354753'),
	(1108,769,'Content',1,'2017-12-02 02:20:07','2017-12-02 02:20:07','b5de6ba0-f420-49c1-b214-f967a969b675'),
	(1109,770,'Content',1,'2017-12-02 02:20:07','2017-12-02 02:20:07','b715d9ca-78c8-4f45-b08e-f89c556154ca'),
	(1110,770,'Settings',2,'2017-12-02 02:20:07','2017-12-02 02:20:07','9325052b-c27f-4f07-a28c-a2bd67378fb8'),
	(1111,771,'Content',1,'2017-12-02 02:20:07','2017-12-02 02:20:07','ba6e3572-703c-4e09-a12a-6cf5a11265fb'),
	(1112,772,'Tab 1',1,'2017-12-02 02:20:07','2017-12-02 02:20:07','45832635-eecd-4136-8f70-fbc1ddd599b4'),
	(1113,773,'Content',1,'2017-12-02 02:20:07','2017-12-02 02:20:07','c9c5f7c2-5837-48c7-b9c7-2f8aada10c6f'),
	(1114,775,'Content',1,'2017-12-02 02:20:07','2017-12-02 02:20:07','427edb00-bb9e-47bf-987d-61d1558f8cf2'),
	(1115,775,'Settings',2,'2017-12-02 02:20:07','2017-12-02 02:20:07','ceb36b30-0128-40b1-ad3f-88b42cf9c6ee'),
	(1116,776,'Content',1,'2017-12-02 02:20:07','2017-12-02 02:20:07','fd0e0e35-0cbd-44a8-b800-43d088a9a959'),
	(1117,777,'Content',1,'2017-12-02 02:20:07','2017-12-02 02:20:07','ee6a0929-592d-495c-83b0-902989574e85'),
	(1118,777,'Settings',2,'2017-12-02 02:20:07','2017-12-02 02:20:07','5e19c382-442d-414c-ad24-bbd25a5856cb'),
	(1119,778,'Content',1,'2017-12-02 02:20:07','2017-12-02 02:20:07','05cf71e5-01f0-4543-adaa-63fce8c31e23'),
	(1120,778,'Settings',2,'2017-12-02 02:20:07','2017-12-02 02:20:07','ff70b6b1-f05c-4cd1-b5c0-e055c53ce93e'),
	(1121,779,'Content',1,'2017-12-02 02:20:07','2017-12-02 02:20:07','561c3043-01ea-4985-a680-25edc5b4712d'),
	(1122,779,'Settings',2,'2017-12-02 02:20:07','2017-12-02 02:20:07','e2299720-6ee6-4fb1-85a2-0f2f5d99521c'),
	(1123,780,'Content',1,'2017-12-02 02:20:07','2017-12-02 02:20:07','1726347a-1bfe-42d1-b918-36febaf68118'),
	(1124,780,'Settings',2,'2017-12-02 02:20:07','2017-12-02 02:20:07','34e10518-5ccd-4882-ab7a-008b892ee2e8'),
	(1125,781,'Content',1,'2017-12-02 02:20:07','2017-12-02 02:20:07','04b958db-11bf-4f3a-a767-ce81c4faef72'),
	(1126,781,'Settings',2,'2017-12-02 02:20:07','2017-12-02 02:20:07','de7a3272-a340-44da-995b-8e56612aa0c1'),
	(1127,782,'Content',1,'2017-12-02 02:20:07','2017-12-02 02:20:07','c56b9cfd-7e90-40ae-9756-6839e01c22f4'),
	(1128,782,'Settings',2,'2017-12-02 02:20:07','2017-12-02 02:20:07','5fcccb46-c15d-4aad-9ead-4ec47379580d'),
	(1129,783,'Content',1,'2017-12-02 02:20:07','2017-12-02 02:20:07','b93109c0-7c24-4fd4-ba49-b09f3215ee66'),
	(1130,783,'Settings',2,'2017-12-02 02:20:07','2017-12-02 02:20:07','f340cb1a-2e23-4232-a2c6-5e3e5e00368a'),
	(1131,784,'Content',1,'2017-12-02 02:20:07','2017-12-02 02:20:07','03c9fe23-83bf-48e3-a689-9f255b8c5cdf'),
	(1132,784,'Settings',2,'2017-12-02 02:20:07','2017-12-02 02:20:07','f97be4cc-54c0-4b1b-81dc-7b5ca7450da8'),
	(1133,785,'Content',1,'2017-12-02 21:13:29','2017-12-02 21:13:29','cd625787-52c3-4590-bb56-bd1fbf05fd66'),
	(1134,786,'Content',1,'2017-12-02 21:48:30','2017-12-02 21:48:30','4837aa31-bff4-46b0-82af-e993ae42401e'),
	(1135,786,'Meta',2,'2017-12-02 21:48:30','2017-12-02 21:48:30','98465a59-bf89-445f-a33c-69379c3b617e'),
	(1136,787,'Content',1,'2017-12-02 21:50:32','2017-12-02 21:50:32','602def69-816d-4f94-9eff-14397f1ecddb'),
	(1137,787,'Meta',2,'2017-12-02 21:50:32','2017-12-02 21:50:32','d63a55c6-6ac8-40ed-85e2-ccacbdc35cc4');

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
	(3,2,'Category: Topics','categoryTopics','global','',0,'Categories','{\"source\":\"group:1\",\"limit\":\"\",\"selectionLabel\":\"\"}','2017-04-16 22:48:52','2017-11-11 16:48:34','f99eb1e1-cf4f-4c6a-a6a9-c0b670f178eb'),
	(4,4,'Global: Contact','globalContact','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"},\"new4\":{\"width\":\"\"},\"new5\":{\"width\":\"\"},\"new6\":{\"width\":\"\"},\"new7\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":1,\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-04-16 22:48:52','2017-04-16 22:48:52','775a80e1-a6c7-45e3-9b73-28c6c4af82bd'),
	(5,NULL,'Company','company','superTableBlockType:1','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:52','2017-04-16 22:48:52','2057f1f5-4c1a-47b6-93a6-cba4928e37f4'),
	(6,NULL,'Street','street','superTableBlockType:1','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:52','2017-04-16 22:48:52','ae9276a2-45c6-416e-912a-40b6138d5295'),
	(7,NULL,'Postal Code','postalCode','superTableBlockType:1','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:52','2017-04-16 22:48:52','700b3fab-6c34-4d52-91e3-7040a2b924c4'),
	(8,NULL,'Location','location','superTableBlockType:1','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:52','2017-04-16 22:48:52','dd655459-562b-407b-b61f-01b6e4769cdc'),
	(9,NULL,'Mail','mail','superTableBlockType:1','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:52','2017-04-16 22:48:52','58e879da-d437-452b-afcb-945da6296860'),
	(10,NULL,'Phone','phone','superTableBlockType:1','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:52','2017-04-16 22:48:52','40502cff-09b2-48d2-8a35-842a68042436'),
	(11,NULL,'Mobile Phone','mobilePhone','superTableBlockType:1','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:48:52','2017-04-16 22:48:52','5e0c3714-2202-4a5a-a017-6a36d2da3f8c'),
	(31,6,'Plugin: Seomatic Home','pluginSeomaticHome','global','',0,'Seomatic_Meta','{\"assetSources\":\"*\",\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"WebPage\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoTitle\":\"\",\"seoTitleSourceChangeable\":\"1\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"singleIntroText\",\"seoDescription\":\"\",\"seoDescriptionSourceChangeable\":\"1\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoKeywords\":\"\",\"seoKeywordsSourceChangeable\":\"1\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"singleImageEntry\",\"seoImageIdSourceChangeable\":\"1\",\"seoImageTransform\":\"socialSharing\",\"twitterCardType\":\"summary_large_image\",\"twitterCardTypeChangeable\":\"1\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"singleImageEntry\",\"seoTwitterImageIdSourceChangeable\":\"1\",\"seoTwitterImageTransform\":\"socialSharingTwitter\",\"openGraphType\":\"\",\"openGraphTypeChangeable\":\"1\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"singleImageEntry\",\"seoFacebookImageIdSourceChangeable\":\"1\",\"seoFacebookImageTransform\":\"socialSharing\",\"robots\":\"\",\"robotsChangeable\":\"1\"}','2017-04-16 22:48:54','2017-11-11 16:37:29','07f85313-5d91-415c-9bd3-6cd0acf06af1'),
	(32,7,'Settings: Link','settingsLink','global','',0,'SuperTable','{\"columns\":{\"33\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null,\"minRows\":null}','2017-04-16 22:48:54','2017-10-17 21:55:49','08cd9e7a-9813-425d-a459-957dfbd8d3f4'),
	(33,NULL,'Style','style','superTableBlockType:4','',0,'Dropdown','{\"options\":[{\"label\":\"Underlined\",\"value\":\"underlined\",\"default\":\"1\"},{\"label\":\"Outlined\",\"value\":\"outlined\",\"default\":\"\"}]}','2017-04-16 22:48:54','2017-10-17 21:55:50','01c6ed96-507a-4b5b-b289-e724f15bb9f4'),
	(37,7,'Settings: Link Group','settingsLinksGroup','global','',0,'SuperTable','{\"columns\":{\"38\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null,\"minRows\":null}','2017-04-16 22:48:55','2017-10-17 21:54:36','2ce3ba09-a1bf-4a19-bafd-421b3114a1e9'),
	(38,NULL,'Style','style','superTableBlockType:5','',0,'Dropdown','{\"options\":[{\"label\":\"Underlined\",\"value\":\"underlined\",\"default\":\"1\"},{\"label\":\"Outlined\",\"value\":\"outlined\",\"default\":\"\"}]}','2017-04-16 22:48:55','2017-10-17 21:54:36','6c309da0-b686-4525-9228-a816b6fdfea4'),
	(40,7,'Settings: Definition List','settingsDefinitionList','global','',0,'SuperTable','{\"columns\":{\"41\":{\"width\":\"\"},\"42\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null,\"minRows\":null}','2017-04-16 22:48:55','2017-10-17 22:18:40','415cfc65-b315-494c-8c28-97cf7bac58e9'),
	(41,NULL,'Ratio','ratio','superTableBlockType:6','',0,'Dropdown','{\"options\":[{\"label\":\"1:1\",\"value\":\"50-50\",\"default\":\"1\"},{\"label\":\"1:2\",\"value\":\"33-66\",\"default\":\"\"},{\"label\":\"1:3\",\"value\":\"25-75\",\"default\":\"\"}]}','2017-04-16 22:48:55','2017-10-17 22:18:40','161f4ffe-b03e-41ae-b6aa-5e6a9b397493'),
	(42,NULL,'Layout','layout','superTableBlockType:6','',0,'Dropdown','{\"options\":[{\"label\":\"Table\",\"value\":\"table\",\"default\":\"1\"},{\"label\":\"Row\",\"value\":\"row\",\"default\":\"\"}]}','2017-04-16 22:48:55','2017-10-17 22:18:40','0d5a23e5-8449-462c-bfc3-d5b9fe45f3b7'),
	(43,7,'Settings: Embed','settingsEmbed','global','',0,'SuperTable','{\"columns\":{\"45\":{\"width\":\"\"},\"46\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null,\"minRows\":null}','2017-04-16 22:48:55','2017-11-19 22:51:37','e53396bc-f7a9-48f6-b84d-d0688ec3e36c'),
	(45,NULL,'Position','position','superTableBlockType:7','',0,'Dropdown','{\"options\":[{\"label\":\"Left\",\"value\":\"align-left\",\"default\":\"1\"},{\"label\":\"Center\",\"value\":\"align-center\",\"default\":\"\"},{\"label\":\"Right\",\"value\":\"align-right\",\"default\":\"\"}]}','2017-04-16 22:48:56','2017-11-19 22:51:37','a536303f-28f8-44ce-a714-7016c49cbefd'),
	(46,NULL,'Width','width','superTableBlockType:7','',0,'Dropdown','{\"options\":[{\"label\":\"Full\",\"value\":\"width-100\",\"default\":\"1\"},{\"label\":\"Three Quarter\",\"value\":\"width-75\",\"default\":\"\"},{\"label\":\"Half\",\"value\":\"width-50\",\"default\":\"\"}]}','2017-04-16 22:48:56','2017-11-19 22:51:37','0a23214e-c6eb-43ae-ba97-6687d0c41bc2'),
	(47,7,'Settings: Focal Point','settingsFocalPoint','global','',0,'FocalPointField_FocalPoint','{\"defaultFocalPoint\":\"50% 50%\"}','2017-04-16 22:48:56','2017-04-16 22:48:56','56b4e0bb-3648-4872-a635-41125c6d0fd5'),
	(48,7,'Settings: Headline','settingsHeadline','global','',0,'SuperTable','{\"columns\":{\"50\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null}','2017-04-16 22:48:56','2017-04-19 22:01:54','0cc564f2-f3aa-4195-acfe-e2d440c35d1f'),
	(50,NULL,'Size','size','superTableBlockType:8','',0,'Dropdown','{\"options\":[{\"label\":\"H2\",\"value\":\"h2\",\"default\":\"1\"},{\"label\":\"H3\",\"value\":\"h3\",\"default\":\"\"},{\"label\":\"H4\",\"value\":\"h4\",\"default\":\"\"},{\"label\":\"H5\",\"value\":\"h5\",\"default\":\"\"},{\"label\":\"H6\",\"value\":\"h6\",\"default\":\"\"}]}','2017-04-16 22:48:57','2017-04-19 22:01:54','e762c338-786b-4e81-89c6-bb58d32ebc28'),
	(52,7,'Settings: Image Cover','settingsImageCover','global','',0,'SuperTable','{\"columns\":{\"53\":{\"width\":\"\"},\"54\":{\"width\":\"\"},\"55\":{\"width\":\"\"},\"109\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null,\"minRows\":null}','2017-04-16 22:48:57','2017-07-11 05:23:58','209881bb-a426-47e6-aaa2-79354a549e58'),
	(53,NULL,'Background Position','backgroundPosition','superTableBlockType:9','',0,'Dropdown','{\"options\":[{\"label\":\"Focalpoint\",\"value\":\"focalpoint\",\"default\":\"1\"},{\"label\":\"Left : Top\",\"value\":\"0% 0%\",\"default\":\"\"},{\"label\":\"Left : Center\",\"value\":\"0% 50%\",\"default\":\"\"},{\"label\":\"Left : Bottom\",\"value\":\"0% 100%\",\"default\":\"\"},{\"label\":\"Center : Top\",\"value\":\"50% 0%\",\"default\":\"\"},{\"label\":\"Center : Center\",\"value\":\"50% 50%\",\"default\":\"\"},{\"label\":\"Center : Bottom\",\"value\":\"50% 100%\",\"default\":\"\"},{\"label\":\"Right : Top\",\"value\":\"100% 0%\",\"default\":\"\"},{\"label\":\"Right : Center\",\"value\":\"100% 50%\",\"default\":\"\"},{\"label\":\"Right : Bottom\",\"value\":\"100% 100%\",\"default\":\"\"}]}','2017-04-16 22:48:57','2017-07-11 05:23:58','bdd100ab-144e-4264-a75a-b5e6cb7c3350'),
	(54,NULL,'Text Vertical Position','textVerticalPosition','superTableBlockType:9','',0,'Dropdown','{\"options\":[{\"label\":\"Top\",\"value\":\"textV-top\",\"default\":\"\"},{\"label\":\"Center\",\"value\":\"textV-center\",\"default\":\"\"},{\"label\":\"Bottom\",\"value\":\"textV-bottom\",\"default\":\"1\"}]}','2017-04-16 22:48:57','2017-07-11 05:23:58','332b34bc-c8e4-4ae5-8bc1-b4a1d403aaf2'),
	(55,NULL,'Text Alignment','textAlignment','superTableBlockType:9','',0,'Dropdown','{\"options\":[{\"label\":\"Left\",\"value\":\"textH-left\",\"default\":\"\"},{\"label\":\"Center\",\"value\":\"textH-center\",\"default\":\"1\"},{\"label\":\"Right\",\"value\":\"textH-right\",\"default\":\"\"}]}','2017-04-16 22:48:57','2017-07-11 05:23:58','80e5dc50-61d7-4a7c-b1d9-8591cde2c6d9'),
	(56,7,'Settings: Image Gallery','settingsImageGallery','global','',0,'SuperTable','{\"columns\":{\"59\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null,\"minRows\":null}','2017-04-16 22:48:57','2017-11-19 23:00:56','21cf9e06-e54a-49e8-8799-c46f1308abcb'),
	(59,NULL,'Thumbs Ratio','thumbsRatio','superTableBlockType:10','',0,'Dropdown','{\"options\":[{\"label\":\"Landscape\",\"value\":\"16:10\",\"default\":\"\"},{\"label\":\"Square\",\"value\":\"1:1\",\"default\":\"1\"},{\"label\":\"Portrait\",\"value\":\"10:16\",\"default\":\"\"}]}','2017-04-16 22:48:58','2017-11-19 23:00:56','812a3f7a-45d9-4351-8bb3-7a11f5aeb371'),
	(60,7,'Settings: Image Grid','settingsImageGrid','global','',0,'SuperTable','{\"columns\":{\"61\":{\"width\":\"\"},\"62\":{\"width\":\"\"},\"63\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null,\"minRows\":null}','2017-04-16 22:48:58','2017-11-19 23:01:59','b0f61e15-eec0-4227-b19b-3db8252c752c'),
	(61,NULL,'Caption','caption','superTableBlockType:11','',0,'Lightswitch','{\"default\":\"\"}','2017-04-16 22:48:58','2017-11-19 23:02:00','364a21c0-c4fd-4da0-a2c0-f9f83fb5233e'),
	(62,NULL,'Columns','columns','superTableBlockType:11','',0,'Dropdown','{\"options\":[{\"label\":\"3\",\"value\":\"columns-3\",\"default\":\"\"},{\"label\":\"2\",\"value\":\"columns-2\",\"default\":\"1\"},{\"label\":\"1\",\"value\":\"columns-1\",\"default\":\"\"}]}','2017-04-16 22:48:58','2017-11-19 23:02:00','6cf16dcf-f649-464d-9be3-f40daefb1333'),
	(63,NULL,'Ratio','ratio','superTableBlockType:11','',0,'Dropdown','{\"options\":[{\"label\":\"Landscape\",\"value\":\"16:10\",\"default\":\"\"},{\"label\":\"Square\",\"value\":\"1:1\",\"default\":\"1\"},{\"label\":\"Portrait\",\"value\":\"10:16\",\"default\":\"\"},{\"label\":\"Auto\",\"value\":\"auto\",\"default\":\"\"}]}','2017-04-16 22:48:58','2017-11-19 23:02:00','81d289bd-9d5d-49fd-93a4-9dff38fa9966'),
	(64,7,'Settings: Image Single','settingsImageSingle','global','',0,'SuperTable','{\"columns\":{\"65\":{\"width\":\"\"},\"66\":{\"width\":\"\"},\"67\":{\"width\":\"\"},\"68\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null,\"minRows\":null}','2017-04-16 22:48:58','2017-11-19 23:48:00','810871ff-93b3-4f1d-a8ff-8e3743dd8361'),
	(65,NULL,'Caption','caption','superTableBlockType:12','Soll eine Caption angezeigt werden?',0,'Lightswitch','{\"default\":\"\"}','2017-04-16 22:48:58','2017-11-19 23:48:00','674b8645-5a09-44f1-9b6c-d7f73179886f'),
	(66,NULL,'Alignment','alignment','superTableBlockType:12','Wie soll das Bild ausgerichtet sein? Greift nicht wenn es bei dem Modul \"RichText Marginals\" genutzt wird. ',0,'Dropdown','{\"options\":[{\"label\":\"Left\",\"value\":\"align-left\",\"default\":\"\"},{\"label\":\"Center\",\"value\":\"align-center\",\"default\":\"1\"},{\"label\":\"Right\",\"value\":\"align-right\",\"default\":\"\"}]}','2017-04-16 22:48:59','2017-11-19 23:48:00','2bedac5a-5b13-49ef-92d0-91478e203fe7'),
	(67,NULL,'Ratio','ratio','superTableBlockType:12','Welches Seitenverhältnis soll das Bild haben? Auto nimmt das ursprüngliche Seitenverhältnis vom Bild. ',0,'Dropdown','{\"options\":[{\"label\":\"Landscape\",\"value\":\"16:10\",\"default\":\"1\"},{\"label\":\"Square\",\"value\":\"1:1\",\"default\":\"\"},{\"label\":\"Portrait\",\"value\":\"10:16\",\"default\":\"\"},{\"label\":\"Auto\",\"value\":\"auto\",\"default\":\"\"}]}','2017-04-16 22:48:59','2017-11-19 23:48:00','5c9b3f7d-b541-4f5a-b514-cfc65f52ef7b'),
	(68,NULL,'Width','width','superTableBlockType:12','Über wie viele Spalten soll sich das Bild erstrecken? Greift nicht wenn es bei dem Modul \"RichText Marginals\" genutzt wird. ',0,'Dropdown','{\"options\":[{\"label\":\"Cover\",\"value\":\"width-cover\",\"default\":\"\"},{\"label\":\"Full\",\"value\":\"width-full\",\"default\":\"1\"},{\"label\":\"Three Quarter\",\"value\":\"width-threeQuarter\",\"default\":\"\"},{\"label\":\"Half\",\"value\":\"width-half\",\"default\":\"\"}]}','2017-04-16 22:48:59','2017-11-19 23:48:00','2661efb8-eb33-45be-8b5b-bd92ce47d06b'),
	(69,7,'Settings: Image Slider','settingsImageSlider','global','',0,'SuperTable','{\"columns\":{\"70\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null,\"minRows\":null}','2017-04-16 22:48:59','2017-11-19 23:36:46','cd018358-a1a4-40d0-a332-1cba4dfbc14e'),
	(70,NULL,'ratio','ratio','superTableBlockType:13','',0,'Dropdown','{\"options\":[{\"label\":\"Landscape\",\"value\":\"landscape\",\"default\":\"1\"},{\"label\":\"Square\",\"value\":\"square\",\"default\":\"\"},{\"label\":\"Portrait\",\"value\":\"portrait\",\"default\":\"\"}]}','2017-04-16 22:48:59','2017-11-19 23:36:46','0be4f25a-452b-4c08-914d-ce1cb40d71f6'),
	(73,7,'Settings: Section','settingsSection','global','',0,'SuperTable','{\"columns\":{\"75\":{\"width\":\"\"},\"76\":{\"width\":\"\"},\"133\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Section Options\",\"maxRows\":null,\"minRows\":null}','2017-04-16 22:48:59','2017-12-02 21:13:29','8fabec04-d56b-4b9e-9387-759a5a223433'),
	(75,NULL,'Width','width','superTableBlockType:14','',0,'Dropdown','{\"options\":[{\"label\":\"Content Width\",\"value\":\"\",\"default\":\"1\"},{\"label\":\"Full Width\",\"value\":\"fluid\",\"default\":\"\"}]}','2017-04-16 22:49:00','2017-12-02 21:13:29','9fc896ef-e002-4809-805e-bc7c64740e7a'),
	(76,NULL,'Padding Vertical','paddingVertical','superTableBlockType:14','',0,'Dropdown','{\"options\":[{\"label\":\"Small\",\"value\":\"paddingVertical-small\",\"default\":\"1\"},{\"label\":\"Medium\",\"value\":\"paddingVertical-medium\",\"default\":\"\"},{\"label\":\"Large\",\"value\":\"paddingVertical-large\",\"default\":\"\"},{\"label\":\"None\",\"value\":\"paddingVertical-none\",\"default\":\"\"}]}','2017-04-16 22:49:00','2017-12-02 21:13:29','21fe272b-40cb-43da-933f-d55c4ecdb2ff'),
	(77,7,'Settings: Divider','settingsDivider','global','',0,'SuperTable','{\"columns\":{\"79\":{\"width\":\"\"},\"80\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":\"1\",\"selectionLabel\":\"Add a row\",\"maxRows\":null,\"minRows\":null}','2017-04-16 22:49:00','2017-11-19 22:48:55','1c16da1a-9828-49c5-9e0b-1aee38fbfbed'),
	(79,NULL,'Style','style','superTableBlockType:15','',0,'Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"style-default\",\"default\":\"1\"}]}','2017-04-16 22:49:00','2017-11-19 22:48:55','f16ffbfa-5ac1-4106-b2a9-788bb96cb649'),
	(80,NULL,'Margin Vertical','marginVertical','superTableBlockType:15','',0,'Dropdown','{\"options\":[{\"label\":\"Small\",\"value\":\"mv-small\",\"default\":\"1\"},{\"label\":\"Medium\",\"value\":\"mv-medium\",\"default\":\"\"},{\"label\":\"Large\",\"value\":\"mv-large\",\"default\":\"\"},{\"label\":\"None\",\"value\":\"mv-none\",\"default\":\"\"}]}','2017-04-16 22:49:00','2017-11-19 22:48:55','1fcf5028-579b-41eb-8c3f-57c23c97f15f'),
	(83,8,'Single: Anchor','singleAnchor','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:49:01','2017-04-16 22:49:01','dd3cf74d-e16d-4a66-b61c-dacf217067c9'),
	(84,8,'Single: Button','singleButton','global','',0,'FruitLinkIt','{\"types\":[\"email\",\"tel\",\"custom\",\"entry\",\"category\",\"asset\"],\"defaultText\":\"Click here\",\"allowCustomText\":1,\"allowTarget\":1,\"entrySources\":[],\"entrySelectionLabel\":\"Select an entry\",\"assetSources\":\"*\",\"assetSelectionLabel\":\"Select an asset\",\"categorySources\":\"*\",\"categorySelectionLabel\":\"Select a category\"}','2017-04-16 22:49:01','2017-04-16 22:49:01','8177593b-8cee-481a-854d-bfd5adc54c09'),
	(85,8,'Single: Link Group','singleLinkGroup','global','',0,'SuperTable','{\"columns\":{\"86\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":null,\"selectionLabel\":\"Add a Link\",\"maxRows\":\"3\",\"minRows\":null}','2017-04-16 22:49:01','2017-10-17 22:05:08','994107ce-abe4-4651-aa03-00bd619cd9f9'),
	(86,NULL,'Single Link','singleLink','superTableBlockType:17','',0,'FruitLinkIt','{\"types\":[\"email\",\"tel\",\"custom\",\"entry\",\"category\",\"asset\"],\"defaultText\":\"\",\"allowCustomText\":\"1\",\"allowTarget\":\"1\",\"entrySources\":\"*\",\"entrySelectionLabel\":\"Select an entry\",\"assetSources\":\"*\",\"assetSelectionLabel\":\"Select an asset\",\"categorySources\":\"*\",\"categorySelectionLabel\":\"Select a category\"}','2017-04-16 22:49:01','2017-10-17 22:05:08','51e3766b-5805-45eb-9140-a8bcb61048d5'),
	(87,8,'Single: Code','singleCode','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":1,\"initialRows\":8}','2017-04-16 22:49:02','2017-04-16 22:49:02','0c6beed0-c301-4bcc-b324-87a47d76d1cc'),
	(88,8,'Single: Definition List','singleDefinitionList','global','',0,'Table','{\"columns\":{\"col1\":{\"heading\":\"Definition Term\",\"handle\":\"definitionTerm\",\"width\":\"\",\"type\":\"singleline\"},\"col2\":{\"heading\":\"Definition Description\",\"handle\":\"definitionDescription\",\"width\":\"\",\"type\":\"singleline\"}},\"defaults\":{\"row1\":{\"col1\":\"\",\"col2\":\"\"}}}','2017-04-16 22:49:02','2017-04-16 22:49:02','cd553829-4aea-4a8a-88de-d33d8ec628e2'),
	(89,8,'Single: Embed Code','singleEmbedCode','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":1,\"initialRows\":2}','2017-04-16 22:49:02','2017-04-16 22:49:02','00e69e8a-9cfd-4fd2-953a-27efe4ecc6cc'),
	(90,8,'Single: Headline','singleHeadline','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:49:02','2017-04-16 22:49:02','3ef9aa49-1347-43d9-ab83-e5d017f535f6'),
	(91,8,'Single: Image','singleImage','global','',0,'Assets','{\"useSingleFolder\":1,\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":1,\"allowedKinds\":[\"image\"],\"limit\":1,\"viewMode\":\"list\",\"selectionLabel\":\"Add an Image\"}','2017-04-16 22:49:02','2017-04-16 22:49:02','3f8d6749-4752-43ac-8c4b-c114bdb261dd'),
	(92,8,'Single: Images','singleImages','global','',0,'Assets','{\"useSingleFolder\":1,\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":1,\"allowedKinds\":[\"image\"],\"limit\":\"\",\"viewMode\":\"list\",\"selectionLabel\":\"Add an Image\"}','2017-04-16 22:49:02','2017-04-16 22:49:02','a68296a9-b5fa-450a-a6c3-2a92ddac6bb3'),
	(93,8,'Single: Label','singleLabel','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:49:02','2017-04-16 22:49:02','e3341790-52a1-4fab-ba84-1e9157f4f0cf'),
	(94,8,'Single: Quote','singleQuote','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":1,\"initialRows\":4}','2017-04-16 22:49:02','2017-04-16 22:49:02','717862d4-82be-413f-8ab2-03d6515f6b2e'),
	(95,8,'Single: Rich Text','singleRichText','global','',0,'RichText','{\"configFile\":\"Baukasten.json\",\"availableAssetSources\":\"*\",\"availableTransforms\":\"*\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"1\",\"purifierConfig\":\"\",\"columnType\":\"text\"}','2017-04-16 22:49:02','2017-12-05 13:50:49','f85c7165-6da7-44a9-928c-57095d6f6cfe'),
	(96,8,'Single: Source','singleSource','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:49:03','2017-04-16 22:49:03','ca0751da-0f25-4028-9e3d-17cdee2d809c'),
	(97,8,'Single: Source Url','singleSourceUrl','global','',0,'FruitLinkIt','{\"types\":[\"custom\"],\"defaultText\":\"\",\"allowCustomText\":1,\"allowTarget\":\"\",\"entrySources\":[],\"entrySelectionLabel\":\"Select an entry\",\"assetSources\":\"*\",\"assetSelectionLabel\":\"Select an asset\",\"categorySources\":\"*\",\"categorySelectionLabel\":\"Select a category\"}','2017-04-16 22:49:03','2017-04-16 22:49:03','28ac9431-3120-41a6-a177-85a8f047d82f'),
	(98,8,'Single: Subline','singleSubline','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:49:03','2017-04-16 22:49:03','9e2275b6-c045-4134-96b7-7320ffac648d'),
	(99,8,'Single: Text','singleText','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-04-16 22:49:03','2017-04-16 22:49:03','93e95a04-5244-4b57-aed4-575f7a4e1bcf'),
	(100,3,'Content Builder','contentBuilder','global','',0,'Neo','{\"maxBlocks\":null}','2017-04-16 22:49:03','2017-12-02 02:20:07','aab66a18-eccb-4d87-9ce7-41dbac12dc72'),
	(101,6,'Plugin: Preparse Dominant Color','pluginPreparseDominantColor','global','',0,'PreparseField_Preparse','{\"fieldTwig\":\"{% spaceless %}\\r\\n  {% if asset|length %}\\r\\n    {% set color = craft.imager.getDominantColor(asset) %}\\r\\n    {{ color }}\\r\\n  {% endif %}\\r\\n{% endspaceless %}\",\"columnType\":\"text\",\"decimals\":\"0\",\"parseBeforeSave\":\"1\",\"parseOnMove\":\"1\",\"showField\":\"1\",\"allowSelect\":\"1\"}','2017-06-08 16:49:28','2017-06-08 17:06:13','02fa3799-a387-49ce-9f87-94c1b5811fb5'),
	(102,8,'Single: Seo Title','singleSeoTitle','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\"}','2017-06-08 16:52:25','2017-06-08 16:52:25','7381bf3c-30ee-4168-8152-7318c3b122b3'),
	(103,8,'Single: Image Entry','singleImageEntry','global','',0,'Assets','{\"useSingleFolder\":\"1\",\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"1\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"limit\":\"1\",\"viewMode\":\"list\",\"selectionLabel\":\"\"}','2017-06-08 16:54:33','2017-06-08 16:54:33','02bb0686-b937-4fca-aa2c-4961bb513870'),
	(104,8,'Single: Intro Text','singleIntroText','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"1\",\"initialRows\":\"8\"}','2017-06-08 16:56:11','2017-06-08 16:56:11','468fde0f-8d8d-4ffd-9fef-595ae367e4ae'),
	(105,6,'Plugin: Seomatic Articles','pluginSeomaticArticles','global','',0,'Seomatic_Meta','{\"assetSources\":\"*\",\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"WebPage\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoTitle\":\"\",\"seoTitleSourceChangeable\":\"1\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"singleIntroText\",\"seoDescription\":\"\",\"seoDescriptionSourceChangeable\":\"1\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoKeywords\":\"\",\"seoKeywordsSourceChangeable\":\"1\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"singleImageEntry\",\"seoImageIdSourceChangeable\":\"1\",\"seoImageTransform\":\"socialSharing\",\"twitterCardType\":\"summary_large_image\",\"twitterCardTypeChangeable\":\"1\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"singleImageEntry\",\"seoTwitterImageIdSourceChangeable\":\"1\",\"seoTwitterImageTransform\":\"socialSharingTwitter\",\"openGraphType\":\"\",\"openGraphTypeChangeable\":\"1\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"singleImageEntry\",\"seoFacebookImageIdSourceChangeable\":\"1\",\"seoFacebookImageTransform\":\"socialSharing\",\"robots\":\"\",\"robotsChangeable\":\"1\"}','2017-06-08 17:01:21','2017-10-17 22:17:32','53c3e6cf-eee8-4b5c-a1c2-fe963a16cf5b'),
	(106,6,'Plugin: Seomatic Pages','pluginSeomaticPages','global','',0,'Seomatic_Meta','{\"assetSources\":\"*\",\"seoMainEntityCategory\":\"CreativeWork\",\"seoMainEntityOfPage\":\"WebPage\",\"seoTitleSource\":\"field\",\"seoTitleSourceField\":\"title\",\"seoTitle\":\"\",\"seoTitleSourceChangeable\":\"1\",\"seoDescriptionSource\":\"field\",\"seoDescriptionSourceField\":\"singleIntroText\",\"seoDescription\":\"\",\"seoDescriptionSourceChangeable\":\"1\",\"seoKeywordsSource\":\"custom\",\"seoKeywordsSourceField\":\"title\",\"seoKeywords\":\"\",\"seoKeywordsSourceChangeable\":\"1\",\"seoImageIdSource\":\"field\",\"seoImageIdSourceField\":\"singleImageEntry\",\"seoImageIdSourceChangeable\":\"1\",\"seoImageTransform\":\"socialSharing\",\"twitterCardType\":\"summary_large_image\",\"twitterCardTypeChangeable\":\"1\",\"seoTwitterImageIdSource\":\"field\",\"seoTwitterImageIdSourceField\":\"singleImageEntry\",\"seoTwitterImageIdSourceChangeable\":\"1\",\"seoTwitterImageTransform\":\"socialSharingTwitter\",\"openGraphType\":\"\",\"openGraphTypeChangeable\":\"1\",\"seoFacebookImageIdSource\":\"field\",\"seoFacebookImageIdSourceField\":\"singleImageEntry\",\"seoFacebookImageIdSourceChangeable\":\"1\",\"seoFacebookImageTransform\":\"socialSharing\",\"robots\":\"\",\"robotsChangeable\":\"1\"}','2017-06-08 17:01:36','2017-10-08 17:24:00','1e5834f3-c420-4ea3-94f8-da9ffdb4e5df'),
	(109,NULL,'Text Color','textColor','superTableBlockType:9','',0,'Dropdown','{\"options\":[{\"label\":\"White\",\"value\":\"textColor-white\",\"default\":\"1\"},{\"label\":\"Black\",\"value\":\"textColor-black\",\"default\":\"\"}]}','2017-07-11 05:22:54','2017-07-11 05:23:58','2c8a0cde-ace6-43dd-b679-675ed8d22771'),
	(113,4,'Global: Third Party Snippets','globalThirdPartySnippets','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"new2\":{\"width\":\"\"},\"new3\":{\"width\":\"\"}},\"fieldLayout\":\"row\",\"staticField\":null,\"selectionLabel\":\"Add a row\",\"maxRows\":null,\"minRows\":null}','2017-09-03 17:01:51','2017-09-03 17:01:51','160ad338-5d40-4eca-8426-25687816cae3'),
	(114,NULL,'Snippet Name','snippetName','superTableBlockType:19','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-09-03 17:01:51','2017-09-03 17:01:51','25bcc791-f1e7-4d49-80e1-e6722b57df21'),
	(115,NULL,'Snippet Status','snippetStatus','superTableBlockType:19','',0,'Lightswitch','{\"default\":\"\"}','2017-09-03 17:01:51','2017-09-03 17:01:51','0772389e-ac64-4e72-b3ce-c0d7e956308c'),
	(116,NULL,'Snippet Code','snippetCode','superTableBlockType:19','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":1,\"initialRows\":8}','2017-09-03 17:01:51','2017-09-03 17:01:51','277452ec-8a9d-4928-b719-05693ad57a32'),
	(117,4,'Global: Google Analytics','globalGoogleAnalytics','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-09-03 17:04:46','2017-09-24 22:09:04','f44f8bbe-a0be-4d8f-8448-871371d0fea8'),
	(118,4,'Global: Social Networks','globalSocialNetworks','global','',0,'SuperTable','{\"columns\":{\"new1\":{\"width\":\"\"},\"119\":{\"width\":\"\"},\"120\":{\"width\":\"\"}},\"fieldLayout\":\"table\",\"staticField\":null,\"selectionLabel\":\"Add a row\",\"maxRows\":null,\"minRows\":null}','2017-09-03 22:18:05','2017-09-03 23:13:41','1f2d1f75-8b19-45f8-9e43-e9002e4be19f'),
	(119,NULL,'Profil Name','profilName','superTableBlockType:20','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-09-03 22:18:05','2017-09-03 23:13:41','cc689563-5972-487f-8b0a-e2d5ac4c1ccf'),
	(120,NULL,'Profil Url','profilUrl','superTableBlockType:20','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-09-03 22:18:05','2017-09-03 23:13:41','14b3e157-7f9b-4b6b-89a6-7f0a9b6b7b32'),
	(121,NULL,'Network Name','networkName','superTableBlockType:20','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":\"4\"}','2017-09-03 23:13:41','2017-09-03 23:13:41','d2749079-c35a-4fa2-a375-03eb36b15c40'),
	(122,4,'Global: Logo','globalLogo','global','',0,'Assets','{\"useSingleFolder\":1,\"sources\":\"*\",\"defaultUploadLocationSource\":\"1\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"3\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":1,\"allowedKinds\":[\"image\"],\"limit\":1,\"viewMode\":\"large\",\"selectionLabel\":\"\"}','2017-09-19 22:48:00','2017-09-19 22:48:00','18f957dd-b05f-4a5f-a253-98031a2d1527'),
	(126,8,'Single: Link','singleLink','global','',0,'FruitLinkIt','{\"types\":[\"email\",\"tel\",\"custom\",\"entry\",\"category\",\"asset\"],\"defaultText\":\"Click here\",\"allowCustomText\":1,\"allowTarget\":1,\"entrySources\":[],\"entrySelectionLabel\":\"Select an entry\",\"assetSources\":\"*\",\"assetSelectionLabel\":\"Select an asset\",\"categorySources\":\"*\",\"categorySelectionLabel\":\"Select a category\"}','2017-10-08 16:27:05','2017-10-08 16:27:05','34ac01ed-59d5-4e9f-a962-993e2732a8f6'),
	(127,9,'Image: Caption','imageCaption','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":1,\"initialRows\":4}','2017-10-17 22:13:24','2017-10-17 22:13:24','c0087231-cad0-480a-90d0-686e95932a50'),
	(128,9,'Image: Caption Headline','imageCaptionHeadline','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-10-17 22:13:24','2017-10-17 22:13:24','2cf2dbcf-a37b-4d06-99c7-b5706b50a0c7'),
	(129,9,'Image: Source','imageSource','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-10-17 22:13:24','2017-10-17 22:13:24','277e6f99-94f5-44da-a576-6b8dc0fe5ab3'),
	(130,9,'Image: Source URL','imageSourceUrl','global','',0,'FruitLinkIt','{\"types\":[\"custom\"],\"defaultText\":\"\",\"allowCustomText\":\"\",\"allowTarget\":\"\",\"entrySources\":\"*\",\"entrySelectionLabel\":\"Select an entry\",\"assetSources\":\"*\",\"assetSelectionLabel\":\"Select an asset\",\"categorySources\":\"*\",\"categorySelectionLabel\":\"Select a category\"}','2017-10-17 22:15:21','2017-10-17 22:15:21','ebbe4835-82dd-4dfa-bdbc-70872ed82cf5'),
	(131,7,'Settings: Dominant Color Overwrite','settingsDominantColorOverwrite','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"\",\"initialRows\":4}','2017-11-17 15:05:09','2017-11-17 15:05:09','db597481-d764-4696-8dce-0e2ccae56447'),
	(132,8,'Single: Plain Text','singlePlainText','global','',0,'PlainText','{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"1\",\"initialRows\":\"2\"}','2017-12-02 00:31:46','2017-12-02 00:39:56','c2871c21-16d3-48a6-b3f7-79d06991edd7'),
	(133,NULL,'Offset','offset','superTableBlockType:14','',0,'Dropdown','{\"options\":[{\"label\":\"No\",\"value\":\"no\",\"default\":\"1\"},{\"label\":\"Yes\",\"value\":\"yes\",\"default\":\"\"}]}','2017-12-02 01:34:17','2017-12-02 21:13:29','26680345-ebc3-45ac-87ea-8ca2e5a72ff8');

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
	(115,'Google Analytics','googleAnalytics',362,'2017-09-03 17:04:46','2017-09-24 22:15:48','f683e91c-d38c-4e16-ae41-1d3d1b17835d'),
	(116,'Contact','contact',351,'2017-09-04 13:52:53','2017-09-04 13:52:53','4c3b255b-6a8a-4ce8-8678-1265388ccb9b'),
	(117,'Logo','logo',352,'2017-09-19 22:48:00','2017-09-19 22:48:00','cdc54a37-d7ee-42ed-a31e-759d051e6f38');

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
	(1,'2.6.2997','2.6.11',2,'Baukasten','http://baukasten.dev','UTC',1,0,'2017-04-16 21:53:40','2017-11-17 15:10:23','66d3ce2a-d695-463f-af51-9364c16014bf');

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
	(71,NULL,'m170612_000000_route_index_shuffle','2017-06-26 20:04:33','2017-06-26 20:04:33','2017-06-26 20:04:33','a072f9a8-5192-48cd-9d3e-d45becaaaada'),
	(72,NULL,'m171107_000000_assign_group_permissions','2017-11-17 14:54:51','2017-11-17 14:54:51','2017-11-17 14:54:51','e138beae-fc0c-4d8b-be1a-9667a0a54bb8'),
	(78,29,'m160426_020311_retour_FixIndexes','2017-12-03 23:43:04','2017-12-03 23:43:04','2017-12-03 23:43:04','64671999-f456-402c-ba73-93fb5e278635'),
	(79,29,'m160427_000000_retour_addHandledStats','2017-12-03 23:43:04','2017-12-03 23:43:04','2017-12-03 23:43:04','2f01a801-7b86-4ac3-908b-ab656ef28cdf'),
	(80,29,'m160514_000000_retour_convertToElementId','2017-12-03 23:43:04','2017-12-03 23:43:04','2017-12-03 23:43:04','e570a770-c4c1-4611-93e3-47d5d7e88b16'),
	(81,29,'m160704_000000_retour_addReferrerStats','2017-12-03 23:43:04','2017-12-03 23:43:04','2017-12-03 23:43:04','8d03a6e1-466b-446a-9c49-b670081d12a4'),
	(82,30,'m170614_141800_amCommand_defaultElementTypeSettings','2017-12-05 14:25:57','2017-12-05 14:25:57','2017-12-05 14:25:57','c3f94d33-0b07-40e9-adc5-3cf42e0a22da');

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
	(124,5,100,1,1,NULL,'2017-12-01 23:35:02','2017-12-03 04:24:33','479dbae0-e506-4aef-ad07-4d4f5140ecd0'),
	(126,5,100,6,0,NULL,'2017-12-01 23:35:02','2017-12-02 21:51:59','d8b77891-e53a-46fd-9482-ecfcedb64779'),
	(128,5,100,6,0,NULL,'2017-12-01 23:52:57','2017-12-02 21:51:59','4a59e939-4572-4a91-b436-42fa9992b0aa'),
	(130,5,100,6,0,NULL,'2017-12-01 23:52:57','2017-12-02 21:51:59','d23ddf46-51e3-4974-a7ae-e2e487c71c85'),
	(132,5,100,6,0,NULL,'2017-12-01 23:52:58','2017-12-02 21:51:59','6384be87-cbb3-4092-a079-72b27dac329d'),
	(134,5,100,6,0,NULL,'2017-12-01 23:52:58','2017-12-02 21:51:59','dc52bc33-4ce3-4e71-9414-8fa2c1f5d000'),
	(136,5,100,1,0,NULL,'2017-12-01 23:54:50','2017-12-02 21:51:59','01a819bf-d4cb-4837-ba40-a1b3b756a8ac'),
	(138,5,100,7,1,NULL,'2017-12-01 23:54:50','2017-12-02 21:51:59','09e998a9-1a94-4af0-8fdf-c80142f8f4ab'),
	(141,5,100,20,0,NULL,'2017-12-01 23:59:18','2017-12-02 21:51:59','b6139d02-f1ac-4570-9a02-07428ff9c012'),
	(143,5,100,8,0,NULL,'2017-12-02 00:10:11','2017-12-02 21:51:59','0a1b11c7-70d8-4a52-b4f3-a67c9666cc4a'),
	(146,5,100,1,0,NULL,'2017-12-02 00:24:38','2017-12-02 21:51:59','b39de025-4f49-455d-acce-fe9f37835cdc'),
	(149,5,100,9,0,NULL,'2017-12-02 00:38:12','2017-12-02 21:51:59','63bfc921-22b4-43b7-989c-2fa618125f28'),
	(150,5,100,24,0,NULL,'2017-12-02 00:38:12','2017-12-02 21:51:59','8bfbfbf5-07d9-4a27-b366-113bbcfc083b'),
	(151,5,100,9,0,NULL,'2017-12-02 00:40:40','2017-12-02 21:51:59','ce09bd98-4693-47f4-ab28-10a29bf6d9be'),
	(155,5,100,25,0,NULL,'2017-12-02 02:19:07','2017-12-02 21:51:59','96aefd5d-cd5b-4d90-9f0d-c10fe39accdb'),
	(158,157,100,1,0,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','dd38663b-3490-4b45-8f0d-f6df4bbbf890'),
	(160,157,100,6,0,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','0f8b71aa-fcb9-4d11-9138-30b79274cb65'),
	(162,157,100,6,0,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','03029db5-2a82-41af-a3d9-b4237dd412cc'),
	(164,157,100,6,0,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','33daf4af-6d6a-482f-9da3-9de43a2c5420'),
	(166,157,100,6,0,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','efb6f348-bd57-4fab-b46e-e9a9103a12df'),
	(168,157,100,6,0,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','7547acf2-b310-468e-802a-a74650b9cc1b'),
	(170,157,100,7,1,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','62b1d56e-bb44-4eb9-b3fd-a14e72e7d63f'),
	(171,157,100,1,0,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','0916cfa7-8143-47c5-ba4f-dd70bef0bf78'),
	(173,157,100,20,0,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','ca23114b-5654-467d-9352-92e2a08d5afc'),
	(175,157,100,1,0,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','f49cc6ad-95da-438f-91ed-2741d3073b02'),
	(177,157,100,8,0,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','c7b30821-167a-4088-a317-e5620b14c028'),
	(178,157,100,9,0,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','f3b924ec-c2c0-498a-b2e9-7bba4d934509'),
	(179,157,100,24,0,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','7f6cfa46-42c3-4232-a0fd-e4108c056c26'),
	(180,157,100,9,0,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','9cd50927-270d-4db0-bd99-f6b12184fe04'),
	(181,157,100,25,0,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','125b3746-6ac4-4132-ab60-81e57dc79f00');

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
	(211,213,120,100,NULL,'2017-09-24 14:08:40','2017-09-24 14:08:40','7927e579-aa00-4782-8d46-0c073df1e622'),
	(213,215,123,100,NULL,'2017-09-24 14:09:37','2017-09-24 14:09:37','c181a697-de8d-4e83-9ab1-7afe21b8faf2'),
	(214,216,121,100,NULL,'2017-09-24 14:09:50','2017-09-24 14:09:50','cc518087-4248-432f-abb5-db701ad89cc5'),
	(217,219,119,100,NULL,'2017-11-11 16:55:20','2017-11-11 16:55:20','d95e8959-0051-416c-bc4c-3aa799537d08'),
	(242,245,5,100,NULL,'2017-12-02 21:51:59','2017-12-02 21:51:59','12fd7fe6-992e-4eb6-b1f9-5bfda81087e5'),
	(245,248,157,100,NULL,'2017-12-02 22:10:57','2017-12-02 22:10:57','16299b58-bf9c-4855-8a20-40e46839247e');

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
	(1,100,767,'Section','bkSection',NULL,NULL,'',1,2,'2017-04-16 22:49:03','2017-12-02 02:20:07','78239f04-f35e-4486-96c0-22ce83005e52'),
	(2,100,768,'Accordion','accordion',NULL,NULL,'[\"accordionContent\"]',1,3,'2017-04-16 22:49:03','2017-12-02 02:20:07','24a92ae0-ef4c-47ff-a4bf-ae9c7b51a842'),
	(3,100,769,'Accordion Content','accordionContent',NULL,NULL,'[\"headline\",\"richText\",\"quote\",\"definitionList\",\"imageGallery\",\"imageGrid\",\"imageSingle\",\"embed\",\"divider\"]',0,4,'2017-04-16 22:49:03','2017-12-02 02:20:07','a1f6f60c-322b-4f9f-be18-92641e5fc621'),
	(6,100,770,'Headline','headline',NULL,NULL,'',1,6,'2017-04-16 22:49:03','2017-12-02 02:20:07','17fd7dce-492b-46c0-9e31-1349ede5974d'),
	(7,100,771,'Rich Text','richText',NULL,2,'',1,7,'2017-04-16 22:49:03','2017-12-02 02:20:07','7ac911e0-9050-4a42-9973-4fd2254979d7'),
	(8,100,773,'Rich Text Marginals','richTextMarginals',NULL,2,'[\"marginalColumn\"]',1,9,'2017-04-16 22:49:03','2017-12-02 02:20:07','6766b9e5-47e3-419e-9b4f-747380865009'),
	(9,100,774,'Marginal Column','marginalColumn',NULL,1,'[\"plainText\",\"image\",\"quote\"]',0,10,'2017-04-16 22:49:03','2017-12-02 02:20:07','3474dff3-8e0f-40cb-bd85-0959acab99b8'),
	(10,100,776,'Quote','quote',NULL,NULL,'',1,12,'2017-04-16 22:49:03','2017-12-02 02:20:07','0f31b23d-9cf9-4af2-9177-da772cb61534'),
	(11,100,778,'Image Cover','imageCover',NULL,NULL,'',1,15,'2017-04-16 22:49:03','2017-12-02 02:20:07','eff1c786-4c77-49ca-b177-873fbd713465'),
	(12,100,779,'Image Gallery','imageGallery',NULL,NULL,'',1,16,'2017-04-16 22:49:03','2017-12-02 02:20:07','1052add9-8383-4344-9c8e-b17abd59adeb'),
	(13,100,780,'Image Grid','imageGrid',NULL,NULL,'',1,17,'2017-04-16 22:49:03','2017-12-02 02:20:07','e9cda3a8-9c3b-45e8-888f-98fa13cb219d'),
	(14,100,781,'Image Single','imageSingle',NULL,NULL,'',1,18,'2017-04-16 22:49:03','2017-12-02 02:20:07','875dae98-1d96-4528-a3d2-d5a72b4664d2'),
	(15,100,782,'Image Slider','imageSlider',NULL,NULL,'',1,19,'2017-04-16 22:49:03','2017-12-02 02:20:07','996e77e7-6822-4714-af11-eede05096719'),
	(18,100,777,'Definition List','definitionList',NULL,NULL,'',1,13,'2017-04-16 22:49:03','2017-12-02 02:20:07','a7c26f72-f741-4679-95bf-26e52968fee4'),
	(19,100,783,'Embed','embed',NULL,NULL,'',1,21,'2017-04-16 22:49:03','2017-12-02 02:20:07','bfdd8ca2-35d6-4716-8f16-120127bb8dbc'),
	(20,100,784,'Divider','divider',NULL,NULL,'',1,22,'2017-04-16 22:49:03','2017-12-02 02:20:07','c1b095f7-15f7-48b1-9cad-8cdf7a67c07e'),
	(24,100,772,'Plain Text','plainText',NULL,NULL,'',1,8,'2017-12-02 00:31:14','2017-12-02 02:20:07','9af452c6-05b0-4cf7-a24f-c3c6143d6251'),
	(25,100,775,'Image','image',NULL,NULL,'',0,11,'2017-12-02 02:18:46','2017-12-02 02:20:07','71eac2fa-c511-44a1-9fdd-4a7664e328c9');

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
	(156,100,'■ Wrapper',1,'2017-12-02 02:20:07','2017-12-02 02:20:07','6b7c1db9-83e8-4158-83ef-b0cc525ea9ef'),
	(157,100,'■ Text',5,'2017-12-02 02:20:07','2017-12-02 02:20:07','8d7d97c4-d617-4e4d-bd68-24f308281d83'),
	(158,100,'■ Images',14,'2017-12-02 02:20:07','2017-12-02 02:20:07','d5c4bbce-b9cc-4389-9c67-4e42f549743b'),
	(159,100,'■ Leftover',20,'2017-12-02 02:20:07','2017-12-02 02:20:07','ef4b5238-4339-4724-885b-05513d798dd5'),
	(160,100,'■ External',23,'2017-12-02 02:20:07','2017-12-02 02:20:07','d37755ca-81ad-4195-a5bc-7a2462bac413');

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
	(2,'Cookies','1.0.4','1.0.0',NULL,'unknown',1,NULL,'2017-04-16 22:11:44','2017-04-16 22:11:44','2017-11-17 15:10:31','ef47ceba-51a6-4565-90bd-bfc199022e6c'),
	(3,'FocalPointField','1.0.2',NULL,NULL,'unknown',1,NULL,'2017-04-16 22:11:48','2017-04-16 22:11:48','2017-11-17 15:10:31','4e64b877-25c4-4f86-91ff-a5e3109b4e2f'),
	(4,'Imager','1.6.4','1.0.0',NULL,'unknown',1,NULL,'2017-04-16 22:11:50','2017-04-16 22:11:50','2017-11-17 15:10:31','0cff012d-6717-4a58-aa39-51268d2dbe80'),
	(5,'Kint','1.1.0','1.0.0',NULL,'unknown',1,'{\"kintDisplayTheme\":\"solarized-dark\"}','2017-04-16 22:11:55','2017-04-16 22:11:55','2017-12-03 04:17:47','f101513d-d2bd-4990-a866-6ad089964b4a'),
	(6,'FruitLinkIt','2.3.4','2.3.0',NULL,'unknown',1,NULL,'2017-04-16 22:11:59','2017-04-16 22:11:59','2017-11-17 15:10:31','47ace0df-f9d6-49c2-9647-788d50e2e275'),
	(7,'Minify','1.2.0','1.0.0',NULL,'unknown',1,NULL,'2017-04-16 22:42:23','2017-04-16 22:42:23','2017-11-17 15:10:31','16bd2799-b641-4981-a41c-0e3392a48d5a'),
	(8,'Neo','1.4.1','1.5.0',NULL,'unknown',1,NULL,'2017-04-16 22:42:26','2017-04-16 22:42:26','2017-12-01 23:09:09','70d7e5dd-2268-40a4-85f3-a7ab5dcf34cc'),
	(9,'SidebarEnhancer','1.0.9','1.0.0',NULL,'unknown',1,NULL,'2017-04-16 22:42:33','2017-04-16 22:42:33','2017-11-17 15:10:31','217a761d-a45d-4d67-8ee2-7cbd11ac91c4'),
	(10,'SuperTable','1.0.5','1.0.0',NULL,'unknown',1,NULL,'2017-04-16 22:42:40','2017-04-16 22:42:40','2017-11-17 15:10:31','196c672e-f9cb-444f-b32c-f399bca73a78'),
	(11,'TheArchitect','1.6.0','1.6.0',NULL,'unknown',1,NULL,'2017-04-16 22:42:43','2017-04-16 22:42:43','2017-11-17 15:10:31','fb4f3140-f2f7-4c99-9257-087a3f99f655'),
	(12,'Seomatic','1.1.56','1.1.25',NULL,'unknown',1,NULL,'2017-04-16 22:43:59','2017-04-16 22:43:59','2017-11-17 15:10:31','7dcd03d0-54c8-47ed-b618-e93935503345'),
	(14,'PreparseField','0.3.6','1.0.0',NULL,'unknown',1,NULL,'2017-06-08 16:47:59','2017-06-08 16:47:59','2017-11-17 15:10:31','76418ae9-5d26-4856-ae7d-4ea1d49288b1'),
	(16,'CpFieldLinks','1.2.2','1.0',NULL,'unknown',1,NULL,'2017-07-17 21:20:11','2017-07-17 21:20:11','2017-11-17 15:10:31','4766608d-4053-4413-a74e-1bc3ca584459'),
	(19,'FmContentKing','0.0.1','0.0.1',NULL,'unknown',1,NULL,'2017-11-10 21:59:53','2017-11-10 21:59:53','2017-11-17 15:10:31','b5584013-e4fd-45a7-af71-a5b70e45dfd1'),
	(20,'Hacksaw','1.1.2',NULL,NULL,'unknown',1,NULL,'2017-11-10 22:23:51','2017-11-10 22:23:51','2017-11-17 15:10:31','ddec166f-4dfd-4483-9e4a-ff031308cfb6'),
	(22,'FmSitemap','0.0.1',NULL,NULL,'unknown',1,NULL,'2017-12-03 03:58:18','2017-12-03 03:58:18','2017-12-03 03:58:18','ef9ef91a-0372-4479-ad7e-81420e4cd51f'),
	(24,'TaskManager','0.4.3',NULL,NULL,'unknown',1,NULL,'2017-12-03 04:01:19','2017-12-03 04:01:19','2017-12-03 04:01:19','20a36cef-d31e-41e8-8d0e-64a286093f8e'),
	(27,'Helpers','2.1.0','1.0.0',NULL,'unknown',1,NULL,'2017-12-03 04:17:21','2017-12-03 04:17:21','2017-12-03 04:17:21','14634425-8b22-4e99-8b4d-4e6259259f6a'),
	(28,'BaukastenNeoStyles','1.0.0','1.0.0',NULL,'unknown',1,NULL,'2017-12-03 23:42:27','2017-12-03 23:42:27','2017-12-03 23:42:27','edf9f0c3-198b-47d9-8ba7-ad77665e0106'),
	(29,'Retour','1.0.19','1.0.4',NULL,'unknown',1,NULL,'2017-12-03 23:43:04','2017-12-03 23:43:04','2017-12-03 23:43:04','3533dc77-1517-40c3-80f9-056b74c559a9'),
	(30,'AmCommand','2.2.0','2.0.1',NULL,'unknown',1,NULL,'2017-12-05 14:25:57','2017-12-05 14:25:57','2017-12-05 14:25:57','ec66d6cd-40da-46f2-91b9-736ee1584451');

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
	(3396,103,120,NULL,11,1,'2017-09-24 14:08:40','2017-09-24 14:08:40','7adb2c6e-e439-421b-9fcc-42fb5a370160'),
	(3397,3,120,NULL,122,1,'2017-09-24 14:08:40','2017-09-24 14:08:40','35055ed2-5aca-485b-baa5-15e9497de0a2'),
	(3400,103,123,NULL,13,1,'2017-09-24 14:09:37','2017-09-24 14:09:37','00dbd3b6-f42b-41cf-9158-ccc8dd68e51d'),
	(3401,3,123,NULL,122,1,'2017-09-24 14:09:37','2017-09-24 14:09:37','616864a1-a8f4-40af-8318-54846307a506'),
	(3402,103,121,NULL,12,1,'2017-09-24 14:09:50','2017-09-24 14:09:50','6f8acae9-7bfc-400a-8e2e-a989bc6294c0'),
	(3403,3,121,NULL,122,1,'2017-09-24 14:09:50','2017-09-24 14:09:50','e4ba5e0e-2a15-4f43-bdeb-e20f50d62fb1'),
	(3409,91,155,NULL,14,1,'2017-12-02 21:51:59','2017-12-02 21:51:59','2b265109-6573-402b-888c-8f6f8f1b61ee'),
	(3412,91,181,NULL,14,1,'2017-12-02 22:10:57','2017-12-02 22:10:57','1324ec68-0dbf-4b77-82f8-962b3d28773c');

/*!40000 ALTER TABLE `craft_relations` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle craft_retour_redirects
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_retour_redirects`;

CREATE TABLE `craft_retour_redirects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `associatedElementId` int(11) NOT NULL,
  `redirectSrcUrl` text COLLATE utf8_unicode_ci,
  `redirectSrcUrlParsed` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `redirectMatchType` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'match',
  `redirectDestUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `redirectHttpCode` int(10) DEFAULT '301',
  `hitCount` int(10) DEFAULT '0',
  `hitLastTime` datetime DEFAULT '2017-12-03 23:43:04',
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_retour_redirects_redirectSrcUrlParsed_unq_idx` (`redirectSrcUrlParsed`),
  KEY `craft_retour_redirects_locale_associatedElementId_idx` (`locale`,`associatedElementId`),
  KEY `craft_retour_redirects_associatedElementId_fk` (`associatedElementId`),
  CONSTRAINT `craft_retour_redirects_associatedElementId_fk` FOREIGN KEY (`associatedElementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_retour_redirects_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_retour_static_redirects
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_retour_static_redirects`;

CREATE TABLE `craft_retour_static_redirects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `redirectSrcUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `redirectSrcUrlParsed` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `redirectMatchType` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'match',
  `redirectDestUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `redirectHttpCode` int(10) DEFAULT '301',
  `hitCount` int(10) DEFAULT '0',
  `hitLastTime` datetime DEFAULT '2017-12-03 23:43:04',
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `associatedElementId` int(10) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_retour_static_redirects_redirectSrcUrlParsed_unq_idx` (`redirectSrcUrlParsed`),
  KEY `craft_retour_static_redirects_locale_id_idx` (`locale`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_retour_stats
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_retour_stats`;

CREATE TABLE `craft_retour_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `redirectSrcUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `referrerUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `hitCount` int(10) DEFAULT '0',
  `hitLastTime` datetime DEFAULT '2017-12-03 23:43:04',
  `handledByRetour` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_retour_stats_redirectSrcUrl_unq_idx` (`redirectSrcUrl`),
  KEY `craft_retour_stats_hitCount_id_idx` (`hitCount`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_retour_stats` WRITE;
/*!40000 ALTER TABLE `craft_retour_stats` DISABLE KEYS */;

INSERT INTO `craft_retour_stats` (`id`, `redirectSrcUrl`, `referrerUrl`, `hitCount`, `hitLastTime`, `handledByRetour`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'/assets/images/bitmap/favicons/favicon-96x96.png','http://baukasten.dev/',2,'2017-12-05 12:59:28',0,'2017-12-05 12:46:31','2017-12-05 12:59:28','abd7b175-ea7c-414e-86e4-102ac6f5d852'),
	(2,'/assets/images/bitmap/favicons/favicon-128.png','http://baukasten.dev/',2,'2017-12-05 12:59:28',0,'2017-12-05 12:46:32','2017-12-05 12:59:28','3509530f-e911-4b87-ba97-51032aa3aad7'),
	(3,'/assets/images/bitmap/favicons/favicon-196x196.png','http://baukasten.dev/',2,'2017-12-05 12:59:29',0,'2017-12-05 12:46:33','2017-12-05 12:59:29','9258c503-846e-49f0-8c10-8c57bc06b6dc'),
	(4,'/favicon.ico','http://baukasten.dev/admin/login',1,'2017-12-05 12:58:26',0,'2017-12-05 12:58:26','2017-12-05 12:58:26','f46e0b65-0b92-4b30-8702-4adb894deaad'),
	(5,'/__webpack_hmr','http://baukasten.dev/dev/modules-content-builder-nested',268,'2017-12-05 14:32:13',0,'2017-12-05 12:59:28','2017-12-05 14:32:13','41685dde-2e82-4e50-afae-c2499a05ac03');

/*!40000 ALTER TABLE `craft_retour_stats` ENABLE KEYS */;
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
	(6,'field',12,'de',''),
	(6,'slug',0,'de',''),
	(5,'field',100,'de',''),
	(5,'title',0,'de',' modules content builder '),
	(5,'slug',0,'de',' modules content builder '),
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
	(68,'field',78,'de',' 0 '),
	(68,'field',79,'de',' default '),
	(68,'field',80,'de',' default '),
	(68,'slug',0,'de',''),
	(70,'field',78,'de',' 0 '),
	(70,'field',79,'de',' default '),
	(70,'field',80,'de',' large '),
	(70,'slug',0,'de',''),
	(11,'field',101,'de',' 3d372f '),
	(12,'field',101,'de',' a7a7a7 '),
	(13,'field',101,'de',' 656565 '),
	(14,'field',101,'de',' c7c7c7 '),
	(5,'field',102,'de',''),
	(5,'field',104,'de',''),
	(5,'field',103,'de',''),
	(114,'field',113,'de',''),
	(114,'slug',0,'de',''),
	(115,'field',117,'de',''),
	(115,'slug',0,'de',''),
	(6,'field',118,'de',''),
	(116,'field',4,'de',''),
	(116,'slug',0,'de',''),
	(117,'field',122,'de',''),
	(117,'slug',0,'de',''),
	(119,'field',102,'de',''),
	(119,'field',104,'de',''),
	(119,'field',100,'de',''),
	(119,'field',103,'de',''),
	(119,'field',106,'de',' 1 0 de 1 0 template creativework webpage articles socialsharing socialsharing socialsharing summary_large_image news field title field singleintrotext custom title field singleimageentry field singleimageentry field singleimageentry '),
	(119,'slug',0,'de',' articles '),
	(119,'title',0,'de',' articles '),
	(120,'field',102,'de',''),
	(120,'field',104,'de',' an populo iriure interesset sit eum quas zril nostrum ei est no esse illum falli doming vix no no pri causae petentium id vocibus volutpat deterruisset usu vocibus verterem sed ne usu ne similique temporibus ex vix dicat discere partiendo at ignota corpora mei posse percipitur mea ut at doming commodo deseruisse sit eu diceret fabulas eligendi vix sea nostrum scriptorem ad quo cu eius tollit instructior '),
	(120,'field',103,'de',' image 01 '),
	(120,'field',100,'de',''),
	(120,'field',3,'de',' example '),
	(120,'field',105,'de',' 1 0 de 1 0 template creativework webpage welcome to baukasten an populo iriure interesset sit eum quas zril nostrum ei est no esse illum falli doming vix no no pri causae petentium id vocibus volutpat deterruisset socialsharing socialsharing socialsharing summary_large_image 11 11 11 welcome an populo iriure interesset sit eum quas zril nostrum ei est no esse illum falli doming vix no no pri causae petentium id vocibus volutpat deterruisset field title field singleintrotext custom title field singleimageentry field singleimageentry field singleimageentry '),
	(120,'slug',0,'de',' welcome '),
	(120,'title',0,'de',' welcome to baukasten '),
	(121,'field',102,'de',''),
	(121,'field',104,'de',' lorem ipsum dolor sit amet quas appetere qui te vel ne enim putent tractatos ullum inani et duo per placerat ocurreret te eos diceret accumsan in qui no viderer vivendum facilisi pro illud possim legimus at illum sonet numquam id vis ei accumsan nominati eos nam suas admodum ancillae ne nullam noster scribentur per cu te duis consetetur adipiscing pri mollis deseruisse te mei cu euismod singulis suavitate eam ex eos purto similique an eum fabellas adolescens dolor signiferumque cum id dicunt cetero detracto mea ei '),
	(121,'field',100,'de',''),
	(121,'field',103,'de',' image 02 '),
	(121,'field',3,'de',' example '),
	(121,'field',105,'de',' 1 0 de 1 0 template creativework webpage example news entry lorem ipsum dolor sit amet quas appetere qui te vel ne enim putent tractatos ullum inani et duo per placerat ocurreret te eos diceret accumsan in qui no socialsharing socialsharing socialsharing summary_large_image 12 12 12 example news entry lorem ipsum dolor sit amet quas appetere qui te vel ne enim putent tractatos ullum inani et duo per placerat ocurreret te eos diceret accumsan in qui no field title field singleintrotext custom title field singleimageentry field singleimageentry field singleimageentry '),
	(121,'slug',0,'de',' example news entry '),
	(121,'title',0,'de',' example news entry '),
	(122,'slug',0,'de',' example '),
	(122,'title',0,'de',' example '),
	(123,'field',102,'de',''),
	(123,'field',104,'de',' ex dico dolor vis splendide vituperatoribus cu usu ei mea posse sonet labores ad duo veritus intellegam alterum appellantur vix et vis dissentiet repudiandae eu decore integre principes per ei id vim stet mentitum repudiandae pri mentitum qualisque ea ex usu augue viderer suscipit ea vel mucius graecis mentitum perfecto eu duo duo eu ipsum urbanitas eruditi recteque abhorreant ius et omnes dolore debitis vel ei an inani copiosae nec audiam sanctus nostrum est ea assum iuvaret mea id '),
	(123,'field',100,'de',''),
	(123,'field',103,'de',' image 03 '),
	(123,'field',3,'de',' example '),
	(123,'field',105,'de',' 1 0 de 1 0 template creativework webpage another news example ex dico dolor vis splendide vituperatoribus cu usu ei mea posse sonet labores ad duo veritus intellegam alterum appellantur vix et vis dissentiet socialsharing socialsharing socialsharing summary_large_image 13 13 13 another news example ex dico dolor vis splendide vituperatoribus cu usu ei mea posse sonet labores ad duo veritus intellegam alterum appellantur vix et vis dissentiet field title field singleintrotext custom title field singleimageentry field singleimageentry field singleimageentry '),
	(123,'slug',0,'de',' another news example '),
	(123,'title',0,'de',' another news example '),
	(115,'field',83,'de',''),
	(124,'field',73,'de',' yes paddingvertical small '),
	(124,'slug',0,'de',''),
	(125,'field',75,'de',''),
	(125,'field',76,'de',' paddingvertical small '),
	(125,'slug',0,'de',''),
	(126,'field',90,'de',' h2 the quick brown fox jumps over the lazy dog '),
	(126,'field',48,'de',' h2 '),
	(126,'slug',0,'de',''),
	(127,'field',50,'de',' h2 '),
	(127,'slug',0,'de',''),
	(128,'field',90,'de',' h3 the quick brown fox jumps over the lazy dog '),
	(128,'field',48,'de',' h3 '),
	(128,'slug',0,'de',''),
	(129,'field',50,'de',' h3 '),
	(129,'slug',0,'de',''),
	(130,'field',90,'de',' h4 the quick brown fox jumps over the lazy dog '),
	(130,'field',48,'de',' h4 '),
	(130,'slug',0,'de',''),
	(131,'field',50,'de',' h4 '),
	(131,'slug',0,'de',''),
	(132,'field',90,'de',' h5 the quick brown fox jumps over the lazy dog '),
	(132,'field',48,'de',' h5 '),
	(132,'slug',0,'de',''),
	(133,'field',50,'de',' h5 '),
	(133,'slug',0,'de',''),
	(134,'field',90,'de',' h6 the quick brown fox jumps over the lazy dog '),
	(134,'field',48,'de',' h6 '),
	(134,'slug',0,'de',''),
	(135,'field',50,'de',' h6 '),
	(135,'slug',0,'de',''),
	(136,'field',73,'de',' no paddingvertical small '),
	(136,'slug',0,'de',''),
	(137,'field',75,'de',''),
	(137,'field',76,'de',' paddingvertical small '),
	(137,'slug',0,'de',''),
	(138,'field',95,'de',' lorem ipsum dolor sit amet quas appetere qui te vel ne enim putent tractatos ullum inani et duo per placerat ocurreret te eos diceret accumsan in qui no viderer vivendum facilisi pro illud possim legimus at illum sonet numquam id vis ei accumsan nominati eos nam suas admodum ancillae ne nullam noster scribentur per cu te duis consetetur adipiscing pri mollis deseruisse te mei cu euismod singulis suavitate eam ex eos purto similique an eum fabellas adolescens dolor signiferumque cum id dicunt cetero detracto mea ei ex dico dolor vis splendide vituperatoribus cu usu ei mea posse sonet labores ad duo veritus intellegam alterum appellantur vix et vis dissentiet repudiandae eu decore integre principes per ei id vim stet mentitum repudiandae pri mentitum qualisque ea ex usu augue viderer suscipit ea vel mucius graecis mentitum perfecto eu duo duo eu ipsum urbanitas eruditi recteque abhorreant ius et omnes dolore debitis vel ei an inani copiosae nec audiam sanctus nostrum est ea assum iuvaret mea id an populo iriure interesset sit eum quas zril nostrum ei est no esse illum falli doming vix no no pri causae petentium id vocibus volutpat deterruisset usu vocibus verterem sed ne usu ne similique temporibus ex vix dicat discere partiendo at ignota corpora mei posse percipitur mea ut at doming commodo deseruisse sit eu diceret fabulas eligendi vix sea nostrum scriptorem ad quo cu eius tollit instructior lorem ipsum dolor sit amet quas appetere qui te vel ne enim putent tractatos ullum inani et duo per placerat ocurreret te eos diceret accumsan in qui no viderer vivendum facilisi pro illud possim legimus at illum sonet numquam id vis ei accumsan nominati eos nam suas admodum ancillae ne nullam noster scribentur per cu te duis consetetur adipiscing pri mollis deseruisse te mei cu euismod singulis suavitate eam ex eos purto similique an eum fabellas adolescens dolor signiferumque cum id dicunt cetero detracto mea ei ex dico dolor vis splendide vituperatoribus cu usu ei mea posse sonet labores ad duo veritus intellegam alterum appellantur vix et vis dissentiet repudiandae eu decore integre principes per ei id vim stet mentitum repudiandae pri mentitum qualisque ea ex usu augue viderer suscipit ea vel mucius graecis mentitum perfecto eu duo duo eu ipsum urbanitas eruditi recteque abhorreant ius et omnes dolore debitis vel ei an inani copiosae nec audiam sanctus nostrum est ea assum iuvaret mea id an populo iriure interesset sit eum quas zril nostrum ei est no esse illum falli doming vix no no pri causae petentium id vocibus volutpat deterruisset usu vocibus verterem sed ne usu ne similique temporibus ex vix dicat discere partiendo at ignota corpora mei posse percipitur mea ut at doming commodo deseruisse sit eu diceret fabulas eligendi vix sea nostrum scriptorem ad quo cu eius tollit instructior lorem ipsum dolor sit amet quas appetere qui te vel ne enim putent tractatos ullum inani et duo per placerat ocurreret te eos diceret accumsan in qui no viderer vivendum facilisi pro illud possim legimus at illum sonet numquam id vis ei accumsan nominati eos nam suas admodum ancillae ne nullam noster scribentur per cu te duis consetetur adipiscing pri mollis deseruisse te mei cu euismod singulis suavitate eam ex eos purto similique an eum fabellas adolescens dolor signiferumque cum id dicunt cetero detracto mea ei ex dico dolor vis splendide vituperatoribus cu usu ei mea posse sonet labores ad duo veritus intellegam alterum appellantur vix et vis dissentiet repudiandae eu decore integre principes per ei id vim stet mentitum repudiandae pri mentitum qualisque ea ex usu augue viderer suscipit ea vel mucius graecis mentitum perfecto eu duo duo eu ipsum urbanitas eruditi recteque abhorreant ius et omnes dolore debitis vel ei an inani copiosae nec audiam sanctus nostrum est ea assum iuvaret mea id dolor signiferumque cum id dicunt cetero detracto mea ei ex dico dolor vis splendide vituperatoribus cu usu ei mea posse sonet labores ad duo veritus intellegam alterum appellantur vix et vis dissentiet repudiandae eu decore integre principes per ei id vim stet mentitum repudiandae pri mentitum qualisque ea ex usu augue viderer suscipit ea vel mucius graecis mentitum perfecto eu duo duo eu ipsum urbanitas eruditi recteque abhorreant ius et omnes dolore debitis vel ei an inani copiosae nec audiam sanctus nostrum est ea assum iuvaret mea id cu euismod singulis suavitate eam ex eos purto similique an eum fabellas adolescens dolor signiferumque cum id dicunt cetero detracto mea ei ex dico dolor vis splendide vituperatoribus cu usu ei mea posse sonet labores ad duo veritus intellegam alterum appellantur vix et vis dissentiet repudiandae eu decore integre principes per ei id vim stet mentitum repudiandae pri mentitum qualisque ea ex usu augue viderer suscipit ea vel mucius graecis mentitum perfecto eu duo duo eu ipsum urbanitas eruditi recteque abhorreant ius et omnes dolore debitis vel ei an inani copiosae nec audiam sanctus nostrum est ea assum iuvaret mea id an populo iriure interesset sit eum quas zril nostrum ei est no esse illum falli doming vix no no pri causae petentium id vocibus volutpat deterruisset usu vocibus verterem sed ne usu ne similique temporibus ex vix dicat discere partiendo at ignota corpora mei posse percipitur mea ut at doming commodo deseruisse sit eu diceret fabulas eligendi vix sea nostrum scriptorem ad quo cu eius tollit instructior '),
	(138,'slug',0,'de',''),
	(143,'field',95,'de',' lorem ipsum dolor sit amet quas appetere qui te vel ne enim putent tractatos ullum inani et duo per placerat ocurreret te eos diceret accumsan in qui no viderer vivendum facilisi pro illud possim legimus at illum sonet numquam id vis ei accumsan nominati eos nam suas admodum ancillae ne nullam noster scribentur per cu te duis consetetur adipiscing pri mollis deseruisse te mei cu euismod singulis suavitate eam ex eos purto similique an eum fabellas adolescens dolor signiferumque cum id dicunt cetero detracto mea ei ex dico dolor vis splendide vituperatoribus cu usu ei mea posse sonet labores ad duo veritus intellegam alterum appellantur vix et vis dissentiet repudiandae eu decore integre principes per ei id vim stet mentitum repudiandae pri mentitum qualisque ea ex usu augue viderer suscipit ea vel mucius graecis mentitum perfecto eu duo duo eu ipsum urbanitas eruditi recteque abhorreant ius et omnes dolore debitis vel ei an inani copiosae nec audiam sanctus nostrum est ea assum iuvaret mea id an populo iriure interesset sit eum quas zril nostrum ei est no esse illum falli doming vix no no pri causae petentium id vocibus volutpat deterruisset usu vocibus verterem sed ne usu ne similique temporibus ex vix dicat discere partiendo at ignota corpora mei posse percipitur mea ut at doming commodo deseruisse sit eu diceret fabulas eligendi vix sea nostrum scriptorem ad quo cu eius tollit instructior '),
	(141,'field',77,'de',' mv small style default '),
	(141,'slug',0,'de',''),
	(142,'field',79,'de',' style default '),
	(142,'field',80,'de',' mv small '),
	(142,'slug',0,'de',''),
	(143,'slug',0,'de',''),
	(150,'slug',0,'de',''),
	(150,'field',132,'de',' an populo iriure interesset sit eum quas zril nostrum ei est no esse illum falli doming vix no '),
	(137,'field',133,'de',' no '),
	(155,'slug',0,'de',''),
	(155,'field',64,'de',' align center 0 16 10 width full '),
	(155,'field',91,'de',' image 04 '),
	(156,'field',68,'de',' width full '),
	(146,'field',73,'de',' no paddingvertical none '),
	(146,'slug',0,'de',''),
	(147,'field',75,'de',''),
	(147,'field',76,'de',' paddingvertical none '),
	(147,'slug',0,'de',''),
	(149,'slug',0,'de',''),
	(151,'slug',0,'de',''),
	(157,'field',102,'de',''),
	(157,'field',104,'de',''),
	(157,'field',100,'de',''),
	(125,'field',133,'de',' yes '),
	(156,'field',65,'de',' 0 '),
	(147,'field',133,'de',' no '),
	(156,'slug',0,'de',''),
	(156,'field',67,'de',' 16 10 '),
	(156,'field',66,'de',' align center '),
	(157,'field',103,'de',''),
	(157,'slug',0,'de',' modules content builder nested '),
	(157,'title',0,'de',' modules content builder nested '),
	(158,'field',73,'de',' no paddingvertical small '),
	(158,'slug',0,'de',''),
	(159,'field',75,'de',''),
	(159,'field',76,'de',' paddingvertical small '),
	(159,'field',133,'de',' no '),
	(159,'slug',0,'de',''),
	(160,'field',90,'de',' h2 the quick brown fox jumps over the lazy dog '),
	(160,'field',48,'de',' h2 '),
	(160,'slug',0,'de',''),
	(161,'field',50,'de',' h2 '),
	(161,'slug',0,'de',''),
	(162,'field',90,'de',' h3 the quick brown fox jumps over the lazy dog '),
	(162,'field',48,'de',' h3 '),
	(162,'slug',0,'de',''),
	(163,'field',50,'de',' h3 '),
	(163,'slug',0,'de',''),
	(164,'field',90,'de',' h4 the quick brown fox jumps over the lazy dog '),
	(164,'field',48,'de',' h4 '),
	(164,'slug',0,'de',''),
	(165,'field',50,'de',' h4 '),
	(165,'slug',0,'de',''),
	(166,'field',90,'de',' h5 the quick brown fox jumps over the lazy dog '),
	(166,'field',48,'de',' h5 '),
	(166,'slug',0,'de',''),
	(167,'field',50,'de',' h5 '),
	(167,'slug',0,'de',''),
	(168,'field',90,'de',' h6 the quick brown fox jumps over the lazy dog '),
	(168,'field',48,'de',' h6 '),
	(168,'slug',0,'de',''),
	(169,'field',50,'de',' h6 '),
	(169,'slug',0,'de',''),
	(170,'field',95,'de',' lorem ipsum dolor sit amet quas appetere qui te vel ne enim putent tractatos ullum inani et duo per placerat ocurreret te eos diceret accumsan in qui no viderer vivendum facilisi pro illud possim legimus at illum sonet numquam id vis ei accumsan nominati eos nam suas admodum ancillae ne nullam noster scribentur per cu te duis consetetur adipiscing pri mollis deseruisse te mei cu euismod singulis suavitate eam ex eos purto similique an eum fabellas adolescens dolor signiferumque cum id dicunt cetero detracto mea ei ex dico dolor vis splendide vituperatoribus cu usu ei mea posse sonet labores ad duo veritus intellegam alterum appellantur vix et vis dissentiet repudiandae eu decore integre principes per ei id vim stet mentitum repudiandae pri mentitum qualisque ea ex usu augue viderer suscipit ea vel mucius graecis mentitum perfecto eu duo duo eu ipsum urbanitas eruditi recteque abhorreant ius et omnes dolore debitis vel ei an inani copiosae nec audiam sanctus nostrum est ea assum iuvaret mea id an populo iriure interesset sit eum quas zril nostrum ei est no esse illum falli doming vix no no pri causae petentium id vocibus volutpat deterruisset usu vocibus verterem sed ne usu ne similique temporibus ex vix dicat discere partiendo at ignota corpora mei posse percipitur mea ut at doming commodo deseruisse sit eu diceret fabulas eligendi vix sea nostrum scriptorem ad quo cu eius tollit instructior lorem ipsum dolor sit amet quas appetere qui te vel ne enim putent tractatos ullum inani et duo per placerat ocurreret te eos diceret accumsan in qui no viderer vivendum facilisi pro illud possim legimus at illum sonet numquam id vis ei accumsan nominati eos nam suas admodum ancillae ne nullam noster scribentur per cu te duis consetetur adipiscing pri mollis deseruisse te mei cu euismod singulis suavitate eam ex eos purto similique an eum fabellas adolescens dolor signiferumque cum id dicunt cetero detracto mea ei ex dico dolor vis splendide vituperatoribus cu usu ei mea posse sonet labores ad duo veritus intellegam alterum appellantur vix et vis dissentiet repudiandae eu decore integre principes per ei id vim stet mentitum repudiandae pri mentitum qualisque ea ex usu augue viderer suscipit ea vel mucius graecis mentitum perfecto eu duo duo eu ipsum urbanitas eruditi recteque abhorreant ius et omnes dolore debitis vel ei an inani copiosae nec audiam sanctus nostrum est ea assum iuvaret mea id an populo iriure interesset sit eum quas zril nostrum ei est no esse illum falli doming vix no no pri causae petentium id vocibus volutpat deterruisset usu vocibus verterem sed ne usu ne similique temporibus ex vix dicat discere partiendo at ignota corpora mei posse percipitur mea ut at doming commodo deseruisse sit eu diceret fabulas eligendi vix sea nostrum scriptorem ad quo cu eius tollit instructior lorem ipsum dolor sit amet quas appetere qui te vel ne enim putent tractatos ullum inani et duo per placerat ocurreret te eos diceret accumsan in qui no viderer vivendum facilisi pro illud possim legimus at illum sonet numquam id vis ei accumsan nominati eos nam suas admodum ancillae ne nullam noster scribentur per cu te duis consetetur adipiscing pri mollis deseruisse te mei cu euismod singulis suavitate eam ex eos purto similique an eum fabellas adolescens dolor signiferumque cum id dicunt cetero detracto mea ei ex dico dolor vis splendide vituperatoribus cu usu ei mea posse sonet labores ad duo veritus intellegam alterum appellantur vix et vis dissentiet repudiandae eu decore integre principes per ei id vim stet mentitum repudiandae pri mentitum qualisque ea ex usu augue viderer suscipit ea vel mucius graecis mentitum perfecto eu duo duo eu ipsum urbanitas eruditi recteque abhorreant ius et omnes dolore debitis vel ei an inani copiosae nec audiam sanctus nostrum est ea assum iuvaret mea id dolor signiferumque cum id dicunt cetero detracto mea ei ex dico dolor vis splendide vituperatoribus cu usu ei mea posse sonet labores ad duo veritus intellegam alterum appellantur vix et vis dissentiet repudiandae eu decore integre principes per ei id vim stet mentitum repudiandae pri mentitum qualisque ea ex usu augue viderer suscipit ea vel mucius graecis mentitum perfecto eu duo duo eu ipsum urbanitas eruditi recteque abhorreant ius et omnes dolore debitis vel ei an inani copiosae nec audiam sanctus nostrum est ea assum iuvaret mea id cu euismod singulis suavitate eam ex eos purto similique an eum fabellas adolescens dolor signiferumque cum id dicunt cetero detracto mea ei ex dico dolor vis splendide vituperatoribus cu usu ei mea posse sonet labores ad duo veritus intellegam alterum appellantur vix et vis dissentiet repudiandae eu decore integre principes per ei id vim stet mentitum repudiandae pri mentitum qualisque ea ex usu augue viderer suscipit ea vel mucius graecis mentitum perfecto eu duo duo eu ipsum urbanitas eruditi recteque abhorreant ius et omnes dolore debitis vel ei an inani copiosae nec audiam sanctus nostrum est ea assum iuvaret mea id an populo iriure interesset sit eum quas zril nostrum ei est no esse illum falli doming vix no no pri causae petentium id vocibus volutpat deterruisset usu vocibus verterem sed ne usu ne similique temporibus ex vix dicat discere partiendo at ignota corpora mei posse percipitur mea ut at doming commodo deseruisse sit eu diceret fabulas eligendi vix sea nostrum scriptorem ad quo cu eius tollit instructior '),
	(170,'slug',0,'de',''),
	(171,'field',73,'de',' no paddingvertical none '),
	(171,'slug',0,'de',''),
	(172,'field',75,'de',''),
	(172,'field',76,'de',' paddingvertical none '),
	(172,'field',133,'de',' no '),
	(172,'slug',0,'de',''),
	(173,'field',77,'de',' mv small style default '),
	(173,'slug',0,'de',''),
	(174,'field',79,'de',' style default '),
	(174,'field',80,'de',' mv small '),
	(174,'slug',0,'de',''),
	(175,'field',73,'de',' no paddingvertical small '),
	(175,'slug',0,'de',''),
	(176,'field',75,'de',''),
	(176,'field',76,'de',' paddingvertical small '),
	(176,'field',133,'de',' no '),
	(176,'slug',0,'de',''),
	(177,'field',95,'de',' lorem ipsum dolor sit amet quas appetere qui te vel ne enim putent tractatos ullum inani et duo per placerat ocurreret te eos diceret accumsan in qui no viderer vivendum facilisi pro illud possim legimus at illum sonet numquam id vis ei accumsan nominati eos nam suas admodum ancillae ne nullam noster scribentur per cu te duis consetetur adipiscing pri mollis deseruisse te mei cu euismod singulis suavitate eam ex eos purto similique an eum fabellas adolescens dolor signiferumque cum id dicunt cetero detracto mea ei ex dico dolor vis splendide vituperatoribus cu usu ei mea posse sonet labores ad duo veritus intellegam alterum appellantur vix et vis dissentiet repudiandae eu decore integre principes per ei id vim stet mentitum repudiandae pri mentitum qualisque ea ex usu augue viderer suscipit ea vel mucius graecis mentitum perfecto eu duo duo eu ipsum urbanitas eruditi recteque abhorreant ius et omnes dolore debitis vel ei an inani copiosae nec audiam sanctus nostrum est ea assum iuvaret mea id an populo iriure interesset sit eum quas zril nostrum ei est no esse illum falli doming vix no no pri causae petentium id vocibus volutpat deterruisset usu vocibus verterem sed ne usu ne similique temporibus ex vix dicat discere partiendo at ignota corpora mei posse percipitur mea ut at doming commodo deseruisse sit eu diceret fabulas eligendi vix sea nostrum scriptorem ad quo cu eius tollit instructior '),
	(177,'slug',0,'de',''),
	(178,'slug',0,'de',''),
	(179,'field',132,'de',' an populo iriure interesset sit eum quas zril nostrum ei est no esse illum falli doming vix no '),
	(179,'slug',0,'de',''),
	(180,'slug',0,'de',''),
	(181,'field',91,'de',' image 04 '),
	(181,'field',64,'de',' align center 0 16 10 width full '),
	(181,'slug',0,'de',''),
	(182,'field',65,'de',' 0 '),
	(182,'field',66,'de',' align center '),
	(182,'field',67,'de',' 16 10 '),
	(182,'field',68,'de',' width full '),
	(182,'slug',0,'de','');

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
	(4,244,'Development','development','structure',1,'_dev',0,'2017-04-16 22:48:52','2017-12-02 22:10:54','0fe1fe7e-9e1d-432b-9401-fa46118d05f4'),
	(5,NULL,'Articles','articles','channel',1,'_entry',1,'2017-04-16 22:48:52','2017-11-16 01:13:05','222d6ea4-e3a8-4270-8dae-597e1c1f38d4'),
	(6,2,'Pages','pages','structure',1,'_entry',1,'2017-04-16 22:56:24','2017-11-16 01:13:47','ad6b7331-f1d3-44a9-b70f-24214262a47b');

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
	(4,4,'de',0,'dev/{slug}',NULL,'2017-04-16 22:48:52','2017-12-02 22:10:54','0405acd3-102d-46ef-b580-bd0a9d068f4d'),
	(5,5,'de',0,'article/{slug}',NULL,'2017-04-16 22:48:52','2017-11-11 16:42:41','746a5783-5275-4025-9255-047aeab14ceb'),
	(6,6,'de',0,'{slug}','{parent.uri}/{slug}','2017-04-16 22:56:24','2017-11-11 16:42:09','9ac9729b-5fda-42ca-9777-90aa49b58024');

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
	(1,NULL,NULL,NULL,NULL,NULL,'de','Baukasten.io','It\'s not a homepage baukasten','|','after','This is the default global natural language description of the content on the site pages.','default,global,comma-separated,keywords','socialSharing','socialSharing','socialSharingTwitter','summary_large_image','website','','# robots.txt for {{ siteUrl }}\r\n\r\nSitemap: {{ siteUrl |trim(\'/\') }}/sitemap.xml\r\n\r\n# Don\'t allow web crawlers to index Craft\r\n\r\nUser-agent: *\r\nDisallow: /craft/\r\n','[]','','','','','',0,0,0,0,0,0,0,'Organization','LocalBusiness','ProfessionalService','David Hellmann','Baukasten','It\'s not a homepage baukasten','https://davidhellmann.com','','','','','','','','','','','','','','[]','$$$','[{\"open\":\"\",\"close\":\"\"},{\"open\":\"\",\"close\":\"\"},{\"open\":\"\",\"close\":\"\"},{\"open\":\"\",\"close\":\"\"},{\"open\":\"\",\"close\":\"\"},{\"open\":\"\",\"close\":\"\"},{\"open\":\"\",\"close\":\"\"}]','','','','','Male','','','','','','','','','','','','','','','Person','Corporation','','David Hellmann','','','https://davidhellmann.com','','','','','','','','','','','','','','[]','','','','','','Male','','/* TEAM */\r\n\r\n{% if seomaticCreator.name is defined and seomaticCreator.name %}\r\nCreator: {{ seomaticCreator.name }}\r\n{% endif %}\r\n{% if seomaticCreator.url is defined and seomaticCreator.url %}\r\nURL: {{ seomaticCreator.url }}\r\n{% endif %}\r\n{% if seomaticCreator.description is defined and seomaticCreator.description %}\r\nDescription: {{ seomaticCreator.description }}\r\n{% endif %}\r\n\r\n/* THANKS */\r\n\r\nPixel & Tonic - https://pixelandtonic.com\r\n\r\n/* SITE */\r\n\r\nStandards: HTML5, CSS3\r\nComponents: Craft CMS, Yii, PHP, Javascript, SEOmatic','2017-04-16 23:05:29','2017-10-08 17:23:09','fce4ae7f-6daa-4b68-9d2f-b83927bf3974');

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
	(23,1,'6e532e7b8cbab6a5ab7b24f86d7dc530d209b790czozMjoiSnZnMTFmejlMY35tRERsc2o2YW5DTXpVMUl+R1VQd2EiOw==','2017-08-29 21:02:49','2017-08-29 21:02:49','337fb151-eee1-4792-8406-b9aa3765fcc1'),
	(24,1,'c0fd86a033a481dda57298beb6afd4e9c84ed86eczozMjoieG5qcG5jc3JJZnlQX3FGWH5WT2l1TF9Rb2VvdTRGclkiOw==','2017-09-03 17:01:12','2017-09-03 17:01:12','bf526696-ca3f-4f10-b5d8-2043f8f7029e'),
	(25,1,'b97f97c7a4e07f793ed9161303929703d12b6c35czozMjoiQUZOcGhFRk1JYm5xWGJiamY4NFF4Sjk0clAwS2xHb2EiOw==','2017-09-03 22:17:49','2017-09-03 22:17:49','ffdbea25-d3c9-48a1-b2f7-8fa177a17d39'),
	(26,1,'27f87fa5092f53d00938bfc2521f567c5826dc37czozMjoiNFM2bmY3Zl9YaUpqV284eXR1UlZsaVpQY1NzQUtkdW0iOw==','2017-09-04 13:49:04','2017-09-04 13:49:04','19d79f07-18c7-4f7d-813a-d4be3043ce72'),
	(27,1,'403671758ee7f5ddbdbc416cdf7eda69d86095fbczozMjoiNWV6anU2U2M3TG1qV2pheGFrYjFKeU9CODFzV2RtdzgiOw==','2017-09-19 22:44:30','2017-09-19 22:44:30','a39690cf-ec0a-4b4e-b209-354db5749a88'),
	(29,1,'3ab415c671b95d032a0976f0a3cf3453f3104cf8czozMjoieEFPRjFQcUVwVH5mVWxmRmZ4am1aUTJBYmRZaWlqZWIiOw==','2017-09-22 23:30:57','2017-09-22 23:30:57','f0be0644-2cf2-44bb-ab1c-563060f18ee6'),
	(30,1,'a848df7aaede1c9b61e50eb2236a69e45c2dfaf5czozMjoiejl2U1FJN3ZnZ21Wc3h4MUV4Zm9rNX4xRGY0YjJ5RkgiOw==','2017-09-23 15:27:41','2017-09-23 15:27:41','c84ff28a-4041-41f1-9e41-3da8d2469c9f'),
	(31,1,'84cdcb20580c92f247805acd8bdd32fa8e673e39czozMjoiZnR5aGN2RzVwSENuN2l1N29nR0VBWVEyWmFQOE1SdksiOw==','2017-09-24 13:53:15','2017-09-24 13:53:15','b7317641-4a6c-4ff4-9635-0936c81c5f3e'),
	(33,1,'d470648e74615af3972e8f6ed151b574af821e23czozMjoiZXdRTTJtakNsZE1paHJON2pWa25pVUJCVHRwbmtIfkEiOw==','2017-09-24 20:45:22','2017-09-24 20:45:22','3ecfcfd2-8e31-4384-b9d5-d7e2278ee305'),
	(35,1,'5c93897c29d3720f12adf1df84e02c636b896271czozMjoiRDYxRHR2OXZHVDRHYWh5VEhWOHFWUEdubzh5VHBUc34iOw==','2017-11-11 16:18:27','2017-11-11 16:18:27','951274aa-8839-4200-a015-0d79b729f423'),
	(36,1,'9bb73da0e6d5360aa178655d171e7938a0b8f222czozMjoiV2pCfndJeUxkTVgxOUhGVldPZThSYldqNkhtM1JnMVEiOw==','2017-11-12 22:07:37','2017-11-12 22:07:37','9f835d6c-1986-40e3-a6f0-80b529507f96'),
	(37,1,'b34f8604ab5dae8303da9a9c31f707ba61d2cc10czozMjoiM2w2UnFPZWV1dHpncXc5b05ffmJ4UFZ0VjBsSlNfb2QiOw==','2017-11-22 20:42:21','2017-11-26 12:42:13','892d1128-3fff-4068-9aa2-e35df1f6df4d'),
	(38,1,'61aa0f24970080c7784a5575b1493a5961cc4a96czozMjoiflpOeVRta3NLeFd+NTdMRWR+U1lySVV4WnRCdmhHTDIiOw==','2017-12-03 23:30:28','2017-12-03 23:30:28','e669f135-a2ec-4b70-91cc-5ea8517f12f5'),
	(39,1,'cb3495fb17b311d1d738f17db7ec0a69417f7fb4czozMjoiVFRhMlNHckludGdZVVVCV2lBYX5iS3NmZnN6ZUlRTFAiOw==','2017-12-05 12:58:29','2017-12-05 12:58:29','57b6ff05-99c4-4452-a834-3b4d286e7b92');

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
	(6240,2,NULL,6240,1,4,0,'2017-09-24 13:57:35','2017-09-24 13:57:35','0ae6ac9a-54ea-4711-a20e-16541e3fc593'),
	(6241,2,119,6240,2,3,1,'2017-09-24 13:57:35','2017-09-24 13:57:35','ac64c14d-f28c-4f90-a15a-1a5206a0659a'),
	(6242,1,NULL,6242,1,4,0,'2017-09-24 14:07:04','2017-09-24 14:07:04','1420a7d3-0649-41fd-a554-02dbb827dfaf'),
	(6243,1,122,6242,2,3,1,'2017-09-24 14:07:04','2017-09-24 14:07:04','4a3f03d8-06f2-4a90-b7ed-d4a891255fc6'),
	(6534,244,NULL,6534,1,6,0,'2017-12-02 21:44:27','2017-12-02 21:44:27','b0bce628-0a40-4e65-8b07-437edb832aa1'),
	(6535,244,5,6534,2,3,1,'2017-12-02 21:44:27','2017-12-02 21:44:27','df6aca61-b40c-4492-a8ae-eb36207f2b92'),
	(6536,245,NULL,6536,1,32,0,'2017-12-02 21:51:59','2017-12-02 21:51:59','11997824-12a9-4c52-9e87-a945e4cb0534'),
	(6537,245,124,6536,2,3,1,'2017-12-02 21:51:59','2017-12-02 21:51:59','c4a53179-a4d5-49e2-9055-b09d90563358'),
	(6538,245,126,6536,4,5,1,'2017-12-02 21:51:59','2017-12-02 21:51:59','f73bb7f2-822d-4193-a852-5d95185577d5'),
	(6539,245,128,6536,6,7,1,'2017-12-02 21:51:59','2017-12-02 21:51:59','075177c0-08eb-4ec9-b529-7ba3ba116612'),
	(6540,245,130,6536,8,9,1,'2017-12-02 21:51:59','2017-12-02 21:51:59','33cefeb6-33d6-4bb8-b70d-557c2daee5ca'),
	(6541,245,132,6536,10,11,1,'2017-12-02 21:51:59','2017-12-02 21:51:59','ad3fb564-f254-4634-9ae4-fc0e9b78f7c9'),
	(6542,245,134,6536,12,13,1,'2017-12-02 21:51:59','2017-12-02 21:51:59','e409009f-b411-4e5a-acdd-5b22b583a953'),
	(6543,245,138,6536,14,15,1,'2017-12-02 21:51:59','2017-12-02 21:51:59','17a9b775-fc3b-4d3b-b73c-e32160cb93ea'),
	(6544,245,146,6536,16,17,1,'2017-12-02 21:51:59','2017-12-02 21:51:59','112a215f-ec3d-448b-944d-54cd726267fa'),
	(6545,245,141,6536,18,19,1,'2017-12-02 21:51:59','2017-12-02 21:51:59','544467af-0a2c-4073-8b9c-5fc5418dce33'),
	(6546,245,136,6536,20,21,1,'2017-12-02 21:51:59','2017-12-02 21:51:59','c1b0e1de-402f-483c-8fa8-cf816fe41861'),
	(6547,245,143,6536,22,31,1,'2017-12-02 21:51:59','2017-12-02 21:51:59','0816a6e7-cecc-4959-8448-f04e651d23a0'),
	(6548,245,149,6536,23,26,2,'2017-12-02 21:51:59','2017-12-02 21:51:59','7af04c3e-51c3-4c8e-bb0f-b48db6f01960'),
	(6549,245,150,6536,24,25,3,'2017-12-02 21:51:59','2017-12-02 21:51:59','858d8581-5ae8-4128-978b-0c8a188727d0'),
	(6550,245,151,6536,27,30,2,'2017-12-02 21:51:59','2017-12-02 21:51:59','caaca975-6c65-4011-811b-11497128ffea'),
	(6551,245,155,6536,28,29,3,'2017-12-02 21:51:59','2017-12-02 21:51:59','c4ad5488-8ece-4855-a9e0-1f546f151923'),
	(6568,244,157,6534,4,5,1,'2017-12-02 21:52:40','2017-12-02 21:52:40','dad0e3c0-20da-4414-a92a-cfec475299bd'),
	(6585,248,NULL,6585,1,32,0,'2017-12-02 22:10:57','2017-12-02 22:10:57','5a21e934-b297-4a99-9c53-b78397596c45'),
	(6586,248,158,6585,2,3,1,'2017-12-02 22:10:57','2017-12-02 22:10:57','df127f37-4ec4-4ba2-8945-25068d7c2a63'),
	(6587,248,160,6585,4,5,1,'2017-12-02 22:10:57','2017-12-02 22:10:57','9845d988-7db1-4640-9f56-037f6e29e6e4'),
	(6588,248,162,6585,6,7,1,'2017-12-02 22:10:57','2017-12-02 22:10:57','e213932f-88d0-4953-b78d-e0627119e924'),
	(6589,248,164,6585,8,9,1,'2017-12-02 22:10:57','2017-12-02 22:10:57','4532546c-4b76-4d49-9274-2c3d4a308f29'),
	(6590,248,166,6585,10,11,1,'2017-12-02 22:10:57','2017-12-02 22:10:57','4c6864e3-d2b9-421e-9da8-5047b0d4a106'),
	(6591,248,168,6585,12,13,1,'2017-12-02 22:10:57','2017-12-02 22:10:57','b7f375a7-6e73-4474-b2c7-abb90b887c3e'),
	(6592,248,170,6585,14,15,1,'2017-12-02 22:10:57','2017-12-02 22:10:57','81865371-b1ab-43c2-820e-8a636812ce27'),
	(6593,248,171,6585,16,17,1,'2017-12-02 22:10:57','2017-12-02 22:10:57','c1214150-dd9c-43e1-ae9c-ae933fd542ae'),
	(6594,248,173,6585,18,19,1,'2017-12-02 22:10:57','2017-12-02 22:10:57','a3869a9f-add7-48ae-8796-0512e86bfe2a'),
	(6595,248,175,6585,20,21,1,'2017-12-02 22:10:57','2017-12-02 22:10:57','c431ff27-2b29-4e39-816b-97a35e126821'),
	(6596,248,177,6585,22,31,1,'2017-12-02 22:10:57','2017-12-02 22:10:57','38d735b6-72e3-4d13-8805-c4b718c8905a'),
	(6597,248,178,6585,23,26,2,'2017-12-02 22:10:57','2017-12-02 22:10:57','58fdc18f-8d9a-41a8-bc64-0f374d22e1c1'),
	(6598,248,179,6585,24,25,3,'2017-12-02 22:10:57','2017-12-02 22:10:57','cf6330ab-2b72-4651-9527-5f8b291e9566'),
	(6599,248,180,6585,27,30,2,'2017-12-02 22:10:57','2017-12-02 22:10:57','564380ef-31ad-4fd7-8c82-1a68dc4469df'),
	(6600,248,181,6585,28,29,3,'2017-12-02 22:10:57','2017-12-02 22:10:57','b4290c93-2f6a-44d4-8eb9-2783ed67ab47');

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
	(1,1,'2017-04-16 22:50:30','2017-11-16 01:40:24','1a4b9299-b069-4a7b-8c00-29504646e00f'),
	(2,NULL,'2017-04-16 22:56:24','2017-11-16 01:13:47','b851dd62-a4ec-48ae-af65-c381d767cd41'),
	(213,NULL,'2017-09-24 14:08:40','2017-09-24 14:08:40','c08cc02a-24df-467e-9e0f-44eb4aa4101a'),
	(215,NULL,'2017-09-24 14:09:37','2017-09-24 14:09:37','17f23f47-b2dd-4d36-a53e-aa8948a48ec7'),
	(216,NULL,'2017-09-24 14:09:50','2017-09-24 14:09:50','fc783493-d257-4973-8eef-5ab034a7166f'),
	(219,NULL,'2017-11-11 16:55:20','2017-11-11 16:55:20','0326e158-a90f-48ff-a70f-36a26a9dcc98'),
	(244,1,'2017-12-02 21:44:27','2017-12-02 22:10:54','4ee3bd15-917d-4d6c-9616-d9ae7726e3f0'),
	(245,NULL,'2017-12-02 21:51:59','2017-12-02 21:51:59','136e8b41-e62a-434a-ad86-222089d31a5d'),
	(248,NULL,'2017-12-02 22:10:57','2017-12-02 22:10:57','463a2385-5a58-452e-93ac-4a6d67ee6a39');

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
	(125,124,73,14,1,NULL,'2017-12-01 23:35:02','2017-12-02 21:51:59','3b2dbadf-2e63-4457-91e3-8c616d99a7dd'),
	(127,126,48,8,1,NULL,'2017-12-01 23:35:02','2017-12-02 21:51:59','3870c22c-323e-4cf2-8f8b-54d7657d19b2'),
	(129,128,48,8,1,NULL,'2017-12-01 23:52:57','2017-12-02 21:51:59','52c13288-d130-4f45-9a5c-9801271bcfda'),
	(131,130,48,8,1,NULL,'2017-12-01 23:52:57','2017-12-02 21:51:59','68f82d2e-cae6-4724-9763-532782e101c7'),
	(133,132,48,8,1,NULL,'2017-12-01 23:52:57','2017-12-02 21:51:59','b1f27d61-9ff8-4e14-b654-a9e2e514d568'),
	(135,134,48,8,1,NULL,'2017-12-01 23:52:58','2017-12-02 21:51:59','57b5292a-382d-4ffd-95d4-f4ca3a5a123a'),
	(137,136,73,14,1,NULL,'2017-12-01 23:54:50','2017-12-02 21:51:59','e970f9ee-e71a-4bdd-b631-d37bd104e954'),
	(142,141,77,15,1,NULL,'2017-12-01 23:59:18','2017-12-02 21:51:59','87feb485-dfdd-4e7c-b224-add79f1a702e'),
	(147,146,73,14,1,NULL,'2017-12-02 00:24:38','2017-12-02 21:51:59','c9ac480a-beca-4446-b165-263308afefab'),
	(156,155,64,12,1,NULL,'2017-12-02 21:13:44','2017-12-02 21:51:59','b3dcd34b-9607-4f6e-9114-bc6e7a9745c6'),
	(159,158,73,14,1,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','4a0d72a4-bb4a-4fad-a45c-86d89d154d8b'),
	(161,160,48,8,1,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','dbc0b2ba-de2d-4586-bd6f-2bb82aeece88'),
	(163,162,48,8,1,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','1f4b2a36-ddd5-4ee0-a7b5-664b03c5a54b'),
	(165,164,48,8,1,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','f1cdc52b-1e7b-4e2d-99c6-6f63b4f348be'),
	(167,166,48,8,1,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','35e64e69-44db-4abf-a855-4f7a4d2e33e9'),
	(169,168,48,8,1,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','95ccaf1f-32e6-4626-abfa-5b5f7f559af4'),
	(172,171,73,14,1,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','e6ce254c-9118-47c4-a063-898a00bc4737'),
	(174,173,77,15,1,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','e244ccb1-1570-4506-98e8-d362a70d0cbd'),
	(176,175,73,14,1,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','0d535893-4547-4a33-8928-24bfed032074'),
	(182,181,64,12,1,NULL,'2017-12-02 21:52:40','2017-12-02 22:10:57','1f9561f9-7715-46ca-9b00-bdfe0c8f748d');

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
	(4,32,413,'2017-04-16 22:48:54','2017-10-17 21:55:50','3dd66ead-99ef-432f-84f7-d0e15ef8b4a6'),
	(5,37,412,'2017-04-16 22:48:55','2017-10-17 21:54:36','6709c019-9bb8-4c24-a0f5-2ae0f5390eee'),
	(6,40,512,'2017-04-16 22:48:55','2017-10-17 22:18:40','cd2d37bf-dcf2-41b4-b0af-63c411272c09'),
	(7,43,622,'2017-04-16 22:48:56','2017-11-19 22:51:37','6ea0042c-9175-409d-8e9e-5653aac81b3d'),
	(8,48,142,'2017-04-16 22:48:56','2017-04-19 22:01:54','d24e51f5-0e6e-452d-b8cd-08f1de33fb44'),
	(9,52,185,'2017-04-16 22:48:57','2017-07-11 05:23:58','1af0637f-91eb-490a-b106-970749c29d88'),
	(10,56,623,'2017-04-16 22:48:57','2017-11-19 23:00:56','c2c345f5-b507-4b2f-b880-0d00c2d2528c'),
	(11,60,624,'2017-04-16 22:48:58','2017-11-19 23:02:00','29078bf3-96e3-48fb-af00-9bb3fe011899'),
	(12,64,628,'2017-04-16 22:48:58','2017-11-19 23:48:00','9ff59a2c-435b-49f6-b637-88b187d27e61'),
	(13,69,627,'2017-04-16 22:48:59','2017-11-19 23:36:46','e5bb65e6-af3c-4894-86b3-0a3255563865'),
	(14,73,785,'2017-04-16 22:49:00','2017-12-02 21:13:29','c2262ae1-52ac-47b8-a956-55ba97b2d301'),
	(15,77,621,'2017-04-16 22:49:00','2017-11-19 22:48:55','4e35ee79-fc78-4e89-b876-0f4ead3020ce'),
	(17,85,448,'2017-04-16 22:49:01','2017-10-17 22:05:08','90a4cf47-bc1f-453a-b62b-5b2bd78817df'),
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
  `field_ratio` varchar(255) COLLATE utf8_unicode_ci DEFAULT '50-50',
  `field_layout` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'table',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craf_supertableconte_settingsdefinitionli_elementI_local_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingsdefinitionlist_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingsdefinitionlist_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingsdefinitionlist_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_settingsdivider
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingsdivider`;

CREATE TABLE `craft_supertablecontent_settingsdivider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'style-default',
  `field_marginVertical` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'mv-small',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_settingsdivider_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingsdivider_locale_idx` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingsdivider_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingsdivider_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `craft_supertablecontent_settingsdivider` WRITE;
/*!40000 ALTER TABLE `craft_supertablecontent_settingsdivider` DISABLE KEYS */;

INSERT INTO `craft_supertablecontent_settingsdivider` (`id`, `elementId`, `locale`, `field_style`, `field_marginVertical`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,68,'de','default','default','2017-04-20 13:44:03','2017-04-20 13:51:14','cb85d910-b474-4357-93de-72dad15da8f3'),
	(2,70,'de','default','large','2017-04-20 13:48:14','2017-04-20 13:51:15','b73ff22e-98eb-4a08-942b-8fcb7b979b61'),
	(3,142,'de','style-default','mv-small','2017-12-01 23:59:18','2017-12-02 21:51:59','e1a7838e-9dc2-4525-85f3-aaca4afdbc90'),
	(4,174,'de','style-default','mv-small','2017-12-02 21:52:40','2017-12-02 22:10:57','78afc9ce-8bb2-48fb-9483-9a0b552a00aa');

/*!40000 ALTER TABLE `craft_supertablecontent_settingsdivider` ENABLE KEYS */;
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
	(1,127,'de','h2','2017-12-01 23:35:02','2017-12-02 21:51:59','563a44e2-2791-470b-9c99-148f2bb74504'),
	(2,129,'de','h3','2017-12-01 23:52:57','2017-12-02 21:51:59','c2feaeff-e7ce-4362-bc52-4944b5257913'),
	(3,131,'de','h4','2017-12-01 23:52:57','2017-12-02 21:51:59','1a2d056b-be7a-458f-8de9-3bce780b1a7e'),
	(4,133,'de','h5','2017-12-01 23:52:57','2017-12-02 21:51:59','0a6e6799-fafe-48f9-a686-9a491db79c42'),
	(5,135,'de','h6','2017-12-01 23:52:58','2017-12-02 21:51:59','e6d47e80-98cc-49d4-9b77-5ed027bebd95'),
	(6,161,'de','h2','2017-12-02 21:52:40','2017-12-02 22:10:57','67d9ab98-abf0-4889-b49f-94c1b9d0a176'),
	(7,163,'de','h3','2017-12-02 21:52:40','2017-12-02 22:10:57','d8645bf3-3391-4cb6-9d10-1a2be78a1035'),
	(8,165,'de','h4','2017-12-02 21:52:40','2017-12-02 22:10:57','cf35ba1f-1f32-4ce9-9771-86e9fe375d04'),
	(9,167,'de','h5','2017-12-02 21:52:40','2017-12-02 22:10:57','d5c6c609-53e7-4e92-9c1d-8832d24f500e'),
	(10,169,'de','h6','2017-12-02 21:52:40','2017-12-02 22:10:57','8dcb60ee-c571-4ad6-9e97-a5b069fdc886');

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



# Export von Tabelle craft_supertablecontent_settingsimagegallery
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingsimagegallery`;

CREATE TABLE `craft_supertablecontent_settingsimagegallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_thumbsRatio` varchar(255) COLLATE utf8_unicode_ci DEFAULT '1:1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_settingsimagegalle_elementI_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingsimagegallery_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingsimagegallery_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingsimagegallery_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_settingsimagegrid
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingsimagegrid`;

CREATE TABLE `craft_supertablecontent_settingsimagegrid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_caption` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_columns` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'columns-2',
  `field_ratio` varchar(255) COLLATE utf8_unicode_ci DEFAULT '1:1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_settingsimagegri_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingsimagegrid_locale_fk` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingsimagegrid_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingsimagegrid_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_settingsimagesingle
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingsimagesingle`;

CREATE TABLE `craft_supertablecontent_settingsimagesingle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_caption` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_alignment` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'align-center',
  `field_ratio` varchar(255) COLLATE utf8_unicode_ci DEFAULT '16:10',
  `field_width` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'width-full',
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
	(2,156,'de',0,'align-center','16:10','width-full','2017-12-02 21:13:44','2017-12-02 21:51:59','a2e6967b-381b-45b8-b2cd-9c59b935f280'),
	(3,182,'de',0,'align-center','16:10','width-full','2017-12-02 21:52:40','2017-12-02 22:10:57','f4ec0cec-a76a-4546-83b2-66c9d753a19e');

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



# Export von Tabelle craft_supertablecontent_settingslink
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingslink`;

CREATE TABLE `craft_supertablecontent_settingslink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'underlined',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_settingslink_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingslink_locale_idx` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingslink_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingslink_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_settingslinksgroup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingslinksgroup`;

CREATE TABLE `craft_supertablecontent_settingslinksgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'underlined',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertableconten_settingslinksgrou_elementId_locale_unq_id` (`elementId`,`locale`),
  KEY `craft_supertablecontent_settingslinksgroup_locale_idx` (`locale`),
  CONSTRAINT `craft_supertablecontent_settingslinksgroup_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_settingslinksgroup_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Export von Tabelle craft_supertablecontent_settingssection
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_settingssection`;

CREATE TABLE `craft_supertablecontent_settingssection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_width` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `field_paddingVertical` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'paddingVertical-small',
  `field_offset` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'no',
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

INSERT INTO `craft_supertablecontent_settingssection` (`id`, `elementId`, `locale`, `field_width`, `field_paddingVertical`, `field_offset`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,125,'de','','paddingVertical-small','yes','2017-12-01 23:35:02','2017-12-02 21:51:59','df88f419-878d-4c56-807e-9437a9b35d29'),
	(2,137,'de','','paddingVertical-small','no','2017-12-01 23:54:50','2017-12-02 21:51:59','b89116f1-6ba7-41fc-b1b5-7e2f046c2a2f'),
	(4,147,'de','','paddingVertical-none','no','2017-12-02 00:24:38','2017-12-02 21:51:59','502334d4-6fa7-4f78-a7f3-56828e0f20e2'),
	(5,159,'de','','paddingVertical-small','no','2017-12-02 21:52:40','2017-12-02 22:10:57','a1232f77-e9bc-4e5c-b5f5-ae1a403287f1'),
	(6,172,'de','','paddingVertical-none','no','2017-12-02 21:52:40','2017-12-02 22:10:57','cf93a892-5517-42fe-916f-9cbc5c2240e2'),
	(7,176,'de','','paddingVertical-small','no','2017-12-02 21:52:40','2017-12-02 22:10:57','02952aed-cec4-4167-a84c-a3c59466f2f2');

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


# Export von Tabelle craft_supertablecontent_singlelinkgroup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craft_supertablecontent_singlelinkgroup`;

CREATE TABLE `craft_supertablecontent_singlelinkgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `field_singleLink` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `craft_supertablecontent_singlelinkgroup_elementId_locale_unq_idx` (`elementId`,`locale`),
  KEY `craft_supertablecontent_singlelinkgroup_locale_idx` (`locale`),
  CONSTRAINT `craft_supertablecontent_singlelinkgroup_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `craft_supertablecontent_singlelinkgroup_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



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

LOCK TABLES `craft_usergroups` WRITE;
/*!40000 ALTER TABLE `craft_usergroups` DISABLE KEYS */;

INSERT INTO `craft_usergroups` (`id`, `name`, `handle`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Admins','admins','2017-12-05 14:30:08','2017-12-05 14:30:08','6f9b1d55-12b2-413e-a4f0-60d67bf816f3'),
	(2,'Editors','editors','2017-12-05 14:32:09','2017-12-05 14:32:09','c9c3f2c4-8401-4754-9031-6ef039f84498');

/*!40000 ALTER TABLE `craft_usergroups` ENABLE KEYS */;
UNLOCK TABLES;


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

LOCK TABLES `craft_userpermissions` WRITE;
/*!40000 ALTER TABLE `craft_userpermissions` DISABLE KEYS */;

INSERT INTO `craft_userpermissions` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'accesssitewhensystemisoff','2017-12-05 14:30:09','2017-12-05 14:30:09','57c9cf20-88e8-4643-bfe4-a467fe33acc0'),
	(2,'accesscpwhensystemisoff','2017-12-05 14:30:09','2017-12-05 14:30:09','93f99f06-6817-4039-8088-992f8d3626d3'),
	(3,'accessplugin-seomatic','2017-12-05 14:30:09','2017-12-05 14:30:09','433689d6-e0fa-450c-ba8c-2f7cb254b32c'),
	(4,'accesscp','2017-12-05 14:30:09','2017-12-05 14:30:09','27c78c18-33ac-4457-aac0-7fccfaad9246'),
	(5,'registerusers','2017-12-05 14:30:09','2017-12-05 14:30:09','7b9a0143-78a8-4c73-9939-9369c17c3aa2'),
	(6,'changeuseremails','2017-12-05 14:30:09','2017-12-05 14:30:09','a50081c7-5281-462d-bd43-3e7b5cdfad8a'),
	(7,'administrateusers','2017-12-05 14:30:09','2017-12-05 14:30:09','a6ce7f55-1374-4dec-af9b-28b92af02615'),
	(8,'assignuserpermissions','2017-12-05 14:30:09','2017-12-05 14:30:09','2ee12121-5a64-49db-9c33-7290f2ab6bbb'),
	(9,'assignusergroups','2017-12-05 14:30:09','2017-12-05 14:30:09','066ff070-c2b5-4adc-8319-949351cf479a'),
	(10,'editusers','2017-12-05 14:30:09','2017-12-05 14:30:09','2b7c64b5-0e63-4300-a7d5-4b48fe85c119'),
	(11,'deleteusers','2017-12-05 14:30:09','2017-12-05 14:30:09','1b202c23-0756-434c-84dd-3f23da263073'),
	(12,'createentries:5','2017-12-05 14:30:09','2017-12-05 14:30:09','55b55eb5-8ac6-434a-b8d9-54ed13a29f91'),
	(13,'publishentries:5','2017-12-05 14:30:09','2017-12-05 14:30:09','edd9b75b-0445-4e63-9821-ea41faf35c42'),
	(14,'deleteentries:5','2017-12-05 14:30:09','2017-12-05 14:30:09','780ce4c1-c400-467b-ac5c-c36eda09ffbc'),
	(15,'publishpeerentries:5','2017-12-05 14:30:09','2017-12-05 14:30:09','5f042a23-371b-4f98-b550-30b3af8b522b'),
	(16,'deletepeerentries:5','2017-12-05 14:30:09','2017-12-05 14:30:09','20e8371a-8dd3-4925-a4b7-0f6fffa77e3b'),
	(17,'editpeerentries:5','2017-12-05 14:30:09','2017-12-05 14:30:09','0f641857-59a4-4abd-aa4a-39a3c1c9f120'),
	(18,'publishpeerentrydrafts:5','2017-12-05 14:30:09','2017-12-05 14:30:09','631b15d2-d416-46b2-a4e3-000f45eae816'),
	(19,'deletepeerentrydrafts:5','2017-12-05 14:30:09','2017-12-05 14:30:09','e8e8455b-f320-43e2-8a4b-da65650204b9'),
	(20,'editpeerentrydrafts:5','2017-12-05 14:30:09','2017-12-05 14:30:09','3449fac4-8a69-46d4-b67a-4e4ad6fcce83'),
	(21,'editentries:5','2017-12-05 14:30:09','2017-12-05 14:30:09','1b470831-7096-4bbc-a5ee-2c0b3efc3bd8'),
	(22,'createentries:4','2017-12-05 14:30:09','2017-12-05 14:30:09','4b9cd7c1-044d-496b-86fd-03e67b0c0e84'),
	(23,'publishentries:4','2017-12-05 14:30:09','2017-12-05 14:30:09','fb986d14-8128-4729-b919-f4aaebec1f31'),
	(24,'deleteentries:4','2017-12-05 14:30:09','2017-12-05 14:30:09','39c99e8f-154f-4aae-a8ad-44178b8b3253'),
	(25,'publishpeerentries:4','2017-12-05 14:30:09','2017-12-05 14:30:09','728fc893-1c16-4cde-ba8c-da139a217d92'),
	(26,'deletepeerentries:4','2017-12-05 14:30:09','2017-12-05 14:30:09','6648e5de-076e-49c3-89d9-65192da2ab65'),
	(27,'editpeerentries:4','2017-12-05 14:30:09','2017-12-05 14:30:09','fea508d9-0109-400d-9afe-9ba6a2317307'),
	(28,'publishpeerentrydrafts:4','2017-12-05 14:30:09','2017-12-05 14:30:09','0916bfac-c8bc-4bae-acbb-1a3c21081a0e'),
	(29,'deletepeerentrydrafts:4','2017-12-05 14:30:09','2017-12-05 14:30:09','7f2730b5-db96-4164-89f3-59115d0b3341'),
	(30,'editpeerentrydrafts:4','2017-12-05 14:30:09','2017-12-05 14:30:09','ebab7f03-6aba-47da-bd6e-f84f656af84b'),
	(31,'editentries:4','2017-12-05 14:30:09','2017-12-05 14:30:09','2269db23-bbfe-4ad2-bcf9-0d0f0509a47e'),
	(32,'publishentries:3','2017-12-05 14:30:09','2017-12-05 14:30:09','2007bed7-9bae-4e6a-88d2-04f69eba60d6'),
	(33,'publishpeerentrydrafts:3','2017-12-05 14:30:09','2017-12-05 14:30:09','567c9052-3dc4-4a81-a8ac-c326bc17e32a'),
	(34,'deletepeerentrydrafts:3','2017-12-05 14:30:09','2017-12-05 14:30:09','52c680ae-e04a-4cbd-9ebb-def11ab0ff32'),
	(35,'editpeerentrydrafts:3','2017-12-05 14:30:09','2017-12-05 14:30:09','355808ca-21ed-4bd5-9ad2-17cfaab77c98'),
	(36,'editentries:3','2017-12-05 14:30:09','2017-12-05 14:30:09','463ff449-c610-4119-a38c-c2b354dd0035'),
	(37,'createentries:6','2017-12-05 14:30:09','2017-12-05 14:30:09','bf1f24f5-343f-475a-8cd4-50ece63e92fb'),
	(38,'publishentries:6','2017-12-05 14:30:09','2017-12-05 14:30:09','7220d6cb-6252-45a0-bd11-7d21d387952b'),
	(39,'deleteentries:6','2017-12-05 14:30:09','2017-12-05 14:30:09','09a051bc-7f74-4256-a89d-4aae62f7f330'),
	(40,'publishpeerentries:6','2017-12-05 14:30:09','2017-12-05 14:30:09','123cc42d-06ba-4112-9b13-a217c5b91e19'),
	(41,'deletepeerentries:6','2017-12-05 14:30:09','2017-12-05 14:30:09','57b53109-f1f1-4c0b-b5df-713b543d0bde'),
	(42,'editpeerentries:6','2017-12-05 14:30:09','2017-12-05 14:30:09','21ed31e4-b79c-49be-83b1-939e4ab60a17'),
	(43,'publishpeerentrydrafts:6','2017-12-05 14:30:09','2017-12-05 14:30:09','a47da628-0ee0-4a40-b968-d624c45be77b'),
	(44,'deletepeerentrydrafts:6','2017-12-05 14:30:09','2017-12-05 14:30:09','06463cc8-f96a-4c09-98c2-f04d9448cd0d'),
	(45,'editpeerentrydrafts:6','2017-12-05 14:30:09','2017-12-05 14:30:09','8ed0ee73-e45c-4aea-a286-fce90a00d9ae'),
	(46,'editentries:6','2017-12-05 14:30:09','2017-12-05 14:30:09','169c0f46-9d4e-4000-bb89-a4d8197678f3'),
	(47,'editglobalset:116','2017-12-05 14:30:09','2017-12-05 14:30:09','923357f6-67b4-4064-8e49-dde6b864c659'),
	(48,'editglobalset:115','2017-12-05 14:30:09','2017-12-05 14:30:09','660ff55b-c71a-46fe-a0f0-d086590e1081'),
	(49,'editglobalset:117','2017-12-05 14:30:09','2017-12-05 14:30:09','1e3b1ec9-12cb-481b-a11b-190b9623751b'),
	(50,'editglobalset:6','2017-12-05 14:30:09','2017-12-05 14:30:09','46f6e497-e29a-4da4-b51c-fd0d6e48ddc4'),
	(51,'editglobalset:114','2017-12-05 14:30:09','2017-12-05 14:30:09','0be59bbc-3082-464c-a793-5cf6836064ed'),
	(52,'editcategories:1','2017-12-05 14:30:09','2017-12-05 14:30:09','2f2dda5a-7218-4b88-bdc5-485970d3ffca'),
	(53,'uploadtoassetsource:1','2017-12-05 14:30:09','2017-12-05 14:30:09','1fbf3793-87ed-4182-a1ec-2e930e2df5f0'),
	(54,'createsubfoldersinassetsource:1','2017-12-05 14:30:09','2017-12-05 14:30:09','76a9a056-acca-48d9-bb32-7791d3265fd8'),
	(55,'removefromassetsource:1','2017-12-05 14:30:09','2017-12-05 14:30:09','6a46cdfa-286f-4ff6-a568-79cc5b7041ae'),
	(56,'viewassetsource:1','2017-12-05 14:30:09','2017-12-05 14:30:09','9de616ad-ecd1-475f-bd94-af5c472448d1'),
	(57,'uploadtoassetsource:2','2017-12-05 14:30:09','2017-12-05 14:30:09','cc5df3e6-4554-4c1e-b443-0ffbfd8758af'),
	(58,'createsubfoldersinassetsource:2','2017-12-05 14:30:09','2017-12-05 14:30:09','e453fd59-d304-4df1-a4aa-d7da9a94d2c3'),
	(59,'removefromassetsource:2','2017-12-05 14:30:09','2017-12-05 14:30:09','f7305356-ff62-4490-99d9-97ae77ea2beb'),
	(60,'viewassetsource:2','2017-12-05 14:30:09','2017-12-05 14:30:09','2ab00725-d5b3-4d73-9221-0c49e3f3308a'),
	(61,'uploadtoassetsource:3','2017-12-05 14:30:09','2017-12-05 14:30:09','d0e4986b-25bb-4972-8644-26eae951e3c4'),
	(62,'createsubfoldersinassetsource:3','2017-12-05 14:30:09','2017-12-05 14:30:09','f88c6f16-f808-47aa-9ceb-43b93baa4a13'),
	(63,'removefromassetsource:3','2017-12-05 14:30:09','2017-12-05 14:30:09','9cdfa083-d6da-4662-928a-d95e8fbaf05b'),
	(64,'viewassetsource:3','2017-12-05 14:30:09','2017-12-05 14:30:09','3d783576-bb04-4a0e-808e-728719ea3b58'),
	(65,'uploadtoassetsource:4','2017-12-05 14:30:09','2017-12-05 14:30:09','58694058-da34-488a-9cf1-820643bd3f4a'),
	(66,'createsubfoldersinassetsource:4','2017-12-05 14:30:09','2017-12-05 14:30:09','091e888c-f4a1-4584-a607-adee2756f4ba'),
	(67,'removefromassetsource:4','2017-12-05 14:30:09','2017-12-05 14:30:09','2a5a59c6-318a-4ff9-99fc-7f5fd56787eb'),
	(68,'viewassetsource:4','2017-12-05 14:30:09','2017-12-05 14:30:09','a67d4efe-3fd8-4f92-9a63-a2473de6ac2a');

/*!40000 ALTER TABLE `craft_userpermissions` ENABLE KEYS */;
UNLOCK TABLES;


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

LOCK TABLES `craft_userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `craft_userpermissions_usergroups` DISABLE KEYS */;

INSERT INTO `craft_userpermissions_usergroups` (`id`, `permissionId`, `groupId`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','0128e8f7-d465-4262-9fff-1d9b0bedcde5'),
	(2,2,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','353c7374-4892-467c-b7b3-a35b68f939e7'),
	(3,3,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','c758c84b-dc8d-4bd8-ad37-075922c2707b'),
	(4,4,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','61fabe46-fd06-43fa-a352-140fa6485c4d'),
	(5,5,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','b1cb5bb3-24d9-44c6-bbf7-62f192a622f0'),
	(6,6,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','4e3f2c4b-6b54-4fbd-9254-4b0e34a0d3cd'),
	(7,7,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','1de35eae-0cb4-4c17-8e1b-6f50ede166d9'),
	(8,8,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','9daff3a1-a235-468f-9b1b-b9e6b8a83b3b'),
	(9,9,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','511f33cb-e566-4561-b189-670cef04162e'),
	(10,10,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','092341ba-a701-45f6-b8c8-9a82b472ddc8'),
	(11,11,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','2ad3d5f2-1b08-4e44-9fdc-93ace091a632'),
	(12,12,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','0def4fc0-8a48-41e2-8918-58470ae7fd50'),
	(13,13,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','9d3e42c1-201a-4148-934c-2e93628ff43a'),
	(14,14,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','82da7f36-6006-4201-a091-819582d1c312'),
	(15,15,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','b4c85c7d-1441-491e-a4ca-f5917dd06a9a'),
	(16,16,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','3ce4f875-5961-46c6-a88f-65305573565f'),
	(17,17,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','53438d01-dc3c-48a7-af8c-3188343f6d0f'),
	(18,18,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','d1962634-0d5d-45bd-a5a9-84bfa8a10baa'),
	(19,19,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','47664b53-47c3-4475-886d-0aef8f556eeb'),
	(20,20,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','a9de5020-2738-417a-a80b-9e7080fbffcd'),
	(21,21,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','adff1790-f49d-428e-91d1-14d8d004bd5f'),
	(22,22,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','65797b3d-3b6d-4487-9958-442c671dfffa'),
	(23,23,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','bb69debf-287d-4856-90e3-5d1b1e14cada'),
	(24,24,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','80032c2b-ec4f-4331-a0cd-7b0876606611'),
	(25,25,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','532c5fab-161c-4111-9395-7d9ea31fd7e8'),
	(26,26,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','90db4181-28d0-4bb1-8077-f96108b467f7'),
	(27,27,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','e50c85cc-c9b1-4950-9659-f36041cbcd72'),
	(28,28,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','9aec2c3b-959f-40de-abcd-e8348ae85c82'),
	(29,29,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','43200234-5d99-462a-ae00-ad8cc0c24ea0'),
	(30,30,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','05581e00-8d2b-4780-a7f6-c4368d9490d7'),
	(31,31,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','ecaca2e9-3832-4c8e-b238-88afa9bfd478'),
	(32,32,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','a05dd4a3-3868-43b3-96f2-2552e7cce663'),
	(33,33,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','b67b67c0-0fdb-4fc9-b4bf-66f120f7ff1c'),
	(34,34,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','7bcaee47-03b7-49d9-a193-09d2e0b57349'),
	(35,35,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','4c07adf2-613b-4fa1-90f7-d3419110024c'),
	(36,36,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','629845e5-479b-41d4-b69e-1f6464ab1d37'),
	(37,37,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','61b14db1-5a54-41af-91aa-4aaab66bb60f'),
	(38,38,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','cefb670c-3fdc-4430-95cc-091eb399a551'),
	(39,39,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','4c97c028-d057-412c-aba2-f964957e5140'),
	(40,40,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','ce91ff41-ef20-41b2-b8a8-e8269371b7c4'),
	(41,41,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','e3faf7b4-7817-4890-9218-a3e7142233eb'),
	(42,42,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','bbf3a1b9-9fd5-4f41-ae6d-bd7c0ab1915b'),
	(43,43,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','4abde4ca-1f31-4d89-8454-3d8fe4560c2a'),
	(44,44,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','ae2c8440-fff5-48b4-8e75-05c22f7f333e'),
	(45,45,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','3e9e9a06-9b68-48f2-8506-ae9e6659835d'),
	(46,46,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','313eece4-e515-4fde-b455-82db3defddb8'),
	(47,47,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','8f014fc1-27f8-48a7-b6b3-26feeaa1ad3a'),
	(48,48,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','8e0e9959-8127-4c59-a927-6b4da6b9e8f0'),
	(49,49,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','0f413ae3-ff5d-4cdf-8aef-093857db68c1'),
	(50,50,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','2e6b86d1-c833-4ebc-b0d3-00848b3279fa'),
	(51,51,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','234b5c77-2d81-4f1e-91d7-90a37ea5ea73'),
	(52,52,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','4a873fc7-7075-4c3f-b69d-749e75c49123'),
	(53,53,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','3ca22781-72ec-4e2b-9e54-9a8aeae69bea'),
	(54,54,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','a0597f78-d7fc-4a73-abe2-6b1105c9fff3'),
	(55,55,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','48f802c7-a2ea-4f8e-98b9-e96cecd7ca7e'),
	(56,56,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','33434d72-875c-4745-876a-bb8ddf52c39a'),
	(57,57,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','06fe4a21-84bc-4a8c-99b1-2d0533198727'),
	(58,58,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','dc619c91-5dbb-49ba-9861-22bfc0669c35'),
	(59,59,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','da6e6e7f-ae96-4aa9-b0eb-46621b3b2cb7'),
	(60,60,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','59dcf614-4bb7-4c72-9b4b-94f4d94146c9'),
	(61,61,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','ebcdca81-d23b-47ec-9d22-9c9b926658d5'),
	(62,62,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','5da6cfbe-6b4d-4c9a-851c-fead6b3b89b2'),
	(63,63,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','e9fa86af-9423-499b-bab6-904ffc2852d9'),
	(64,64,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','46b8b0ef-6eaa-4617-a87a-527f86d05234'),
	(65,65,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','dd12b77e-0ff8-466c-b1e2-9bc7cdb1f40f'),
	(66,66,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','1b036412-47fc-42c9-8513-e88cc90375bd'),
	(67,67,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','3bc615f8-a994-4ab2-9f69-e669ee514577'),
	(68,68,1,'2017-12-05 14:30:09','2017-12-05 14:30:09','96c1dc8b-c779-48f4-9d06-972d8ee44f50'),
	(69,1,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','2767b5cb-ae1f-431c-a286-77d4ea730895'),
	(70,2,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','69b7cac9-45ff-4237-9a8f-e89daa12006c'),
	(71,4,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','48871f38-4084-4a8b-956b-a2cc465438cb'),
	(72,12,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','94ec8906-15ef-46da-a738-b9f5ec064860'),
	(73,13,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','f69f2d47-b2c6-4f5e-bbf3-ffc9594cb4dc'),
	(74,14,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','d2604f9f-974a-4705-981d-a1409a39380f'),
	(75,15,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','b5528e64-ebe7-462e-bdd8-5d0a5d29b376'),
	(76,16,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','f9f4de4f-ab28-4f97-ab02-88378e16c8ec'),
	(77,17,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','5172569f-ab95-4181-bb32-10e072615935'),
	(78,18,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','424ca925-b70e-496e-92ff-88d53257e79c'),
	(79,19,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','22f76753-4a75-4de2-acfa-c6b0578b7242'),
	(80,20,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','e9471e26-6cbe-4a66-b10e-6019b1561c05'),
	(81,21,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','066136e7-4a4c-4f1f-ad17-3680b1c06b07'),
	(82,22,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','13008241-80a5-4a3c-ba75-35ac4b19fc68'),
	(83,24,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','a286c25e-da87-44f9-8732-b89d490d1098'),
	(84,31,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','831119e6-28e2-46b3-83d7-af53ecc3fc75'),
	(85,32,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','77d3e143-85b5-4251-8c28-ea02d26aef59'),
	(86,33,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','e8a638f2-870d-49d5-99f1-cd9a30d7291a'),
	(87,34,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','68246399-0131-45c0-8a77-34b972060b94'),
	(88,35,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','0f41b7f4-a57f-4216-a0ec-521ebf35be7b'),
	(89,36,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','4a5fb2f6-7980-4325-8fcf-52da127f051e'),
	(90,37,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','f79c6c2c-32ed-4044-a6d2-106a208ae849'),
	(91,38,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','2c0f8e1f-5957-43fb-9fc0-4278866566c3'),
	(92,39,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','5cb33064-b852-484d-b140-4668f756ec98'),
	(93,40,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','2a019162-0b30-4c31-bc56-88cac6599f68'),
	(94,41,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','fd0f8ee9-054d-497a-99bd-619ea6091fd3'),
	(95,42,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','b0792b40-28aa-44ec-bf0f-f7e6e186894e'),
	(96,43,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','733ab3fa-aad9-4f0b-812e-89ad10a00d23'),
	(97,44,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','ea3b3576-d796-48a7-bdf6-ce10e3eb6100'),
	(98,45,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','9ce19994-aa64-4b1b-b3cb-84bc04390b40'),
	(99,46,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','5722e6f4-0d94-40f2-bcf6-df61f58091f4'),
	(100,47,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','e0cd4613-cb9e-4aff-a9ae-e9a130d3a991'),
	(101,48,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','66519426-9a77-4e2b-a315-ae4d86968e63'),
	(102,49,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','1cd8e906-0c0c-41e7-a6c2-d895fa3081b9'),
	(103,50,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','849d44e8-ac56-422e-abef-b5a67b9fe0e8'),
	(104,51,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','782b13f3-8b57-47d8-aa30-1c326939a34d'),
	(105,52,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','d8eceb31-d03d-4540-8141-e526f564953a'),
	(106,53,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','25c939eb-8dad-4b8f-af23-fb4363e95978'),
	(107,54,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','f59a8a7b-34af-43b0-bada-474a0549481c'),
	(108,55,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','80052aa7-47c8-427b-ade6-5eb598c4b765'),
	(109,56,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','db04accc-e6a9-419d-b07d-439405a27e00'),
	(110,57,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','64ef4b46-da7a-4a35-82f3-6ec649e76120'),
	(111,58,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','0f998630-744a-458c-b203-687eccf17988'),
	(112,59,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','ae8d2f95-d417-4755-a0ad-4c4be672179e'),
	(113,60,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','153ba356-173c-43ea-a4cd-f0865f6ab9d0'),
	(114,61,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','556341d3-e87e-4d3c-8f53-e38e6b6113eb'),
	(115,62,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','feb3e8fa-485d-4f56-8030-15e8ca693e5e'),
	(116,63,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','f62e92e6-1656-4c95-9773-44e13099aac9'),
	(117,64,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','33874942-727e-46ea-bae0-81ed736115d9'),
	(118,65,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','fc4f7fa6-6c6d-416c-8f9c-47f552c367da'),
	(119,66,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','1a7cf40e-715c-4130-a313-7d87f5302594'),
	(120,67,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','ca9e3ddf-d8ca-4385-8e73-cf2bc97e25ac'),
	(121,68,2,'2017-12-05 14:32:09','2017-12-05 14:32:09','07160604-4885-4e4d-b0ed-c8778065035a');

/*!40000 ALTER TABLE `craft_userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;


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
	(1,'superuser',NULL,'','','mail@domain.com','$2y$13$XiQ7RMMV2PbU.93SnT4rv.AFs4ahr0H3kEH1D6iMq86GjfyoOUA86',NULL,1,1,0,0,0,0,0,'2017-12-05 12:58:29','::1',NULL,NULL,'2017-07-08 19:57:50',NULL,NULL,NULL,NULL,0,'2017-04-16 21:53:42','2017-04-16 21:53:42','2017-12-05 12:58:29','df730679-fa87-4b60-991e-9e821fddf5f8');

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
