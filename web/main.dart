import 'dart:html';
import 'dart:convert';

main() {
    HttpRequest.getString("questions.json").then((String jsonString) => printJson(jsonString));
}

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

class Question {
    int questionNumber;
    String questionString, redAnswer, blueAnswer, whiteAnswer, yellowAnswer;
}

class QuestionWithDef extends Question {
    String redDef, blueDef, whiteDef, yellowDef;
}
