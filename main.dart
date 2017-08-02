import 'dart:io';
import 'dart:convert';

main() async {
    int questionNumber = 14;
    String jsonFile = await new File('questions.json').readAsString();

    List questionList = JSON.decode(jsonFile);

    print(questionList[questionNumber]["question"]);

    for (int i = 0; i < questionList[questionNumber]["choices"].length; i++) {
        print("${questionList[questionNumber]["choices"][i]["answer"]}?");
    }
}