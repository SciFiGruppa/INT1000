-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 26, 2015 at 06:05 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`answerID`, `answerText`) VALUES
(2, 'Styrbord'),
(3, 'Motorbåten'),
(4, 'Skipet'),
(5, 'Babord'),
(6, 'Akter'),
(7, 'Seilbåten'),
(8, 'Begge må vike');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `answerquestion`
--

INSERT INTO `answerquestion` (`AQID`, `questionID`, `answerID`) VALUES
(1, 1, 2),
(2, 2, 3),
(3, 3, 4),
(4, 1, 5),
(5, 1, 6),
(6, 2, 7),
(7, 2, 8),
(8, 3, 3),
(9, 3, 4),
(10, 3, 7);

-- --------------------------------------------------------

--
-- Table structure for table `flagg`
--

CREATE TABLE IF NOT EXISTS `flagg` (
  `flaggnr` int(11) NOT NULL AUTO_INCREMENT,
  `flaggnavn` varchar(10) NOT NULL,
  `beskrivelse` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`flaggnr`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `flagg`
--

INSERT INTO `flagg` (`flaggnr`, `flaggnavn`, `beskrivelse`) VALUES
(1, 'A.png', 'Jeg har dykker nede. Hold godt klar og gå med sakte fart.'),
(2, 'B.png', 'Jeg laster eller losser eller fører farlig gods.'),
(3, 'C.png', 'Bekreftende - ja, eller «betydningen av den foregående gruppe skal leses bekreftende».'),
(4, 'D.png', 'Hold klar av meg. Jeg har vanskelig for å manøvrere.'),
(5, 'E.png', 'Jeg forandrer min kurs til styrbord.'),
(6, 'F.png', 'Jeg har havari. Sett deg i forbindelse med meg.'),
(7, 'G.png', 'Jeg trenger los. Når det gis av fiskefartøyer som driver fiske i grupper på fiskefeltet, betyr signalet: Jeg tar inn fiskeredskap.'),
(8, 'H.png', 'Jeg har los ombord.'),
(9, 'I.png', 'Jeg forandrer min kurs til babord.'),
(10, 'J.png', 'Jeg er i brann og har farlig last ombord. Hold godt klar av meg.'),
(11, 'K.png', 'Jeg ønsker å opprette forbindelse med deg.'),
(12, 'L.png', 'Stopp fartøyet øyeblikkelig.'),
(13, 'M.png', 'Mitt fartøy er stoppet og ligger stille.'),
(14, 'N.png', 'Nektende - nei, eller «Betydningen av den foregående gruppe skal leses nektende». Dette signal kan bare gis optisk eller med lyd. Ved tale eller radiosending skal signalet være «NO».'),
(15, 'O.png', 'Mann overbord!'),
(16, 'P.png', 'I havn: Fartøyet skal gå og alle må komme om bord.\r\nI sjøen: Det kan benyttes av fiskefartøyer med følgende betydning: Mine fiskeredskaper har satt seg fast.'),
(17, 'Q.png', 'Det er ikke konstatert smittefare og fartøyet ber om å få lege ombord som kan gi karantenelisens for samkvem med land: "My vessel is healthy and I require free pratique".'),
(18, 'R.png', 'Jeg har mottatt ditt signal.'),
(19, 'S.png', 'Jeg bruker maskinkraften akterover.'),
(20, 'T.png', 'Hold klar av meg. Jeg driver partråling..'),
(21, 'U.png', 'Du stevner mot fare!'),
(22, 'V.png', 'Jeg trenger assistanse.'),
(23, 'W.png', 'Jeg trenger legehjelp.'),
(24, 'X.png', 'Stopp det du holder på med (eller har til hensikt å gjøre) og gi akt på mine signaler.'),
(25, 'Y.png', 'Jeg driver for ankeret.'),
(26, 'Z.png', 'Jeg trenger slepebåt.\r\nNår det gis av fiskefartøyer som driver fiske i grupper på fiskefeltet, betyr signalet: Jeg setter ut fiskeredskap.');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`questionID`, `questionText`, `correctAnswerID`, `quizType`) VALUES
(1, 'Når to motorbåter møter hverandre, til hvilken side skal de vike?', 2, 'quiz'),
(2, 'En seilbåt og en motorbåt møtes, hvem skal vike?', 3, 'quiz'),
(3, 'Hvilket fartøy har forkjørsrett?', 4, 'quiz');

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
