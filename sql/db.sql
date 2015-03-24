-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 24, 2015 at 04:00 PM
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
-- Table structure for table `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `questionID` int(11) NOT NULL AUTO_INCREMENT,
  `questionText` varchar(300) DEFAULT NULL,
  `correctAnswerID` int(11) NOT NULL,
  `quizType` enum('quiz','dropdown') NOT NULL,
  PRIMARY KEY (`questionID`),
  KEY `correctAnswerID` (`correctAnswerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
