<?php

class Question {

    private $id;
    private $question;
    private $answer;
    private $alternatives;

    public function __construct($id, $question, $answer, $alternatives) {
        $this->id = $id;
        $this->question = $question;
        $this->answer = $answer;
        $this->alternatives = $alternatives;
    }

    public function getID() {
        return $this->id;
    }

    public function getQuestion() {
        return $this->question;
    }

    public function getAnswer() {
        return $this->answer;
    }

    public function getAlternatives() {
        return $this->alternatives;
    }

    public function getHTML() {
        $html = $this->question . "<br>";

        for($i = 0; $i < count($this->alternatives); $i++) {
            $currAlt = $this->alternatives[$i];
            $html .= "<input type='radio' name='$this->id' value='$currAlt'><span id='$this->id;$currAlt'>$currAlt</span>" . "<br>";

            if($i === count($this->alternatives) - 1) {
                $html .= "<br>";
            }
        }

        return $html;
    }

    /**
     * @return String Returns a representation of this object in JSON.
     */
    public function toJSON() {
        $fields = array(
            "id" => $this->id,
            "question" => $this->question,
            "answer" => $this->answer,
            "alternatives" => $this->alternatives
        );

        return json_encode($fields);
    }
}