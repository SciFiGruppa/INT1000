<?php
require_once("DBApi.php");

/* Fetching all questions as JSON */
$db = new DBApi();
$questions = $db->getQuestions();

$questionsAsJson = array();
for($i = 0; $i < count($questions); $i++) {
    array_push($questionsAsJson, $questions[$i]->toJSON());
}

$questionsAsJson = json_encode($questionsAsJson);

print($questionsAsJson);