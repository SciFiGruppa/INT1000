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
        $last_alternative = end(array_keys($this->alternatives));
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

        return $fields;
    }
}