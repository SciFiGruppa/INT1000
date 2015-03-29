<?php
require_once("DBApi.php");

if (isset($_GET['true'])) {
    /* Fetching all questions as JSON */
    $db = new DBApi(config());
    $questions = $db->getQuestions('dropdown');

    $questionsAsJson = array();
    for($i = 0; $i < count($questions); $i++) {
        array_push($questionsAsJson, $questions[$i]->toJSON());
    }

    echo json_encode($questionsAsJson);
}