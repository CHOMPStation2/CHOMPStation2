-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               10.5.4-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for ss13
CREATE DATABASE IF NOT EXISTS `ss13` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ss13`;

-- Dumping structure for table ss13.death
CREATE TABLE IF NOT EXISTS `death` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pod` text DEFAULT NULL COMMENT 'Place of death',
  `coord` text DEFAULT NULL COMMENT 'X, Y, Z POD',
  `tod` datetime DEFAULT NULL COMMENT 'Time of death',
  `job` text DEFAULT NULL,
  `special` text DEFAULT NULL,
  `name` text DEFAULT NULL,
  `byondkey` text NOT NULL,
  `laname` text DEFAULT NULL COMMENT 'Last attacker name',
  `lakey` text DEFAULT NULL COMMENT 'Last attacker key',
  `gender` text DEFAULT NULL,
  `bruteloss` int(11) DEFAULT NULL,
  `brainloss` int(11) DEFAULT NULL,
  `fireloss` int(11) DEFAULT NULL,
  `oxyloss` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=13926 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table ss13.erro_admin
CREATE TABLE IF NOT EXISTS `erro_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ckey` varchar(32) NOT NULL,
  `rank` varchar(32) NOT NULL DEFAULT 'Administrator',
  `level` int(2) NOT NULL DEFAULT 0,
  `flags` int(16) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table ss13.erro_admin_log
CREATE TABLE IF NOT EXISTS `erro_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `adminckey` varchar(32) NOT NULL,
  `adminip` varchar(18) NOT NULL,
  `log` text NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table ss13.erro_attacklog
CREATE TABLE IF NOT EXISTS `erro_attacklog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `ckey` varchar(64) DEFAULT NULL,
  `mob` varchar(128) DEFAULT NULL,
  `message` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=886 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table ss13.erro_ban
CREATE TABLE IF NOT EXISTS `erro_ban` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bantime` datetime NOT NULL,
  `serverip` varchar(32) NOT NULL,
  `bantype` varchar(32) NOT NULL,
  `reason` text NOT NULL,
  `job` varchar(32) DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `rounds` int(11) DEFAULT NULL,
  `expiration_time` datetime NOT NULL,
  `ckey` varchar(32) NOT NULL,
  `computerid` varchar(32) NOT NULL,
  `ip` varchar(32) NOT NULL,
  `a_ckey` varchar(32) NOT NULL,
  `a_computerid` varchar(32) NOT NULL,
  `a_ip` varchar(32) NOT NULL,
  `who` text NOT NULL,
  `adminwho` text NOT NULL,
  `edits` text DEFAULT NULL,
  `unbanned` tinyint(1) DEFAULT NULL,
  `unbanned_datetime` datetime DEFAULT NULL,
  `unbanned_ckey` varchar(32) DEFAULT NULL,
  `unbanned_computerid` varchar(32) DEFAULT NULL,
  `unbanned_ip` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table ss13.erro_connection_log
CREATE TABLE IF NOT EXISTS `erro_connection_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `serverip` varchar(64) NOT NULL,
  `ckey` varchar(64) NOT NULL,
  `ip` varchar(64) NOT NULL,
  `computerid` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12353 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table ss13.erro_dialog
CREATE TABLE IF NOT EXISTS `erro_dialog` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `ckey` varchar(32) NOT NULL,
  `mob` varchar(128) DEFAULT NULL,
  `type` varchar(32) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=3345 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table ss13.erro_feedback
