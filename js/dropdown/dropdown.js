"use strict";

var dropdown = {
    initAjax: function () {
        if (window.XMLHttpRequest) {
            return new XMLHttpRequest();
        } else {
            return new ActiveXObject("Microsoft.XMLHTTP");
        }
    },
    /* rotete */
    draw: function (data, options) {
        var form = document.getElementsByClassName(options.mainForm)[0],
            submit = document.createElement('input'),
            pattern = /\{0\}/i;
        // Go over data object
        for (var i = 0; i < data.length; i++) {
            var select = document.createElement("select"),
                questionDiv = document.createElement("p");
            // Every alternative in data object to be filled in option elements
            for (var key in data[i].alternatives) {
                var option = document.createElement("option"),
                    textNode = document.createTextNode(data[i].alternatives[key]);
                option.value = key;
                option.appendChild(textNode);
                select.appendChild(option);
            }
            // set name of select element to question id
            select.name = data[i].id;
            questionDiv.innerHTML = data[i].question.replace(pattern, select.outerHTML);
            form.appendChild(questionDiv);
        }
        // add properties to input element type submit
        submit.type = "submit";
        submit.value = "Sjekk svar";
        submit.id = "dropdownSubmit";
        // when submit is clicked
        // show correct and wrong answers
        // then disable select element
        submit.onclick = function (event) {
            event.preventDefault();
            for (var i = 0; i < document.getElementsByClassName(options.mainForm)[0].getElementsByTagName('select').length; i++) {
                var selectElement = document.getElementsByClassName(options.mainForm)[0].getElementsByTagName('select')[i];
                if (selectElement.options[selectElement.selectedIndex].text === data[i].answer) {
                    selectElement.style.backgroundColor = "green";
                    selectElement.style.color = "white";
                } else {
                    selectElement.style.backgroundColor = "red";
                    selectElement.style.color = "white";
                }
                selectElement.disabled = true;
            }
        };
        // add submit button to the form
        form.appendChild(submit);
    },
    init: function () {
        // get all the question and answer things from the database via ajax
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
    reset: function () {
        // resets the form
        var form = document.getElementsByClassName(this.options.mainForm)[0];
        form.innerHTML = '';
    },
    options: {
        api: {
            request: "php/dropdown_api.php?true=true"
        },
        mainForm: "quizDropdown",
        submit: "submit",
        textClass: "dropdownSelectText",
        selectClass: "dropdownSelect"
    }
}