"use strict";

var dropdown = {
    initAjax: function () {
        if (window.XMLHttpRequest) {
            return new XMLHttpRequest();
        } else {
            return new ActiveXObject("Microsoft.XMLHTTP");
        }
    },
    /* faen for et rot */
    draw: function (data, options) {
        var form = document.getElementsByClassName(options.mainForm)[0],
            submit = document.createElement('input'),
            pattern = /\{0\}/i;
        for (var i = 0; i < 2; i++) {
            var select = document.createElement("select"),
                questionDiv = document.createElement("p");

            for (var key in data[i].alternatives) {
                var option = document.createElement("option"),
                    textNode = document.createTextNode(data[i].alternatives[key]);
                option.value = key;
                option.appendChild(textNode);
                select.appendChild(option);
            }
            select.name = data[i].id;
            questionDiv.innerHTML = data[i].question.replace(pattern, select.outerHTML);
            form.appendChild(questionDiv);
        }
        submit.type = "submit";
        submit.value = "Sjekk svar";
        submit.id = "dropdownSubmit";
        submit.onclick = function (event) {
            event.preventDefault();
            for (var i = 0; i < document.getElementsByClassName(options.mainForm)[0].getElementsByTagName('select').length; i++) {
                var selectElement = document.getElementsByClassName(options.mainForm)[0].getElementsByTagName('select')[i];
                if (selectElement.options[selectElement.selectedIndex].text === data[i].answer) {
                    selectElement.style.borderColor = "green";
                } else {
                    selectElement.style.borderColor = "red";
                }
            }
        };
        console.log(submit);
        form.appendChild(submit);
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
                console.log(response);
            }
        };
        req.send();
    },
    reset: function () {
        var form = document.getElementsByClassName(this.options.mainForm)[0];

        form.innerHTML = '';
    },
    options: {
        api: {
            request: "../dropdown_api.php?true=true",
            response: "../dropdown_api.php"
        },
        mainForm: "quizDropdown",
        submit: "submit",
        textClass: "dropdownSelectText",
        selectClass: "dropdownSelect"
    }
}