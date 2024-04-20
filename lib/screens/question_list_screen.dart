import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/methods/question_crud.dart';
import 'package:quiz_app/models/questions_model.dart';
import 'package:quiz_app/widgets/base_widget.dart';

class QuestionListScreen extends StatelessWidget {
  QuestionListScreen({super.key});

  List<Question> questions = [];

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      appBar: AppBar(
        title: const Text('لیست سؤالات'),
        titleTextStyle: const TextStyle(
          fontSize: 25,
          fontFamily: 'IRANSans',
          fontWeight: FontWeight.bold,
          color: pColorGrayPalette,
        ),
        centerTitle: true,
        backgroundColor: pColorGreenLight,
        iconTheme: const IconThemeData(color: pColorGrayPalette),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ValueListenableBuilder(
          valueListenable: Hive.box<Question>('question').listenable(),
          builder: (BuildContext context, Box<Question> value, Widget? child) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              itemCount: value.length,
              itemBuilder: (context, index) {
                Question questions = value.values.toList()[index];
                return ListTile(
                  title: Text(questions.question.toString()),
                  titleTextStyle: const TextStyle(
                    fontFamily: 'IRANSans',
                    color: pColorGrayPalette,
                  ),
                  subtitle: Text('جواب صحیح: ${questions.trueAnswer.toString()}'),
                  subtitleTextStyle: const TextStyle(
                    fontFamily: 'IRANSans',
                    color: pColorGrayPalette,
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: pColorGrayPalette,
                    ),
                    onPressed: () {
                      deleteQuestion(questions.id);
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void deleteQuestion(int id) async {
    await CRUDQuestion.deleteQuestion(id);
    Question? question;
    for (var item in questions) {
      if (item.id == id) {
        question = item;
        break;
      }
    }
    questions.remove(question!);
  }
}
