<?php
require_once("Question.php");

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

    public function getQuestions($type) {
        $questions = array();

        $q1 = new Question(1, "What is life purpose?", "42", ["42", "43"]);
        $q2 = new Question(2, "What is yellow?", "yellow", ["yellow", "green"]);
        $q3 = new Question(3, "Can has?", "yes", ["yes", "no", "maybe", "not"]);

        array_push($questions, $q1);
        array_push($questions, $q2);
        array_push($questions, $q3);

        return $questions;
    }

}