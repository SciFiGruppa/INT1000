INSERT INTO `answer` (`answerID`, `answerText`) VALUES
(1, 'Kunnskap og planlegging'),
(2, 'Juks og fanteri'),
(3, 'Vås og vimseri'),
(4, 'Regler'),
(5, 'Drikke vann'),
(6, 'holdes i orden og være lett tilgjengelig.'),
(7, 'kastes på sjøen dersom båten synker.');

INSERT INTO `answerquestion` (`AQID`, `questionID`, `answerID`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(8, 2, 6),
(9, 2, 7);

INSERT INTO `question` (`questionID`, `questionText`, `correctAnswerID`, `quizType`) VALUES
(1, '{0} reduserer risikoen og øker trivselen.', 1, 'dropdown'),
(2, 'Utstyret må {0}', 6, 'dropdown');
