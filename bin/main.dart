import 'dart:io';
import 'dart:convert';

main() async {
    createQuestions(File('assets/questions.json').readAsStringSync());
}
    
void createQuestions(String json) {
    final List questionList = jsonDecode(json);

    for (int i = 0; i < questionList.length; i++) {
        if (questionList[i]['definitions']) {
            QuestionWithDefinition questionCard = new QuestionWithDefinition();
            questionCard.questionString = questionList[i]['question'];
            questionCard.questionNumber = i + 1;
            for (final color in Question.colors) {
                questionCard.answers[color] = questionList[i]['choices'][color]['answer'];
                questionCard.definitions[color] = questionList[i]['choices'][color]['definition'];
            }
            questionCard.readQuestion();
        } else {
            Question questionCard = new Question();
            questionCard.questionString = questionList[i]['question'];
            questionCard.questionNumber = i + 1;
            for (final color in Question.colors) {
                questionCard.answers[color] = questionList[i]['choices'][color]['answer'];
            }
            questionCard.readQuestion();
        }

        if (i < questionList.length - 1) print('\n');
    }
}

class Question {
    static List colors = ['red', 'blue', 'white', 'yellow'];
    int? questionNumber;
    String? questionString;
    Map answers = Map<String, String?>.fromIterable(colors,
        key: (i) => i,
        value: (i) => '$i answer');

    void readQuestion() {
        print('Question #$questionNumber \n$questionString\n');
        for (final color in colors) {
            print(answers[color]);
        }
    }
}

class QuestionWithDefinition extends Question {
    Map definitions = Map<String, String?>.fromIterable(Question.colors,
        key: (i) => i,
        value: (i) => '$i definition');

    void readQuestion() {
        print('Question #$questionNumber \n$questionString\n');
        for (final color in Question.colors) {
            print('${answers[color]} [${definitions[color]}]');
        }
    }
}
