import 'dart:io';
import 'dart:convert';

main() async {
    var jsonFile = await new File('questions.json').readAsString();
    List questionList = JSON.decode(jsonFile);
    print(questionList[0]);
}