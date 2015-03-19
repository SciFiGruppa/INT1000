/* SETTINGS */
var NUM_ALTERNATIVES = 3;


/* ########################################### SCRIPT START ########################################### */
/* Async AJAX getting questions from DB API */
$(function() {
    $.ajax({
        type: 'GET',
        url: 'api/db_api.php',
        success: function(questions) {
            jsonQuestions = JSON.parse(questions);
            createAndShowQuiz(jsonQuestions);
        }
    })
});

var questions = [];

/**
 * AJAX 'on success' callback
 */
function createAndShowQuiz(jsonQuestions) {
    this.questions = [];

    // Creating Questions and adding them to questions array.
    for(var i = 0; i < jsonQuestions.length; i++) {
        var currJson = jsonQuestions[i];
        questions.push(new Question(currJson.questionID, currJson.question, currJson.answer, currJson.alternatives));
    }

    $(function() {
        /* Filling the #quiz_container with quiz form */
        $("#quiz_container").html(getQuizHTML(questions));

        /* Registering OnClick listener for Check Answers Button */
        $("#quizButton").click(onClickCheckAnswers);
    });

}
/* ########################################### SCRIPT END ########################################### */


/**
 * OnClick for check answers button
 */
var onClickCheckAnswers = function() {
    // Disabling all radios
    var allInputs = $(":input");
    var radios = [];
    for(var i=0; i < allInputs.length; i++) {
        if(allInputs[i].type === "radio") {
            radios.push(allInputs[i]);
            $(allInputs[i]).attr("disabled", true);
        }
    }

    // Disabling button
    $("#quizButton").attr("disabled", true);

    // Put green color on correct answer text
    for(var j=0; j < radios.length; j++) {
        var radioGroup = radios[j].name;

        // Find the corresponding Question object
        for(var x=0; x < questions; x++) {
            if(questions[i].getQuestionID() === radioGroup) {
                if(radios[i].value === questions[x].getAnswer) {
                    console.log("i has found radio correct");
                }
            }
        }
    }



    // I tilegg, hvis brukeren svarte feil, marker svaret hans med rødt.
    // Vis topptekst som sier "du svarte x/y riktig"

};


/**
 * Returns the complete quiz form as a string
 */
function getQuizHTML(questions) {
    var html = "<form>";

    // Adding the questions HTML
    for(var i = 0; i < questions.length; i++) {
        if(i !== 0) {
            html += "<br>";
        }

        html += questions[i].getHTML(NUM_ALTERNATIVES);
    }

    // Adding the button
    html += "<br>" + "<button type='button' name='quizButton' id='quizButton' value='quizButton'>Sjekk svar!</button>";
    html += "</form>";
    return html;
}

/**
 * Toggles overlay visibility
 */
function toggleOverlay() {
    var overlay = $("#overlay");
    var state = overlay.css("visibility");
    overlay.css("visibility", (state === "hidden") ? "visible" : "hidden");
}

/**
 * OBJECT Question
 */
var Question = function(questionID, question, answer, alternatives) {
    this.questionID = questionID;
    this.question = question;
    this.answer = answer;
    this.alternatives = alternatives;

    this.getQuestion = function() {
        return this.question;
    };

    this.getAlternatives = function() {
        return this.alternatives;
    };

    this.getAnswer = function() {
        return this.answer;
    };

    this.getQuestionID = function() {
        return this.questionID;
    };

    /**
     * Gets this questions html for use in the quiz form.
     * @param numOfAlternatives The number of alternatives shown.
     * @returns bool|string Returns false if numOfAlternatives is greater than the alternatives.length.
     */
    this.getHTML = function(numOfAlternatives) {
        if(numOfAlternatives > this.getAlternatives().length) {
            return false;
        }

        var html = this.getQuestion() + "<br>";
        for(var i = 0; i < numOfAlternatives; i++) {
            var alternative =
                "<input type='radio' name=" + "'" + this.getQuestionID() + "' " +
                "value=" + "'" + this.alternatives[i] +"'" +
                ">" + this.alternatives[i];

            html += alternative + "<br>";
        }

        return html;
    };
};