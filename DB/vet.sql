-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server versie:                5.6.21 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Versie:              9.2.0.4947
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Databasestructuur van vet wordt geschreven
CREATE DATABASE IF NOT EXISTS `vet` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `vet`;


-- Structuur van  tabel vet.consultatie wordt geschreven
CREATE TABLE IF NOT EXISTS `consultatie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gewicht` decimal(10,0) NOT NULL DEFAULT '0',
  `dierId` int(11) NOT NULL DEFAULT '0',
  `artsId` int(11) NOT NULL DEFAULT '0',
  `datum` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `notitie` text,
  `medbeeld` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Consultatie_Dier` (`dierId`),
  KEY `FK_Consultatie_Arts` (`artsId`),
  CONSTRAINT `FK_Consultatie_Arts` FOREIGN KEY (`artsId`) REFERENCES `dierenarts` (`id`),
  CONSTRAINT `FK_Consultatie_Dier` FOREIGN KEY (`dierId`) REFERENCES `dier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumpen data van tabel vet.consultatie: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `consultatie` DISABLE KEYS */;
/*!40000 ALTER TABLE `consultatie` ENABLE KEYS */;


-- Structuur van  tabel vet.dier wordt geschreven
CREATE TABLE IF NOT EXISTS `dier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naam` varchar(50) NOT NULL DEFAULT '0',
  `stamboomnaam` varchar(100) NOT NULL DEFAULT 'Geen stamboomnaam',
  `soort` varchar(50) NOT NULL DEFAULT '0',
  `ras` varchar(50) NOT NULL DEFAULT '0',
  `geboortedatum` date NOT NULL,
  `chipnummer` varchar(50) NOT NULL DEFAULT '0',
  `paspoortnummer` varchar(50) NOT NULL DEFAULT '0',
  `kleur` text NOT NULL,
  `klantId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_Klant_Dier` (`klantId`),
  CONSTRAINT `FK_Klant_Dier` FOREIGN KEY (`klantId`) REFERENCES `klant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumpen data van tabel vet.dier: ~1 rows (ongeveer)
/*!40000 ALTER TABLE `dier` DISABLE KEYS */;
INSERT INTO `dier` (`id`, `naam`, `stamboomnaam`, `soort`, `ras`, `geboortedatum`, `chipnummer`, `paspoortnummer`, `kleur`, `klantId`) VALUES
	(6, 'Rocky', 'St.-Hubertus', 'hond', 'Mopshond', '0000-00-00', '1', '1', 'beige', 2);
/*!40000 ALTER TABLE `dier` ENABLE KEYS */;


-- Structuur van  tabel vet.dierenarts wordt geschreven
CREATE TABLE IF NOT EXISTS `dierenarts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naam` varchar(50) NOT NULL DEFAULT '0',
  `voornaam` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumpen data van tabel vet.dierenarts: ~0 rows (ongeveer)
/*!40000 ALTER TABLE `dierenarts` DISABLE KEYS */;
/*!40000 ALTER TABLE `dierenarts` ENABLE KEYS */;


-- Structuur van  tabel vet.klant wordt geschreven
CREATE TABLE IF NOT EXISTS `klant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naam` varchar(50) NOT NULL DEFAULT '0',
  `voornaam` varchar(50) NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '0',
  `straat` varchar(100) NOT NULL DEFAULT '0',
  `wachtwoord` varchar(100) NOT NULL DEFAULT '0',
  `huisnummer` varchar(50) NOT NULL DEFAULT '0',
  `postcode` char(4) NOT NULL DEFAULT '0',
  `woonplaats` varchar(150) NOT NULL DEFAULT '0',
  `tel` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumpen data van tabel vet.klant: ~2 rows (ongeveer)
/*!40000 ALTER TABLE `klant` DISABLE KEYS */;
INSERT INTO `klant` (`id`, `naam`, `voornaam`, `email`, `straat`, `wachtwoord`, `huisnummer`, `postcode`, `woonplaats`, `tel`) VALUES
	(2, 'Heindryckx', 'Sarah', 'sarah.heindryckx@hotmail.com', 'Spanjaardstraat', '123', '24', '8830', 'Hooglede', '0497455712'),
	(3, 'ExampleLn', 'ExampleFn', 'example@hexample.com', 'Examplestreet', '123', '1', '1111', 'ExampleCity', '1111111111');
/*!40000 ALTER TABLE `klant` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
