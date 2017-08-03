import 'dart:io';
import 'dart:convert';

main() async {
    String jsonFile = await new File('questions.json').readAsString();

    List questionList = JSON.decode(jsonFile);
    
    for (int i = 0; i < questionList.length; i++) {
        print(questionList[i]["question"]);
        for (int j = 0; j < questionList[i]["choices"].length; j++) {
            print("${questionList[i]["choices"][j]["answer"]}?");
        }

        print(" ");
    }   
}

class Question {
    int questionNumber;
    String questionString, redAnswer, blueAnswer, whiteAnswer, yellowAnswer;
}

class PhraseQuestion extends Question {
    String redDef, blueDef, whiteDef, yellowDef;
}
