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
-- Dumping data for table `flagg`
--

INSERT INTO `flagg` (`flaggnavn`, `beskrivelse`) VALUES
('A.png', 'Jeg har dykker nede. Hold godt klar og gå med sakte fart.'),
('B.png', 'Jeg laster eller losser eller fører farlig gods.'),
('C.png', 'Bekreftende - ja, eller «betydningen av den foregående gruppe skal leses bekreftende».'),
('D.png', 'Hold klar av meg. Jeg har vanskelig for å manøvrere.'),
('E.png', 'Jeg forandrer min kurs til styrbord.'),
('F.png', 'Jeg har havari. Sett deg i forbindelse med meg.'),
('G.png', 'Jeg trenger los. Når det gis av fiskefartøyer som driver fiske i grupper på fiskefeltet, betyr signalet: Jeg tar inn fiskeredskap.'),
('H.png', 'Jeg har los ombord.'),
('I.png', 'Jeg forandrer min kurs til babord.'),
('J.png', 'Jeg er i brann og har farlig last ombord. Hold godt klar av meg.'),
('K.png', 'Jeg ønsker å opprette forbindelse med deg.'),
('L.png', 'Stopp fartøyet øyeblikkelig.'),
('M.png', 'Mitt fartøy er stoppet og ligger stille.'),
('N.png', 'Nektende - nei, eller «Betydningen av den foregående gruppe skal leses nektende». Dette signal kan bare gis optisk eller med lyd. Ved tale eller radiosending skal signalet være «NO».'),
('O.png', 'Mann overbord!'),
('P.png', 'I havn: Fartøyet skal gå og alle må komme om bord.\r\nI sjøen: Det kan benyttes av fiskefartøyer med følgende betydning: Mine fiskeredskaper har satt seg fast.'),
('Q.png', 'Det er ikke konstatert smittefare og fartøyet ber om å få lege ombord som kan gi karantenelisens for samkvem med land: "My vessel is healthy and I require free pratique".'),
('R.png', 'Jeg har mottatt ditt signal.'),
('S.png', 'Jeg bruker maskinkraften akterover.'),
('T.png', 'Hold klar av meg. Jeg driver partråling..'),
('U.png', 'Du stevner mot fare!'),
('V.png', 'Jeg trenger assistanse.'),
('W.png', 'Jeg trenger legehjelp.'),
('X.png', 'Stopp det du holder på med (eller har til hensikt å gjøre) og gi akt på mine signaler.'),
('Y.png', 'Jeg driver for ankeret.'),
('Z.png', 'Jeg trenger slepebåt.\r\nNår det gis av fiskefartøyer som driver fiske i grupper på fiskefeltet, betyr signalet: Jeg setter ut fiskeredskap.');

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
