<!DOCTYPE html>
<html>
<head>
    <title>Dropdown test</title>
    <style type="text/css">
        select {
            border: 1px solid #EDEDED;
            padding: 5px 0;
            font-size: 16px;
            font-family: Arial, sans-serif;
        }
        .quizDropdown {
            font-family: Arial, sans-serif;
        }
        /* Quiz Overlay */
        #overlay {
            visibility: hidden;
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            text-align: center;
            z-index: 1000;
            background-color: rgba(0, 0, 0, 0.3);
        }
        #quiz_container {
            width: 50%;
            margin: 100px auto;
            background-color: #fff;
            border: 1px solid #000;
            padding: 15px;
            text-align:center;
        }
        #quiz_container a {
            color: black;
        }
    </style>
</head>
<body>
<div id="overlay">
    <div id="quiz_container">
        <a href="#" id="closeQuiz">Lukk</a>
        <form method="POST" action="" class="quizDropdown">
        </form>
    </div>
</div>
<button id="testYourself">Test deg selv</button>
<script type="text/javascript" src="../../js/dropdown/dropdown.js"></script>
<script type="text/javascript">
    (function () {
        document.getElementById('testYourself').onclick = function () {
            dropdown.init();
            document.getElementById('overlay').style.visibility = "visible";
        };
        document.getElementById('closeQuiz').onclick = function () {
            dropdown.reset();
            document.getElementById('overlay').style.visibility = "hidden";
        };
    })();
</script>
</body>
</html>