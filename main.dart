import 'dart:io';
import 'dart:convert';

main() async {
    int questionNumber = 0;
    String jsonFile = await new File('questions.json').readAsString();


    List questionList = JSON.decode(jsonFile);
    String singleQuestionJson = JSON.encode(questionList[questionNumber]);
    //print(singleQuestionJson);

    Map singleQuestionMap = JSON.decode(singleQuestionJson);
    //print(singleQuestionMap["choices"]);

    String singleQuestionQuestionString = singleQuestionMap["question"];
    print(singleQuestionQuestionString);
    String choicesJson = JSON.encode(singleQuestionMap["choices"]);
    //print(choicesJson);

    for (int i = 0; i < singleQuestionMap["choices"].length; i++) {
        List singleChoiceList = JSON.decode(choicesJson);
        //print(singleChoiceList[i]);

        String singleChoiceJson = JSON.encode(singleChoiceList[i]);
        Map singleChoiceMap = JSON.decode(singleChoiceJson);

        print("${singleChoiceMap["answer"]}?");
    }
}