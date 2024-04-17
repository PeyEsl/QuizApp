import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class PointRowWidget extends StatelessWidget {
  const PointRowWidget({super.key,
    required this.gradientColor,
    required this.player,
    required this.rightAnswer,
    required this.wrongAnswer,
    required this.whiteAnswer});

  final Color gradientColor;
  final String player;
  final int rightAnswer;
  final int wrongAnswer;
  final int whiteAnswer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
        vertical: 17.0,
      ),
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: pColorGrayPalette,
        borderRadius: const BorderRadius.horizontal(
          right: Radius.circular(50),
        ),
        gradient: LinearGradient(
          colors: [
            gradientColor,
            pColorGrayPalette,
          ],
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.topEnd,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            player,
            style: const TextStyle(
              color: pColorGrayPalette,
              fontSize: 18,
              fontFamily: 'IRANSans',
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Text(
            rightAnswer.toString(),
            style: const TextStyle(
              color: pColorTrueAnswer,
              fontSize: 20,
              fontFamily: 'IRANSans',
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Text(
            wrongAnswer.toString(),
            style: const TextStyle(
              color: pColorFalseAnswer,
              fontSize: 20,
              fontFamily: 'IRANSans',
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Text(
            whiteAnswer.toString(),
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontFamily: 'IRANSans',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
