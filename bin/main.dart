import 'dart:io';
import 'dart:convert';

main() async {
    //HttpRequest.getString("newFormatQuestions.json").then((String jsonString) => printJson(jsonString));
    createQuestions(await new File('bin/newFormatQuestions.json').readAsString());
}

/// Takes String input and when formatted correctly will cycle through all 
void printJson(String json) {
    //Taking that JSON String and decoding it to a List
    List questionList = JSON.decode(json);
    
    for (int i = 0; i < questionList.length; i++) {
        print(questionList[i]["question"]);
        
        for (int j = 0; j < questionList[i]["choices"].length; j++) {
            print(questionList[i]["choices"][j]["answer"]);
        }

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
        print()
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
