"use strict";

var dropdown = {
    initAjax: function () {
        if (window.XMLHttpRequest) {
            return new XMLHttpRequest();
        } else {
            return new ActiveXObject("Microsoft.XMLHTTP");
        }
    },
    draw: function (data, options) {
        var select = document.getElementById(options.selectID),
            text = document.getElementById(options.textID);

        select.dataset.id = data.questionID;

        for (var i = 0; i < data.answers.length; i++) {
            var option = document.createElement("option"),
                t = document.createTextNode(data.answers[i].desc);
            option.appendChild(t);
            option.value = data.answers[i].answerID;
            select.appendChild(option);
        }

        text.innerHTML = data.question;
    },
    init: function () {
        var req = this.initAjax(),
            draw = this.draw,
            options = this.options;
        req.open('GET', this.options.api.request);
        req.onreadystatechange = function () {
            if (req.readyState == 4 && req.status == 200) {
                var response = JSON.parse(req.responseText);
                draw({questionID: response.questionID, answers: response.answers, question: response.question}, options);
            }
        };
        req.send();
    },
    submit: function () {
        var req = this.initAjax();

        console.log("yes");
    },
    options: {
        api: {
            request: "../dropdown_api.php",
            response: ""
        },
        textID: "quizText",
        selectID: "quizDropdown"
    }
}