import 'package:flutter/material.dart';
import 'package:quiz_app/models/questions_model.dart';
import 'package:quiz_app/widgets/question_number.dart';

class QuestionsList extends StatelessWidget {
  const QuestionsList(
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
    for (int i = 0; i < questionList.length; i++) {
      list.add(QuestionNumber(
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
