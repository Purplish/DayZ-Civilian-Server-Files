-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server Version:               5.6.11-log - MySQL Community Server (GPL)
-- Server Betriebssystem:        Win64
-- HeidiSQL Version:             8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Exportiere Struktur von Tabelle civilian.character_data
DROP TABLE IF EXISTS `character_data`;
CREATE TABLE IF NOT EXISTS `character_data` (
  `CharacterID` int(11) NOT NULL AUTO_INCREMENT,
  `PlayerID` int(11) NOT NULL DEFAULT '0',
  `PlayerUID` varchar(45) NOT NULL DEFAULT '0',
  `InstanceID` int(11) NOT NULL DEFAULT '0',
  `Datestamp` datetime DEFAULT NULL,
  `LastLogin` datetime NOT NULL,
  `Inventory` longtext,
  `Backpack` longtext,
  `Worldspace` varchar(70) NOT NULL DEFAULT '[]',
  `Medical` varchar(200) NOT NULL DEFAULT '[]',
  `Alive` tinyint(4) NOT NULL DEFAULT '1',
  `Generation` int(11) NOT NULL DEFAULT '1',
  `LastAte` datetime NOT NULL,
  `LastDrank` datetime NOT NULL,
  `KillsZ` int(11) NOT NULL DEFAULT '0',
  `HeadshotsZ` int(11) NOT NULL DEFAULT '0',
  `distanceFoot` int(11) NOT NULL DEFAULT '0',
  `duration` int(11) NOT NULL DEFAULT '0',
  `currentState` varchar(100) NOT NULL DEFAULT '[]',
  `KillsH` int(11) NOT NULL DEFAULT '0',
  `Model` varchar(50) NOT NULL DEFAULT '"Survivor2_DZ"',
  `KillsB` int(11) NOT NULL DEFAULT '0',
  `Humanity` int(11) NOT NULL DEFAULT '2500',
  `last_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`CharacterID`),
  KEY `PlayerID` (`PlayerID`),
  KEY `Alive_PlayerID` (`Alive`,`LastLogin`,`PlayerID`),
  KEY `PlayerUID` (`PlayerUID`),
  KEY `Alive_PlayerUID` (`Alive`,`LastLogin`,`PlayerUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportiere Daten aus Tabelle civilian.character_data: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `character_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_data` ENABLE KEYS */;


-- Exportiere Struktur von Tabelle civilian.character_data_dead
DROP TABLE IF EXISTS `character_data_dead`;
CREATE TABLE IF NOT EXISTS `character_data_dead` (
  `CharacterID` int(11) NOT NULL AUTO_INCREMENT,
  `PlayerID` int(11) NOT NULL DEFAULT '0',
  `PlayerUID` varchar(45) NOT NULL DEFAULT '0',
  `InstanceID` int(11) NOT NULL DEFAULT '0',
  `Datestamp` datetime DEFAULT NULL,
  `LastLogin` datetime NOT NULL,
  `Inventory` longtext,
  `Backpack` longtext,
  `Worldspace` varchar(70) NOT NULL DEFAULT '[]',
  `Medical` varchar(200) NOT NULL DEFAULT '[]',
  `Alive` tinyint(4) NOT NULL DEFAULT '1',
  `Generation` int(11) NOT NULL DEFAULT '1',
  `LastAte` datetime NOT NULL,
  `LastDrank` datetime NOT NULL,
  `KillsZ` int(11) NOT NULL DEFAULT '0',
  `HeadshotsZ` int(11) NOT NULL DEFAULT '0',
  `distanceFoot` int(11) NOT NULL DEFAULT '0',
  `duration` int(11) NOT NULL DEFAULT '0',
  `currentState` varchar(100) NOT NULL DEFAULT '[]',
  `KillsH` int(11) NOT NULL DEFAULT '0',
  `Model` varchar(50) NOT NULL DEFAULT '"Survivor2_DZ"',
  `KillsB` int(11) NOT NULL DEFAULT '0',
  `Humanity` int(11) NOT NULL DEFAULT '2500',
  `last_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`CharacterID`),
  KEY `PlayerID` (`PlayerID`),
  KEY `Alive_PlayerID` (`Alive`,`LastLogin`,`PlayerID`),
  KEY `PlayerUID` (`PlayerUID`),
  KEY `Alive_PlayerUID` (`Alive`,`LastLogin`,`PlayerUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT COMMENT='\r\n';

-- Exportiere Daten aus Tabelle civilian.character_data_dead: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `character_data_dead` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_data_dead` ENABLE KEYS */;


-- Exportiere Struktur von Tabelle civilian.object_classes
DROP TABLE IF EXISTS `object_classes`;
CREATE TABLE IF NOT EXISTS `object_classes` (
  `Classname` varchar(32) NOT NULL DEFAULT '',
  `Chance` varchar(4) NOT NULL DEFAULT '0',
  `MaxNum` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Damage` varchar(20) NOT NULL DEFAULT '0',
  `Type` text NOT NULL,
  PRIMARY KEY (`Classname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Exportiere Daten aus Tabelle civilian.object_classes: 77 rows
/*!40000 ALTER TABLE `object_classes` DISABLE KEYS */;
INSERT IGNORE INTO `object_classes` (`Classname`, `Chance`, `MaxNum`, `Damage`, `Type`) VALUES
	('AN2_DZ', '1', 2, '0,7', 'aircraft'),
	('ATV_CZ_EP1', '0.7', 7, '0,7', 'car'),
	('ATV_US_EP1', '1', 2, '0,7', 'car'),
	('BAF_Offroad_D', '0.9', 1, '0,7', 'car'),
	('BAF_Offroad_W', '0.65', 4, '0,7', 'car'),
	('car_hatchback', '0.65', 5, '0,7', 'car'),
	('car_sedan', '0.65', 4, '0,7', 'car'),
	('datsun1_civil_1_open', '0.65', 4, '0,7', 'car'),
	('datsun1_civil_2_covered', '0.65', 3, '0,7', 'car'),
	('datsun1_civil_3_open', '0.65', 3, '0,7', 'car'),
	('Fishing_Boat', '0.7', 3, '0,7', 'ship'),
	('hilux1_civil_1_open', '0.65', 4, '0,7', 'car'),
	('hilux1_civil_2_covered', '0.9', 1, '0,7', 'car'),
	('hilux1_civil_3_open', '0.65', 2, '0,7', 'car'),
	('Ikarus', '0.7', 4, '0,7', 'car'),
	('Ikarus_TK_CIV_EP1', '0.7', 4, '0,7', 'car'),
	('kpfs_golf_bl', '0.8', 1, '0,7', 'car'),
	('kpfs_golf_g', '0.8', 1, '0,7', 'car'),
	('kyo_microlight', '0.8', 1, '0,7', 'aircraft'),
	('kyo_microlight_blue', '0.8', 1, '0,7', 'aircraft'),
	('kyo_ultralight', '0.8', 1, '0,7', 'aircraft'),
	('Lada2', '0.8', 1, '0,7', 'car'),
	('Lada2_TK_CIV_EP1', '0.8', 1, '0,7', 'car'),
	('Lada3_GDR', '0.75', 2, '0,7', 'car'),
	('Lada4_GDR', '0.75', 2, '0,7', 'car'),
	('Lada5_GDR', '0.75', 2, '0,7', 'car'),
	('LadaLM', '0.8', 1, '0,7', 'car'),
	('LadaVP', '0.65', 2, '0,7', 'car'),
	('LandRover_CZ_EP1', '0.65', 3, '0,7', 'car'),
	('M1030', '0.75', 3, '0,7', 'motorcycle'),
	('MH6J_DZ', '0.66', 3, '0,7', 'aircraft'),
	('Mi17_DZ', '0.75', 1, '0,7', 'aircraft'),
	('Old_bike_TK_CIV_EP1', '0.75', 12, '0,7', 'bike'),
	('Old_bike_TK_INS_EP1', '0.75', 13, '0,7', 'bike'),
	('Old_moto_TK_Civ_EP1', '0.8', 4, '0,7', 'motorcycle'),
	('PBX', '0.75', 4, '0,7', 'car'),
	('policecar', '1', 1, '0,7', 'car'),
	('Post_bike_E', '0.75', 17, '0,7', 'bike'),
	('Post_bike_W', '0.75', 9, '0,7', 'bike'),
	('S1203_TK_CIV_EP1', '0.8', 6, '0,7', 'car'),
	('Skoda', '0.65', 2, '0,7', 'car'),
	('SkodaBlue', '0.7', 2, '0,7', 'car'),
	('SkodaGreen', '0.7', 1, '0,7', 'car'),
	('SkodaRed', '0.7', 2, '0,7', 'car'),
	('Smallboat_1', '0.7', 5, '0,7', 'car'),
	('smallboat_2', '0.7', 1, '0,7', 'car'),
	('SUV_Green', '0.8', 2, '0,7', 'car'),
	('SUV_Silver', '0.8', 1, '0,7', 'car'),
	('Tractor', '0.5', 17, '0,7', 'car'),
	('tractorOld', '1', 1, '0,7', 'car'),
	('TT650_Gue', '0.65', 2, '0,7', 'motorcycle'),
	('TT650_Ins', '0.65', 1, '0,7', 'motorcycle'),
	('TT650_TK_CIV_EP1', '0.65', 2, '0,7', 'motorcycle'),
	('TT650_TK_EP1', '0.65', 4, '0,7', 'motorcycle'),
	('UAZ_Unarmed_TK_CIV_EP1', '0.7', 2, '0,7', 'car'),
	('UAZ_Unarmed_UN_EP1', '0.7', 2, '0,7', 'car'),
	('UH1H_DZ', '0.9', 2, '0,7', 'aircraft'),
	('UralCivil', '0.75', 1, '0,7', 'car'),
	('UralCivil2', '0.75', 1, '0,7', 'car'),
	('UralOpen_INS', '0.75', 1, '0,7', 'car'),
	('Ural_CDF', '0.75', 1, '0,7', 'car'),
	('Ural_TK_CIV_EP1', '0.75', 1, '0,7', 'car'),
	('V3S_Civ', '0.75', 2, '0,7', 'car'),
	('VolhaLimo_TK_CIV_EP1', '0.75', 2, '0,7', 'car'),
	('Volha_2_TK_CIV_EP1', '0.75', 3, '0,7', 'car'),
	('VWGolf', '0.8', 1, '0,7', 'car'),
	('LandRover_TK_CIV_EP1', '0.8', 1, '0.7', 'car'),
	('SUV_DZ', '0.8', 1, '0.7', 'car'),
	('UAZ_RU', '0.8', 1, '0.7', 'car'),
	('SUV_Orange', '0.7', 1, '0.7', 'car'),
	('UAZ_Unarmed_TK_EP1', '0.7', 1, '0.7', 'car'),
	('AH6X_DZ', '0.3', 3, '0.5', 'aircraft'),
	('Lada1_GDR', '0.75', 1, '0.7', 'car'),
	('UAZ_CDF', '0.7', 1, '0.7', 'car'),
	('LadaMP', '0.7', 1, '0.7', 'car'),
	('SUV_Red', '0.7', 1, '0.8', 'car'),
	('Fence_Ind', '0', 0, '0', 'deployable');
/*!40000 ALTER TABLE `object_classes` ENABLE KEYS */;


-- Exportiere Struktur von Tabelle civilian.object_data
DROP TABLE IF EXISTS `object_data`;
CREATE TABLE IF NOT EXISTS `object_data` (
  `ObjectID` int(11) NOT NULL AUTO_INCREMENT,
  `ObjectUID` bigint(20) NOT NULL DEFAULT '0',
  `Instance` int(11) NOT NULL,
  `Classname` varchar(50) DEFAULT NULL,
  `Datestamp` datetime NOT NULL,
  `CharacterID` int(11) NOT NULL DEFAULT '0',
  `Worldspace` varchar(70) NOT NULL DEFAULT '[]',
  `Inventory` longtext,
  `Hitpoints` varchar(500) NOT NULL DEFAULT '[]',
  `Fuel` double(13,5) NOT NULL DEFAULT '1.00000',
  `Damage` double(13,5) NOT NULL DEFAULT '0.00000',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ObjectID`),
  UNIQUE KEY `CheckUID` (`ObjectUID`,`Instance`),
  KEY `ObjectUID` (`ObjectUID`),
  KEY `Instance` (`Damage`,`Instance`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportiere Daten aus Tabelle civilian.object_data: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `object_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_data` ENABLE KEYS */;


-- Exportiere Struktur von Tabelle civilian.object_spawns
DROP TABLE IF EXISTS `object_spawns`;
CREATE TABLE IF NOT EXISTS `object_spawns` (
  `ObjectUID` bigint(20) NOT NULL DEFAULT '0',
  `Classname` varchar(32) DEFAULT NULL,
  `Worldspace` varchar(64) DEFAULT NULL,
  `Inventory` longtext,
  `Hitpoints` varchar(999) NOT NULL DEFAULT '[]',
  `MapID` varchar(255) NOT NULL DEFAULT '',
  `Last_changed` int(10) DEFAULT NULL,
  PRIMARY KEY (`ObjectUID`,`MapID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Exportiere Daten aus Tabelle civilian.object_spawns: 216 rows
/*!40000 ALTER TABLE `object_spawns` DISABLE KEYS */;
INSERT IGNORE INTO `object_spawns` (`ObjectUID`, `Classname`, `Worldspace`, `Inventory`, `Hitpoints`, `MapID`, `Last_changed`) VALUES
	(600001, 'SkodaGreen', '[45,[1550.5,2295.1184,-8.5830688e-006]]', '[[[], []], [["ItemSodaCoke"], [1]], [[], []]]', '[]', '1', NULL),
	(600002, 'Lada4_GDR', '[2,[1719.603,2231.5129,-1.2874603e-005]]', '[]', '[]', '2', NULL),
	(600003, 'PBX', '[7,[2140.6201,2065.1431,-8.2850456e-006]]', '[]', '[]', '3', NULL),
	(600004, 'UralCivil', '[-109,[2252.5898,2426.5549,9.5367432e-006]]', '[]', '[]', '4', NULL),
	(600005, 'Smallboat_1', '[9,[2505.0151,1908.6506,0.21726671]]', '[]', '[]', '5', NULL),
	(600006, 'ATV_CZ_EP1', '[9,[2631.9849,2243.6067,-3.0517578e-005]]', '[]', '[]', '6', NULL),
	(600007, 'Post_bike_E', '[5,[1937.1237,2265.8557,-4.7683716e-007]]', '[]', '[]', '7', NULL),
	(600008, 'car_sedan', '[101,[2878.2363,2023.2157,1.0967255e-005]]', '[]', '[]', '8', NULL),
	(600009, 'Fishing_Boat', '[84,[3606.6606,2049.1738,0.1715945]]', '[]', '[]', '9', NULL),
	(600010, 'MH6J_DZ', '[3,[3589.2297,2179.7166,12.500687]]', '[]', '[]', '10', NULL),
	(600011, 'Ikarus_TK_CIV_EP1', '[-52,[3645.9082,2529.2024,-1.9073486e-006]]', '[[[], []], [["PartWheel"], [1]], [[], []]]', '[]', '11', NULL),
	(600012, 'Old_bike_TK_CIV_EP1', '[5,[3576.0891,2559.4905,-1.8119812e-005]]', '[]', '[]', '12', NULL),
	(600013, 'Tractor', '[-183,[4396.8525,2947.8708,-4.196167e-005]]', '[]', '[]', '13', NULL),
	(600014, 'Old_moto_TK_Civ_EP1', '[114,[4185.3687,2510.6843,1.335144e-005]]', '[]', '[]', '14', NULL),
	(600015, 'Post_bike_E', '[240,[4518.1167,2385.7302,-7.3432922e-005]]', '[]', '[]', '15', NULL),
	(600016, 'car_hatchback', '[224,[4361.0356,2469.679,9.5367432e-007]]', '[]', '[]', '16', NULL),
	(600017, 'AN2_DZ', '[119,[4635.9961,2556.5051,-0.65822494]]', '[]', '[]', '17', NULL),
	(600018, 'PBX', '[0,[4823.1846,2027.9172,0.15479758]]', '[]', '[]', '18', NULL),
	(600019, 'S1203_TK_CIV_EP1', '[59,[5197.6006,2362.5781,3.2424927e-005]]', '[[[], []], [["ItemSodaCoke"], [2]], [[], []]]', '[]', '19', NULL),
	(600020, 'Fishing_Boat', '[-167,[5954.4395,2004.8566,0.14316303]]', '[]', '[]', '20', NULL),
	(600021, 'PBX', '[101,[8296.0449,2353.1514,0.046811759]]', '[]', '[]', '21', NULL),
	(600022, 'Smallboat_1', '[216,[9787.5166,1745.5361,0.046301454]]', '[]', '[]', '22', NULL),
	(600023, 'Smallboat_1', '[213,[9790.4434,1743.0431,-0.10590515]]', '[]', '[]', '23', NULL),
	(600024, 'smallboat_2', '[97,[11681.313,3125.1782,0.21901111]]', '[]', '[]', '24', NULL),
	(600025, 'Fishing_Boat', '[-77,[13705.641,4034.8933,-0.069395661]]', '[]', '[]', '25', NULL),
	(600026, 'Smallboat_1', '[0,[13100.126,8247.6514,0.11922375]]', '[]', '[]', '26', NULL),
	(600027, 'PBX', '[101,[13896.471,11212.925,0.03149575]]', '[]', '[]', '27', NULL),
	(600028, 'MH6J_DZ', '[8,[12220.714,12591.563,1.5258789e-005]]', '[]', '[]', '28', NULL),
	(600029, 'TT650_TK_CIV_EP1', '[1,[11003.075,13368.771,3.0517578e-005]]', '[]', '[]', '29', NULL),
	(600030, 'Old_bike_TK_INS_EP1', '[157,[10656.897,12755.333,-0.00015258789]]', '[]', '[]', '30', NULL),
	(600031, 'datsun1_civil_1_open', '[89,[9435.7471,13452.391,-8.392334e-005]]', '[]', '[]', '31', NULL),
	(600032, 'Ural_CDF', '[225,[6614.5347,2763.1182,-7.6293945e-006]]', '[]', '[]', '32', NULL),
	(600033, 'Lada2', '[-38,[6973.2339,2389.0029,-1.6212463e-005]]', '[]', '[]', '33', NULL),
	(600034, 'SUV_Green', '[98,[6712.4282,2347.845,-3.8146973e-006]]', '[]', '[]', '34', NULL),
	(600035, 'Post_bike_E', '[125,[6391.1372,2298.0032,2.8610229e-006]]', '[]', '[]', '35', NULL),
	(600036, 'kpfs_golf_bl', '[9,[6280.8789,2576.7339,2.1934509e-005]]', '[]', '[]', '36', NULL),
	(600037, 'Ikarus', '[39,[6427.8477,2863.0554,6.6280365e-005]]', '[[["Makarov"], [1]], [["FoodCanBakedBeans"], [1]], [[], []]]', '[]', '37', NULL),
	(600038, 'M1030', '[-35,[10240.735,1853.7634,2.8610229e-006]]', '[]', '[]', '38', NULL),
	(600039, 'UAZ_Unarmed_UN_EP1', '[-120,[10073.099,2001.5322,-1.8119812e-005]]', '[]', '[]', '39', NULL),
	(600040, 'Ikarus', '[-105,[10312.452,2145.6255,1.2397766e-005]]', '[[["Makarov"], [1]], [["FoodCanBakedBeans"], [1]], [[], []]]', '[]', '40', NULL),
	(600041, 'Post_bike_E', '[3,[10558.508,2316.2388,1.9073486e-005]]', '[]', '[]', '41', NULL),
	(600042, 'datsun1_civil_2_covered', '[81,[12844.587,4430.895,-1.5258789e-005]]', '[]', '[]', '42', NULL),
	(600043, 'ATV_US_EP1', '[3,[12325.136,4549.6777,0.00019836426]]', '[]', '[]', '43', NULL),
	(600044, 'ATV_US_EP1', '[9,[8851.3857,2923.3157,-0.0005645752]]', '[]', '[]', '44', NULL),
	(600045, 'Tractor', '[233,[10038.241,6048.7568,-0.00042724609]]', '[]', '[]', '45', NULL),
	(600046, 'Old_bike_TK_INS_EP1', '[9,[1684.1674,3790.7659,1.5258789e-005]]', '[]', '[]', '46', NULL),
	(600047, 'LadaVP', '[-65,[1654.0295,3862.5723],0]]', '[]', '[]', '47', NULL),
	(600048, 'V3S_Civ', '[89,[3222.1538,3479.0591,-1.5258789e-005]]', '[]', '[]', '48', NULL),
	(600049, 'Tractor', '[0,[3398.3125,3915.2661,-3.0517578e-005]]', '[]', '[]', '49', NULL),
	(600050, 'tractorOld', '[269,[3899.5701,3573.6333],0]]', '[]', '[]', '50', NULL),
	(600051, 'Ikarus_TK_CIV_EP1', '[41,[2678.6428,5134.314,3.0517578e-005]]', '[[[], []], [["PartWheel"], [1]], [[], []]]', '[]', '51', NULL),
	(600052, 'VolhaLimo_TK_CIV_EP1', '[137,[2764.6355,5058.9858,-1.5258789e-005]]', '[]', '[]', '52', NULL),
	(600053, 'TT650_TK_EP1', '[100,[2764.0667,5264.4814,-3.0517578e-005]]', '[]', '[]', '53', NULL),
	(600054, 'hilux1_civil_1_open', '[157,[3191.751,5191.3374,-6.1035156e-005]]', '[]', '[]', '54', NULL),
	(600055, 'datsun1_civil_3_open', '[33,[2255.2947,5134.8994,-0.22784974]]', '[]', '[]', '55', NULL),
	(600056, 'BAF_Offroad_W', '[-203,[3710.5684,6066.1147,0.00012207031]]', '[]', '[]', '56', NULL),
	(600057, 'Tractor', '[199,[3138.4326,5868.7944,-6.1035156e-005]]', '[]', '[]', '57', NULL),
	(600058, 'UralCivil2', '[8,[4355.7075,4665.7251,1.5258789e-005]]', '[]', '[]', '58', NULL),
	(600059, 'Old_bike_TK_INS_EP1', '[53,[4492.3926,4616.2686,-4.5776367e-005]]', '[]', '[]', '59', NULL),
	(600060, 'Tractor', '[41,[3406.6462,4597.978,9.1552734e-005]]', '[]', '[]', '60', NULL),
	(600061, 'Tractor', '[58,[1734.1077,5096.0908,9.1552734e-005]]', '[]', '[]', '61', NULL),
	(600062, 'ATV_CZ_EP1', '[118,[5414.6396,3801.4167,4.5776367e-005]]', '[]', '[]', '62', NULL),
	(600063, 'SkodaBlue', '[59,[5927.3335,4750.2915,3.0517578e-005]]', '[[[], []], [["ItemSodaPepsi"], [1]], [[], []]]', '[]', '63', NULL),
	(600064, 'Volha_2_TK_CIV_EP1', '[-50,[5923.9937,5795.1055,-6.1035156e-005]]', '[]', '[]', '64', NULL),
	(600065, 'V3S_Civ', '[37,[6261.2964,7709.7188,-3.0517578e-005]]', '[]', '[]', '65', NULL),
	(600066, 'UAZ_Unarmed_TK_CIV_EP1', '[20,[8427.9053,6662.8647],0]]', '[]', '[]', '66', NULL),
	(600067, 'Old_bike_TK_CIV_EP1', '[325,[7819.436,7271.4351,-3.0517578e-005]]', '[]', '[]', '67', NULL),
	(600068, 'Old_bike_TK_CIV_EP1', '[91,[8141.8545,8572.3809],0]]', '[]', '[]', '68', NULL),
	(600069, 'datsun1_civil_3_open', '[248,[1918.3032,14527.273,-3.0517578e-005]]', '[]', '[]', '69', NULL),
	(600070, 'Post_bike_E', '[4,[534.46075,13772.634,-3.0517578e-005]]', '[]', '[]', '70', NULL),
	(600071, 'ATV_CZ_EP1', '[6,[3719.2104,14494.887,6.1035156e-005]]', '[]', '[]', '71', NULL),
	(600072, 'kpfs_golf_g', '[9,[12656.883,9692.9971,2.2888184e-005]]', '[]', '[]', '72', NULL),
	(600073, 'datsun1_civil_2_covered', '[27,[12779.849,9629.5869,-3.0517578e-005]]', '[]', '[]', '73', NULL),
	(600074, 'Ikarus', '[243,[12008.765,9053.3066,-7.6293945e-006]]', '[[["Makarov"], [1]], [["FoodCanBakedBeans"], [1]], [[], []]]', '[]', '74', NULL),
	(600075, 'Old_bike_TK_INS_EP1', '[6,[13352.756,6167.5825,-3.8146973e-006]]', '[]', '[]', '75', NULL),
	(600076, 'Tractor', '[92,[12971.738,6724.0078,1.7166138e-005]]', '[]', '[]', '76', NULL),
	(600077, 'SUV_Green', '[27,[13294.746,6103.7461,1.4305115e-006]]', '[]', '[]', '77', NULL),
	(600078, 'S1203_TK_CIV_EP1', '[-196,[8389.9492,4950.1768,1.5258789e-005]]', '[[[], []], [["ItemSodaPepsi", "FoodCanFrankBeans"], [1, 1]], [[], []]]', '[]', '78', NULL),
	(600079, 'TT650_TK_CIV_EP1', '[-76,[7429.7646,5161.2495,-4.5776367e-005]]', '[]', '[]', '79', NULL),
	(600080, 'Tractor', '[193,[7628.6592,5193.7065],0]]', '[]', '[]', '80', NULL),
	(600081, 'ATV_CZ_EP1', '[3,[6516.8027,5605.6846,-6.1035156e-005]]', '[]', '[]', '81', NULL),
	(600082, 'Skoda', '[173,[6485.3389,6182.0503,-3.0517578e-005]]', '[[[], []], [["ItemSodaCoke"], [1]], [[], []]]', '[]', '82', NULL),
	(600083, 'Old_bike_TK_CIV_EP1', '[2,[6538.5005,6551.6006,3.0517578e-005]]', '[]', '[]', '83', NULL),
	(600084, 'policecar', '[137,[11458.372,12213.399,4.5776367e-005]]', '[]', '[]', '84', NULL),
	(600085, 'LandRover_CZ_EP1', '[8,[6876.5679,11473.56,-9.1552734e-005]]', '[]', '[]', '85', NULL),
	(600086, 'Tractor', '[86,[8409.5977,12235.147,0.0002746582]]', '[]', '[]', '86', NULL),
	(600087, 'Tractor', '[-38,[7297.7632,9632.8525,3.0517578e-005]]', '[]', '[]', '87', NULL),
	(600088, 'car_sedan', '[22,[2539.6475,8899.8535,3.0517578e-005]]', '[]', '[]', '88', NULL),
	(600089, 'Tractor', '[9,[4037.9468,7813.1382,0.00012207031]]', '[]', '[]', '89', NULL),
	(600090, 'car_hatchback', '[102,[9636.6875,10431.185,0.00018310547]]', '[]', '[]', '90', NULL),
	(600091, 'Old_bike_TK_CIV_EP1', '[-27,[8632.6475,8855.1182,3.0517578e-005]]', '[]', '[]', '91', NULL),
	(600092, 'SkodaRed', '[52,[4969.9688,12476.708,7.6293945e-005]]', '[[[], []], [["ItemSodaCoke"], [1]], [[], []]]', '[]', '92', NULL),
	(600093, 'hilux1_civil_2_covered', '[-32,[11223.275,5418.124],0]]', '[]', '[]', '93', NULL),
	(600094, 'TT650_Gue', '[-45,[12318.394,10801.813,-0.00011444092]]', '[]', '[]', '94', NULL),
	(600095, 'SUV_Silver', '[214,[12268.295,11089.292,3.0517578e-005]]', '[]', '[]', '95', NULL),
	(600096, 'Tractor', '[4,[7365.5015,10680.669,-9.1552734e-005]]', '[]', '[]', '96', NULL),
	(600097, 'Ural_TK_CIV_EP1', '[206,[3163.6338,7990.2993,-3.0517578e-005]]', '[]', '[]', '97', NULL),
	(600098, 'UAZ_Unarmed_TK_CIV_EP1', '[77,[3054.9927,7669.9805],0]]', '[]', '[]', '98', NULL),
	(600099, 'Ikarus_TK_CIV_EP1', '[316,[9581.3291,8810.123,9.1552734e-005]]', '[[[], []], [["PartWheel"], [1]], [[], []]]', '[]', '99', NULL),
	(600100, 'VWGolf', '[2,[9694.8564,8937.6602,0.00012207031]]', '[]', '[]', '100', NULL),
	(600101, 'Post_bike_E', '[4,[9244.8672,8892.2803,3.0517578e-005]]', '[]', '[]', '101', NULL),
	(600102, 'Tractor', '[2,[2342.3772,11467.788,6.1035156e-005]]', '[]', '[]', '102', NULL),
	(600103, 'LadaLM', '[31,[4610.1484,9572.5879,-3.0517578e-005]]', '[]', '[]', '103', NULL),
	(600104, 'LandRover_CZ_EP1', '[7,[4625.5244,9675.0098],0]]', '[]', '[]', '104', NULL),
	(600105, 'AN2_DZ', '[244,[4516.144,10576.935],0]]', '[]', '[]', '105', NULL),
	(600106, 'Mi17_DZ', '[4,[4646.9663,9729.8594,6.1035156e-005]]', '[]', '[]', '106', NULL),
	(600107, 'MH6J_DZ', '[1,[4048.4495,11653.309,-3.0517578e-005]]', '[]', '[]', '107', NULL),
	(600108, 'ATV_CZ_EP1', '[9,[13386.247,12120.361,-0.00022125244]]', '[]', '[]', '108', NULL),
	(600109, 'VolhaLimo_TK_CIV_EP1', '[9,[10277.149,3771.7039,1.5258789e-005]]', '[]', '[]', '109', NULL),
	(600110, 'Tractor', '[7,[12408.784,13386.686,0.00045013428]]', '[]', '[]', '110', NULL),
	(600111, 'UH1H_DZ', '[-26,[10134.672,9603.2061,9.1552734e-005]]', '[]', '[]', '111', NULL),
	(600112, 'UH1H_DZ', '[107,[4991.9692,7076.2915,-6.1035156e-005]]', '[]', '[]', '112', NULL),
	(600113, 'kyo_microlight', '[111,[11880.781,12821.364,-4.5776367e-005]]', '[]', '[]', '113', NULL),
	(600114, 'kyo_microlight_blue', '[-240,[11872.296,12799.26,4.5776367e-005]]', '[]', '[]', '114', NULL),
	(600115, 'kyo_ultralight', '[152,[4190.4438,10889.137,-3.0517578e-005]]', '[]', '[]', '115', NULL),
	(600116, 'TT650_Gue', '[7,[2734.1709,9929.793,-3.0517578e-005]]', '[]', '[]', '116', NULL),
	(600117, 'UralOpen_INS', '[231,[2838.9868,9766.2871,9.1552734e-005]]', '[]', '[]', '117', NULL),
	(600118, 'Post_bike_W', '[-190,[2252.2405,9416.4033,-1.5258789e-005]]', '[]', '[]', '118', NULL),
	(600119, 'Post_bike_W', '[1,[4964.873,8049.5039,0]]', '[]', '[]', '119', NULL),
	(600120, 'Post_bike_W', '[4,[10902.576,7579.6807,-6.1035156e-005]]', '[]', '[]', '120', NULL),
	(600121, 'BAF_Offroad_D', '[-38,[9261.6436,4969.5674,2.2888184e-005]]', '[]', '[]', '121', NULL),
	(600122, 'Post_bike_E', '[41,[8963.0117,4554.7803],0]]', '[]', '[]', '122', NULL),
	(600123, 'Post_bike_E', '[-26,[11228.045,4756.0166,-3.0517578e-005]]', '[]', '[]', '123', NULL),
	(600124, 'Post_bike_E', '[9,[11389.303,3345.0259,-1.2874603e-005]]', '[]', '[]', '124', NULL),
	(600125, 'Post_bike_E', '[2,[13378.295,4107.9644,5.1498413e-005]]', '[]', '[]', '125', NULL),
	(600126, 'Post_bike_E', '[5,[13042.384,7515.4072,-2.7179718e-005]]', '[]', '[]', '126', NULL),
	(600127, 'Post_bike_E', '[112,[12596.01,11768.904,-8.392334e-005]]', '[]', '[]', '127', NULL),
	(600128, 'TT650_TK_EP1', '[-22,[10732.296,10778.347,-9.1552734e-005]]', '[]', '[]', '128', NULL),
	(600129, 'Lada3_GDR', '[280,[9450.8701,11476.143,-7.6293945e-005]]', '[]', '[]', '129', NULL),
	(600130, 'Post_bike_W', '[-124,[8397.2832,10595.493,0.0002746582]]', '[]', '[]', '130', NULL),
	(600131, 'TT650_Ins', '[2,[5947.5425,10364.896,0.00021362305]]', '[]', '[]', '131', NULL),
	(600132, 'Old_bike_TK_INS_EP1', '[8,[6749.1318,8602.0674,-3.0517578e-005]]', '[]', '[]', '132', NULL),
	(600133, 'hilux1_civil_3_open', '[-25,[5963.4575,10331.795,-6.1035156e-005]]', '[]', '[]', '133', NULL),
	(600134, 'Post_bike_W', '[112,[6186.2456,10434.372],0]]', '[]', '[]', '134', NULL),
	(600135, 'datsun1_civil_1_open', '[246,[5350.5596,8620.6553,-6.1035156e-005]]', '[]', '[]', '135', NULL),
	(600136, 'Old_bike_TK_INS_EP1', '[2,[5183.5122,8587.293,6.1035156e-005]]', '[]', '[]', '136', NULL),
	(600137, 'M1030', '[1,[5907.5581,11357.026,3.0517578e-005]]', '[]', '[]', '137', NULL),
	(600138, 'Old_bike_TK_CIV_EP1', '[94,[5420.9189,11042.91,3.0517578e-005]]', '[]', '[]', '138', NULL),
	(600139, 'Old_bike_TK_CIV_EP1', '[9,[4163.623,12104.11,-3.0517578e-005]]', '[]', '[]', '139', NULL),
	(600140, 'Old_bike_TK_CIV_EP1', '[5,[4886.8994,5645.3462,3.0517578e-005]]', '[]', '[]', '140', NULL),
	(600141, 'Old_bike_TK_CIV_EP1', '[3,[2556.0811,3287.335,-1.5258789e-005]]', '[]', '[]', '141', NULL),
	(600142, 'Lada5_GDR', '[29,[2583.2529,3448.2822],0]]', '[]', '[]', '142', NULL),
	(600143, 'hilux1_civil_1_open', '[2,[3584.5854,6988.5327],0]]', '[]', '[]', '143', NULL),
	(600144, 'Tractor', '[9,[7034.2822,8936.8857,-9.1552734e-005]]', '[]', '[]', '144', NULL),
	(600145, 'Post_bike_W', '[16,[7351.5,8637.96],0]]', '[]', '[]', '145', NULL),
	(600146, 'Post_bike_W', '[139,[7780.9766,3426.6265,-4.0531158e-005]]', '[]', '[]', '146', NULL),
	(600147, 'LadaVP', '[232,[7484.0703,2997.825,-3.8146973e-006]]', '[]', '[]', '147', NULL),
	(600148, 'Old_bike_TK_INS_EP1', '[18,[6487.0962,3825.6328,-0.00011444092]]', '[]', '[]', '148', NULL),
	(600149, 'Old_bike_TK_INS_EP1', '[6,[6272.5996,3770.2388,-1.5258789e-005]]', '[]', '[]', '149', NULL),
	(600150, 'datsun1_civil_3_open', '[-64,[11500.568,7517.3877,9.1552734e-005]]', '[]', '[]', '150', NULL),
	(600151, 'Post_bike_E', '[72,[12201.449,7269.3423,-4.5776367e-005]]', '[]', '[]', '151', NULL),
	(600152, 'Post_bike_E', '[6,[10308.395,9613.1221,-0.0004119873]]', '[]', '[]', '152', NULL),
	(600153, 'Lada2_TK_CIV_EP1', '[9,[10607.597,9982.6885,-0.0001449585]]', '[]', '[]', '153', NULL),
	(600154, 'ATV_CZ_EP1', '[214,[11463.372,11382.654,-3.0517578e-005]]', '[]', '[]', '154', NULL),
	(600155, 'Old_bike_TK_INS_EP1', '[99,[9504.7549,12091.028,-0.00010681152]]', '[]', '[]', '155', NULL),
	(600156, 'hilux1_civil_1_open', '[-30,[9242.0781,12664.155,-0.00015258789]]', '[]', '[]', '156', NULL),
	(600157, 'Tractor', '[5,[3331.676,11940.13,9.1552734e-005]]', '[]', '[]', '157', NULL),
	(600158, 'datsun1_civil_1_open', '[225,[3244.7539,11278.191,0.00012207031]]', '[]', '[]', '158', NULL),
	(600159, 'Old_bike_TK_INS_EP1', '[7,[3204.2834,10763.115],0]]', '[]', '[]', '159', NULL),
	(600160, 'LandRover_TK_CIV_EP1', '[8,[4917.0488,5167.5112,-9.1552734e-005]]', '[]', '[]', '160', NULL),
	(600161, 'datsun1_civil_1_open', '[83,[9124.8145,3853.2849,4.5776367e-005]]', '[]', '[]', '161', NULL),
	(600162, 'Old_moto_TK_Civ_EP1', '[94,[9125.8018,3761.5488],0]]', '[]', '[]', '162', NULL),
	(600163, 'Old_bike_TK_INS_EP1', '[54,[9981.6436,2616.123],0]]', '[]', '[]', '163', NULL),
	(600164, 'SUV_DZ', '[-40,[5335.6396,2328.3264,1.4305115e-005]]', '[]', '[]', '164', NULL),
	(600165, 'UAZ_RU', '[45,[5649.3394,2986.8875,3.0517578e-005]]', '[]', '[]', '165', NULL),
	(600166, 'SUV_Orange', '[240,[4902.6904,2855.322,-5.7220459e-006]]', '[]', '[]', '166', NULL),
	(600167, 'Post_bike_E', '[9,[8722.3711,2478.1116,-4.7683716e-007]]', '[]', '[]', '167', NULL),
	(600168, 'hilux1_civil_3_open', '[-31,[11218.982,4243.6797,9.1552734e-005]]', '[]', '[]', '168', NULL),
	(600169, 'S1203_TK_CIV_EP1', '[220,[10566.761,2346.6948,1.9073486e-006]]', '[[[], []], [["ItemSodaPepsi", "FoodCanFrankBeans"], [1, 1]], [[], []]]', '[]', '169', NULL),
	(600170, 'car_sedan', '[235,[10568.065,2343.0022,1.6212463e-005]]', '[]', '[]', '170', NULL),
	(600171, 'car_hatchback', '[-125,[10569.718,2339.2776,0.00010347366]]', '[]', '[]', '171', NULL),
	(600172, 'Old_bike_TK_INS_EP1', '[144,[10333.161,2113.925,6.7234039e-005]]', '[]', '[]', '172', NULL),
	(600173, 'Old_moto_TK_Civ_EP1', '[216,[10446.626,2309.8113,-4.2915344e-006]]', '[]', '[]', '173', NULL),
	(600174, 'Lada4_GDR', '[9,[10160.199,2210.0391,-6.2942505e-005]]', '[]', '[]', '174', NULL),
	(600175, 'Volha_2_TK_CIV_EP1', '[71,[10149.842,1949.3602,1.4305115e-006]]', '[]', '[]', '175', NULL),
	(600176, 'SkodaRed', '[88,[10179.283,1853.4039,1.4305115e-006]]', '[[[], []], [["ItemSodaPepsi"], [1]], [[], []]]', '[]', '176', NULL),
	(600177, 'Lada5_GDR', '[89,[10178.927,1850.3164,1.9073486e-006]]', '[]', '[]', '177', NULL),
	(600178, 'car_hatchback', '[89,[10179.474,1846.542,1.9073486e-006]]', '[]', '[]', '178', NULL),
	(600179, 'car_sedan', '[89,[10179.353,1842.3148,1.4305115e-006]]', '[]', '[]', '179', NULL),
	(600180, 'S1203_TK_CIV_EP1', '[1,[10010.584,1816.9186,-2.3841858e-006]]', '[[[], []], [["ItemSodaPepsi", "FoodCanFrankBeans"], [1, 1]], [[], []]]', '[]', '180', NULL),
	(600181, 'S1203_TK_CIV_EP1', '[9,[10001.629,1817.5942,-9.5367432e-007]]', '[[[], []], [["ItemSodaCoke"], [2]], [[], []]]', '[]', '181', NULL),
	(600182, 'Old_bike_TK_CIV_EP1', '[7,[10814.976,2341.2681,1.6689301e-005]]', '[]', '[]', '182', NULL),
	(600183, 'Smallboat_1', '[1,[10687.571,2107.3896,0.0040773153]]', '[]', '[]', '183', NULL),
	(600184, 'Ikarus_TK_CIV_EP1', '[30,[10415.104,2251.8174,1.4305115e-006]]', '[[[], []], [["PartWheel"], [1]], [[], []]]', '[]', '184', NULL),
	(600185, 'Ikarus', '[225,[10417.917,2269.0957,-1.9073486e-006]]', '[[["Makarov"], [1]], [["FoodCanBakedBeans"], [1]], [[], []]]', '[]', '185', NULL),
	(600186, 'UAZ_Unarmed_TK_EP1', '[-69,[10161.642,2031.6772,-6.7710876e-005]]', '[]', '[]', '186', NULL),
	(600187, 'Post_bike_W', '[7,[9280.5352,2033.833,9.059906e-006]]', '[]', '[]', '187', NULL),
	(600188, 'M1030', '[117,[8916.918,2050.3755,-8.9168549e-005]]', '[]', '[]', '188', NULL),
	(600189, 'AH6X_DZ', '[2,[11621.557,3134.2285,1.7523766e-005]]', '[]', '[]', '189', NULL),
	(600190, 'AH6X_DZ', '[8,[12142.37,3131.6948,7.390976e-006]]', '[]', '[]', '190', NULL),
	(600191, 'AH6X_DZ', '[7,[12350.514,3302.6038,1.2159348e-005]]', '[]', '[]', '191', NULL),
	(600192, 'Volha_2_TK_CIV_EP1', '[51,[11384.165,6554.5044,1.5258789e-005]]', '[]', '[]', '192', NULL),
	(600193, 'Lada1_GDR', '[310,[11214.65,6588.6494,-1.5258789e-005]]', '[]', '[]', '193', NULL),
	(600194, 'UAZ_CDF', '[-47,[10501.838,6197.0205,1.5258789e-005]]', '[]', '[]', '194', NULL),
	(600195, 'UAZ_Unarmed_UN_EP1', '[70,[9070.3545,8018.21,1.5258789e-005]]', '[]', '[]', '195', NULL),
	(600196, 'Old_bike_TK_CIV_EP1', '[-234,[9691.4307,7842.563,-1.5258789e-005]]', '[]', '[]', '196', NULL),
	(600197, 'Lada3_GDR', '[-229,[6565.3013,2546.5322],0]]', '[]', '[]', '197', NULL),
	(600198, 'car_hatchback', '[128,[6560.6118,2540.6477,-4.3869019e-005]]', '[]', '[]', '198', NULL),
	(600199, 'Old_moto_TK_Civ_EP1', '[131,[6555.3037,2536.6201,1.335144e-005]]', '[]', '[]', '199', NULL),
	(600200, 'hilux1_civil_1_open', '[105,[6970.7188,2818.6816,2.3841858e-006]]', '[]', '[]', '200', NULL),
	(600201, 'Post_bike_W', '[66,[7091.9932,2777.6831,-2.3841858e-006]]', '[]', '[]', '201', NULL),
	(600202, 'LandRover_CZ_EP1', '[8,[9397.3828,8971.5293,6.1035156e-005]]', '[]', '[]', '202', NULL),
	(600203, 'Old_bike_TK_INS_EP1', '[87,[9479.4063,8781.1084],0]]', '[]', '[]', '203', NULL),
	(600204, 'S1203_TK_CIV_EP1', '[82,[11966.704,3563.249,-6.1988831e-006]]', '[[[], []], [["ItemSodaCoke"], [2]], [[], []]]', '[]', '204', NULL),
	(600205, 'Post_bike_E', '[2,[12065.421,3579.4661,9.5367432e-006]]', '[]', '[]', '205', NULL),
	(600206, 'datsun1_civil_2_covered', '[59,[12043.836,3730.1228,9.5367432e-006]]', '[]', '[]', '206', NULL),
	(600207, 'TT650_TK_EP1', '[95,[12178.351,3559.3091,4.2915344e-006]]', '[]', '[]', '207', NULL),
	(600208, 'LadaMP', '[9,[13339.799,4068.8101,1.9073486e-006]]', '[]', '[]', '208', NULL),
	(600209, 'Old_bike_TK_CIV_EP1', '[4,[12858.112,3690.3269,-3.194809e-005]]', '[]', '[]', '209', NULL),
	(600210, 'ATV_CZ_EP1', '[9,[12519.893,4320.2935,0.00010681152]]', '[]', '[]', '210', NULL),
	(600211, 'Skoda', '[3,[13405.313,6200.208,-1.9073486e-006]]', '[[[], []], [["ItemSodaPepsi"], [1]], [[], []]]', '[]', '211', NULL),
	(600212, 'SkodaBlue', '[-82,[13525.396,6323.7212,-4.7922134e-005]]', '[[[], []], [["ItemSodaPepsi"], [1]], [[], []]]', '[]', '212', NULL),
	(600213, 'Tractor', '[3,[12279.29,9117.4736,-3.8146973e-005]]', '[]', '[]', '213', NULL),
	(600214, 'SUV_Red', '[-30,[12073.295,9097.707,8.7738037e-005]]', '[]', '[]', '214', NULL),
	(600215, 'Post_bike_E', '[7,[11812.01,9036.1963,3.8146973e-005]]', '[]', '[]', '215', NULL),
	(600216, 'TT650_TK_EP1', '[1,[11686.24,9150.9414,2.2888184e-005]]', '[]', '[]', '216', NULL);
/*!40000 ALTER TABLE `object_spawns` ENABLE KEYS */;


-- Exportiere Struktur von Prozedur civilian.pCleanup
DROP PROCEDURE IF EXISTS `pCleanup`;
DELIMITER //
CREATE DEFINER=`dayz`@`localhost` PROCEDURE `pCleanup`()
BEGIN

#starts outofbounds cleanup
	CALL pCleanupOOB();
	
#remove dead players from data table
	DELETE 
		FROM Character_DATA 
		WHERE Alive=0;	
	
#remove vehicles with 100% damage
	DELETE
		FROM Object_DATA 
		WHERE Damage = '1';	

#remove unused vehicles older then 14 days
	DELETE
		FROM Object_DATA
		WHERE DATE(last_updated) < CURDATE() - INTERVAL 14 DAY
			AND Classname != 'dummy'
			AND Classname != 'Hedgehog_DZ'
			AND Classname != 'Wire_cat1'
			AND Classname != 'Sandbag1_DZ'
			AND Classname != 'TrapBear';

#remove tents whose owner has been dead for four days
	DELETE
		FROM Object_DATA
		USING Object_DATA, Character_DATA
		WHERE Object_DATA.Classname = 'TentStorage'
			AND Object_DATA.CharacterID = Character_DATA.CharacterID
			AND Character_DATA.Alive = 0
			AND DATE(Character_DATA.last_updated) < CURDATE() - INTERVAL 4 DAY;

#remove empty tents older than seven days
	DELETE
		FROM Object_DATA
		WHERE Classname = 'TentStorage'
			AND DATE(last_updated) < CURDATE() - INTERVAL 7 DAY
			AND Inventory = '[[[],[]],[[],[]],[[],[]]]';
	
	DELETE
		FROM Object_DATA
		WHERE Classname = 'TentStorage'
			AND DATE(last_updated) < CURDATE() - INTERVAL 7 DAY
			AND Inventory = '[]';		

#remove barbed wire older than two days
	DELETE
		FROM Object_DATA
		WHERE Classname = 'Wire_cat1'
			AND DATE(last_updated) < CURDATE() - INTERVAL 2 DAY;
			
#remove Tank Traps older than fifteen days
	DELETE
		FROM Object_DATA
		WHERE Classname = 'Hedgehog_DZ'
			AND DATE(last_updated) < CURDATE() - INTERVAL 15 DAY;

#remove Sandbags older than twenty days
	DELETE
		FROM Object_DATA
		WHERE Classname = 'Sandbag1_DZ'
			AND DATE(last_updated) < CURDATE() - INTERVAL 20 DAY;

#remove Bear Traps older than five days
	DELETE
		FROM Object_DATA
		WHERE Classname = 'TrapBear'
			AND DATE(last_updated) < CURDATE() - INTERVAL 5 DAY;

END//
DELIMITER ;


-- Exportiere Struktur von Prozedur civilian.pCleanupOOB
DROP PROCEDURE IF EXISTS `pCleanupOOB`;
DELIMITER //
CREATE DEFINER=`dayz`@`localhost` PROCEDURE `pCleanupOOB`()
BEGIN

	DECLARE intLineCount	INT DEFAULT 0;
	DECLARE intDummyCount	INT DEFAULT 0;
	DECLARE intDoLine			INT DEFAULT 0;
	DECLARE intWest				INT DEFAULT 0;
	DECLARE intNorth			INT DEFAULT 0;

	SELECT COUNT(*)
		INTO intLineCount
		FROM Object_DATA;

	SELECT COUNT(*)
		INTO intDummyCount
		FROM Object_DATA
		WHERE Classname = 'dummy';

	WHILE (intLineCount > intDummyCount) DO
	
		SET intDoLine = intLineCount - 1;

		SELECT ObjectUID, Worldspace
			INTO @rsObjectUID, @rsWorldspace
			FROM Object_DATA
			LIMIT intDoLine, 1;

		SELECT REPLACE(@rsWorldspace, '[', '') INTO @rsWorldspace;
		SELECT REPLACE(@rsWorldspace, ']', '') INTO @rsWorldspace;
		SELECT REPLACE(SUBSTRING(SUBSTRING_INDEX(@rsWorldspace, ',', 2), LENGTH(SUBSTRING_INDEX(@rsWorldspace, ',', 2 -1)) + 1), ',', '') INTO @West;
		SELECT REPLACE(SUBSTRING(SUBSTRING_INDEX(@rsWorldspace, ',', 3), LENGTH(SUBSTRING_INDEX(@rsWorldspace, ',', 3 -1)) + 1), ',', '') INTO @North;

		SELECT INSTR(@West, '-') INTO intWest;
		SELECT INSTR(@North, '-') INTO intNorth;

		IF (intNorth = 0) THEN
			SELECT CONVERT(@North, DECIMAL(16,8)) INTO intNorth;
		END IF;

		IF (intWest > 0 OR intNorth > 15360) THEN
			DELETE FROM Object_DATA
				WHERE ObjectUID = @rsObjectUID;
		END IF;
			
		SET intLineCount = intLineCount - 1;

	END WHILE;

END//
DELIMITER ;


-- Exportiere Struktur von Tabelle civilian.player_data
DROP TABLE IF EXISTS `player_data`;
CREATE TABLE IF NOT EXISTS `player_data` (
  `playerID` int(11) NOT NULL DEFAULT '0',
  `playerUID` varchar(45) NOT NULL DEFAULT '0',
  `playerName` varchar(50) NOT NULL DEFAULT 'Null',
  `playerMorality` int(11) NOT NULL DEFAULT '0',
  `playerSex` int(11) NOT NULL DEFAULT '0',
  KEY `playerID` (`playerID`),
  KEY `playerUID` (`playerUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportiere Daten aus Tabelle civilian.player_data: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `player_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_data` ENABLE KEYS */;


-- Exportiere Struktur von Tabelle civilian.player_login
DROP TABLE IF EXISTS `player_login`;
CREATE TABLE IF NOT EXISTS `player_login` (
  `LoginID` int(11) NOT NULL AUTO_INCREMENT,
  `PlayerUID` varchar(45) NOT NULL,
  `CharacterID` int(11) NOT NULL DEFAULT '0',
  `datestamp` datetime NOT NULL,
  `Action` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`LoginID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Exportiere Daten aus Tabelle civilian.player_login: ~0 rows (ungefähr)
/*!40000 ALTER TABLE `player_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_login` ENABLE KEYS */;


-- Exportiere Struktur von Prozedur civilian.pMain
DROP PROCEDURE IF EXISTS `pMain`;
DELIMITER //
CREATE DEFINER=`dayz`@`localhost` PROCEDURE `pMain`()
    MODIFIES SQL DATA
BEGIN

# maximum number of INSTANCE id's USED.
#-----------------------------------------------
	DECLARE sInstance VARCHAR(8) DEFAULT 1;
#-----------------------------------------------
#maximum number of vehicles allowed !!! theoretical max. amount
#-----------------------------------------------
	DECLARE iVehSpawnMax INT DEFAULT 80;
#-----------------------------------------------	

# DECLARE iVehSpawnMin				INT DEFAULT 0;		#ToDo !!!
	DECLARE iTimeoutMax 				INT DEFAULT 250;	#number of loops before timeout
	DECLARE iTimeout 						INT DEFAULT 0;		#internal counter for loops done; used to prevent infinite loops - DO NOT CHANGE
	DECLARE iNumVehExisting 		INT DEFAULT 0;		#internal counter for already existing vehicles - DO NOT CHANGE
	DECLARE iNumClassExisting 	INT DEFAULT 0;		#internal counter for already existing class types - DO NOT CHANGE
	DECLARE i INT DEFAULT 1; #internal counter for vehicles spawns - DO NOT CHANGE

#Starts Cleanup
	CALL pCleanup();
	
		SELECT COUNT(*) 				#retrieve the amount of already spawned vehicles...
			INTO iNumVehExisting
			FROM Object_DATA 
			WHERE Instance = sInstance
			AND Classname != '-'						#exclude dummys
			AND Classname != 'Hedgehog_DZ'			#exclude hedgehog
			AND Classname != 'Wire_cat1'				#exclude wirecat
			AND Classname != 'Sandbag1_DZ'			#exclude Sanbag
			AND Classname != 'TrapBear'			#exclude trap
			AND Classname != 'TentStorage';		#exclude TentStorage

		WHILE (iNumVehExisting < iVehSpawnMax) DO		#loop until maximum amount of vehicles is reached

			#select a random vehicle class
			SELECT Classname, Chance, MaxNum, Damage
				INTO @rsClassname, @rsChance, @rsMaxNum, @rsDamage
				FROM Object_CLASSES ORDER BY RAND() LIMIT 1;

			#count number of same class already spawned
			SELECT COUNT(*) 
				INTO iNumClassExisting 
				FROM Object_DATA 
				WHERE Instance = sInstance
				AND Classname = @rsClassname;

			IF (iNumClassExisting < @rsMaxNum) THEN

				IF (rndspawn(@rschance) = 1) THEN
				
					INSERT INTO Object_DATA (ObjectUID, Instance, Classname, Damage, CharacterID, Worldspace, Inventory, Hitpoints, Fuel, Datestamp)
						SELECT ObjectUID, sInstance, Classname, RAND(@rsDamage), '0', Worldspace, Inventory, Hitpoints, RAND(1), SYSDATE() 
							FROM Object_SPAWNS 
							WHERE Classname = @rsClassname 
								AND NOT ObjectUID IN (select objectuid from Object_DATA where instance = sInstance)
							ORDER BY RAND()
							LIMIT 0, 1;
							
					SELECT COUNT(*) 
						INTO iNumVehExisting 
						FROM Object_DATA 
						WHERE Instance = sInstance
							AND Classname != '-'						#exclude dummys
							AND Classname != 'Hedgehog_DZ'			#exclude hedgehog
							AND Classname != 'Wire_cat1'				#exclude wirecat
							AND Classname != 'Sandbag1_DZ'			#exclude Sanbag
							AND Classname != 'TrapBear'			#exclude trap
							AND Classname != 'TentStorage';		#exclude TentStorage
		
					#update number of same class already spawned
					SELECT COUNT(*) 
						INTO iNumClassExisting 
						FROM Object_DATA 
						WHERE Instance = sInstance
						AND Classname = @rsClassname;
				
				END IF;
			END IF;	
			
			SET iTimeout = iTimeout + 1; #raise timeout counter
			IF (iTimeout >= iTimeoutMax) THEN
				SET iNumVehExisting = iVehSpawnMax;
			END IF;
		END WHILE;
	SET i = i + 1;
END//
DELIMITER ;


-- Exportiere Struktur von Funktion civilian.rndspawn
DROP FUNCTION IF EXISTS `rndspawn`;
DELIMITER //
CREATE DEFINER=`dayz`@`localhost` FUNCTION `rndspawn`(`chance` double) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN

	DECLARE bspawn tinyint(1) DEFAULT 0;

	IF (RAND() <= chance) THEN
		SET bspawn = 1;
	END IF;

	RETURN bspawn;

END//
DELIMITER ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
