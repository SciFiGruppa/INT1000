<?php

class Question {

    private $id;
    private $question;
    private $answer;
    private $alternatives;

    public function __construct($id, $question, $answer, $alternatives) {
        $this->id = $id;
        $this->question = utf8_encode($question);
        $this->answer = utf8_encode($answer);

        $utf8Alts = array();
        foreach($alternatives as $element) {
            array_push($utf8Alts, utf8_encode($element));
        }
        $this->alternatives = $utf8Alts;
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
        $last_alt_keys = array_keys($this->alternatives);
        $last_alternative = end($last_alt_keys);
        foreach($this->alternatives as $key => $alternatives) {
            $currAlt = $alternatives;
            $html .= "<input type='radio' name='$this->id' value='$currAlt'><span id='$this->id;$currAlt'>$currAlt</span>" . "<br>";

            if($last_alternative === $key) {
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