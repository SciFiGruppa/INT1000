<?php
require_once("Question.php");

class DBApi {

    public function __construct() {

    }

    public function getQuestions() {
        $q1 = new Question(1, "What is life purpose?", "42", ["42", "43"]);
        $q2 = new Question(2, "What is yellow?", "yellow", ["yellow", "green"]);
        $q3 = new Question(3, "Can has?", "yes", ["yes", "no", "maybe", "not"]);

        $questions = array();
        array_push($questions, $q1);
        array_push($questions, $q2);
        array_push($questions, $q3);

        return $questions;
    }

}