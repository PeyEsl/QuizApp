import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quiz_app/models/questions_model.dart';
import 'package:quiz_app/widgets/question_number_widget.dart';

class QuestionsListWidget extends StatelessWidget {
  const QuestionsListWidget(
      {super.key,
      required this.currentQuestionNumber,
      required this.statusList,
      required this.scrollController});

  final int currentQuestionNumber;
  final List statusList;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    for (int i = 0; i < Hive.box<Question>('question').length; i++) {
      list.add(QuestionNumberWidget(
        number: i + 1,
        currentQuestionNumber: currentQuestionNumber,
        statusList: statusList,
      ));
    }
    return SingleChildScrollView(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: list,
      ),
    );
  }
}
