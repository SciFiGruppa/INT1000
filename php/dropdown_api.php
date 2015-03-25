<?php
require_once("DBApi.php");

/* Fetching all questions as JSON */
$db = new DBApi(config());
$questions = $db->getQuestions('dropdown');

$questionsAsJson = array();
for($i = 0; $i < count($questions); $i++) {
    array_push($questionsAsJson, $questions[$i]->toJSON());
}

//$questionsAsJson = json_encode($questionsAsJson);

echo json_encode($questionsAsJson);