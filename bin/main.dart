import 'dart:io';
import 'dart:convert';

main() async {
    createQuestions(await new File('bin/questions.json').readAsString());
}

/// Takes String input and when formatted correctly will cycle through all 
void printJson(String json) {
    //Taking that JSON String and decoding it to a List
    List questionList = JSON.decode(json);
    
    for (int i = 0; i < questionList.length; i++) {
        print(questionList[i]["question"]);
        

        if (i < questionList.length - 1) print(" ");
    }
}

void createQuestions(String json) {
    //Taking that JSON String and decoding it to a List
    List questionList = JSON.decode(json);

    for (int i = 0; i < questionList.length; i++) {
        QuestionWithDefinition questionCard = new QuestionWithDefinition();
        questionCard.questionString = questionList[i]["question"];
        questionCard.questionNumber = i + 1;
        questionCard.redAnswer = questionList[i]["choices"]["red"]["answer"];
        questionCard.redDefinition = questionList[i]["choices"]["red"]["definition"]; 

        questionCard.readQuestion();
        if (i < questionList.length - 1) print(" ");
    }
}

class Question {
    int questionNumber;
    String questionString, redAnswer, blueAnswer, whiteAnswer, yellowAnswer;

    void readQuestion() {
        print(questionString);
    }
}

class QuestionWithDefinition extends Question {
    String redDefinition, blueDefinition, whiteDefinition, yellowDefinition;
}
