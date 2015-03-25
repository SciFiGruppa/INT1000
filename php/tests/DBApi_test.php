<?php
    require_once("../DBApi.php");
    require_once("../config.php");

    $api = new DBApi(config());

    $api->getQuestions('dropdown');