-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Gegenereerd op: 09 jul 2015 om 15:57
-- Serverversie: 5.6.24
-- PHP-versie: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `vet`
--
CREATE DATABASE IF NOT EXISTS `vet` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `vet`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `consultatie`
--

CREATE TABLE IF NOT EXISTS `consultatie` (
  `id` int(11) NOT NULL,
  `gewicht` decimal(10,0) NOT NULL DEFAULT '0',
  `dierId` int(11) NOT NULL DEFAULT '0',
  `datum` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `notitie` text,
  `dierenartsId` int(11) NOT NULL,
  `vaccinatieId` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `dier`
--

CREATE TABLE IF NOT EXISTS `dier` (
  `id` int(11) NOT NULL,
  `naam` varchar(50) NOT NULL DEFAULT '0',
  `stamboomnaam` varchar(100) NOT NULL DEFAULT 'Geen stamboomnaam',
  `soort` varchar(50) NOT NULL DEFAULT '0',
  `ras` varchar(50) NOT NULL DEFAULT '0',
  `geboortedatum` date NOT NULL,
  `chipnummer` varchar(50) NOT NULL DEFAULT '0',
  `paspoortnummer` varchar(50) NOT NULL DEFAULT '0',
  `kleur` text NOT NULL,
  `medbeeld` varchar(100) NOT NULL,
  `klantId` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `dier`
--

INSERT INTO `dier` (`id`, `naam`, `stamboomnaam`, `soort`, `ras`, `geboortedatum`, `chipnummer`, `paspoortnummer`, `kleur`, `medbeeld`, `klantId`) VALUES
(6, 'Rocky', 'St.-Hubertus', 'hond', 'Mopshond', '0000-00-00', '1', '1', 'beige', 'voorbeeld.jpg', 2);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `dierenarts`
--

CREATE TABLE IF NOT EXISTS `dierenarts` (
  `id` int(11) NOT NULL,
  `naam` varchar(50) NOT NULL,
  `voornaam` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `straat` varchar(100) NOT NULL,
  `wachtwoord` varchar(100) NOT NULL,
  `huisnr` varchar(50) NOT NULL,
  `postcode` char(4) NOT NULL,
  `woonplaats` varchar(150) NOT NULL,
  `tel` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `klant`
--

CREATE TABLE IF NOT EXISTS `klant` (
  `id` int(11) NOT NULL,
  `naam` varchar(50) NOT NULL DEFAULT '0',
  `voornaam` varchar(50) NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '0',
  `straat` varchar(100) NOT NULL DEFAULT '0',
  `wachtwoord` varchar(100) NOT NULL DEFAULT '0',
  `huisnummer` varchar(50) NOT NULL DEFAULT '0',
  `postcode` char(4) NOT NULL DEFAULT '0',
  `woonplaats` varchar(150) NOT NULL DEFAULT '0',
  `tel` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `klant`
--

INSERT INTO `klant` (`id`, `naam`, `voornaam`, `email`, `straat`, `wachtwoord`, `huisnummer`, `postcode`, `woonplaats`, `tel`) VALUES
(2, 'Heindryckx', 'Sarah', 'sarah.heindryckx@hotmail.com', 'Spanjaardstraat', '123', '24', '8830', 'Hooglede', '0497455712'),
(3, 'ExampleLn', 'ExampleFn', 'example@hexample.com', 'Examplestreet', '123', '1', '1111', 'ExampleCity', '1111111111');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `vaccinatie`
--

CREATE TABLE IF NOT EXISTS `vaccinatie` (
  `id` int(11) NOT NULL,
  `naam` varchar(50) NOT NULL,
  `datum` date NOT NULL,
  `memo` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `consultatie`
--
ALTER TABLE `consultatie`
  ADD PRIMARY KEY (`id`), ADD KEY `FK_Consultatie_Dier` (`dierId`), ADD KEY `dierenartsId` (`dierenartsId`), ADD KEY `vaccinatieId` (`vaccinatieId`), ADD KEY `vaccinatieId_2` (`vaccinatieId`);

--
-- Indexen voor tabel `dier`
--
ALTER TABLE `dier`
  ADD PRIMARY KEY (`id`), ADD KEY `FK_Klant_Dier` (`klantId`);

--
-- Indexen voor tabel `dierenarts`
--
ALTER TABLE `dierenarts`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `klant`
--
ALTER TABLE `klant`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `email` (`email`);

--
-- Indexen voor tabel `vaccinatie`
--
ALTER TABLE `vaccinatie`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `consultatie`
--
ALTER TABLE `consultatie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT voor een tabel `dier`
--
ALTER TABLE `dier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT voor een tabel `dierenarts`
--
ALTER TABLE `dierenarts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `klant`
--
ALTER TABLE `klant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT voor een tabel `vaccinatie`
--
ALTER TABLE `vaccinatie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `consultatie`
--
ALTER TABLE `consultatie`
ADD CONSTRAINT `FK_Consultatie_Dier` FOREIGN KEY (`dierId`) REFERENCES `dier` (`id`),
ADD CONSTRAINT `consultatie_ibfk_1` FOREIGN KEY (`dierenartsId`) REFERENCES `dierenarts` (`id`);

--
-- Beperkingen voor tabel `dier`
--
ALTER TABLE `dier`
ADD CONSTRAINT `FK_Klant_Dier` FOREIGN KEY (`klantId`) REFERENCES `klant` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
