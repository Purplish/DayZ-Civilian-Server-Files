SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

DELIMITER $$
--
-- Procedures
--

CREATE DEFINER=`root`@`%` PROCEDURE `proc_loglogin`(in `p_uniqueId` varchar(128), in `p_instanceId` int)
begin
  insert ignore into log_entry (unique_id, instance_id, log_code_id) values (p_uniqueId, p_instanceId, 1); --
end$$

CREATE DEFINER=`root`@`%` PROCEDURE `proc_loglogout`(in `p_uniqueId` varchar(128), in `p_instanceId` int)
begin
  insert into log_entry (unique_id, instance_id, log_code_id) values (p_uniqueId, p_instanceId, 5); --
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `deployable`
--

CREATE TABLE IF NOT EXISTS `deployable` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `class_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq1_deployable` (`class_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `deployable`
--

INSERT INTO `deployable` (`id`, `class_name`) VALUES
(4, 'Hedgehog_DZ'),
(5, 'Sandbag1_DZ'),
(1, 'TentStorage'),
(2, 'TrapBear'),
(3, 'Wire_cat1');

-- --------------------------------------------------------

--
-- Table structure for table `instance`
--

CREATE TABLE IF NOT EXISTS `instance` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `world_id` smallint(5) unsigned NOT NULL DEFAULT '1',
  `inventory` varchar(2048) NOT NULL DEFAULT '[]',
  `backpack` varchar(2048) NOT NULL DEFAULT '["DZ_Patrol_Pack_EP1",[[],[]],[[],[]]]',
  PRIMARY KEY (`id`),
  KEY `fk1_instance` (`world_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `instance`
--

INSERT INTO `instance` (`id`, `world_id`, `inventory`, `backpack`) VALUES
(1, 15, '[]', '["DZ_Patrol_Pack_EP1",[[],[]],[[],[]]]');

-- --------------------------------------------------------

--
-- Table structure for table `instance_deployable`
--

CREATE TABLE IF NOT EXISTS `instance_deployable` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(60) NOT NULL,
  `deployable_id` smallint(5) unsigned NOT NULL,
  `owner_id` int(10) unsigned NOT NULL,
  `instance_id` bigint(20) unsigned NOT NULL DEFAULT '1',
  `worldspace` varchar(60) NOT NULL DEFAULT '[0,[0,0,0]]',
  `inventory` varchar(2048) NOT NULL DEFAULT '[]',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Hitpoints` varchar(500) NOT NULL DEFAULT '[]',
  `Fuel` double(13,0) NOT NULL DEFAULT '0',
  `Damage` double(13,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx1_instance_deployable` (`deployable_id`),
  KEY `idx2_instance_deployable` (`owner_id`),
  KEY `idx3_instance_deployable` (`instance_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `instance_vehicle`
--

CREATE TABLE IF NOT EXISTS `instance_vehicle` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `world_vehicle_id` bigint(20) unsigned NOT NULL,
  `instance_id` bigint(20) unsigned NOT NULL DEFAULT '1',
  `worldspace` varchar(60) NOT NULL DEFAULT '[0,[0,0,0]]',
  `inventory` varchar(2048) NOT NULL DEFAULT '[]',
  `parts` varchar(1024) NOT NULL DEFAULT '[]',
  `fuel` double NOT NULL DEFAULT '0',
  `damage` double NOT NULL DEFAULT '0',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx3_instance_vehicle` (`instance_id`),
  KEY `fk3_instance_vehicle` (`world_vehicle_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `log_code`
--

CREATE TABLE IF NOT EXISTS `log_code` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_log_code` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `log_code`
--

INSERT INTO `log_code` (`id`, `name`, `description`) VALUES
(1, 'Login', 'Player has logged in'),
(2, 'Logout', 'Player has logged out'),
(3, 'Ban', 'Player was banned'),
(4, 'Connect', 'Player has connected'),
(5, 'Disconnect', 'Player has disconnected');

-- --------------------------------------------------------

--
-- Table structure for table `log_entry`
--

CREATE TABLE IF NOT EXISTS `log_entry` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(128) NOT NULL DEFAULT '',
  `log_code_id` int(11) unsigned NOT NULL,
  `text` varchar(1024) DEFAULT '',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `instance_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk1_log_entry` (`log_code_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `migration_schema_log`
--

CREATE TABLE IF NOT EXISTS `migration_schema_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `schema_name` varchar(255) NOT NULL,
  `event_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `old_version` varchar(255) NOT NULL,
  `new_version` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- Dumping data for table `migration_schema_log`
--

INSERT INTO `migration_schema_log` (`id`, `schema_name`, `event_time`, `old_version`, `new_version`) VALUES
(1, 'Reality', '2013-06-08 03:55:39', '0.000000', '0.010000'),
(2, 'Reality', '2013-06-08 03:55:39', '0.010000', '0.020000'),
(3, 'Reality', '2013-06-08 03:55:39', '0.020000', '0.030000'),
(4, 'Reality', '2013-06-08 03:55:39', '0.030000', '0.040000'),
(5, 'Reality', '2013-06-08 03:55:39', '0.040000', '0.050000'),
(6, 'Reality', '2013-06-08 03:55:39', '0.050000', '0.060000'),
(7, 'Reality', '2013-06-08 03:55:39', '0.060000', '0.070000'),
(8, 'Reality', '2013-06-08 03:55:39', '0.070000', '0.080000'),
(9, 'Reality', '2013-06-08 03:55:39', '0.080000', '0.090000'),
(10, 'Reality', '2013-06-08 03:55:39', '0.090000', '0.100000'),
(11, 'Reality', '2013-06-08 03:55:39', '0.100000', '0.110000'),
(12, 'Reality', '2013-06-08 03:55:39', '0.110000', '0.120000'),
(13, 'Reality', '2013-06-08 03:55:39', '0.120000', '0.130000'),
(14, 'Reality', '2013-06-08 03:55:39', '0.130000', '0.140000'),
(15, 'Reality', '2013-06-08 03:55:39', '0.140000', '0.150000'),
(16, 'Reality', '2013-06-08 03:55:39', '0.150000', '0.160000'),
(17, 'Reality', '2013-06-08 03:55:39', '0.160000', '0.170000'),
(18, 'Reality', '2013-06-08 03:55:39', '0.170000', '0.180000'),
(19, 'Reality', '2013-06-08 03:55:39', '0.180000', '0.190000'),
(20, 'Reality', '2013-06-08 03:55:39', '0.190000', '0.200000'),
(21, 'Reality', '2013-06-08 03:55:39', '0.200000', '0.210000'),
(22, 'Reality', '2013-06-08 03:55:39', '0.210000', '0.220000'),
(23, 'Reality', '2013-06-08 03:55:39', '0.220000', '0.230000'),
(24, 'Reality', '2013-06-08 03:55:39', '0.230000', '0.240000'),
(25, 'Reality', '2013-06-08 03:55:39', '0.240000', '0.250000'),
(26, 'Reality', '2013-06-08 03:55:39', '0.250000', '0.260000'),
(27, 'Reality', '2013-06-08 03:55:39', '0.260000', '0.270000'),
(28, 'Reality', '2013-06-08 03:55:39', '0.270000', '0.280000'),
(29, 'Reality', '2013-06-08 03:55:39', '0.280000', '0.290000'),
(30, 'Reality', '2013-06-08 03:55:39', '0.290000', '0.300000'),
(31, 'Reality', '2013-06-08 03:55:39', '0.300000', '0.310000'),
(32, 'Reality', '2013-06-08 03:55:39', '0.310000', '0.320000'),
(33, 'Reality', '2013-06-08 03:55:39', '0.320000', '0.330000'),
(34, 'Reality', '2013-06-08 03:55:39', '0.330000', '0.340000'),
(35, 'Reality', '2013-06-08 03:55:39', '0.340000', '0.350000'),
(36, 'Reality', '2013-06-08 03:55:39', '0.350000', '0.360000'),
(37, 'Reality', '2013-06-08 03:55:39', '0.360000', '0.370000'),
(38, 'Reality', '2013-06-08 03:55:39', '0.370000', '0.380000'),
(39, 'Reality', '2013-06-08 03:55:39', '0.380000', '0.390000'),
(40, 'RealityMessaging', '2013-06-08 03:55:46', '0.000000', '0.010000'),
(41, 'RealityBuildings', '2013-06-08 03:55:51', '0.000000', '0.010000'),
(42, 'RealityInvCust', '2013-06-08 03:55:56', '0.000000', '0.010000'),
(43, 'RealityInvCust', '2013-06-08 03:55:56', '0.010000', '0.020000');

-- --------------------------------------------------------

--
-- Table structure for table `migration_schema_version`
--

CREATE TABLE IF NOT EXISTS `migration_schema_version` (
  `name` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migration_schema_version`
--

INSERT INTO `migration_schema_version` (`name`, `version`) VALUES
('Reality', '0.390000'),
('RealityBuildings', '0.010000'),
('RealityCivilian', '0.01'),
('RealityInvCust', '0.020000'),
('RealityMessaging', '0.010000');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(128) NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `humanity` int(6) NOT NULL DEFAULT '2500',
  `survival_attempts` int(3) unsigned NOT NULL DEFAULT '1',
  `total_survival_time` int(5) unsigned NOT NULL DEFAULT '0',
  `total_survivor_kills` int(4) unsigned NOT NULL DEFAULT '0',
  `total_bandit_kills` int(4) unsigned NOT NULL DEFAULT '0',
  `total_zombie_kills` int(5) unsigned NOT NULL DEFAULT '0',
  `total_headshots` int(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_profile` (`unique_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `survivor`
--

CREATE TABLE IF NOT EXISTS `survivor` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(128) NOT NULL,
  `world_id` smallint(5) unsigned NOT NULL DEFAULT '1',
  `worldspace` varchar(60) NOT NULL DEFAULT '[]',
  `inventory` varchar(2048) NOT NULL DEFAULT '[]',
  `backpack` varchar(2048) NOT NULL DEFAULT '[]',
  `medical` varchar(255) NOT NULL DEFAULT '[false,false,false,false,false,false,false,12000,[],[0,0],0]',
  `is_dead` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `model` varchar(128) NOT NULL DEFAULT 'Survivor2_DZ',
  `state` varchar(128) NOT NULL DEFAULT '["","aidlpercmstpsnonwnondnon_player_idlesteady04",36]',
  `survivor_kills` int(3) unsigned NOT NULL DEFAULT '0',
  `bandit_kills` int(3) unsigned NOT NULL DEFAULT '0',
  `zombie_kills` int(4) unsigned NOT NULL DEFAULT '0',
  `headshots` int(4) unsigned NOT NULL DEFAULT '0',
  `last_ate` int(3) unsigned NOT NULL DEFAULT '0',
  `last_drank` int(3) unsigned NOT NULL DEFAULT '0',
  `survival_time` int(3) unsigned NOT NULL DEFAULT '0',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `start_time` datetime NOT NULL,
  `DistanceFoot` int(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx1_main` (`unique_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE IF NOT EXISTS `vehicle` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `class_name` varchar(100) DEFAULT NULL,
  `damage_min` decimal(4,3) NOT NULL DEFAULT '0.100',
  `damage_max` decimal(4,3) NOT NULL DEFAULT '0.700',
  `fuel_min` decimal(4,3) NOT NULL DEFAULT '0.200',
  `fuel_max` decimal(4,3) NOT NULL DEFAULT '0.800',
  `limit_min` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `limit_max` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `parts` varchar(1024) DEFAULT NULL,
  `inventory` varchar(2048) NOT NULL DEFAULT '[]',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq1_vehicle` (`class_name`),
  KEY `idx1_vehicle` (`class_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=187 ;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`id`, `class_name`, `damage_min`, `damage_max`, `fuel_min`, `fuel_max`, `limit_min`, `limit_max`, `parts`, `inventory`) VALUES
(1, 'UAZ_Unarmed_TK_EP1', '0.100', '0.700', '0.200', '0.800', 0, 1, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[[[], []], [["20Rnd_762x51_DMR"], [5]], [[], []]]'),
(2, 'UAZ_Unarmed_TK_CIV_EP1', '0.100', '0.700', '0.200', '0.800', 0, 5, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[[[], []], [["10Rnd_127x99_m107"], [5]], [[], []]]'),
(3, 'UAZ_Unarmed_UN_EP1', '0.100', '0.700', '0.200', '0.800', 0, 1, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[[[], []], [["30Rnd_556x45_StanagSD"], [5]], [[], []]]'),
(4, 'UAZ_RU', '0.100', '0.700', '0.200', '0.800', 0, 4, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[[[], []], [["HandGrenade_west"], [5]], [[], []]]'),
(5, 'ATV_US_EP1', '0.100', '0.700', '0.200', '0.800', 0, 3, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[[[], []], [["ItemTent", "ItemMatchbox"], [1, 1]], [[], []]]'),
(6, 'ATV_CZ_EP1', '0.100', '0.700', '0.200', '0.800', 0, 4, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[[[], []], [["Skin_Camo1_DZ", "ItemCompass"], [1, 1]], [[], []]]'),
(7, 'SkodaBlue', '0.100', '0.700', '0.200', '0.800', 0, 2, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[[[], []], [["ItemWatch", "ItemKnife"], [1, 1]], [[], []]]'),
(8, 'Skoda', '0.100', '0.700', '0.200', '0.800', 0, 5, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[[["Binocular"], [1]], [[], []], [["CZ_VestPouch_EP1"], [1]]]'),
(9, 'SkodaGreen', '0.100', '0.700', '0.200', '0.800', 0, 4, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[[[], []], [["ItemMatchbox", "ItemMap"], [1, 1]], [[], []]]'),
(10, 'TT650_Ins', '0.100', '0.700', '0.200', '0.800', 0, 5, 'motor', '[[[], []], [["ItemJerrycan"], [1]], [[], []]]'),
(11, 'TT650_TK_EP1', '0.100', '0.700', '0.200', '0.800', 0, 2, 'motor', '[[[], []], [["PartGeneric"], [1]], [[], []]]'),
(12, 'TT650_TK_CIV_EP1', '0.100', '0.700', '0.200', '0.800', 0, 2, 'motor', '[[[], []], [["PartWheel"], [1]], [[], []]]'),
(13, 'Old_bike_TK_CIV_EP1', '0.000', '0.000', '0.000', '0.000', 5, 5, NULL, '[]'),
(14, 'Old_bike_TK_INS_EP1', '0.000', '0.000', '0.000', '0.000', 5, 5, NULL, '[]'),
(15, 'UH1H_DZ', '0.100', '0.700', '0.200', '0.800', 0, 2, 'motor,elektronika,mala vrtule,velka vrtule', '[[[], []], [["ItemSodaCoke"], [5]], [[], []]]'),
(16, 'hilux1_civil_3_open', '0.100', '0.700', '0.200', '0.800', 0, 2, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[[[], []], [["PartFueltank", "PartWheel"], [1, 1]], [[], []]]'),
(17, 'Ikarus_TK_CIV_EP1', '0.100', '0.700', '0.200', '0.800', 0, 2, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[[[], []], [["ItemWatch", "ItemSodaPepsi"], [1, 3]], [[], []]]'),
(18, 'Ikarus', '0.100', '0.700', '0.200', '0.800', 0, 1, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[[[], []], [["PartWheel", "ItemSodaCoke"], [1, 3]], [[], []]]'),
(19, 'Tractor', '0.100', '0.700', '0.200', '0.800', 0, 4, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[[[], []], [["ItemWire", "ItemJerrycan"], [1, 1]], [[], []]]'),
(20, 'S1203_TK_CIV_EP1', '0.100', '0.700', '0.200', '0.800', 0, 5, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[[["Makarov"], [1]], [["FoodCanBakedBeans"], [3]], [[], []]]'),
(21, 'V3S_Civ', '0.100', '0.700', '0.200', '0.800', 1, 1, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[[["MR43"], [1]], [["PartEngine"], [1]], [[], []]]'),
(22, 'UralCivil', '0.100', '0.700', '0.200', '0.800', 1, 1, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[[[], []], [["PartWheel", "ItemToolbox", "ItemTankTrap"], [1, 1, 1]], [[], []]]'),
(23, 'car_hatchback', '0.100', '0.700', '0.200', '0.800', 0, 4, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[[["LeeEnfield"], [1]], [["5x_22_LR_17_HMR"], [3]], [[], []]]'),
(24, 'Fishing_Boat', '0.100', '0.700', '0.200', '0.800', 0, 4, 'motor', '[]'),
(25, 'PBX', '0.100', '0.700', '0.200', '0.800', 1, 1, 'motor', '[[[], []], [["ItemFlashlightRed"], [1]], [["DZ_Backpack_EP1"], [1]]]'),
(26, 'Smallboat_1', '0.100', '0.700', '0.200', '0.800', 0, 2, 'motor', '[]'),
(27, 'Volha_2_TK_CIV_EP1', '0.100', '0.700', '0.200', '0.800', 0, 4, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[[[], []], [["ItemSodaPepsi", "FoodCanFrankBeans"], [3, 3]], [[], []]]'),
(28, 'Volha_1_TK_CIV_EP1', '0.100', '0.700', '0.200', '0.800', 0, 4, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[[[], []], [["ItemSodaCoke", "FoodCanBakedBeans"], [3, 3]], [[], []]]'),
(29, 'SUV_TK_CIV_EP1', '0.100', '0.700', '0.200', '0.800', 1, 1, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[[[], []], [["Pipebomb"], [1]], [[], []]]'),
(30, 'car_sedan', '0.100', '0.700', '0.200', '0.800', 0, 2, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[[[], []], [["ItemFlashlight", "ItemMap"], [1, 1]], [["DZ_ALICE_Pack_EP1"], [1]]]'),
(31, 'hilux1_civil_3_open_EP1', '0.100', '0.700', '0.200', '0.800', 0, 3, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[[[], []], [["PartEngine", "ItemJerrycan"], [1, 1]], [[], []]]'),
(32, 'UralCivil2', '0.100', '0.700', '0.200', '0.800', 1, 1, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[[[], []], [["PartVRotor", "ItemMorphine", "FoodCanPasta"], [1, 1, 1]], [[], []]]'),
(33, 'LandRover_CZ_EP1', '0.100', '0.700', '0.200', '0.800', 0, 5, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[[["AK_47_M"], [1]], [["ItemPainkiller"], [1]], [[], []]]'),
(34, 'Ka60_GL_NAC', '0.100', '0.700', '0.200', '0.800', 1, 1, 'motor,elektronika,mala vrtule,velka vrtule', '[]'),
(35, 'Mi17_Civilian_Nam', '0.100', '0.700', '0.200', '0.800', 1, 1, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[]'),
(36, 'BW_Ikarus1', '0.100', '0.700', '0.200', '0.800', 0, 5, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[]'),
(37, 'BW_Ikarus2', '0.100', '0.700', '0.200', '0.800', 0, 5, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[]'),
(38, 'kpfs_golf_g', '0.100', '0.700', '0.200', '0.800', 0, 5, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[]'),
(39, 'kpfs_golf_p', '0.100', '0.700', '0.200', '0.800', 0, 5, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[]'),
(40, 'kpfs_golf_post', '0.100', '0.700', '0.200', '0.800', 0, 5, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[]'),
(41, 'kpfs_golf_tk', '0.100', '0.700', '0.200', '0.800', 0, 5, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[]'),
(42, 'Lada1_GDR', '0.100', '0.700', '0.200', '0.800', 0, 5, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[]'),
(43, 'Lada2_GDR', '0.100', '0.700', '0.200', '0.800', 0, 5, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[]'),
(44, 'Lada2_TK_CIV_EP1', '0.100', '0.700', '0.200', '0.800', 0, 5, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[]'),
(45, 'Lada4_GDR', '0.100', '0.700', '0.200', '0.800', 0, 5, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[]'),
(46, 'Lada5_GDR', '0.100', '0.700', '0.200', '0.800', 0, 5, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[]'),
(47, 'TT650_Civ', '0.100', '0.700', '0.200', '0.800', 0, 5, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[]'),
(48, 'TT650_Gue', '0.100', '0.700', '0.200', '0.800', 0, 5, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[]'),
(49, 'MTVR', '0.100', '0.700', '0.200', '0.800', 0, 5, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[]'),
(50, 'M1030_US_DES_EP1', '0.100', '0.700', '0.200', '0.800', 0, 5, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[]'),
(51, 'smallboat_2', '0.100', '0.700', '0.200', '0.800', 0, 5, 'motor', '[]'),
(52, 'Post_bike_E', '0.100', '0.700', '0.200', '0.800', 0, 5, NULL, '[]'),
(53, 'AH6X_DZ', '0.200', '0.800', '0.500', '0.700', 0, 1, NULL, '[]'),
(54, 'Mi17_DZ', '0.300', '0.900', '0.500', '0.700', 0, 1, NULL, '[]'),
(55, 'AN2_DZ', '0.600', '0.900', '0.200', '0.500', 0, 1, NULL, '[]'),
(56, 'BAF_Offroad_D', '0.000', '0.800', '0.300', '0.600', 0, 1, NULL, '[]'),
(57, 'BAF_Offroad_W', '0.000', '0.800', '0.300', '0.600', 0, 1, NULL, '[]'),
(58, 'datsun1_civil_3_open', '0.050', '0.050', '0.000', '0.500', 0, 2, 'motor,karoserie,palivo,wheel_1_1_steering,wheel_2_1_steering,wheel_1_2_steering,wheel_2_2_steering,sklo predni P,sklo predni L,glass1,glass2,glass3', '[]'),
(59, 'Fishing_Boat_DZ', '0.050', '0.050', '0.000', '0.500', 0, 1, 'motor', '[]'),
(60, 'PBX_DZ', '0.050', '0.050', '0.000', '0.500', 0, 2, 'motor', '[]'),
(61, 'An2_2_TK_CIV_EP1_DZ', '0.050', '0.050', '0.000', '0.500', 0, 2, NULL, '[]'),
(62, 'datsun1_civil_2_covered', '0.050', '0.050', '0.000', '0.500', 0, 1, 'motor,karoserie,palivo,wheel_1_1_steering,wheel_2_1_steering,wheel_1_2_steering,wheel_2_2_steering,sklo predni P,sklo predni L,glass1,glass2,glass3', '[]'),
(63, 'GAZ_Vodnik', '0.050', '0.050', '0.000', '0.500', 0, 0, 'motor,karoserie,palivo,wheel_1_1_steering,wheel_2_1_steering,wheel_1_2_steering,wheel_2_2_steering,sklo predni P,sklo predni L,glass1,glass2,glass3', '[]'),
(64, 'hilux1_civil_1_open', '0.050', '0.050', '0.000', '0.500', 0, 4, 'motor,karoserie,palivo,wheel_1_1_steering,wheel_2_1_steering,wheel_1_2_steering,wheel_2_2_steering,sklo predni P,sklo predni L,glass1,glass2,glass3', '[]'),
(65, 'hilux1_civil_2_covered', '0.050', '0.050', '0.000', '0.500', 0, 4, 'motor,karoserie,palivo,wheel_1_1_steering,wheel_2_1_steering,wheel_1_2_steering,wheel_2_2_steering,sklo predni P,sklo predni L,glass1,glass2,glass3', '[]'),
(66, 'Lada', '0.050', '0.050', '0.000', '0.500', 0, 0, 'motor,karoserie,palivo,wheel_1_1_steering,wheel_2_1_steering,wheel_1_2_steering,wheel_2_2_steering,sklo predni P,sklo predni L,glass1,glass2,glass3', '[]'),
(67, 'Lada1', '0.050', '0.050', '0.000', '0.500', 0, 1, 'motor,karoserie,palivo,wheel_1_1_steering,wheel_2_1_steering,wheel_1_2_steering,wheel_2_2_steering,sklo predni P,sklo predni L,glass1,glass2,glass3', '[]'),
(68, 'Lada1_TK_CIV_EP1', '0.050', '0.050', '0.000', '0.500', 0, 3, 'motor,karoserie,palivo,wheel_1_1_steering,wheel_2_1_steering,wheel_1_2_steering,wheel_2_2_steering,sklo predni P,sklo predni L,glass1,glass2,glass3', '[]'),
(69, 'LadaLM', '0.050', '0.050', '0.000', '0.500', 0, 10, 'motor,karoserie,palivo,wheel_1_1_steering,wheel_2_1_steering,wheel_1_2_steering,wheel_2_2_steering,sklo predni P,sklo predni L,glass1,glass2,glass3', '[]'),
(70, 'LandRover_TK_CIV_EP1', '0.050', '0.050', '0.000', '0.500', 0, 2, 'motor,karoserie,palivo,wheel_1_1_steering,wheel_2_1_steering,wheel_1_2_steering,wheel_2_2_steering,sklo predni P,sklo predni L,glass1,glass2,glass3', '[]'),
(71, 'Mi17_Civilian_DZ', '0.050', '0.050', '0.000', '0.500', 0, 4, 'motor,karoserie,palivo,elektronika,mala vrtule,velka vrtule,sklo predni P,sklo predni L,glass1,glass3', '[]'),
(72, 'Mi17_medevac_RU_DZ', '0.050', '0.050', '0.000', '0.500', 0, 2, 'motor,karoserie,palivo,elektronika,mala vrtule,velka vrtule,sklo predni P,sklo predni L,glass1,glass3', '[]'),
(73, 'MMT_Civ', '0.050', '0.050', '0.000', '0.500', 0, 10, NULL, '[]'),
(74, 'Old_moto_TK_Civ_EP1', '0.050', '0.050', '0.000', '0.500', 0, 4, 'motor,karoserie,palivo,wheel_1_1_steering,wheel_2_1_steering,wheel_1_2_steering,wheel_2_2_steering,sklo predni P,sklo predni L,glass1,glass2,glass3', '[]'),
(75, 'RHIB2Turret_DZ', '0.050', '0.050', '0.000', '0.500', 0, 1, 'motor', '[]'),
(76, 'S1203_ambulance_EP1', '0.050', '0.050', '0.000', '0.500', 0, 5, 'motor,karoserie,palivo,wheel_1_1_steering,wheel_2_1_steering,wheel_1_2_steering,wheel_2_2_steering,sklo predni P,sklo predni L,glass1,glass2,glass3', '[]'),
(77, 'SkodaRed', '0.050', '0.050', '0.000', '0.500', 0, 2, 'motor,karoserie,palivo,wheel_1_1_steering,wheel_2_1_steering,wheel_1_2_steering,wheel_2_2_steering,sklo predni P,sklo predni L,glass1,glass2,glass3', '[]'),
(78, 'Smallboat_1_DZ', '0.050', '0.050', '0.000', '0.500', 0, 0, 'motor', '[]'),
(79, 'Smallboat_2_DZ', '0.050', '0.050', '0.000', '0.500', 0, 0, 'motor', '[]'),
(80, 'TowingTractor', '0.050', '0.050', '0.000', '0.500', 0, 1, 'motor,karoserie,palivo,wheel_1_1_steering,wheel_2_1_steering,wheel_1_2_steering,wheel_2_2_steering,sklo predni P,sklo predni L,glass1,glass2,glass3', '[]'),
(81, 'VWGolf', '0.050', '0.050', '0.000', '0.500', 0, 3, 'motor,karoserie,palivo,wheel_1_1_steering,wheel_2_1_steering,wheel_1_2_steering,wheel_2_2_steering,sklo predni P,sklo predni L,glass1,glass2,glass3', '[]'),
(82, 'VolhaLimo_TK_CIV_EP1', '0.050', '0.050', '0.000', '0.500', 0, 6, 'motor,karoserie,palivo,wheel_1_1_steering,wheel_2_1_steering,wheel_1_2_steering,wheel_2_2_steering,sklo predni P,sklo predni L,glass1,glass2,glass3', '[]'),
(88, 'UralRefuel_INS', '0.100', '0.700', '0.200', '0.800', 0, 5, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[]'),
(89, 'Ural_INS', '0.100', '0.700', '0.200', '0.800', 0, 20, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[]'),
(90, 'HMMWV_DES_EP1', '0.100', '0.700', '0.200', '0.800', 0, 5, NULL, '[[[], []], [["Pipebomb"], [3]], [[], []]]'),
(91, 'C130J', '0.100', '0.700', '0.200', '0.800', 0, 5, NULL, '[]'),
(92, 'MH6J_DZ', '0.100', '0.500', '0.000', '0.500', 0, 1, 'motor,elektronika,mala vrtule,velka vrtule', '[[[],[]],[["1Rnd_Smoke_M203", "7Rnd_45ACP_1911", "30Rnd_556x45_StanagSD", "200Rnd_556x45_M249", "FoodCanPasta", "15Rnd_W1866_Slug", "5x_22_LR_17_HMR", "15Rnd_9x19_M9SD", "17Rnd_9x19_glock17", "100Rnd_762x51_M240", "6Rnd_45ACP", "8Rnd_9x18_Makarov"],[]],[["DZ_Backpack_EP1"],[]]]'),
(93, 'HMMWV_DZ', '0.300', '0.900', '0.300', '0.700', 0, 5, 'palivo,motor,karoserie,wheel_1_1_steering,wheel_1_2_steering,wheel_2_1_steering,wheel_2_2_steering', '[[["AK_47_M"],[]],[["PartWoodPile", "ItemBandage", "HandGrenade_west", "6Rnd_45ACP", "ItemEpinephrine", "8Rnd_B_Beneli_74Slug", "HandChemBlue", "8Rnd_B_Beneli_Pellets", "PartEngine", "17Rnd_9x19_glock17", "ItemTent"],[]],[["DZ_CivilBackpack_EP1"],[]]]'),
(94, 'MV22_DZ', '0.100', '0.700', '0.200', '0.800', 0, 1, NULL, '[]'),
(95, 'CSJ_GyroP', '0.000', '0.050', '0.100', '0.800', 0, 2, NULL, '[]'),
(96, 'Policecar', '0.000', '0.500', '0.100', '0.800', 0, 2, NULL, '[]'),
(97, 'Ka137_PMC', '0.600', '0.900', '0.200', '0.500', 1, 2, NULL, '[]'),
(98, '350z_black', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(99, '350z_blue', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(100, '350z_city', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(101, '350z_mod', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(102, '350z_gold', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(103, '350z_green', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(104, '350z_pink', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(105, '350z_kiwi', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(106, '350z', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(107, '350z_red', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(108, '350z_ruben', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(109, '350z_silver', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(110, '350z_v', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(111, '350z_white', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(112, '350z_yellow', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(113, 'f1car', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(114, 'TPS_octavia_policeEU', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(115, 'kpfs_golf_bl', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(116, 'kpfs_golf_y', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(117, 'HMMWV_M2', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(118, 'HMMWV_M998_crows_M2_DES_EP1', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(119, 'Lada3_GDR', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(120, 'LadaMP', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(121, 'LadaVP', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(122, 'LadaSP', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(123, 'LandRover_Special_CZ_EP1', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(124, 'Offroad_DSHKM_TK_GUE_EP1', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(125, 'Pickup_PK_INS', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(126, 'Pickup_PK_GUE', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(127, 'TPS_octavia_civil', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(128, 'TPS_octavia_civil_blue', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(129, 'TPS_octavia_civil_gold', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(130, 'TPS_octavia_civil_green', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(131, 'TPS_octavia_civil_silver', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(132, 'TPS_octavia_civil_white', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(133, 'SUV_Blue', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(134, 'SUV_Charcoal', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(135, 'SUV_Green', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(136, 'SUV_Orange', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(137, 'SUV_Pink', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(138, 'SUV_Red', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(139, 'SUV_Silver', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(140, 'SUV_White', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(141, 'SUV_Yellow', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(142, 'UAZ_MG_CDF', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(143, 'Lada2', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(144, 'Kamaz', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(145, 'KamazOpen', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(146, 'Ural_CDF', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(147, 'UralOpen_INS', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(148, 'R34_black', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(149, 'R34_blue', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(150, 'R34_policecar', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(151, 'R34_red', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(152, 'R34_yellow', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(153, 'An2_2_TK_CIV_EP1', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(154, 'BAF_Merlin_HC3_D', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(155, 'MH60S', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(156, 'Mi17_Civilian', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(157, 'kyo_microlight_blue', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(158, 'kyo_microlight_military', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(159, 'kyo_microlight', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(160, 'kyo_microlight_yellow', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(161, 'MV22', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(162, 'kyo_ultralight', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(163, 'luf_c130', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(164, 'can_c130', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(165, 'airnz_C130', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(166, 'qantas_C130', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(167, 'Da_kart', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(168, 'CSJ_GyroPboat', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(169, 'CSJ_GyroCover', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(170, 'CSJ_GyroC', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(171, 'IMG_Jetski', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(172, 'sigisolda1', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(173, 'Ural_TK_CIV_EP1', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(174, 'LandRover_MG_TK_INS_EP1', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(175, 'Post_bike_W', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(176, 'CH_47F_EP1', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(177, 'GNTFSF', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(178, 'Land_Fregata', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(179, 'sigisolda5', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(180, 'RHIB', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(181, 'RHIB2Turret', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(182, 'JFH_USCG_RHIB', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(183, 'JFH_USCG_ZODIAC', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(184, 'AS_jail', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(185, 'CSJ_GyroCfloat', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]'),
(186, 'land_OWP_CB_b1', '0.100', '0.700', '0.200', '0.800', 0, 100, 'motor', '[]');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_deployable`
--
CREATE TABLE IF NOT EXISTS `v_deployable` (
`instance_deployable_id` bigint(20) unsigned
,`vehicle_id` smallint(5) unsigned
,`class_name` varchar(100)
,`owner_id` int(8) unsigned
,`owner_name` varchar(64)
,`owner_unique_id` varchar(128)
,`is_owner_dead` tinyint(3) unsigned
,`worldspace` varchar(60)
,`inventory` varchar(2048)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `v_player`
--
CREATE TABLE IF NOT EXISTS `v_player` (
`player_name` varchar(64)
,`humanity` int(6)
,`alive_survivor_id` int(8) unsigned
,`alive_survivor_world_id` smallint(5) unsigned
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `v_vehicle`
--
CREATE TABLE IF NOT EXISTS `v_vehicle` (
`instance_vehicle_id` bigint(20) unsigned
,`vehicle_id` smallint(5) unsigned
,`instance_id` bigint(20) unsigned
,`world_id` smallint(5) unsigned
,`class_name` varchar(100)
,`worldspace` varchar(60)
,`inventory` varchar(2048)
,`parts` varchar(1024)
,`damage` double
,`fuel` double
);
-- --------------------------------------------------------

--
-- Table structure for table `world`
--

CREATE TABLE IF NOT EXISTS `world` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '0',
  `max_x` mediumint(9) DEFAULT '0',
  `max_y` mediumint(9) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_world` (`name`),
  KEY `idx1_world` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `world`
--

INSERT INTO `world` (`id`, `name`, `max_x`, `max_y`) VALUES
(1, 'chernarus', 14700, 15360),
(2, 'lingor', 10000, 10000),
(3, 'utes', 5100, 5100),
(4, 'takistan', 14000, 14000),
(5, 'panthera2', 10200, 10200),
(6, 'fallujah', 10200, 10200),
(7, 'zargabad', 8000, 8000),
(8, 'namalsk', 12000, 12000),
(9, 'mbg_celle2', 13000, 13000),
(10, 'tavi', 25600, 25600),
(15, 'civi-chernarus', 14700, 15360);

-- --------------------------------------------------------

--
-- Table structure for table `world_vehicle`
--

CREATE TABLE IF NOT EXISTS `world_vehicle` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `vehicle_id` smallint(5) unsigned NOT NULL DEFAULT '1',
  `world_id` smallint(5) unsigned NOT NULL DEFAULT '1',
  `worldspace` varchar(60) NOT NULL DEFAULT '[]',
  `description` varchar(1024) DEFAULT NULL,
  `chance` decimal(4,3) unsigned NOT NULL DEFAULT '0.000',
  `last_modified` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx1_world_vehicle` (`vehicle_id`),
  KEY `idx2_world_vehicle` (`world_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1180 ;

--
-- Dumping data for table `world_vehicle`
--

INSERT INTO `world_vehicle` (`id`, `vehicle_id`, `world_id`, `worldspace`, `description`, `chance`, `last_modified`) VALUES
(1, 1, 1, '[0,[12140.168, 12622.802,0]]', NULL, '0.650', NULL),
(2, 2, 1, '[0,[6279.4966, 7810.3691,0]]', NULL, '0.650', NULL),
(3, 3, 1, '[45,[6865.2432,2481.6943,0]]', 'UAZ in Cherno.', '0.650', '0.19'),
(4, 4, 1, '[157,[3693.0386, 5969.1489,0]]', NULL, '0.650', NULL),
(5, 2, 1, '[20,[13264.081,12167.432,0]]', 'Black Lake UAZ.', '0.650', '0.19'),
(6, 2, 1, '[223,[4817.6572, 2556.5034,0]]', NULL, '0.650', NULL),
(7, 1, 1, '[337,[8120.3057,9305.4912,0]]', NULL, '0.650', '0.19'),
(8, 5, 1, '[337,[3312.2793,11270.755,0]]', NULL, '0.700', '0.19'),
(9, 5, 1, '[50,[3684.0366, 5999.0117,0]]', NULL, '0.700', NULL),
(10, 6, 1, '[202,[11464.035, 11381.071,0]]', NULL, '0.700', NULL),
(11, 5, 1, '[253,[11459.299,11386.546,0]]', NULL, '0.700', '0.19'),
(12, 6, 1, '[335,[8856.8359,2893.7903,0]]', NULL, '0.700', '0.19'),
(13, 7, 1, '[353,[12869.565,4450.4077,0]]', NULL, '0.650', '0.19'),
(14, 8, 1, '[223,[6288.416, 7834.3521,0]]', NULL, '0.650', NULL),
(15, 9, 1, '[306,[8125.7075,3166.3708,0]]', NULL, '0.650', '0.19'),
(16, 5, 1, '[284,[8854.9082,2891.5762,0]]', NULL, '0.700', '0.19'),
(17, 10, 1, '[291,[11945.78,9099.3633,0]]', NULL, '0.700', '0.19'),
(18, 11, 1, '[151,[6592.686,2906.8245,0]]', NULL, '0.700', '0.19'),
(19, 12, 1, '[372,[8762.8516, 11727.877,0]]', NULL, '0.700', NULL),
(20, 12, 1, '[52,[8713.4893, 7103.0518,0]]', NULL, '0.700', NULL),
(21, 13, 1, '[50,[8040.6777, 7086.5356,0]]', NULL, '0.950', NULL),
(22, 13, 1, '[316,[7943.5068,6988.1763,0]]', NULL, '0.950', '0.19'),
(23, 14, 1, '[201,[8070.6958, 3358.7793,0]]', NULL, '0.950', NULL),
(24, 14, 1, '[179,[3474.3989, 2562.4915,0]]', NULL, '0.950', NULL),
(25, 14, 1, '[236,[1773.9318,2351.6221,0]]', NULL, '0.950', '0.19'),
(26, 13, 1, '[236,[3699.9189,2474.2119,0]]', NULL, '0.950', '0.19'),
(27, 13, 1, '[73,[8350.0947, 2480.542,0]]', NULL, '0.950', NULL),
(28, 14, 1, '[35,[8345.7227, 2482.6855,0]]', NULL, '0.950', NULL),
(29, 13, 1, '[23,[3203.0916, 3988.6379,0]]', NULL, '0.950', NULL),
(30, 14, 1, '[191,[2782.7134,5285.5342,0]]', NULL, '0.950', '0.19'),
(31, 14, 1, '[155,[8680.75,2445.5315,0]]', NULL, '0.950', '0.19'),
(32, 13, 1, '[155,[12158.999,3468.7563,0]]', NULL, '0.950', '0.19'),
(33, 14, 1, '[250,[11984.01,3835.9231,0]]', NULL, '0.950', '0.19'),
(34, 13, 1, '[255,[10153.068,2219.3547,0]]', NULL, '0.950', '0.19'),
(35, 15, 1, '[60,[11279.154,4296.0205,0]]', 'UH1H at Rog Castle.', '0.250', '0.19'),
(36, 15, 1, '[133,[4211.8789,10735.168,0]]', NULL, '0.250', '0.19'),
(37, 15, 1, '[52,[6874.0503,11432.864,0]]', 'UH1H at Devil''s Castle.', '0.250', '0.19'),
(38, 15, 1, '[58,[10571.7,2220.3101,0.0015564]]', NULL, '0.250', '0.19'),
(39, 15, 1, '[359,[6377.8799,2757.8899,-0.048767101]]', NULL, '0.250', '0.19'),
(40, 16, 1, '[344,[2045.3989,7267.4165,0]]', NULL, '0.550', '0.19'),
(41, 16, 1, '[133,[8310.9902, 3348.3579,0]]', NULL, '0.550', NULL),
(42, 16, 1, '[124,[11309.963, 6646.3989,0]]', NULL, '0.550', NULL),
(43, 16, 1, '[6,[11240.744, 5370.6128,0]]', NULL, '0.550', NULL),
(44, 17, 1, '[230,[3762.5764,8736.1709,0]]', NULL, '0.550', '0.19'),
(45, 18, 1, '[279,[10628.433,8037.8188,0]]', NULL, '0.550', '0.19'),
(46, 18, 1, '[245,[4580.3203,4515.9282,0]]', NULL, '0.550', '0.19'),
(47, 17, 1, '[333,[6040.0923,7806.5439,0]]', NULL, '0.550', '0.19'),
(48, 18, 1, '[76,[10314.745, 2147.5374,0]]', NULL, '0.550', NULL),
(49, 17, 1, '[59,[6705.8887, 2991.9358,0]]', NULL, '0.550', NULL),
(50, 19, 1, '[195,[9681.8213,8947.2354,0]]', NULL, '0.750', '0.19'),
(51, 19, 1, '[262,[3825.1318,8941.4873,0]]', NULL, '0.750', '0.19'),
(52, 19, 1, '[19,[11246.52, 7534.7954,0]]', NULL, '0.750', NULL),
(53, 20, 1, '[19,[11066.828,7915.2275,0]]', NULL, '0.550', '0.19'),
(54, 20, 1, '[352,[12058.555,3577.8667,0]]', NULL, '0.550', '0.19'),
(55, 20, 1, '[218,[11940.854, 8872.8389,0]]', NULL, '0.550', NULL),
(56, 20, 1, '[346,[13386.471,6604.0098,0]]', NULL, '0.550', '0.19'),
(57, 21, 1, '[178,[13276.482, 6098.4463,0]]', NULL, '0.550', NULL),
(58, 22, 1, '[338,[1890.9952,12417.333,0]]', NULL, '0.550', '0.19'),
(59, 23, 1, '[226,[1975.1283, 9150.0195,0]]', NULL, '0.750', NULL),
(60, 23, 1, '[315,[7429.4849,5157.8682,0]]', NULL, '0.750', '0.19'),
(61, 24, 1, '[315,[8317.2676,2348.6055,0]]', NULL, '0.550', '0.19'),
(62, 24, 1, '[315,[13222.181,10015.431,0]]', NULL, '0.550', '0.19'),
(63, 25, 1, '[55,[13454.882, 13731.796,0]]', NULL, '0.550', NULL),
(64, 26, 1, '[245,[14417.589,12886.104,0]]', NULL, '0.550', '0.19'),
(65, 26, 1, '[268,[13098.13, 8250.8828,0]]', NULL, '0.550', NULL),
(66, 27, 1, '[205,[9731.1514,8937.7998,0]]', NULL, '0.550', '0.19'),
(67, 28, 1, '[337,[9715.0352,6522.8286,0]]', NULL, '0.550', '0.19'),
(68, 28, 1, '[241,[2614.0862,5079.6357,0]]', NULL, '0.550', '0.19'),
(69, 27, 1, '[18,[10827.634, 2701.5688,0]]', NULL, '0.550', NULL),
(70, 28, 1, '[222,[5165.7231,2375.7642,0]]', NULL, '0.550', '0.19'),
(71, 27, 1, '[207,[1740.8503,3622.6938,0]]', NULL, '0.550', '0.19'),
(72, 29, 1, '[266,[9157.8408, 11019.819,0]]', NULL, '0.450', NULL),
(73, 30, 1, '[222,[12360.468, 10817.882,0]]', NULL, '0.750', NULL),
(74, 1, 2, '[130,[13129.8,11560,0.0706997]]', NULL, '0.650', NULL),
(75, 2, 2, '[3,[7107.41,5825.43,0]]', NULL, '0.650', NULL),
(76, 3, 2, '[271,[6424,6777.25,0.00143909]]', NULL, '0.650', NULL),
(77, 4, 2, '[5,[4150.78,1426.02,0.0821762]]', NULL, '0.650', NULL),
(78, 2, 2, '[87,[2476.24,4105.05,0.00119781]]', NULL, '0.650', NULL),
(79, 2, 2, '[177,[4073.41,5156.29,0.00143814]]', NULL, '0.650', NULL),
(80, 29, 2, '[9,[6457.83,6660.57,0]]', NULL, '0.450', NULL),
(81, 5, 2, '[355,[6888.25,3147.13,0.00132751]]', NULL, '0.700', NULL),
(82, 5, 2, '[17,[5968.15,6595.98,0.00117016]]', NULL, '0.700', NULL),
(83, 6, 2, '[186,[3546.66,3740.02,0.00143433]]', NULL, '0.700', NULL),
(84, 5, 2, '[75,[3287.92,6434.28,0.00110245]]', NULL, '0.700', NULL),
(85, 6, 2, '[51,[5927.38,6616.12,0.00140476]]', NULL, '0.700', NULL),
(86, 7, 2, '[3,[5805.57,4727.47,0.00143814]]', NULL, '0.650', NULL),
(87, 8, 2, '[0,[6115.49,5859.39,0]]', NULL, '0.650', NULL),
(88, 15, 2, '[208,[1748.81,642.642,14.1062]]', NULL, '0.250', NULL),
(89, 5, 2, '[323,[1199.85,5270.49,10.8326]]', NULL, '0.700', NULL),
(90, 10, 2, '[267,[4080.74,1130.51,0.00143909]]', NULL, '0.700', NULL),
(91, 11, 2, '[-209,[6592.686, 2906.8245,0]]', NULL, '0.700', NULL),
(92, 12, 2, '[179,[5802.9,4712.73,0.00143814]]', NULL, '0.700', NULL),
(93, 12, 2, '[97,[4589.57,2616.75,0.00136948]]', NULL, '0.700', NULL),
(95, 32, 2, '[90,[6821.08,2497.89,0.00143909]]', NULL, '0.550', NULL),
(96, 33, 2, '[294,[3143.17,7997.26,0.00159264]]', NULL, '0.550', NULL),
(97, 14, 2, '[254,[3933.37,4220.77,0.00143433]]', NULL, '0.950', NULL),
(98, 14, 2, '[184,[3551.31,3739.72,0.0010376]]', NULL, '0.950', NULL),
(99, 31, 2, '[163,[5985.63,5351.37,0.00143909]]', NULL, '0.550', NULL),
(100, 13, 2, '[10,[8819.02,8023.86,0.00143814]]', NULL, '0.950', NULL),
(101, 14, 2, '[279,[5796.81,4688.25,0.00143814]]', NULL, '0.950', NULL),
(102, 13, 2, '[0,[5671.37,796.868,0.00129175]]', NULL, '0.950', NULL),
(103, 6, 2, '[0,[969.451,1275.39,0.00255895]]', NULL, '0.700', NULL),
(104, 29, 2, '[9,[6593.81,5728.57,0]]', NULL, '0.450', NULL),
(105, 27, 2, '[94,[621.466,4631.81,0.00143814]]', NULL, '0.550', NULL),
(106, 15, 2, '[5,[3360.08,1126.39,0.00143862]]', NULL, '0.250', NULL),
(107, 15, 2, '[18,[3956.76,4229.46,0.00143433]]', NULL, '0.250', NULL),
(108, 15, 2, '[168,[602.249,4686.56,6.81655]]', NULL, '0.250', NULL),
(109, 15, 2, '[89,[6597.37,6767.08,0]]', NULL, '0.250', NULL),
(110, 15, 2, '[274,[6863.03,4451.83,0.00143814]]', NULL, '0.250', NULL),
(111, 17, 2, '[79,[3472.71,1374.62,0.00143909]]', NULL, '0.550', NULL),
(112, 18, 2, '[79,[3572.71,1374.62,0.00143909]]', NULL, '0.550', NULL),
(113, 18, 2, '[180,[5775.69,4724.98,0.00143814]]', NULL, '0.550', NULL),
(114, 17, 2, '[209,[835.536,5520.96,7.97942]]', NULL, '0.550', NULL),
(115, 18, 2, '[9,[6572.64,5970.13,0]]', NULL, '0.550', NULL),
(116, 17, 2, '[9,[6472.64,5970.13,0]]', NULL, '0.550', NULL),
(117, 12, 2, '[272,[2837.28,5328.06,0.373938]]', NULL, '0.700', NULL),
(118, 19, 2, '[89,[7971.34,1091.71,0.00143909]]', NULL, '0.750', NULL),
(119, 19, 2, '[317,[2645.8,6945.16,0.00143909]]', NULL, '0.750', NULL),
(120, 20, 2, '[285,[4290.23,4935.53,0.00152206]]', NULL, '0.550', NULL),
(121, 20, 2, '[5,[4198.66,4442.61,0.00143814]]', NULL, '0.550', NULL),
(122, 20, 2, '[3,[5796.71,4721.43,0.00143814]]', NULL, '0.550', NULL),
(123, 20, 2, '[167,[13367.5,6601.11,0.0126638]]', NULL, '0.550', NULL),
(124, 21, 2, '[4,[4401.8,1702.02,0.121414]]', NULL, '0.550', NULL),
(125, 24, 2, '[137,[3800.27,2307.3,4.6834]]', NULL, '0.550', NULL),
(126, 24, 2, '[137,[3700.27,2307.3,4.6834]]', NULL, '0.550', NULL),
(127, 25, 2, '[291,[5873.05,5326.02,0.00148487]]', NULL, '0.550', NULL),
(128, 26, 2, '[147,[8433.71,7797.2,2.1895]]', NULL, '0.550', NULL),
(129, 26, 2, '[310,[3822.1,2299.23,0.000923157]]', NULL, '0.550', NULL),
(131, 28, 2, '[272,[6827.53,5927.34,0.00143909]]', NULL, '0.550', NULL),
(132, 28, 2, '[356,[8039.13,2916.39,0.00257635]]', NULL, '0.550', NULL),
(133, 27, 2, '[274,[3697.02,1404.02,0.00143909]]', NULL, '0.550', NULL),
(134, 28, 2, '[260,[8299.95,2358.95,1.28169]]', NULL, '0.550', NULL),
(135, 27, 2, '[47,[4149.76,1537.27,0.0821762]]', NULL, '0.550', NULL),
(136, 29, 2, '[183,[5784.84,4712.17,0.00143814]]', NULL, '0.450', NULL),
(137, 30, 2, '[222,[9120.468,8667.882,0]]', NULL, '0.750', NULL),
(138, 24, 2, '[273,[8842.5,921.916,0.00130701]]', NULL, '0.550', NULL),
(139, 1, 2, '[249,[7563.33,1693.72,0.00143909]]', NULL, '0.650', NULL),
(140, 24, 2, '[195,[6800.51,2828.05,0.00150663]]', NULL, '0.550', NULL),
(141, 15, 1, '[310,[6365.7402,7795.3501,-0.048767101]]', NULL, '0.250', '0.19'),
(142, 15, 1, '[14,[13308.511,3227.0215,0]]', NULL, '0.250', '0.19'),
(143, 15, 1, '[265,[7695.0356,3991.2056,0]]', NULL, '0.250', '0.19'),
(144, 15, 1, '[22,[12009.904,12636.732,0]]', 'UH1H at NEAF.', '0.250', '0.19'),
(145, 18, 4, '[79,[5228.1963,6146.6855,-1.19209]]', NULL, '0.500', '0.21'),
(146, 27, 4, '[334,[1399.4459,3464.3445,0]]', NULL, '0.500', '0.21'),
(147, 18, 4, '[227,[4621.7837,649.05255,0.00663757]]', NULL, '0.500', '0.21'),
(148, 27, 4, '[204,[5309.2461,6202.939,0]]', NULL, '0.500', '0.21'),
(149, 15, 4, '[132,[8189.5273,2064.668,0.00119019]]', NULL, '0.250', '0.21'),
(150, 5, 4, '[6,[6837.0986,4988.1509,0.000762939]]', NULL, '0.500', '0.21'),
(151, 20, 4, '[219,[8263.0322,7730.8857,0]]', NULL, '0.500', '0.21'),
(152, 5, 4, '[17,[11738.519,8349.665,0.0155945]]', NULL, '0.500', '0.21'),
(153, 12, 4, '[169,[12313.892,10475.649,4.19617]]', NULL, '0.500', '0.21'),
(154, 15, 4, '[18,[5843.7178,11336.136,0.00793457]]', NULL, '0.250', '0.21'),
(155, 20, 4, '[353,[1497.7494,5739.3496,6.67572]]', NULL, '0.500', '0.21'),
(156, 7, 4, '[165,[9157.1348,6692.1816,0.00242615]]', NULL, '0.500', '0.21'),
(157, 21, 4, '[341,[2069.3496,7657.5806,0]]', NULL, '0.500', '0.21'),
(158, 1, 4, '[130,[12242.198,11064.873,0.0706997]]', NULL, '0.500', '0.21'),
(159, 32, 4, '[252,[10489.811,11066.72,0.000778198]]', NULL, '0.500', '0.21'),
(160, 23, 4, '[310,[5298.9331,4714.4155,0.00106812]]', NULL, '0.500', '0.21'),
(161, 27, 4, '[123,[4157.9121,11910.076,0]]', NULL, '0.500', '0.21'),
(162, 13, 4, '[51,[1914.0155,7597.2456,-1.52588]]', NULL, '0.600', '0.21'),
(163, 13, 4, '[15,[5315.9443,6134.3672,0.0126953]]', NULL, '0.600', '0.21'),
(164, 13, 4, '[211,[8495.876,2404.3872,0.00710678]]', NULL, '0.600', '0.21'),
(165, 13, 4, '[108,[8464.3613,2459.9939,0.00117016]]', NULL, '0.600', '0.21'),
(166, 1, 4, '[123,[9946.1982,11338.414,0.00994873]]', NULL, '0.500', '0.21'),
(167, 15, 4, '[300,[772.11139,10483.121,0]]', NULL, '0.250', '0.21'),
(168, 9, 4, '[46,[2072.7871,299.8927,0.00143433]]', NULL, '0.500', '0.21'),
(169, 13, 4, '[93,[5962.1055,1078.1791,6.10352]]', NULL, '0.600', '0.21'),
(170, 32, 4, '[42,[6365.4731,11270.29,0]]', NULL, '0.500', '0.21'),
(171, 21, 4, '[28,[5953.3921,11337.747,0.00424194]]', NULL, '0.500', '0.21'),
(172, 13, 4, '[103,[11825.438,2588.1191,0.0188293]]', NULL, '0.600', '0.21'),
(173, 8, 4, '[106,[1786.9825,11949.147,0.00014782]]', NULL, '0.500', '0.21'),
(174, 13, 4, '[132,[12311.814,11033.296,0.0022583]]', NULL, '0.600', '0.21'),
(175, 13, 4, '[101,[5591.5513,8915.2783,0.0133638]]', NULL, '0.600', '0.21'),
(176, 13, 4, '[223,[7903.8716,3229.6731,0.0132484]]', NULL, '0.600', '0.21'),
(177, 13, 4, '[182,[8346.94,2458.27,0.0158215]]', NULL, '0.600', '0.21'),
(178, 21, 4, '[84,[8101.6929,2026.0935,0.0254517]]', NULL, '0.500', '0.21'),
(179, 1, 5, '[225,[6140,5668,0]]', 'Radovna', '0.700', '0.21'),
(180, 1, 5, '[0,[4029,7226,0]]', 'Arnoldstein', '0.700', '0.21'),
(181, 32, 5, '[270,[8601,4809,0]]', 'Lesce Airport', '0.700', '0.21'),
(182, 32, 5, '[180,[7920,1267,0]]', 'New Skooma', '0.700', '0.21'),
(183, 21, 5, '[110,[5394,3899,0]]', 'Ukanc', '0.700', '0.21'),
(184, 5, 5, '[140,[6053,5085,0]]', 'Radovna', '0.700', '0.21'),
(185, 5, 5, '[140,[4266,3929,0]]', 'Radovna', '0.700', '0.21'),
(187, 5, 5, '[140,[4265,3925,0]]', 'Krsnka Koca', '0.700', '0.21'),
(188, 5, 5, '[180,[7241,6009,0]]', 'Jesenice', '0.700', '0.21'),
(189, 5, 5, '[180,[5334,2567,0]]', 'Sela', '0.700', '0.21'),
(190, 20, 5, '[320,[4676,5020,0]]', 'Trenta', '0.700', '0.21'),
(191, 20, 5, '[180,[6741,1593,0]]', 'Belley', '0.700', '0.21'),
(192, 20, 5, '[0,[8718,3981,0]]', 'Kropa', '0.700', '0.21'),
(193, 8, 5, '[0,[7288,1369,0]]', 'Rockburn', '0.700', '0.21'),
(194, 20, 5, '[90,[3094,5878,0]]', 'Cave del Predil', '0.700', '0.21'),
(195, 20, 5, '[185,[6072,7455,0]]', 'Senzatoka', '0.700', '0.21'),
(196, 23, 5, '[275,[6752,6876,0]]', 'Kleinfort', '0.700', '0.21'),
(197, 23, 5, '[180,[6416,6210,0]]', 'Dovje', '0.700', '0.21'),
(198, 24, 5, '[180,[7922,1230,0]]', 'Hafen New Skooma', '0.700', '0.21'),
(199, 25, 5, '[180,[3465,2459,0]]', 'Bucht sÃ¼dlich von Livek', '0.700', '0.21'),
(200, 24, 5, '[180,[3900,2214,0]]', 'Bucht bei Bolhovo', '0.700', '0.21'),
(201, 25, 5, '[180,[3197,4531,0]]', 'LandeinwÃ¤rts Ende des Flusses', '0.700', '0.21'),
(202, 15, 5, '[0,[4141,7466,0]]', 'NÃ¶rdlichstes Airfield im Hangar', '0.700', '0.21'),
(203, 15, 5, '[315,[6921,793,0]]', 'Helipad im SÃ¼den', '0.700', '0.21'),
(204, 15, 5, '[0,[2674,3406,0]]', 'Helipad westliches AF', '0.700', '0.21'),
(205, 15, 5, '[270,[6702,7344,0]]', 'Firestation Rennstrecke', '0.700', '0.21'),
(206, 15, 5, '[180,[5573,4968,0]]', 'Dom Planika', '0.700', '0.21'),
(207, 13, 5, '[340,[4752,1864,0]]', 'Taff Grove', '0.700', '0.21'),
(208, 13, 5, '[335,[6530,3734,0]]', 'Boh. Bistrica', '0.700', '0.21'),
(209, 13, 5, '[180,[5052,6404,0]]', 'Kranjska Gora', '0.700', '0.21'),
(210, 13, 5, '[270,[8767,3107,0]]', 'Selca Leuchtturm', '0.700', '0.21'),
(211, 13, 5, '[90,[6672,394,0]]', 'Cato', '0.700', '0.21'),
(212, 13, 5, '[40,[5218,3867,0]]', 'Ukanc', '0.700', '0.21'),
(213, 18, 5, '[90,[5889,894,0]]', 'Tankstelle Zappado', '0.700', '0.21'),
(214, 18, 5, '[0,[7872,1567,0]]', 'Tankstelle New Skooma', '0.700', '0.21'),
(215, 18, 5, '[90,[7988,4925,0]]', 'Bled', '0.700', '0.21'),
(216, 1, 5, '[90,[3406,2473,0]]', 'Livek', '0.650', '0.21'),
(217, 1, 5, '[270,[8677,5631,0]]', '086|046', '0.650', '0.21'),
(218, 1, 5, '[270,[5007,5127,0]]', 'Trenta', '0.650', '0.21'),
(219, 34, 8, '[219,[4148.12,6579.55,3.866]]', NULL, '0.250', NULL),
(220, 4, 8, '[182,[4127.6,6703.51,0.00146484]]', NULL, '0.650', NULL),
(221, 4, 8, '[93,[3552.5,6675.55,0.00143433]]', NULL, '0.650', NULL),
(222, 32, 8, '[220,[3941.47,7595.37,0.00143814]]', NULL, '0.550', NULL),
(223, 32, 8, '[180,[5849.93,8659.4,0.00143814]]', NULL, '0.550', NULL),
(224, 22, 8, '[90,[4837.61,6145.8,0.00143814]]', NULL, '0.550', NULL),
(225, 31, 8, '[90,[7051.95,5777.77,0.00144196]]', NULL, '0.550', NULL),
(226, 22, 8, '[180,[7894.81,7718.42,0.00142384]]', NULL, '0.550', NULL),
(227, 31, 8, '[52,[7358.11,7984.73,0.00138092]]', NULL, '0.550', NULL),
(228, 32, 8, '[351,[7685.47,8729.3,0.00157166]]', NULL, '0.550', NULL),
(229, 4, 8, '[23,[5975.07,6690.23,0.00141525]]', NULL, '0.650', NULL),
(230, 31, 8, '[255,[5748.33,9844.07,0.00140762]]', NULL, '0.550', NULL),
(231, 19, 8, '[296,[8252.9,10792.1,0.00143909]]', NULL, '0.750', NULL),
(232, 13, 8, '[22,[8957.08,10629.1,0.00132465]]', NULL, '0.950', NULL),
(233, 24, 8, '[110,[9134.51,10091.7,4.11368]]', NULL, '0.550', NULL),
(234, 13, 8, '[81,[7209.53,10848.4,0.00142956]]', NULL, '0.950', NULL),
(235, 22, 8, '[270,[6739.51,11323.5,0.00143909]]', NULL, '0.550', NULL),
(236, 31, 8, '[74,[7029.23,11540.7,0.00143909]]', NULL, '0.550', NULL),
(237, 13, 8, '[11,[6665.94,11022.5,0.00143909]]', NULL, '0.950', NULL),
(238, 31, 8, '[278,[5796.78,10761.3,0.00142288]]', NULL, '0.550', NULL),
(239, 4, 8, '[203,[4849.06,10858.9,0.00143909]]', NULL, '0.650', NULL),
(240, 4, 8, '[280,[4418.92,10748.9,0.00143909]]', NULL, '0.650', NULL),
(241, 35, 8, '[47,[4521,11230,3.81583]]', NULL, '0.250', NULL),
(242, 25, 8, '[55,[4525.93,11255.1,0.001692]]', NULL, '0.550', NULL),
(243, 24, 8, '[92,[4387.41,11293.1,7.2188]]', NULL, '0.550', NULL),
(244, 24, 8, '[0,[4430.48,11303.5,8.4149]]', NULL, '0.550', NULL),
(245, 4, 8, '[250,[4090.02,9225.91,0.00144958]]', NULL, '0.650', NULL),
(246, 24, 8, '[180,[4306.51,4719.16,5.83564]]', NULL, '0.550', NULL),
(247, 13, 8, '[34,[2197.75,5762.33,0.00141096]]', NULL, '0.950', NULL),
(248, 25, 8, '[88,[2144.77,5754.73,1.84505]]', NULL, '0.550', NULL),
(249, 25, 8, '[245,[5031.6,6100.52,5.8214]]', NULL, '0.550', NULL),
(250, 13, 8, '[6,[4877.88,6215.15,0.00143814]]', NULL, '0.950', NULL),
(251, 25, 8, '[228,[6044.81,6760.48,2.24013]]', NULL, '0.550', NULL),
(252, 32, 8, '[126,[7647.15,7406.74,0.00144958]]', NULL, '0.550', NULL),
(253, 22, 8, '[1,[4991.09,8165.97,0.00148773]]', NULL, '0.550', NULL),
(254, 50, 9, '[42,[6065.28,2703.19,-0.0156651]]', NULL, '0.650', NULL),
(255, 51, 9, '[0,[10773.651,975.24237,0.23155731]]', NULL, '0.650', NULL),
(256, 52, 9, '[0,[8482.4492,8107.7109,-2.4795532e-005]]', NULL, '0.650', NULL),
(257, 49, 9, '[71,[2094.65,7619.18,-0.00772476]]', NULL, '0.650', NULL),
(258, 13, 9, '[0,[2319.8,1213.5911,4.0054321e-005]]', NULL, '0.650', NULL),
(259, 44, 9, '[360,[8516.86,2148.63,0.0001297]]', NULL, '0.650', NULL),
(260, 42, 9, '[35,[1671.69,2091.84,0.000419617]]', NULL, '0.650', NULL),
(261, 39, 9, '[81,[2360.87,1208.99,0.00244331]]', NULL, '0.650', NULL),
(262, 47, 9, '[310,[409.376,3768.02,-0.00925827]]', NULL, '0.650', NULL),
(263, 19, 9, '[152,[4736.75,3007.69,-1.33514e-005]]', NULL, '0.650', NULL),
(264, 11, 9, '[0,[1625.8889,2078.1746,1.335144e-005]]', NULL, '0.650', NULL),
(265, 41, 9, '[27,[367.971,3718.82,-6.67572e-005]]', NULL, '0.650', NULL),
(266, 13, 9, '[88,[6140.061,2629.8596,-3.8146973e-006]]', NULL, '0.650', NULL),
(267, 19, 9, '[120,[6078.4307,2745.4111,-3.0517578e-005]]', NULL, '0.650', NULL),
(268, 45, 9, '[7,[8918.93,2126.1,7.34329e-005]]', NULL, '0.650', NULL),
(269, 13, 9, '[0,[8923.083,2139.8386,-5.7220459e-006]]', NULL, '0.650', NULL),
(270, 15, 9, '[94,[8777.93,2076.05,-0.0491714]]', NULL, '0.650', NULL),
(271, 19, 9, '[0,[8843.0586,2538.1528,-1.9073486e-006]]', NULL, '0.650', NULL),
(272, 25, 9, '[299,[8613.07,2467.64,0.175663]]', NULL, '0.650', NULL),
(273, 19, 9, '[0,[8766.1475,2672.552,5.7220459e-006]]', NULL, '0.650', NULL),
(274, 26, 9, '[0,[6771.4668,3383.1628,0.084204674]]', NULL, '0.650', NULL),
(275, 15, 9, '[162,[7797.06,1508.78,0.0114393]]', NULL, '0.650', NULL),
(276, 13, 9, '[0,[10837.63,876.93933]]', NULL, '0.650', NULL),
(277, 48, 9, '[0,[7489.06,1447.57,0.0154333]]', NULL, '0.650', NULL),
(278, 13, 9, '[45,[10976.697,885.80438,9.5367432e-007]]', NULL, '0.650', NULL),
(279, 6, 9, '[149,[2629.24,4096.96,0.000131607]]', NULL, '0.650', NULL),
(280, 10, 9, '[27,[10973.6,906.303,-0.0132909]]', NULL, '0.650', NULL),
(281, 31, 9, '[33,[2437.44,4242.37,0]]', NULL, '0.650', NULL),
(282, 46, 9, '[210,[561.609,5010.75,5.91278e-005]]', NULL, '0.650', NULL),
(283, 47, 9, '[1,[583.873,4999.42,-0.0209208]]', NULL, '0.650', NULL),
(284, 40, 9, '[0,[657.07629,5135.0928,6.6757202e-006]]', NULL, '0.650', NULL),
(285, 12, 9, '[360,[8531.11,8107.91,0.00588608]]', NULL, '0.650', NULL),
(286, 38, 9, '[82,[8884.36,2633.27,0.12]]', NULL, '0.650', NULL),
(287, 43, 9, '[41,[6677.15,8072.63,3.8147e-006]]', NULL, '0.650', NULL),
(288, 19, 9, '[327,[6876.86,11167,2.76566e-005]]', NULL, '0.650', NULL),
(289, 11, 9, '[0,[3008.2402,11027.495]]', NULL, '0.650', NULL),
(290, 13, 9, '[0,[6852.0908,11166.002,-1.9073486e-006]]', NULL, '0.650', NULL),
(291, 36, 9, '[355,[2902.24,10913.6,-0.000387192]]', NULL, '0.650', NULL),
(292, 40, 9, '[39,[3072.7,11002.3,0.000118256]]', NULL, '0.650', NULL),
(293, 37, 9, '[360,[8852.78,2168.46,-1.90735e-006]]', NULL, '0.650', NULL),
(294, 33, 9, '[358,[10465.1,11582.3,-1.52588e-005]]', NULL, '0.650', NULL),
(295, 11, 9, '[274,[10446.7,11510.6,-0.00825787]]', NULL, '0.650', NULL),
(296, 15, 9, '[152,[10976,11109.1,-0.0227766]]', NULL, '0.650', NULL),
(297, 13, 9, '[0,[10507.803,10731.588,-5.3405762e-005]]', NULL, '0.650', NULL),
(298, 10, 9, '[0,[10478.332,10651.773,-4.0054321e-005]]', NULL, '0.650', NULL),
(299, 44, 9, '[0,[9081.3779,8934.1094]]', NULL, '0.650', NULL),
(301, 53, 1, '[2,[12010.7,12637.2,0]]', NULL, '0.250', NULL),
(302, 53, 1, '[113,[6880.2007,11454.291,0]]', NULL, '0.250', NULL),
(303, 54, 1, '[156,[7660.271,3982.0063,0]]', NULL, '0.300', NULL),
(304, 54, 1, '[-188,[7220.6538,9116.3428,0]]', NULL, '0.300', NULL),
(305, 54, 1, '[4,[13584.044,3199.9648,0]]', NULL, '0.300', NULL),
(306, 55, 1, '[252,[4530.52,10785.1,0]]', NULL, '0.250', NULL),
(307, 56, 1, '[162,[3702.04,6044.3101,0]]', NULL, '0.500', NULL),
(308, 56, 1, '[141,[11953.279,9107.3896,0]]', NULL, '0.500', NULL),
(309, 57, 1, '[71,[3708.5,5999.4199,0]]', NULL, '0.500', NULL),
(310, 57, 1, '[322,[7201.5181,3034.3232,0]]', NULL, '0.500', NULL),
(564, 91, 10, '[242,[10291.3,18354.9,-0.180809]]', '', '0.700', '0.34'),
(565, 29, 10, '[354,[10951,17800.9,0.0223007]]', '', '0.700', '0.34'),
(566, 29, 10, '[162,[10922.9,17345.1,0.0321388]]', '', '0.700', '0.34'),
(567, 81, 10, '[157,[10157.5,19150.1,0]]', '', '0.700', '0.34'),
(568, 18, 10, '[184,[10339.8,18663.9,0.0126953]]', '', '0.700', '0.34'),
(569, 30, 10, '[340,[10948.5,17206.8,0.0906601]]', '', '0.700', '0.34'),
(570, 3, 10, '[62,[10984.5,18950.9,-4.76837e-007]]', '', '0.700', '0.34'),
(571, 3, 10, '[339,[10270.8,17668.5,0.0456314]]', '', '0.700', '0.34'),
(572, 32, 10, '[204,[11211.6,18116,0.00648117]]', '', '0.700', '0.34'),
(573, 21, 10, '[243,[10228.8,18638.9,0.00063324]]', '', '0.700', '0.34'),
(574, 15, 10, '[293,[9964.81,18664.9,0.00174713]]', '', '0.700', '0.34'),
(575, 55, 10, '[313,[10490,17603.4,-0.629063]]', '', '0.700', '0.34'),
(576, 55, 10, '[176,[10090.7,18410.8,-0.674576]]', '', '0.700', '0.34'),
(577, 55, 10, '[245,[10177.2,18598.8,-0.671776]]', '', '0.700', '0.34'),
(578, 89, 10, '[327,[11099.5,18673.8,0]]', '', '0.700', '0.34'),
(579, 14, 10, '[319,[10633.1,17340.5,0.00105286]]', '', '0.700', '0.34'),
(580, 81, 10, '[170,[10117.2,19008.2,0]]', '', '0.700', '0.34'),
(581, 90, 10, '[85,[9962.75,18923,0.00149536]]', '', '0.700', '0.34'),
(582, 81, 10, '[95,[10306.9,16804,0]]', '', '0.700', '0.34'),
(583, 81, 10, '[131,[8788.46,19497.9,0.0118561]]', '', '0.700', '0.34'),
(584, 3, 10, '[349,[11036.6,16840.4,0.0015564]]', '', '0.700', '0.34'),
(585, 58, 10, '[316,[8778.47,19045.2,-0.00346375]]', '', '0.700', '0.34'),
(586, 25, 10, '[92,[11698.8,18823.9,-0.338678]]', '', '0.700', '0.34'),
(587, 25, 10, '[112,[11680.8,18691.2,-0.360215]]', '', '0.700', '0.34'),
(588, 29, 10, '[317,[7474.65,4423.4,-0.00769424]]', '', '0.700', '0.34'),
(589, 29, 10, '[277,[9057.16,2530.97,-0.0063858]]', '', '0.700', '0.34'),
(590, 29, 10, '[134,[9135.33,7964.65,-0.00769043]]', '', '0.700', '0.34'),
(591, 29, 10, '[95,[4019.75,6695.92,-0.00769424]]', '', '0.700', '0.34'),
(592, 29, 10, '[220,[13403,8635.49,-0.00769043]]', '', '0.700', '0.34'),
(593, 29, 10, '[66,[5822.55,8464.95,-0.00753784]]', '', '0.700', '0.34'),
(594, 29, 10, '[56,[12022.2,15220.1,-0.00769806]]', '', '0.700', '0.34'),
(595, 29, 10, '[318,[14163.5,12404.8,-0.00769424]]', '', '0.700', '0.34'),
(596, 29, 10, '[0,[15257.5,9471.55,-0.00769615]]', '', '0.700', '0.34'),
(597, 29, 10, '[70,[17359,7417.03,-0.00769043]]', '', '0.700', '0.34'),
(598, 29, 10, '[189,[12614,11897.5,-0.00769806]]', '', '0.700', '0.34'),
(599, 29, 10, '[57,[16971.7,12787.1,-0.00769615]]', '', '0.700', '0.34'),
(600, 29, 10, '[304,[11371.1,1101.07,-0.00540161]]', '', '0.700', '0.34'),
(601, 81, 10, '[92,[6514.76,8748.42,0.0316048]]', '', '0.700', '0.34'),
(602, 81, 10, '[233,[4727.36,8095.94,7.62939e-006]]', '', '0.700', '0.34'),
(603, 81, 10, '[131,[5224.73,6274.16,0.00038147]]', '', '0.700', '0.34'),
(604, 81, 10, '[131,[10011.1,7181.43,0.00144958]]', '', '0.700', '0.34'),
(605, 81, 10, '[120,[6510.3,5542.96,0.000148773]]', '', '0.700', '0.34'),
(606, 81, 10, '[131,[7768.96,4579.06,0]]', '', '0.700', '0.34'),
(607, 81, 10, '[320,[13427.7,8644.56,0]]', '', '0.700', '0.34'),
(608, 81, 10, '[178,[15123.8,9375.95,0]]', '', '0.700', '0.34'),
(609, 81, 10, '[169,[16213.3,14955.3,0.0228539]]', '', '0.700', '0.34'),
(610, 81, 10, '[45,[7706.79,4174.13,0]]', '', '0.700', '0.34'),
(611, 81, 10, '[360,[15355.2,9831.41,3.05176e-005]]', '', '0.700', '0.34'),
(612, 81, 10, '[333,[12887.8,13419.6,0.02285]]', '', '0.700', '0.34'),
(613, 81, 10, '[131,[8395.68,3332.51,0.000270844]]', '', '0.700', '0.34'),
(614, 81, 10, '[296,[15925.3,8918.18,0.00468254]]', '', '0.700', '0.34'),
(615, 81, 10, '[131,[14267.7,11740.5,0.00571442]]', '', '0.700', '0.34'),
(616, 81, 10, '[167,[11115.6,16432.1,0]]', '', '0.700', '0.34'),
(617, 81, 10, '[50,[9682.93,5836.99,0.0102997]]', '', '0.700', '0.34'),
(618, 81, 10, '[147,[10770.1,2291.05,0.00911713]]', '', '0.700', '0.34'),
(619, 81, 10, '[146,[8233.2,3557.05,0.00823021]]', '', '0.700', '0.34'),
(620, 81, 10, '[154,[14631.3,18568.4,0.00568962]]', '', '0.700', '0.34'),
(621, 81, 10, '[357,[15333,16325.5,0]]', '', '0.700', '0.34'),
(622, 81, 10, '[179,[14983.5,9843.48,0]]', '', '0.700', '0.34'),
(623, 81, 10, '[131,[11717.7,14820.3,0]]', '', '0.700', '0.34'),
(624, 81, 10, '[160,[14953.7,17686.2,0.0230598]]', '', '0.700', '0.34'),
(625, 81, 10, '[124,[11765.8,15295.7,0]]', '', '0.700', '0.34'),
(626, 81, 10, '[193,[16535.6,12305.2,0.0189724]]', '', '0.700', '0.34'),
(627, 81, 10, '[58,[13973.5,12345.3,0]]', '', '0.700', '0.34'),
(628, 81, 10, '[0,[13233.2,12143.6,0.0196762]]', '', '0.700', '0.34'),
(629, 81, 10, '[183,[17595.4,6287.17,0.00100708]]', '', '0.700', '0.34'),
(630, 81, 10, '[131,[16712.8,8479.33,0.0872345]]', '', '0.700', '0.34'),
(631, 81, 10, '[1,[12873.5,12944.9,0]]', '', '0.700', '0.34'),
(632, 81, 10, '[143,[15653,10009.4,0]]', '', '0.700', '0.34'),
(633, 81, 10, '[143,[12961.6,14013.4,0]]', '', '0.700', '0.34'),
(634, 18, 10, '[132,[7808.4,4330.21,0]]', '', '0.700', '0.34'),
(635, 18, 10, '[66,[17398.7,6512.27,0.0234985]]', '', '0.700', '0.34'),
(636, 18, 10, '[183,[15569,8258.74,0.141594]]', '', '0.700', '0.34'),
(637, 18, 10, '[158,[17167.2,7767.53,0.0743866]]', '', '0.700', '0.34'),
(638, 18, 10, '[158,[12452.1,14354.7,0]]', '', '0.700', '0.34'),
(639, 18, 10, '[128,[16412.7,8723.52,0.151649]]', '', '0.700', '0.34'),
(640, 18, 10, '[214,[16459,12013.3,0.00720406]]', '', '0.700', '0.34'),
(641, 18, 10, '[278,[15560.1,16005.2,0.00566101]]', '', '0.700', '0.34'),
(642, 18, 10, '[76,[13169.2,19343.8,0.0113888]]', '', '0.700', '0.34'),
(643, 18, 10, '[158,[11545.9,15615.5,0]]', '', '0.700', '0.34'),
(644, 18, 10, '[84,[12838.6,11940.6,0]]', '', '0.700', '0.34'),
(645, 18, 10, '[181,[14907.1,9766.22,0]]', '', '0.700', '0.34'),
(646, 18, 10, '[158,[17324.2,7421.05,-0.102005]]', '', '0.700', '0.34'),
(647, 18, 10, '[158,[5179.3,8106.45,0.00350952]]', '', '0.700', '0.34'),
(648, 18, 10, '[113,[7495.9,8301.67,0.00138855]]', '', '0.700', '0.34'),
(649, 18, 10, '[128,[9141,8111.72,0]]', '', '0.700', '0.34'),
(650, 18, 10, '[303,[5915.2,5921.79,1.90735e-005]]', '', '0.700', '0.34'),
(651, 18, 10, '[130,[7652.84,4086.29,0]]', '', '0.700', '0.34'),
(652, 7, 10, '[203,[10693.7,6536.87,0.0229568]]', '', '0.700', '0.34'),
(653, 9, 10, '[157,[8047.39,8636.07,0.00374603]]', '', '0.700', '0.34'),
(654, 77, 10, '[158,[5482.39,8202.6,0.0140457]]', '', '0.700', '0.34'),
(655, 8, 10, '[349,[5570.72,6114.17,8.7738e-005]]', '', '0.700', '0.34'),
(656, 30, 10, '[318,[6888.35,5214.03,0.00019455]]', '', '0.700', '0.34'),
(657, 30, 10, '[225,[7839.55,4494.92,0]]', '', '0.700', '0.34'),
(658, 30, 10, '[140,[8652.84,3068.12,0.00364494]]', '', '0.700', '0.34'),
(659, 30, 10, '[128,[7167.82,8533.28,0.00255585]]', '', '0.700', '0.34'),
(660, 30, 10, '[120,[16354.1,13180.9,0.0191612]]', '', '0.700', '0.34'),
(661, 30, 10, '[158,[8211.36,6154.37,0.0160217]]', '', '0.700', '0.34'),
(662, 30, 10, '[208,[9050.35,7881.65,0]]', '', '0.700', '0.34'),
(663, 30, 10, '[215,[16175.9,10431.5,0.0055275]]', '', '0.700', '0.34'),
(664, 30, 10, '[182,[15113.4,9929.65,0.137263]]', '', '0.700', '0.34'),
(665, 30, 10, '[134,[11133.3,1959.98,0.000549316]]', '', '0.700', '0.34'),
(666, 30, 10, '[144,[8542.64,3162.03,0.000202179]]', '', '0.700', '0.34'),
(667, 30, 10, '[295,[13424,8648.58,0]]', '', '0.700', '0.34'),
(668, 30, 10, '[179,[15252.8,9215.89,0]]', '', '0.700', '0.34'),
(669, 77, 10, '[126,[7214.78,4930.56,0.00031662]]', '', '0.700', '0.34'),
(670, 8, 10, '[140,[8275.1,3476.29,0.00530815]]', '', '0.700', '0.34'),
(671, 7, 10, '[271,[16905.2,6272.22,0.00584412]]', '', '0.700', '0.34'),
(672, 77, 10, '[143,[10510.9,2562.58,0.0067749]]', '', '0.700', '0.34'),
(673, 8, 10, '[147,[9604.49,4852.59,0.00148773]]', '', '0.700', '0.34'),
(674, 77, 10, '[91,[11172.7,15990.7,0]]', '', '0.700', '0.34'),
(675, 8, 10, '[181,[12874.6,13155.3,0]]', '', '0.700', '0.34'),
(676, 9, 10, '[185,[16062.1,15670.4,0.0116997]]', '', '0.700', '0.34'),
(677, 77, 10, '[180,[16259.6,11102.7,0.0425148]]', '', '0.700', '0.34'),
(678, 8, 10, '[87,[17370.6,7346.27,0]]', '', '0.700', '0.34'),
(679, 19, 10, '[271,[12152.6,14950.1,0.0159607]]', '', '0.700', '0.34'),
(680, 19, 10, '[311,[12435,15202.6,0.00318909]]', '', '0.700', '0.34'),
(681, 19, 10, '[277,[13670.5,13096.8,0.00578308]]', '', '0.700', '0.34'),
(682, 19, 10, '[222,[13162.4,13622.9,0.00712585]]', '', '0.700', '0.34'),
(683, 19, 10, '[293,[13364.2,13315.5,0.0142212]]', '', '0.700', '0.34'),
(684, 19, 10, '[250,[13268.5,19505.5,0.0949459]]', '', '0.700', '0.34'),
(685, 19, 10, '[332,[12080.8,19157.7,0.0564194]]', '', '0.700', '0.34'),
(686, 19, 10, '[283,[8596.41,19476.3,0.0055542]]', '', '0.700', '0.34'),
(687, 19, 10, '[293,[8411.4,19204.7,0.125671]]', '', '0.700', '0.34'),
(688, 19, 10, '[293,[1663.18,7532.56,0.00292587]]', '', '0.700', '0.34'),
(689, 19, 10, '[2,[2249.73,7592.62,0.0450172]]', '', '0.700', '0.34'),
(690, 19, 10, '[272,[1519.11,7133.55,0.141129]]', '', '0.700', '0.34'),
(691, 19, 10, '[293,[1680.76,6870.38,0.0112076]]', '', '0.700', '0.34'),
(692, 19, 10, '[201,[5554.78,6028.8,3.8147e-005]]', '', '0.700', '0.34'),
(693, 19, 10, '[31,[4594.34,6231.05,0.0142784]]', '', '0.700', '0.34'),
(694, 20, 10, '[315,[7374.36,4759.34,-0.000656128]]', '', '0.700', '0.34'),
(695, 20, 10, '[44,[7710.61,4611.11,-0.000656128]]', '', '0.700', '0.34'),
(696, 20, 10, '[128,[7716.36,3906.45,-0.000656128]]', '', '0.700', '0.34'),
(697, 20, 10, '[274,[13456,8603.68,-0.000671387]]', '', '0.700', '0.34'),
(698, 20, 10, '[2,[14879.6,9330.99,-0.000658035]]', '', '0.700', '0.34'),
(699, 3, 10, '[315,[11508.4,1262.49,0.0632362]]', '', '0.700', '0.34'),
(700, 3, 10, '[330,[9883.54,3139.64,0.0131836]]', '', '0.700', '0.34'),
(701, 3, 10, '[237,[11825,1411.95,0.0010252]]', '', '0.700', '0.34'),
(702, 3, 10, '[274,[13190.3,8792.78,0]]', '', '0.700', '0.34'),
(703, 3, 10, '[134,[13450.8,8605.12,0]]', '', '0.700', '0.34'),
(704, 3, 10, '[339,[10688.8,11734,0.550781]]', '', '0.700', '0.34'),
(705, 3, 10, '[191,[16826.5,8195.05,0.00675964]]', '', '0.700', '0.34'),
(706, 3, 10, '[184,[15012.4,15616.1,0.00805664]]', '', '0.700', '0.34'),
(707, 3, 10, '[293,[18394.7,5052.93,0.106243]]', '', '0.700', '0.34'),
(708, 3, 10, '[273,[17564.7,6309.81,0]]', '', '0.700', '0.34'),
(709, 3, 10, '[181,[16446.6,11620.8,0]]', '', '0.700', '0.34'),
(710, 3, 10, '[293,[13174.2,13260.9,0.0268364]]', '', '0.700', '0.34'),
(711, 3, 10, '[292,[12478,13860,0]]', '', '0.700', '0.34'),
(712, 3, 10, '[270,[14688.2,10835.4,0.0373383]]', '', '0.700', '0.34'),
(713, 3, 10, '[318,[9711.47,1983.53,0.00771332]]', '', '0.700', '0.34'),
(714, 3, 10, '[25,[5711.09,5851.74,0.0101013]]', '', '0.700', '0.34'),
(715, 3, 10, '[233,[9015.01,7405.48,0.021965]]', '', '0.700', '0.34'),
(716, 3, 10, '[320,[2799.21,7081.33,0.0408325]]', '', '0.700', '0.34'),
(717, 3, 10, '[315,[7649.58,21950.5,0.0791931]]', '', '0.700', '0.34'),
(718, 3, 10, '[293,[11398.1,15315.9,0]]', '', '0.700', '0.34'),
(719, 3, 10, '[293,[15651.9,9659.04,-0.102001]]', '', '0.700', '0.34'),
(720, 3, 10, '[350,[16812.2,6297.74,0.00746155]]', '', '0.700', '0.34'),
(721, 32, 10, '[179,[9082.64,21516.1,0.116533]]', '', '0.700', '0.34'),
(722, 32, 10, '[266,[12963.3,11995.9,0.0131302]]', '', '0.700', '0.34'),
(723, 32, 10, '[293,[3807.23,7246.74,0]]', '', '0.700', '0.34'),
(724, 32, 10, '[55,[4034.12,7745.7,6.10352e-005]]', '', '0.700', '0.34'),
(725, 32, 10, '[43,[5856.52,8621.12,0.00302887]]', '', '0.700', '0.34'),
(726, 32, 10, '[221,[17118.1,7807.23,0.0652618]]', '', '0.700', '0.34'),
(727, 32, 10, '[91,[15039.7,14824.6,0.00798798]]', '', '0.700', '0.34'),
(728, 32, 10, '[259,[16347.1,7414.9,0.137238]]', '', '0.700', '0.34'),
(729, 32, 10, '[359,[13414.2,8651.67,1.52588e-005]]', '', '0.700', '0.34'),
(730, 32, 10, '[273,[15457.5,9795.01,0.0424709]]', '', '0.700', '0.34'),
(731, 32, 10, '[272,[16283.9,10041.2,0.00337219]]', '', '0.700', '0.34'),
(732, 32, 10, '[2,[16335.7,10544.5,0]]', '', '0.700', '0.34'),
(733, 32, 10, '[259,[7742.34,7074.12,0.0001297]]', '', '0.700', '0.34'),
(734, 32, 10, '[243,[8374.7,5813.29,0.0271759]]', '', '0.700', '0.34'),
(735, 32, 10, '[181,[16465.9,14267.1,0]]', '', '0.700', '0.34'),
(736, 32, 10, '[3,[15151.9,9366.48,0]]', '', '0.700', '0.34'),
(737, 32, 10, '[307,[9534.39,7782.44,0]]', '', '0.700', '0.34'),
(738, 32, 10, '[293,[11570.2,15115.9,0]]', '', '0.700', '0.34'),
(739, 32, 10, '[293,[13297.6,12424.3,0.00325775]]', '', '0.700', '0.34'),
(740, 32, 10, '[47,[10099,2944.08,0.0168152]]', '', '0.700', '0.34'),
(741, 32, 10, '[319,[8721.09,2951.82,0.00160789]]', '', '0.700', '0.34'),
(742, 32, 10, '[308,[6124.46,5807.65,0]]', '', '0.700', '0.34'),
(743, 21, 10, '[314,[7756.23,4266.02,0]]', '', '0.700', '0.34'),
(744, 21, 10, '[271,[2168,7026.63,0.000202179]]', '', '0.700', '0.34'),
(745, 21, 10, '[359,[2129.33,7064.36,0.0020256]]', '', '0.700', '0.34'),
(746, 21, 10, '[275,[16448.8,9219.42,0.146385]]', '', '0.700', '0.34'),
(747, 23, 10, '[293,[15137.8,10164.2,0]]', '', '0.700', '0.34'),
(748, 90, 10, '[72,[17214.1,5605.34,-0.00038147]]', '', '0.700', '0.34'),
(749, 21, 10, '[293,[17380.9,5111.01,0.0486755]]', '', '0.700', '0.34'),
(750, 21, 10, '[360,[9630.26,4229.79,0]]', '', '0.700', '0.34'),
(751, 21, 10, '[5,[6760.29,9811.86,0.0148087]]', '', '0.700', '0.34'),
(752, 21, 10, '[358,[9628.1,4417.41,0]]', '', '0.700', '0.34'),
(753, 21, 10, '[151,[16695.3,10633.4,0]]', '', '0.700', '0.34'),
(754, 21, 10, '[360,[3888.82,6974.72,0]]', '', '0.700', '0.34'),
(755, 29, 10, '[360,[9303.53,4234.05,-0.00769806]]', '', '0.700', '0.34'),
(756, 29, 10, '[271,[9409.02,4633.06,-0.00769806]]', '', '0.700', '0.34'),
(757, 53, 10, '[293,[6739.95,8450.5,0.00347137]]', '', '0.700', '0.34'),
(758, 15, 10, '[271,[15123.8,9746.96,0]]', '', '0.700', '0.34'),
(759, 15, 10, '[183,[17514.7,5240.99,0.00959778]]', '', '0.700', '0.34'),
(760, 15, 10, '[132,[7747.75,4258.96,0]]', '', '0.700', '0.34'),
(761, 55, 10, '[221,[16613.3,11616.6,-0.674572]]', '', '0.700', '0.34'),
(762, 55, 10, '[339,[7197.96,8235.7,-0.667679]]', '', '0.700', '0.34'),
(763, 55, 10, '[216,[7469.84,8071.2,-0.678246]]', '', '0.700', '0.34'),
(764, 58, 10, '[118,[16014.9,8410.25,0.0563278]]', '', '0.700', '0.34'),
(765, 62, 10, '[137,[9612.94,2065.55,-0.0139961]]', '', '0.700', '0.34'),
(766, 23, 10, '[270,[2167.46,7018.76,0.000156403]]', '', '0.700', '0.34'),
(767, 58, 10, '[266,[3695.45,2348.44,0.293526]]', '', '0.700', '0.34'),
(768, 62, 10, '[293,[4927.72,8571.45,0.0936146]]', '', '0.700', '0.34'),
(769, 23, 10, '[293,[4558.08,6561.13,0.000110626]]', '', '0.700', '0.34'),
(770, 62, 10, '[91,[17374.2,7641.97,-0.0154572]]', '', '0.700', '0.34'),
(771, 23, 10, '[93,[13412.8,8656.76,1.52588e-005]]', '', '0.700', '0.34'),
(772, 58, 10, '[340,[9514.06,4977.89,-0.0154419]]', '', '0.700', '0.34'),
(773, 62, 10, '[216,[14227.3,19121.1,0.0452614]]', '', '0.700', '0.34'),
(774, 23, 10, '[265,[17085,6914.41,0.0455627]]', '', '0.700', '0.34'),
(775, 58, 10, '[129,[6218.76,9814.33,-0.00266266]]', '', '0.700', '0.34'),
(776, 62, 10, '[338,[4092.65,8087.38,0.104589]]', '', '0.700', '0.34'),
(777, 23, 10, '[217,[9454.04,5261.97,0.00300598]]', '', '0.700', '0.34'),
(778, 89, 10, '[199,[12525.9,11984,0]]', '', '0.700', '0.34'),
(779, 89, 10, '[293,[9351.74,15258.9,0.00850677]]', '', '0.700', '0.34'),
(780, 89, 10, '[310,[9251.79,2059.08,0.0140038]]', '', '0.700', '0.34'),
(781, 89, 10, '[271,[16503.3,9805.29,0]]', '', '0.700', '0.34'),
(782, 89, 10, '[219,[7489.96,8046.14,0.000335693]]', '', '0.700', '0.34'),
(783, 89, 10, '[54,[9704.19,4731.92,0.0215988]]', '', '0.700', '0.34'),
(784, 89, 10, '[273,[3503,7838.59,0]]', '', '0.700', '0.34'),
(785, 47, 10, '[342,[2130.2,7102.84,0.0467148]]', '', '0.700', '0.34'),
(786, 14, 10, '[1,[15129.4,9539.02,0.0100794]]', '', '0.700', '0.34'),
(787, 10, 10, '[342,[2141.89,7102.96,0.0446053]]', '', '0.700', '0.34'),
(788, 48, 10, '[343,[2137.76,7102.6,0.0414391]]', '', '0.700', '0.34'),
(789, 12, 10, '[341,[2133.69,7103.56,0.0480652]]', '', '0.700', '0.34'),
(790, 47, 10, '[342,[2126.66,7103.33,0.0381203]]', '', '0.700', '0.34'),
(791, 10, 10, '[122,[1867.53,7180.35,0.0412025]]', '', '0.700', '0.34'),
(792, 48, 10, '[91,[2236.42,7332.13,0.0434113]]', '', '0.700', '0.34'),
(793, 12, 10, '[227,[1977.12,7314.2,0.0414314]]', '', '0.700', '0.34'),
(794, 47, 10, '[325,[14276.1,11341.2,0.0357208]]', '', '0.700', '0.34'),
(795, 10, 10, '[154,[17485.7,5878.32,0.0465851]]', '', '0.700', '0.34'),
(796, 48, 10, '[90,[11995.8,14826.6,0.0642624]]', '', '0.700', '0.34'),
(797, 12, 10, '[91,[12786.3,12594.9,0.0311279]]', '', '0.700', '0.34'),
(798, 47, 10, '[294,[8427.57,3328.11,0.0574608]]', '', '0.700', '0.34'),
(799, 10, 10, '[90,[5415.58,6186.02,0.0469246]]', '', '0.700', '0.34'),
(800, 48, 10, '[339,[5298.04,8531.94,0.0501747]]', '', '0.700', '0.34'),
(801, 12, 10, '[62,[4288.17,7869.8,0.0450974]]', '', '0.700', '0.34'),
(802, 47, 10, '[293,[8058,6558.82,0.0485535]]', '', '0.700', '0.34'),
(803, 10, 10, '[1,[16414,11521.6,0.0345001]]', '', '0.700', '0.34'),
(804, 12, 10, '[91,[11200.6,15657.3,0.0419388]]', '', '0.700', '0.34'),
(805, 47, 10, '[183,[16510.8,8259.83,0.0452576]]', '', '0.700', '0.34'),
(806, 10, 10, '[79,[16100.5,14243.9,0.0524826]]', '', '0.700', '0.34'),
(807, 48, 10, '[31,[15075.9,15924.6,0.0644913]]', '', '0.700', '0.34'),
(808, 12, 10, '[90,[11175.4,15818.8,0.0353546]]', '', '0.700', '0.34'),
(809, 47, 10, '[293,[15589.7,9072.52,0.0452518]]', '', '0.700', '0.34'),
(810, 10, 10, '[91,[15733.3,9512.98,0.0452595]]', '', '0.700', '0.34'),
(811, 48, 10, '[91,[14683.8,9881.79,0.0452595]]', '', '0.700', '0.34'),
(812, 12, 10, '[315,[13419.4,8650.89,0.0454712]]', '', '0.700', '0.34'),
(813, 47, 10, '[3,[14528.9,9956.16,0.0452671]]', '', '0.700', '0.34'),
(814, 12, 10, '[91,[15001.5,9881.99,0.0452595]]', '', '0.700', '0.34'),
(815, 14, 10, '[269,[5979.19,9939.29,0.0100784]]', '', '0.700', '0.34'),
(816, 14, 10, '[318,[7468.45,4436.98,0.0100784]]', '', '0.700', '0.34'),
(817, 14, 10, '[292,[4299.27,7984.63,0.00423813]]', '', '0.700', '0.34'),
(818, 14, 10, '[293,[15248.2,9745.34,-0.0358782]]', '', '0.700', '0.34'),
(819, 14, 10, '[293,[15493.8,9881.16,0.0145454]]', '', '0.700', '0.34'),
(820, 14, 10, '[293,[9066.47,8118.34,0.0128784]]', '', '0.700', '0.34'),
(821, 14, 10, '[273,[16184.7,10004.8,0.0109634]]', '', '0.700', '0.34'),
(822, 14, 10, '[293,[17030.3,6246.27,0.0174866]]', '', '0.700', '0.34'),
(823, 14, 10, '[293,[15270.5,9511.31,0.0100775]]', '', '0.700', '0.34'),
(824, 14, 10, '[356,[16098.2,8204.98,0.125397]]', '', '0.700', '0.34'),
(825, 14, 10, '[171,[16231.9,14855.5,0.0170135]]', '', '0.700', '0.34'),
(826, 14, 10, '[359,[14889.9,17936.8,0.00637054]]', '', '0.700', '0.34'),
(827, 14, 10, '[293,[1425.62,7193.55,0.0614738]]', '', '0.700', '0.34'),
(828, 14, 10, '[294,[6193.01,1521.38,0.182577]]', '', '0.700', '0.34'),
(829, 14, 10, '[171,[8537.62,20142.9,0.0104523]]', '', '0.700', '0.34'),
(830, 14, 10, '[227,[14825.1,11901.1,0.0316849]]', '', '0.700', '0.34'),
(831, 14, 10, '[221,[14642.6,12337.7,0.0271759]]', '', '0.700', '0.34'),
(832, 14, 10, '[232,[16447.9,12912.2,0.032845]]', '', '0.700', '0.34'),
(833, 14, 10, '[294,[8296.59,6950.21,0.253869]]', '', '0.700', '0.34'),
(834, 14, 10, '[6,[6532.7,9966.24,0.0240402]]', '', '0.700', '0.34'),
(835, 14, 10, '[340,[2123.28,7102.89,0.00970459]]', '', '0.700', '0.34'),
(836, 65, 10, '[180,[16116.4,13812.2,-0.000217438]]', '', '0.700', '0.34'),
(837, 65, 10, '[200,[17477.2,12276.4,0.0108566]]', '', '0.700', '0.34'),
(838, 65, 10, '[324,[4629.23,8336.25,0.10837]]', '', '0.700', '0.34'),
(839, 65, 10, '[273,[6671.33,8720.9,0.0102539]]', '', '0.700', '0.34'),
(840, 65, 10, '[293,[7600.95,4315.18,-0.000370026]]', '', '0.700', '0.34'),
(841, 65, 10, '[309,[9290.08,8222.67,-0.00038147]]', '', '0.700', '0.34'),
(842, 65, 10, '[311,[10295.3,6320.12,0.0368347]]', '', '0.700', '0.34'),
(843, 65, 10, '[126,[7805.89,9122.92,0.00511932]]', '', '0.700', '0.34'),
(844, 65, 10, '[319,[8723.51,2986.67,0.00176048]]', '', '0.700', '0.34'),
(845, 65, 10, '[94,[9381.76,4272.11,-0.000366211]]', '', '0.700', '0.34'),
(846, 81, 10, '[266,[2160.29,7085.14,0.00204849]]', '', '0.700', '0.34'),
(847, 81, 10, '[272,[2236.44,7065.34,0.00204086]]', '', '0.700', '0.34'),
(848, 25, 10, '[144,[3722.14,2355.7,-0.544513]]', '', '0.700', '0.34'),
(849, 25, 10, '[273,[11932.6,20890.1,-0.530017]]', '', '0.700', '0.34'),
(850, 25, 10, '[179,[11920.5,20888.2,-0.55589]]', '', '0.700', '0.34'),
(851, 82, 10, '[145,[15725.9,13419.4,0.0174866]]', '', '0.700', '0.34'),
(852, 25, 10, '[85,[13425.4,4308.68,-0.535668]]', '', '0.700', '0.34'),
(853, 25, 10, '[85,[13713.5,2884.49,-0.517073]]', '', '0.700', '0.34'),
(854, 29, 10, '[185,[9694.08,4451.54,-0.00769806]]', '', '0.700', '0.34'),
(855, 29, 10, '[340,[9697.81,4446.22,-0.00769806]]', '', '0.700', '0.34'),
(856, 58, 10, '[155,[9885.42,3154.16,-0.00692749]]', '', '0.700', '0.34'),
(857, 18, 10, '[110,[9887.89,3147.46,0.0118561]]', '', '0.700', '0.34'),
(858, 7, 10, '[310,[9897.35,3145.53,0.00969696]]', '', '0.700', '0.34'),
(859, 81, 10, '[345,[9900.03,3140.46,0.0110016]]', '', '0.700', '0.34'),
(860, 26, 10, '[330,[8542.83,6953.21,-0.608744]]', '', '0.700', '0.34'),
(861, 18, 10, '[90,[12262,15516.9,0]]', '', '0.700', '0.34'),
(862, 9, 10, '[87,[12158.4,15170.1,0.00104523]]', '', '0.700', '0.34'),
(863, 20, 10, '[90,[11822.1,15463.8,-0.00177765]]', '', '0.700', '0.34'),
(864, 10, 10, '[90,[11954.3,15065.7,0.0534363]]', '', '0.700', '0.34'),
(865, 25, 10, '[212,[10175.6,13971,-0.263998]]', '', '0.700', '0.34'),
(866, 25, 10, '[159,[10558.2,13938.9,-0.592891]]', '', '0.700', '0.34'),
(867, 25, 10, '[67,[10819.4,14116.8,-0.0761685]]', '', '0.700', '0.34'),
(868, 25, 10, '[241,[9526.37,14832.4,-0.440026]]', '', '0.700', '0.34'),
(869, 25, 10, '[281,[9509.38,14986.7,-0.416944]]', '', '0.700', '0.34'),
(870, 88, 10, '[220,[7940.75,5388.84,0.0183563]]', '', '0.700', '0.34'),
(871, 88, 10, '[135,[8950.19,3592.84,0.000854492]]', '', '0.700', '0.34'),
(872, 91, 10, '[218,[7722.66,7858.29,-0.184998]]', '', '0.700', '0.34'),
(873, 92, 1, '[122,[10137.868,12049.376,-6.1035156e-005]]', NULL, '0.250', '0.36'),
(874, 93, 1, '[0,[13441.056,12003.912,4.5776367e-005]]', NULL, '0.400', '0.36'),
(875, 94, 2, '[90,[5986.6792,7027.0684,4.863739e-005]]', NULL, '0.250', '0.39'),
(876, 55, 2, '[0,[3055.7537,6474.4546,-0.70897663]]', NULL, '0.650', '0.39'),
(877, 55, 2, '[180,[4318.3994,1878.7593,-0.66435003]]', NULL, '0.500', '0.39'),
(878, 53, 2, '[180,[1301.7004,1455.2246,-4.7683716e-006]]', NULL, '0.555', '0.39'),
(879, 53, 2, '[0,[6081.769,1671.0074,-1.0490417e-005]]', NULL, '0.555', '0.39'),
(880, 53, 2, '[150,[5508.1572,5060.7256,-1.2397766e-005]]', NULL, '0.555', '0.39'),
(881, 92, 2, '[180,[7519.2031,8273.2949,-2.1934509e-005]]', NULL, '0.500', '0.39'),
(882, 92, 2, '[90,[6952.7598,6430.978,9.5367432e-006]]', NULL, '0.500', '0.39'),
(883, 92, 2, '[90,[4183.8716,7572.7285,1.1444092e-005]]', NULL, '0.500', '0.39'),
(884, 54, 2, '[75,[3064.6106,7974.1719,-0.51635265]]', NULL, '0.500', '0.39'),
(885, 15, 15, '[0,[12140.168, 12622.802,0]]', NULL, '0.750', NULL),
(886, 2, 15, '[0,[6279.4966, 7810.3691,0]]', NULL, '0.750', NULL),
(887, 3, 15, '[45,[6865.2432,2481.6943,0]]', 'UAZ in Cherno.', '0.750', NULL),
(888, 4, 15, '[157,[3693.0386, 5969.1489,0]]', NULL, '0.750', NULL),
(889, 2, 15, '[20,[13264.081,12167.432,0]]', 'Black Lake UAZ.', '0.750', NULL),
(890, 2, 15, '[223,[4817.6572, 2556.5034,0]]', NULL, '0.750', NULL),
(891, 15, 15, '[337,[8120.3057,9305.4912,0]]', NULL, '0.750', NULL),
(892, 5, 15, '[337,[3312.2793,11270.755,0]]', NULL, '0.750', NULL),
(893, 5, 15, '[50,[3684.0366, 5999.0117,0]]', NULL, '0.750', NULL),
(894, 6, 15, '[202,[11464.035, 11381.071,0]]', NULL, '0.750', NULL),
(895, 5, 15, '[253,[11459.299,11386.546,0]]', NULL, '0.750', NULL),
(896, 6, 15, '[335,[8856.8359,2893.7903,0]]', NULL, '0.750', NULL),
(897, 7, 15, '[353,[12869.565,4450.4077,0]]', NULL, '0.750', NULL),
(898, 8, 15, '[223,[6288.416, 7834.3521,0]]', NULL, '0.750', NULL),
(899, 9, 15, '[306,[8125.7075,3166.3708,0]]', NULL, '0.750', NULL),
(900, 5, 15, '[284,[8854.9082,2891.5762,0]]', NULL, '0.750', NULL),
(901, 10, 15, '[291,[11945.78,9099.3633,0]]', NULL, '0.750', NULL),
(902, 11, 15, '[151,[6592.686,2906.8245,0]]', NULL, '0.750', NULL),
(903, 12, 15, '[372,[8762.8516, 11727.877,0]]', NULL, '0.750', NULL),
(904, 12, 15, '[52,[8713.4893, 7103.0518,0]]', NULL, '0.750', NULL),
(905, 13, 15, '[50,[8040.6777, 7086.5356,0]]', NULL, '0.750', NULL),
(906, 13, 15, '[316,[7943.5068,6988.1763,0]]', NULL, '0.750', NULL),
(907, 14, 15, '[201,[8070.6958, 3358.7793,0]]', NULL, '0.750', NULL),
(908, 14, 15, '[179,[3474.3989, 2562.4915,0]]', NULL, '0.750', NULL),
(909, 14, 15, '[236,[1773.9318,2351.6221,0]]', NULL, '0.750', NULL),
(910, 13, 15, '[236,[3699.9189,2474.2119,0]]', NULL, '0.750', NULL),
(911, 13, 15, '[73,[8350.0947, 2480.542,0]]', NULL, '0.750', NULL),
(912, 14, 15, '[35,[8345.7227, 2482.6855,0]]', NULL, '0.750', NULL),
(913, 13, 15, '[23,[3203.0916, 3988.6379,0]]', NULL, '0.750', NULL),
(914, 14, 15, '[191,[2782.7134,5285.5342,0]]', NULL, '0.750', NULL),
(915, 14, 15, '[155,[8680.75,2445.5315,0]]', NULL, '0.750', NULL),
(916, 13, 15, '[155,[12158.999,3468.7563,0]]', NULL, '0.750', NULL),
(917, 14, 15, '[250,[11984.01,3835.9231,0]]', NULL, '0.750', NULL),
(918, 13, 15, '[255,[10153.068,2219.3547,0]]', NULL, '0.750', NULL),
(919, 15, 15, '[60,[11279.154,4296.0205,0]]', 'UH1H at Rog Castle.', '0.750', NULL),
(920, 15, 15, '[133,[4211.8789,10735.168,0]]', NULL, '0.750', NULL),
(921, 15, 15, '[52,[6874.0503,11432.864,0]]', 'UH1H at Devils Castle.', '0.750', NULL),
(922, 15, 15, '[58,[10571.7,2220.3101,0.0015564]]', NULL, '0.750', NULL),
(923, 15, 15, '[359,[6377.8799,2757.8899,-0.048767101]]', NULL, '0.750', NULL),
(924, 16, 15, '[344,[2045.3989,7267.4165,0]]', NULL, '0.750', NULL),
(925, 16, 15, '[133,[8310.9902, 3348.3579,0]]', NULL, '0.750', NULL),
(926, 16, 15, '[124,[11309.963, 6646.3989,0]]', NULL, '0.750', NULL),
(927, 16, 15, '[6,[11240.744, 5370.6128,0]]', NULL, '0.750', NULL),
(928, 17, 15, '[230,[3762.5764,8736.1709,0]]', NULL, '0.750', NULL),
(929, 18, 15, '[279,[10628.433,8037.8188,0]]', NULL, '0.750', NULL),
(930, 18, 15, '[245,[4580.3203,4515.9282,0]]', NULL, '0.750', NULL),
(931, 17, 15, '[333,[6040.0923,7806.5439,0]]', NULL, '0.750', NULL),
(932, 18, 15, '[76,[10314.745, 2147.5374,0]]', NULL, '0.750', NULL),
(933, 17, 15, '[59,[6705.8887, 2991.9358,0]]', NULL, '0.750', NULL),
(934, 19, 15, '[195,[9681.8213,8947.2354,0]]', NULL, '0.750', NULL),
(935, 19, 15, '[262,[3825.1318,8941.4873,0]]', NULL, '0.750', NULL),
(936, 19, 15, '[19,[11246.52, 7534.7954,0]]', NULL, '0.750', NULL),
(937, 20, 15, '[19,[11066.828,7915.2275,0]]', NULL, '0.750', NULL),
(938, 20, 15, '[352,[12058.555,3577.8667,0]]', NULL, '0.750', NULL),
(939, 20, 15, '[218,[11940.854, 8872.8389,0]]', NULL, '0.750', NULL),
(940, 20, 15, '[346,[13386.471,6604.0098,0]]', NULL, '0.750', NULL),
(941, 21, 15, '[178,[13276.482, 6098.4463,0]]', NULL, '0.750', NULL),
(942, 22, 15, '[338,[1890.9952,12417.333,0]]', NULL, '0.750', NULL),
(943, 23, 15, '[226,[1975.1283, 9150.0195,0]]', NULL, '0.750', NULL),
(944, 23, 15, '[315,[7429.4849,5157.8682,0]]', NULL, '0.750', NULL),
(945, 24, 15, '[315,[8317.2676,2348.6055,0]]', NULL, '0.750', NULL),
(946, 24, 15, '[315,[13222.181,10015.431,0]]', NULL, '0.750', NULL),
(947, 25, 15, '[55,[13454.882, 13731.796,0]]', NULL, '0.750', NULL),
(948, 26, 15, '[245,[14417.589,12886.104,0]]', NULL, '0.750', NULL),
(949, 26, 15, '[268,[13098.13, 8250.8828,0]]', NULL, '0.750', NULL),
(950, 27, 15, '[205,[9731.1514,8937.7998,0]]', NULL, '0.750', NULL),
(951, 28, 15, '[337,[9715.0352,6522.8286,0]]', NULL, '0.750', NULL),
(952, 28, 15, '[241,[2614.0862,5079.6357,0]]', NULL, '0.750', NULL),
(953, 27, 15, '[18,[10827.634, 2701.5688,0]]', NULL, '0.750', NULL),
(954, 28, 15, '[222,[5165.7231,2375.7642,0]]', NULL, '0.750', NULL),
(955, 27, 15, '[207,[1740.8503,3622.6938,0]]', NULL, '0.750', NULL),
(956, 29, 15, '[266,[9157.8408, 11019.819,0]]', NULL, '0.750', NULL),
(957, 30, 15, '[222,[12360.468, 10817.882,0]]', NULL, '0.750', NULL),
(958, 92, 15, '[122,[10137.868,12049.376,-6.1035156e-005]]', NULL, '0.250', NULL),
(959, 93, 15, '[0,[13441.056,12003.912,4.5776367e-005]]', NULL, '0.400', NULL),
(960, 13, 15, '[-85,[7553.4033,5166.4795,0]]', NULL, '0.999', NULL),
(961, 14, 15, '[45,[3775.0356,2581.8835,-6.1988831e-006]]', NULL, '0.000', NULL),
(962, 14, 15, '[145,[3806.6174,2599.3567,2.6226044e-005]]', NULL, '0.000', NULL),
(963, 14, 15, '[-288,[3592.2278,2424.4521,-8.5830688e-006]]', NULL, '0.000', NULL),
(964, 47, 15, '[-3,[3273.4275,4927.2148,-1.5258789e-005]]', NULL, '0.000', NULL),
(965, 31, 15, '[91,[3285.4194,4912.7397,0]]', NULL, '0.000', NULL),
(966, 23, 15, '[-48,[3400.542,4912.4956,-1.5258789e-005]]', NULL, '0.000', NULL),
(967, 14, 15, '[-57,[3509.9658,4972.4209,-4.5776367e-005]]', NULL, '0.000', NULL),
(968, 20, 15, '[18,[4176.1387,12105.325,0]]', NULL, '0.000', NULL),
(969, 15, 15, '[-57,[5949.2549,10273.692,0.00015258789]]', NULL, '0.000', NULL),
(970, 21, 15, '[-160,[5911.3301,10382.807,6.1035156e-005]]', NULL, '0.000', NULL),
(971, 5, 15, '[42,[11342.836,12576.996,3.0517578e-005]]', NULL, '0.000', NULL),
(972, 6, 15, '[-49,[11331.372,12553.339,-0.00022888184]]', NULL, '0.000', NULL),
(973, 70, 15, '[176,[11564.142,10674.791,1.5258789e-005]]', NULL, '0.000', NULL),
(974, 68, 15, '[-86,[12316.446,10692.626,-8.392334e-005]]', NULL, '0.000', NULL),
(975, 74, 15, '[-175,[12283.883,10637.298,0]]', NULL, '0.000', NULL);
INSERT INTO `world_vehicle` (`id`, `vehicle_id`, `world_id`, `worldspace`, `description`, `chance`, `last_modified`) VALUES
(976, 16, 15, '[-70,[13152.617,10360.331,2.6226044e-005]]', NULL, '0.000', NULL),
(977, 82, 15, '[179,[12972.49,9707.2432,1.9073486e-005]]', NULL, '0.000', NULL),
(978, 173, 15, '[-81,[12880.91,9987.7305,9.059906e-006]]', NULL, '0.000', NULL),
(979, 32, 15, '[-81,[12881.346,9992.6416,4.0054321e-005]]', NULL, '0.000', NULL),
(980, 22, 15, '[193,[12697.407,9653.9131,3.8146973e-006]]', NULL, '0.000', NULL),
(981, 30, 15, '[22,[12227.921,9532.54,4.9591064e-005]]', NULL, '0.000', NULL),
(982, 65, 15, '[201,[12231.082,9531.4658,6.4849854e-005]]', NULL, '0.000', NULL),
(983, 13, 15, '[-68,[12221.395,9515.3066,6.1035156e-005]]', NULL, '0.000', NULL),
(984, 68, 15, '[199,[12236.792,9529.083,5.9127808e-005]]', NULL, '0.000', NULL),
(985, 81, 15, '[-158,[12233.797,9530.1553,6.2942505e-005]]', NULL, '0.000', NULL),
(986, 18, 15, '[-134,[12079.923,9021.1172,0.0001077652]]', NULL, '0.000', NULL),
(987, 98, 15, '[2,[6114.1606,6638.917,9.1552734e-005]]', NULL, '0.000', NULL),
(988, 99, 15, '[0,[6080.6074,5245.3237,0]]', NULL, '0.000', NULL),
(989, 100, 15, '[0,[5908.9541,3897.0596,6.1035156e-005]]', NULL, '0.000', NULL),
(990, 101, 15, '[0,[11277.121,6591.5894,3.0517578e-005]]', NULL, '0.000', NULL),
(991, 102, 15, '[0,[7014.3433,3073.9739,0]]', NULL, '0.000', NULL),
(992, 103, 15, '[0,[7007.3423,2774.4648,-4.5776367e-005]]', NULL, '0.000', NULL),
(993, 104, 15, '[0,[5293.2178,8669.2334,0]]', NULL, '0.000', NULL),
(994, 105, 15, '[0,[10344.022,1961.476,0.00010681152]]', NULL, '0.000', NULL),
(995, 106, 15, '[0,[7545.3135,6277.8677,-7.6293945e-005]]', NULL, '0.000', NULL),
(996, 107, 15, '[0,[7705.2373,5705.4487,0]]', NULL, '0.000', NULL),
(997, 108, 15, '[0,[8976.0313,7093.5933,0]]', NULL, '0.000', NULL),
(998, 109, 15, '[0,[10125.62,7076.603,-3.0517578e-005]]', NULL, '0.000', NULL),
(999, 110, 15, '[0,[9365.1768,10339.259,1.5258789e-005]]', NULL, '0.000', NULL),
(1000, 111, 15, '[0,[6611.2485,2952.5107,-1.5258789e-005]]', NULL, '0.000', NULL),
(1001, 112, 15, '[0,[5223.335,3730.4231,0]]', NULL, '0.000', NULL),
(1002, 113, 15, '[0,[8176.0034,6064.7891,0]]', NULL, '0.000', NULL),
(1003, 114, 15, '[0,[6775.4307,3073.9094,-1.5258789e-005]]', NULL, '0.000', NULL),
(1004, 115, 15, '[0,[2533.5959,6217.5142,0]]', NULL, '0.000', NULL),
(1005, 40, 15, '[0,[6037.7891,10294.385,0]]', NULL, '0.000', NULL),
(1006, 38, 15, '[0,[3117.7261,7987.7251,-1.5258789e-005]]', NULL, '0.000', NULL),
(1007, 39, 15, '[0,[6323.8286,6164.0942,0]]', NULL, '0.000', NULL),
(1008, 41, 15, '[0,[3000.4058,7593.6055,0]]', NULL, '0.000', NULL),
(1009, 116, 15, '[0,[5938.001,5588.9189,1.5258789e-005]]', NULL, '0.000', NULL),
(1010, 81, 15, '[0,[4480.3306,4609.5073,-1.5258789e-005]]', NULL, '0.000', NULL),
(1011, 90, 15, '[0,[6317.3306,6311.5054,4.5776367e-005]]', NULL, '0.000', NULL),
(1012, 118, 15, '[0,[6487.7583,2823.4817,0]]', NULL, '0.000', NULL),
(1013, 119, 15, '[0,[10483.229,2469.2148,0]]', NULL, '0.000', NULL),
(1014, 68, 15, '[0,[9013.835,4362.2329,7.6293945e-005]]', NULL, '0.000', NULL),
(1015, 46, 15, '[0,[1850.3549,2236.9011,-1.5258789e-005]]', NULL, '0.000', NULL),
(1016, 44, 15, '[0,[1766.417,3563.957,-1.5258789e-005]]', NULL, '0.000', NULL),
(1017, 120, 15, '[0,[10508.413,9755.3232,-3.0517578e-005]]', NULL, '0.000', NULL),
(1018, 121, 15, '[0,[9038.0381,8748.4922,-6.1035156e-005]]', NULL, '0.000', NULL),
(1019, 122, 15, '[0,[7536.9199,5022.2437,0.00012207031]]', NULL, '0.000', NULL),
(1020, 123, 15, '[0,[12118.647,9366.7783,0]]', NULL, '0.000', NULL),
(1021, 43, 15, '[0,[11739.137,9199.0508,0]]', NULL, '0.000', NULL),
(1022, 45, 15, '[0,[12704.429,9436.6934,0]]', NULL, '0.000', NULL),
(1023, 174, 15, '[0,[3713.7085,2494.7683,0]]', NULL, '0.000', NULL),
(1024, 124, 15, '[0,[1730.6525,3847.9424,0]]', NULL, '0.000', NULL),
(1025, 50, 15, '[0,[6850.8965,3055.1875,4.5776367e-005]]', NULL, '0.000', NULL),
(1026, 11, 15, '[0,[3473.3091,2375.6919,4.5776367e-005]]', NULL, '0.000', NULL),
(1027, 48, 15, '[0,[8091.8906,3112.7715,1.5258789e-005]]', NULL, '0.000', NULL),
(1028, 10, 15, '[0,[5203.2183,4159.9229,1.5258789e-005]]', NULL, '0.000', NULL),
(1029, 47, 15, '[0,[7019.9424,2788.3901,7.6293945e-005]]', NULL, '0.000', NULL),
(1030, 49, 15, '[0,[7570.0347,4593.2427,3.0517578e-005]]', NULL, '0.000', NULL),
(1031, 125, 15, '[0,[12861.412,8683.9492,-4.5776367e-005]]', NULL, '0.000', NULL),
(1032, 13, 15, '[0,[6834.1997,2964.3601,0]]', NULL, '0.000', NULL),
(1033, 52, 15, '[0,[12519.997,9405.1904,-1.5258789e-005]]', NULL, '0.000', NULL),
(1034, 14, 15, '[0,[6496.3071,2971.5242,1.5258789e-005]]', NULL, '0.000', NULL),
(1035, 23, 15, '[0,[11976.764,8655.9561,1.5258789e-005]]', NULL, '0.000', NULL),
(1036, 126, 15, '[0,[7366.5225,2746.9958,0]]', NULL, '0.000', NULL),
(1037, 127, 15, '[0,[12324.61,9590.2969,0]]', NULL, '0.000', NULL),
(1038, 96, 15, '[0,[7582.4214,3162.6917,3.0517578e-005]]', NULL, '0.000', NULL),
(1039, 20, 15, '[0,[12394.284,8867.9141,4.5776367e-005]]', NULL, '0.000', NULL),
(1040, 30, 15, '[0,[5553.668,5066.0171,-1.5258789e-005]]', NULL, '0.000', NULL),
(1041, 128, 15, '[0,[5844.9233,2154.6101,3.0517578e-005]]', NULL, '0.000', NULL),
(1042, 129, 15, '[0,[12225.816,9459.7285,3.0517578e-005]]', NULL, '0.000', NULL),
(1043, 130, 15, '[0,[12761.458,9830.0342,-1.5258789e-005]]', NULL, '0.000', NULL),
(1044, 131, 15, '[0,[10541.487,2723.7412,3.0517578e-005]]', NULL, '0.000', NULL),
(1045, 132, 15, '[0,[5932.9526,2429.687,-1.5258789e-005]]', NULL, '0.000', NULL),
(1046, 133, 15, '[0,[9881.2461,2027.999,0]]', NULL, '0.000', NULL),
(1047, 134, 15, '[0,[8872.5869,6521.1279,-1.5258789e-005]]', NULL, '0.000', NULL),
(1048, 135, 15, '[0,[10945.227,7581.3677,0]]', NULL, '0.000', NULL),
(1049, 136, 15, '[0,[9312.4863,9164.2783,7.6293945e-005]]', NULL, '0.000', NULL),
(1050, 137, 15, '[0,[10749.519,8116.7236,-3.0517578e-005]]', NULL, '0.000', NULL),
(1051, 138, 15, '[0,[8625.0166,2592.1509,-1.5258789e-005]]', NULL, '0.000', NULL),
(1052, 139, 15, '[0,[4368.0928,5805.7939,4.5776367e-005]]', NULL, '0.000', NULL),
(1053, 140, 15, '[0,[7757.3511,4798.5205,1.5258789e-005]]', NULL, '0.000', NULL),
(1054, 141, 15, '[0,[9489.3789,8182.0605,3.0517578e-005]]', NULL, '0.000', NULL),
(1055, 142, 15, '[0,[9571.6982,6603.6841,0]]', NULL, '0.000', NULL),
(1056, 80, 15, '[0,[4874.0718,7866.3184,0]]', NULL, '0.000', NULL),
(1057, 142, 15, '[0,[6102.5747,7774.293,0]]', NULL, '0.000', NULL),
(1058, 69, 15, '[0,[6715.9375,5728.4546,0]]', NULL, '0.000', NULL),
(1059, 143, 15, '[0,[8282.8467,4877.0703,0]]', NULL, '0.000', NULL),
(1060, 144, 15, '[0,[9728.7344,11020.661,-1.5258789e-005]]', NULL, '0.000', NULL),
(1061, 145, 15, '[0,[12350.067,3532.6978,1.5258789e-005]]', NULL, '0.000', NULL),
(1062, 146, 15, '[0,[7017.2275,7659.2393,-3.0517578e-005]]', NULL, '0.000', NULL),
(1063, 89, 15, '[0,[6667.1621,5376.7153,-3.0517578e-005]]', NULL, '0.000', NULL),
(1064, 32, 15, '[0,[4589.5264,6400.9756,0]]', NULL, '0.000', NULL),
(1065, 22, 15, '[0,[5898.1006,7881.6294,1.5258789e-005]]', NULL, '0.000', NULL),
(1066, 147, 15, '[0,[4778.5942,6766.8184,9.1552734e-005]]', NULL, '0.000', NULL),
(1067, 148, 15, '[0,[9300.2529,2047.8984,-1.5258789e-005]]', NULL, '0.000', NULL),
(1068, 149, 15, '[0,[6319.374,7615.7144,-3.0517578e-005]]', NULL, '0.000', NULL),
(1069, 150, 15, '[0,[5084.3604,6740.9048,-3.0517578e-005]]', NULL, '0.000', NULL),
(1070, 151, 15, '[0,[7406.4556,5794.0913,7.6293945e-005]]', NULL, '0.000', NULL),
(1071, 152, 15, '[0,[11133.212,6624.1382,-4.5776367e-005]]', NULL, '0.000', NULL),
(1072, 154, 15, '[-58,[5219.9409,2223.1462,0]]', NULL, '0.000', NULL),
(1073, 154, 15, '[0,[1940.1135,9132.7764,6.1035156e-005]]', NULL, '0.000', NULL),
(1074, 155, 15, '[0,[6874.2979,11432.363,9.1552734e-005]]', NULL, '0.000', NULL),
(1075, 176, 15, '[0,[7088.2144,8477.1553,-3.0517578e-005]]', NULL, '0.000', NULL),
(1076, 97, 15, '[0,[11042.623,7010.0371,3.0517578e-005]]', NULL, '0.000', NULL),
(1077, 156, 15, '[106,[6532.8184,5600.0234,0.00010681152]]', NULL, '0.000', NULL),
(1078, 157, 15, '[124,[12410.937,12593.578,-4.5776367e-005]]', NULL, '0.000', NULL),
(1079, 158, 15, '[125,[4575.9517,10216.254,1.5258789e-005]]', NULL, '0.000', NULL),
(1080, 159, 15, '[119,[7792.5859,5126.7939,4.5776367e-005]]', NULL, '0.000', NULL),
(1081, 160, 15, '[126,[6733.2314,5920.5625,0]]', NULL, '0.000', NULL),
(1082, 161, 15, '[106,[8577.7539,9239.4834,-3.0517578e-005]]', NULL, '0.000', NULL),
(1083, 15, 15, '[106,[13706.609,2933.5234,-3.0517578e-005]]', NULL, '0.000', NULL),
(1084, 162, 15, '[106,[4603.0996,10438.683,-4.5776367e-005]]', NULL, '0.000', NULL),
(1085, 163, 15, '[326,[4793.7363,9808.5225,3.0517578e-005]]', NULL, '0.000', NULL),
(1086, 164, 15, '[325,[4830.48,9750.0811,-0.00015258789]]', NULL, '0.000', NULL),
(1087, 165, 15, '[323,[4863.6563,9703.2188,-6.1035156e-005]]', NULL, '0.000', NULL),
(1088, 166, 15, '[328,[4765.8496,9851.0107,-0.00015258789]]', NULL, '0.000', NULL),
(1089, 167, 15, '[0,[8566.9395,6790.355,0]]', NULL, '0.000', NULL),
(1090, 167, 15, '[0,[10331.3,5085.4355,0.00010681152]]', NULL, '0.000', NULL),
(1091, 167, 15, '[0,[5689.8887,3049.0398,-3.0517578e-005]]', NULL, '0.000', NULL),
(1092, 167, 15, '[0,[12399.468,3551.0505,0]]', NULL, '0.000', NULL),
(1093, 167, 15, '[0,[8638.415,4503.7104,-3.0517578e-005]]', NULL, '0.000', NULL),
(1094, 167, 15, '[0,[6081.2271,3644.3618,-7.6293945e-005]]', NULL, '0.000', NULL),
(1095, 113, 15, '[0,[8558.6035,10266.275,-1.5258789e-005]]', NULL, '0.000', NULL),
(1096, 113, 15, '[0,[6447.8086,3747.2095,-3.0517578e-005]]', NULL, '0.000', NULL),
(1097, 113, 15, '[0,[12602.82,9482.0088,-6.1035156e-005]]', NULL, '0.000', NULL),
(1098, 113, 15, '[0,[10011.31,5966.0137,-1.5258789e-005]]', NULL, '0.000', NULL),
(1099, 113, 15, '[0,[4986.6763,2370.2004,-3.0517578e-005]]', NULL, '0.000', NULL),
(1100, 113, 15, '[0,[10680.48,2489.4585,1.5258789e-005]]', NULL, '0.000', NULL),
(1101, 95, 15, '[112,[7609.127,5040.5688,0]]', NULL, '0.000', NULL),
(1102, 168, 15, '[109,[7657.4678,5089.9204,-1.5258789e-005]]', NULL, '0.000', NULL),
(1103, 169, 15, '[123,[8659.5869,6344.8281,0]]', NULL, '0.000', NULL),
(1104, 170, 15, '[114,[7649.0449,5039.7173,9.1552734e-005]]', NULL, '0.000', NULL),
(1105, 171, 15, '[0,[13651.782,8899.4092,4.6491623e-006]]', NULL, '0.000', NULL),
(1106, 171, 15, '[0,[13682.838,4751.8242,4.2766333e-006]]', NULL, '0.000', NULL),
(1107, 171, 15, '[0,[12608.327,2926.3896,-4.2319298e-006]]', NULL, '0.000', NULL),
(1108, 171, 15, '[0,[11248.106,2678.0313,-6.9439411e-006]]', NULL, '0.000', NULL),
(1109, 171, 15, '[0,[10141.306,1686.3584,-1.0728836e-006]]', NULL, '0.000', NULL),
(1110, 171, 15, '[0,[10225.676,1696.9014,4.6938658e-006]]', NULL, '0.000', NULL),
(1111, 171, 15, '[0,[10061.154,1722.2041,2.0265579e-006]]', NULL, '0.000', NULL),
(1112, 171, 15, '[0,[7799.3281,2707.46,-5.0216913e-006]]', NULL, '0.000', NULL),
(1113, 171, 15, '[0,[7027.0903,2230.0347,-3.4272671e-007]]', NULL, '0.000', NULL),
(1114, 171, 15, '[0,[7011.5835,2261.4053,2.4914742e-005]]', NULL, '0.000', NULL),
(1115, 171, 15, '[0,[4967.8535,1749.2676,2.0861626e-007]]', NULL, '0.000', NULL),
(1116, 171, 15, '[0,[4053.4082,1837.376,-4.1276217e-006]]', NULL, '0.000', NULL),
(1117, 171, 15, '[0,[3486.0107,1391.3213,-7.0184469e-006]]', NULL, '0.000', NULL),
(1118, 177, 15, '[0,[7367.1523,2359.583,0]]', NULL, '0.000', NULL),
(1119, 178, 15, '[-14,[7088.3691,2076.3958,-0.011839807]]', NULL, '0.000', NULL),
(1120, 172, 15, '[76,[7443.2441,1975.8053,0.13510592]]', NULL, '0.000', NULL),
(1121, 179, 15, '[173,[7947.6343,1909.8322,0.088570133]]', NULL, '0.000', NULL),
(1122, 51, 15, '[0,[7616.8931,2461.9043,-0.013551086]]', NULL, '0.000', NULL),
(1123, 180, 15, '[0,[7541.5049,2461.9673,-0.034575582]]', NULL, '0.000', NULL),
(1124, 181, 15, '[0,[7601.6987,2516.8779,0.016494066]]', NULL, '0.000', NULL),
(1125, 25, 15, '[-152,[8571.5469,2276.0195,0]]', NULL, '0.000', NULL),
(1126, 25, 15, '[-152,[15442.939,13286.639,0]]', NULL, '0.000', NULL),
(1127, 25, 15, '[-152,[14294.525,13222.859,0]]', NULL, '0.000', NULL),
(1128, 25, 15, '[-152,[10297.322,3706.1509,2.5356522]]', NULL, '0.000', NULL),
(1129, 25, 15, '[-152,[10294.462,3678.7656,2.535656]]', NULL, '0.000', NULL),
(1130, 25, 15, '[-152,[10283.775,3693.0605,2.535656]]', NULL, '0.000', NULL),
(1131, 179, 15, '[0,[10758.22,1725.3232,0]]', NULL, '0.000', NULL),
(1132, 182, 15, '[0,[10260.75,1729.9375,0]]', NULL, '0.000', NULL),
(1133, 182, 15, '[0,[10234.608,1737.842,0]]', NULL, '0.000', NULL),
(1134, 182, 15, '[0,[10204.44,1730.7139,0]]', NULL, '0.000', NULL),
(1135, 182, 15, '[0,[3882.5781,2101.8777,-1.3411045e-006]]', NULL, '0.000', NULL),
(1136, 182, 15, '[0,[1566.7178,1813.7136,0]]', NULL, '0.000', NULL),
(1137, 182, 15, '[0,[1278.4561,2126.2986,0]]', NULL, '0.000', NULL),
(1138, 183, 15, '[0,[2081.0359,2109.2539,0]]', NULL, '0.000', NULL),
(1139, 183, 15, '[-87,[3968.7034,2262.6655,0]]', NULL, '0.000', NULL),
(1140, 183, 15, '[0,[7130.4604,2332.2463,0]]', NULL, '0.000', NULL),
(1141, 183, 15, '[0,[7090.3848,2292.1838,0]]', NULL, '0.000', NULL),
(1142, 183, 15, '[0,[6993.3594,2273.2068,0]]', NULL, '0.000', NULL),
(1143, 183, 15, '[0,[10168.12,1720.0845,0]]', NULL, '0.000', NULL),
(1144, 183, 15, '[0,[10066.361,1717.663,0]]', NULL, '0.000', NULL),
(1145, 183, 15, '[0,[10026.788,1689.4053,0]]', NULL, '0.000', NULL),
(1146, 183, 15, '[0,[10116.434,1717.663,0]]', NULL, '0.000', NULL),
(1147, 183, 15, '[0,[11760.784,2684.1174,0]]', NULL, '0.000', NULL),
(1148, 183, 15, '[0,[11440.12,2952.6909,0]]', NULL, '0.000', NULL),
(1149, 183, 15, '[0,[12735.777,3095.6423,0]]', NULL, '0.000', NULL),
(1150, 183, 15, '[0,[12523.446,2796.7446,0]]', NULL, '0.000', NULL),
(1151, 183, 15, '[0,[11578.786,2190.2866,0]]', NULL, '0.000', NULL),
(1152, 183, 15, '[0,[11050.124,1913.0475,0]]', NULL, '0.000', NULL),
(1153, 183, 15, '[0,[10703.459,1891.3889,0]]', NULL, '0.000', NULL),
(1154, 183, 15, '[0,[14339.1,4871.6997,0]]', NULL, '0.000', NULL),
(1155, 183, 15, '[0,[13849.438,5590.7856,0]]', NULL, '0.000', NULL),
(1156, 183, 15, '[0,[13767.104,5976.3198,0]]', NULL, '0.000', NULL),
(1157, 183, 15, '[0,[13858.104,6513.4688,0]]', NULL, '0.000', NULL),
(1158, 183, 15, '[0,[13845.103,6699.7383,0]]', NULL, '0.000', NULL),
(1159, 184, 15, '[-158,[12094.806,12625.431,0]]', NULL, '0.000', NULL),
(1160, 185, 15, '[0,[13520.578,10538.28,-5.364418e-007]]', NULL, '0.000', NULL),
(1161, 185, 15, '[0,[13400.352,10599.427,-6.8545341e-007]]', NULL, '0.000', NULL),
(1162, 185, 15, '[0,[13334.964,10439.178,5.4836273e-006]]', NULL, '0.000', NULL),
(1163, 185, 15, '[0,[13221.065,10342.186,5.9604645e-006]]', NULL, '0.000', NULL),
(1164, 185, 15, '[0,[13237.939,10186.153,2.8908253e-006]]', NULL, '0.000', NULL),
(1165, 185, 15, '[0,[13254.813,10162.96,-4.7981739e-006]]', NULL, '0.000', NULL),
(1166, 185, 15, '[0,[13045.998,9804.5098,6.3478947e-006]]', NULL, '0.000', NULL),
(1167, 185, 15, '[0,[13035.452,9726.4941,6.5118074e-006]]', NULL, '0.000', NULL),
(1168, 185, 15, '[0,[12864.486,3597.7793,1.7106533e-005]]', NULL, '0.000', NULL),
(1169, 185, 15, '[0,[12773.226,3506.5488,-2.3633242e-005]]', NULL, '0.000', NULL),
(1170, 185, 15, '[0,[12252.315,3432.2754,-6.5267086e-006]]', NULL, '0.000', NULL),
(1171, 168, 15, '[0,[8156.4854,2751.8926,5.0887465e-006]]', NULL, '0.000', NULL),
(1172, 168, 15, '[0,[7613.9727,3006.2285,-2.1383166e-006]]', NULL, '0.000', NULL),
(1173, 168, 15, '[0,[7804.7881,3054.8516,-7.1227551e-006]]', NULL, '0.000', NULL),
(1174, 168, 15, '[0,[5376.5776,1878.5566,-4.7385693e-006]]', NULL, '0.000', NULL),
(1175, 168, 15, '[0,[4822.8408,1968.3203,1.5795231e-006]]', NULL, '0.000', NULL),
(1176, 168, 15, '[0,[4280.3281,2140.3711,1.3709068e-006]]', NULL, '0.000', NULL),
(1177, 168, 15, '[0,[4141.894,2263.7979,2.682209e-007]]', NULL, '0.000', NULL),
(1178, 168, 15, '[0,[3874.3794,2157.2021,3.7252903e-007]]', NULL, '0.000', NULL),
(1179, 186, 15, '[-154,[11935.563,12669.051,-1.5258789e-005]]', NULL, '0.000', NULL);

-- --------------------------------------------------------

--
-- Structure for view `v_deployable`
--
DROP TABLE IF EXISTS `v_deployable`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_deployable` AS select `id`.`id` AS `instance_deployable_id`,`d`.`id` AS `vehicle_id`,`d`.`class_name` AS `class_name`,`s`.`id` AS `owner_id`,`p`.`name` AS `owner_name`,`p`.`unique_id` AS `owner_unique_id`,`s`.`is_dead` AS `is_owner_dead`,`id`.`worldspace` AS `worldspace`,`id`.`inventory` AS `inventory` from (((`instance_deployable` `id` join `deployable` `d` on((`id`.`deployable_id` = `d`.`id`))) join `survivor` `s` on((`id`.`owner_id` = `s`.`id`))) join `profile` `p` on((`s`.`unique_id` = `p`.`unique_id`)));

-- --------------------------------------------------------

--
-- Structure for view `v_player`
--
DROP TABLE IF EXISTS `v_player`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_player` AS select `p`.`name` AS `player_name`,`p`.`humanity` AS `humanity`,`s`.`id` AS `alive_survivor_id`,`s`.`world_id` AS `alive_survivor_world_id` from (`profile` `p` left join `survivor` `s` on(((`p`.`unique_id` = `s`.`unique_id`) and (`s`.`is_dead` = 0))));

-- --------------------------------------------------------

--
-- Structure for view `v_vehicle`
--
DROP TABLE IF EXISTS `v_vehicle`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_vehicle` AS select `iv`.`id` AS `instance_vehicle_id`,`v`.`id` AS `vehicle_id`,`iv`.`instance_id` AS `instance_id`,`i`.`world_id` AS `world_id`,`v`.`class_name` AS `class_name`,`iv`.`worldspace` AS `worldspace`,`iv`.`inventory` AS `inventory`,`iv`.`parts` AS `parts`,`iv`.`damage` AS `damage`,`iv`.`fuel` AS `fuel` from (((`instance_vehicle` `iv` join `world_vehicle` `wv` on((`iv`.`world_vehicle_id` = `wv`.`id`))) join `vehicle` `v` on((`wv`.`vehicle_id` = `v`.`id`))) join `instance` `i` on((`iv`.`instance_id` = `i`.`id`)));

--
-- Constraints for dumped tables
--

--
-- Constraints for table `instance`
--
ALTER TABLE `instance`
  ADD CONSTRAINT `instance_ibfk_1` FOREIGN KEY (`world_id`) REFERENCES `world` (`id`);

--
-- Constraints for table `instance_deployable`
--
ALTER TABLE `instance_deployable`
  ADD CONSTRAINT `instance_deployable_ibfk_1` FOREIGN KEY (`instance_id`) REFERENCES `instance` (`id`),
  ADD CONSTRAINT `instance_deployable_ibfk_2` FOREIGN KEY (`owner_id`) REFERENCES `survivor` (`id`),
  ADD CONSTRAINT `instance_deployable_ibfk_3` FOREIGN KEY (`deployable_id`) REFERENCES `deployable` (`id`);

--
-- Constraints for table `instance_vehicle`
--
ALTER TABLE `instance_vehicle`
  ADD CONSTRAINT `fk3_instance_vehicle` FOREIGN KEY (`world_vehicle_id`) REFERENCES `world_vehicle` (`id`),
  ADD CONSTRAINT `instance_vehicle_ibfk_1` FOREIGN KEY (`instance_id`) REFERENCES `instance` (`id`);

--
-- Constraints for table `log_entry`
--
ALTER TABLE `log_entry`
  ADD CONSTRAINT `fk1_log_entry` FOREIGN KEY (`log_code_id`) REFERENCES `log_code` (`id`);

--
-- Constraints for table `world_vehicle`
--
ALTER TABLE `world_vehicle`
  ADD CONSTRAINT `world_vehicle_ibfk_1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`),
  ADD CONSTRAINT `world_vehicle_ibfk_2` FOREIGN KEY (`world_id`) REFERENCES `world` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
