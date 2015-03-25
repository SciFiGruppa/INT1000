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
        var form = document.getElementByClassName(options.mainForm),
            submit = document.getElementByClassName(options.submit),
            pattern = /[{0}]/i;
        for (var i = 0; i < data; i++) {
            var select = document.createElement("select"),
                questionText = data[i].question.replace(pattern, select);
                questionParagraph = document.createElement("p").innerHTML = questionText;

            select.name = data[i].id;

            for (var key, value in data[i].alternatives) {
                var option = document.createElement("option").value = key,
                    textNode = document.createTextNode(value);
                option.appendChild(textnode);
                select.appendChild(option);
            }
            form.appendChild(select);
        }
        submit.removeAttribute("disabled");
    },
    init: function () {
        var req = this.initAjax(),
            draw = this.draw,
            options = this.options;
        req.open('GET', this.options.api.request);
        req.onreadystatechange = function () {
            if (req.readyState == 4 && req.status == 200) {
                var response = JSON.parse(req.responseText);
                draw(response, options);
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
        mainForm: "quizDropdown",
        submit: "submit",
        textClass: "dropdownSelectText",
        selectClass: "dropdownSelect"
    }
}