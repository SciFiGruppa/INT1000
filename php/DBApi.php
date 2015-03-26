<?php
require_once("Question.php");
require_once("config.php");

class DBApi {

    private $connection,
            $config;

    public function __construct(array $config) {
        $this->connection = new PDO(
                                "mysql:host={$config['host']};port={$config['port']};dbname={$config['dbname']}",
                                $config['username'],
                                $config['password']
                            );
    }

    /**
     * returns questions based on type of question
     *
     * @param string $type Enum declared in database to sort between 'quiz' or 'dropdown'
     *
     * @return array Returns an array of objects
     */
    public function getQuestions($type) {
        if (!$type) {
            return;
        }

        $questions = array();

        $sql = "SELECT answerquestion.questionID, question.correctAnswerID, question.questionText, answerquestion.answerID, answer.answerText FROM answerquestion
                INNER JOIN question ON (
                    question.questionID = answerquestion.questionID AND
                    question.quizType = :type
                )
                INNER JOIN answer ON (
                    answer.answerID = answerquestion.answerID
                )";

        $stmt = $this->connection->prepare($sql);
        $stmt->bindParam(':type', $type);
        $stmt->execute();

        $res = $stmt->fetchAll(PDO::FETCH_ASSOC);

        foreach ($this->loopThrough($res, $type) as $qid => $values) {
            $questions[] = new Question($qid, $values['questionText'], $values['correctAnswerText'], $values['answerText']);
        }

        return $questions;
    }
    /**
     * cleans an array so it can be instantiated
     * 
     * @param array $result The array returned from the database
     * @param enum $type 'quiz' or 'dropdown'
     * 
     * @return array Returns the cleaned array so it can easily be used to instantiate the Question class
     */
    private function loopThrough (array $result, $type) {
        $output = array();

        foreach ($result as $key => $value) {
            $output[$value['questionID']]['questionText'] = $value['questionText'];
            $output[$value['questionID']]['answerText'][$value['answerID']] = $value['answerText'];
        }

        $sql = "SELECT question.questionID, answer.answerText FROM question
                INNER JOIN answerquestion ON
                (
                    question.questionID = answerquestion.questionID    
                )
                INNER JOIN answer ON
                (
                    answer.answerID = answerquestion.answerID AND
                    question.correctAnswerID = answer.answerID AND
                    question.quizType = :type
                )";

        $stmt = $this->connection->prepare($sql);
        $stmt->bindParam(':type', $type);
        $stmt->execute();

        $res = $stmt->fetchAll(PDO::FETCH_ASSOC);
        
        foreach ($res as $key => $value) {
            $output[$value['questionID']]['correctAnswerText'] = $value['answerText'];
        }
        return $output;
    }

}