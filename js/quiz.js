$(function() {

    /* Registering onClick's */
    $("#startQuizButton").click(onClickStartQuiz);
    $("#closeQuiz").click(onClickExit);
    $("#checkAnswersButton").click(onClickCheckAnswers);

});

/** OnClick: Start Quiz Button */
var onClickStartQuiz = function() {
    $("#overlay").css("visibility", "visible");
};

/** OnClick: Exit */
var onClickExit = function() {
    $("#overlay").css("visibility", "hidden");
    reset();
};

/** OnClick: Check Answer Button */
var onClickCheckAnswers = function() {
    // AJAX request for retrieving JSON questions
    $.ajax({
        type: 'GET',
        url: 'php/AJAX-API.php',
        success: function(questions) {
            onAJAXSuccess(questions);
        }
    })
};

/**
 * Resets the quiz
 */
var reset = function() {
    // Remove CSS from the spans
    $("#quiz_container span").css({"color": "black", "font-weight": "normal"});

    // Enable radios & button
    $("input:radio").attr("disabled", false);
    $("#checkAnswersButton").attr("disabled", false);
};

/** Shows the results to the user */
var showQuizResults = function(questions) { // array[questionObject, questionObject]

    if(false === isAllRadioGroupsChecked(questions.length)) {
        alert("All questions must be answered!");
        return;
    }

    var radios = ($("input:radio"));

    /* Disabling radios & checkAnswerButton */
    $("input").attr("disabled", true);
    $("#checkAnswersButton").attr("disabled", true);

    /* Setting correct radios to green */
    for(var i=0; i < radios.length; i++) {
        // Find the question corresponding to this radio
        var currQ = getQuestionById(radios[i].name, questions);

        // Find its span element
        var radioSpan = getRadioTextSpan(radios[i].name, radios[i].value);

        // Check if this radio is the correct answer
        if(radios[i].value === currQ.answer) {
            /* If so, set its text to be green */
            $(radioSpan).css({"color": "green", "font-weight": "bold"});
        }
        // If its not correct, see if its checked
        else if(radios[i].checked) {
            // If so, mark it red.
            $(radioSpan).css({"color": "red"});
        }
    }
};

var isAllRadioGroupsChecked = function(numOfGroups) {
    var numOfCheckedRadios = $("input:radio:checked").length;
    return numOfCheckedRadios === numOfGroups;
};

var getRadioTextSpan = function(radioName, radioValue) {
    var spans = $("#quiz_container span");

    // Find span with <span id=radioName;radioValue>
    for(var i=0; i < spans.length; i++) {
        var currSpan = spans.get(i);
        if(currSpan.id === radioName + ";" + radioValue) {
            return currSpan;
        }
    }
};

var getQuestionById = function(radioNameID, questions) {
    for(var i=0; i < questions.length; i++) {
        if(questions[i].id === parseInt(radioNameID)) {
            return questions[i];
        }
    }
    alert("Didnt find the question by id!");
};

/**
 * Parses AJAX response to get a proper array with question objects,
 * then calls showQuizResults()
 */
var onAJAXSuccess = function(questions) {
    var questionsArray = JSON.parse(questions);
    var newArray = [];
    for(var i=0; i < questionsArray.length; i++) {
        newArray.push(JSON.parse(questionsArray[i]))
    }
    showQuizResults(newArray);
};