import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/models/questions_model.dart';

class QuestionNumber extends StatelessWidget {
  const QuestionNumber({super.key, required this.number, required this.currentQuestionNumber, required this.statusList});

  final int number;
  final int currentQuestionNumber;
  final List statusList;

  @override
  Widget build(BuildContext context) {
    Color color = pColorGreeneDarker;
    int temp = number - 1;
    int questionListSize = questionList.length;
    if (temp == currentQuestionNumber) {
      if (temp == questionListSize - 1 && statusList[temp] != 0) {
        if (statusList[temp] == true) {
          color = pColorTrueAnswer;
        } else if (statusList[temp] == false) {
          color = pColorFalseAnswer;
        } else {
          color = pColorGreeneDarker;
        }
      } else {
        color = pColorGrayPalette;
      }
    } else {
      if (statusList[temp] == true) {
        color = pColorTrueAnswer;
      } else if (statusList[temp] == false) {
        color = pColorFalseAnswer;
      } else {
        color = pColorGreeneDarker;
      }
    }
    return Container(
      height: temp == currentQuestionNumber ? 80 : 60,
      width: temp == currentQuestionNumber ? 80 : 60,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Center(
        child: Text(
          '$number',
          style: TextStyle(
            color: temp == currentQuestionNumber
                ? pColorGreeneDarker
                : pColorGrayPalette,
            fontSize: temp == currentQuestionNumber ? 45 : 30,
            fontFamily: 'IRANSans',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