CREATE TABLE IF NOT EXISTS `erro_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `round_id` int(8) NOT NULL,
  `var_name` varchar(32) NOT NULL,
  `var_value` int(16) DEFAULT NULL,
  `details` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=68050 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table ss13.erro_player
CREATE TABLE IF NOT EXISTS `erro_player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ckey` varchar(32) NOT NULL,
  `firstseen` datetime NOT NULL,
  `lastseen` datetime NOT NULL,
  `ip` varchar(18) NOT NULL,
  `computerid` varchar(32) NOT NULL,
  `lastadminrank` varchar(32) NOT NULL DEFAULT 'Player',
  `discord_id` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `ckey` (`ckey`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1349 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table ss13.erro_poll_option
CREATE TABLE IF NOT EXISTS `erro_poll_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pollid` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `percentagecalc` tinyint(1) NOT NULL DEFAULT 1,
  `minval` int(3) DEFAULT NULL,
  `maxval` int(3) DEFAULT NULL,
  `descmin` varchar(32) DEFAULT NULL,
  `descmid` varchar(32) DEFAULT NULL,
  `descmax` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table ss13.erro_poll_question
CREATE TABLE IF NOT EXISTS `erro_poll_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `polltype` varchar(16) NOT NULL DEFAULT 'OPTION',
  `starttime` datetime NOT NULL,
  `endtime` datetime NOT NULL,
  `question` varchar(255) NOT NULL,
  `adminonly` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table ss13.erro_poll_textreply
CREATE TABLE IF NOT EXISTS `erro_poll_textreply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `pollid` int(11) NOT NULL,
  `ckey` varchar(32) NOT NULL,
  `ip` varchar(18) NOT NULL,
  `replytext` text NOT NULL,
  `adminrank` varchar(32) NOT NULL DEFAULT 'Player',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table ss13.erro_poll_vote
CREATE TABLE IF NOT EXISTS `erro_poll_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `pollid` int(11) NOT NULL,
  `optionid` int(11) NOT NULL,
  `ckey` varchar(255) NOT NULL,
  `ip` varchar(16) NOT NULL,
  `adminrank` varchar(32) NOT NULL,
  `rating` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table ss13.erro_privacy
CREATE TABLE IF NOT EXISTS `erro_privacy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `ckey` varchar(32) NOT NULL,
  `option` varchar(128) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=763 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- Dumping structure for table ss13.karma
CREATE TABLE IF NOT EXISTS `karma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spendername` text NOT NULL,
  `spenderkey` text NOT NULL,
  `receivername` text NOT NULL,
  `receiverkey` text NOT NULL,
  `receiverrole` text NOT NULL,
  `receiverspecial` text NOT NULL,
  `isnegative` tinyint(1) NOT NULL,
  `spenderip` text NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=943 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table ss13.karmatotals
CREATE TABLE IF NOT EXISTS `karmatotals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `byondkey` text NOT NULL,
  `karma` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=244 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table ss13.library
CREATE TABLE IF NOT EXISTS `library` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` text NOT NULL,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `category` text NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=300 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table ss13.population
CREATE TABLE IF NOT EXISTS `population` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playercount` int(11) DEFAULT NULL,
  `admincount` int(11) DEFAULT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3627 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table ss13.vr_player_hours
CREATE TABLE IF NOT EXISTS `vr_player_hours` (
  `ckey` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `department` varchar(64) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `hours` double NOT NULL,
  `total_hours` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`ckey`,`department`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Data exporting was unselected.

-- CHOMPedit Start
CREATE TABLE IF NOT EXISTS `erro_mentor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ckey` varchar(32) NOT NULL,
  `mentor` int(16) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

CREATE TABLE IF NOT EXISTS `round` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `initialize_datetime` DATETIME NOT NULL,
  `start_datetime` DATETIME NULL,
  `shutdown_datetime` DATETIME NULL,
  `end_datetime` DATETIME NULL,
  `server_ip` INT(10) UNSIGNED NOT NULL,
  `server_port` SMALLINT(5) UNSIGNED NOT NULL,
  `commit_hash` CHAR(40) NULL,
  `game_mode` VARCHAR(32) NULL,
  `game_mode_result` VARCHAR(64) NULL,
  `end_state` VARCHAR(64) NULL,
  `shuttle_name` VARCHAR(64) NULL,
  `map_name` VARCHAR(32) NULL,
  `station_name` VARCHAR(80) NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
-- CHOMPedit End

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
