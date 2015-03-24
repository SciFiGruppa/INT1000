-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 24, 2015 at 03:46 PM
-- Server version: 5.5.36
-- PHP Version: 5.5.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `106241`
--

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE IF NOT EXISTS `answer` (
  `answerID` int(11) NOT NULL AUTO_INCREMENT,
  `answerText` varchar(50) NOT NULL,
  PRIMARY KEY (`answerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `answerquestion`
--

CREATE TABLE IF NOT EXISTS `answerquestion` (
  `AQID` int(11) NOT NULL AUTO_INCREMENT,
  `questionID` int(11) NOT NULL,
  `answerID` int(11) NOT NULL,
  PRIMARY KEY (`AQID`),
  KEY `questionID` (`questionID`),
  KEY `answerID` (`answerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bilde`
--

CREATE TABLE IF NOT EXISTS `bilde` (
  `bildenr` int(50) NOT NULL AUTO_INCREMENT,
  `opplastingsdato` date NOT NULL COMMENT 'Dato for opplastning',
  `filnavn` varchar(50) NOT NULL,
  `beskrivelse` varchar(400) NOT NULL,
  PRIMARY KEY (`bildenr`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;

--
-- Dumping data for table `bilde`
--

INSERT INTO `bilde` (`bildenr`, `opplastingsdato`, `filnavn`, `beskrivelse`) VALUES
(47, '2015-03-02', '10624154f4549abb1e6.gif', 'GIF'),
(50, '2015-03-02', '10624154f454d33bd2e.png', 'PNG'),
(51, '2015-03-02', '10624154f45c76b0985.gif', 'gif-bilde'),
(52, '2015-03-02', '10624154f45cad79bd5.jpeg', 'jpg-bilde'),
(53, '2015-03-02', '10624154f45cb7d83f2.png', 'png-bilde'),
(54, '2015-03-02', '10624154f4980ef1b56.jpeg', 'dasdas'),
(55, '2015-03-02', '10624154f4cc762dbee.gif', 'kljjkkj'),
(56, '2015-03-03', '10624154f59be9d48c7.jpeg', 'tetetetete'),
(59, '2015-03-03', '10624154f5a18ec1534.jpeg', 'jjj'),
(60, '2015-03-03', '10624154f5aa5084b97.gif', 'geir-gif'),
(61, '2015-03-03', '10624154f5aa6862a9d.jpeg', 'geir-jpg'),
(62, '2015-03-03', '10624154f5aa7cc6f58.png', 'geir-png');

-- --------------------------------------------------------

--
-- Table structure for table `flagg`
--

CREATE TABLE IF NOT EXISTS `flagg` (
  `flaggnr` int(11) NOT NULL AUTO_INCREMENT,
  `flaggnavn` varchar(10) NOT NULL,
  `beskrivelse` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`flaggnr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `klasse`
--

CREATE TABLE IF NOT EXISTS `klasse` (
  `klassekode` char(30) NOT NULL,
  `klassenavn` char(50) NOT NULL,
  PRIMARY KEY (`klassekode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `klasse`
--

INSERT INTO `klasse` (`klassekode`, `klassenavn`) VALUES
('IS1', 'IS1-Klassen'),
('IS2', 'IS2-Klassen'),
('IS3', 'IS3-Klassen');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `questionID` int(11) NOT NULL AUTO_INCREMENT,
  `questionText` varchar(300) DEFAULT NULL,
  `correctAnswerID` int(11) NOT NULL,
  PRIMARY KEY (`questionID`),
  KEY `correctAnswerID` (`correctAnswerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `brukernavn` char(50) NOT NULL,
  `fornavn` text NOT NULL,
  `etternavn` text NOT NULL,
  `klassekode` char(30) NOT NULL,
  `bildenr` int(11) DEFAULT NULL,
  PRIMARY KEY (`brukernavn`),
  KEY `klassekode` (`klassekode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`brukernavn`, `fornavn`, `etternavn`, `klassekode`, `bildenr`) VALUES
('lol', 'dsda', 'dskadaskds', 'IS3', 59);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answerquestion`
--
ALTER TABLE `answerquestion`
  ADD CONSTRAINT `answerquestion_ibfk_1` FOREIGN KEY (`questionID`) REFERENCES `question` (`questionID`),
  ADD CONSTRAINT `answerquestion_ibfk_2` FOREIGN KEY (`answerID`) REFERENCES `answer` (`answerID`);

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`correctAnswerID`) REFERENCES `answer` (`answerID`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`klassekode`) REFERENCES `klasse` (`klassekode`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
