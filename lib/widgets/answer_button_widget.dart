import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class AnswerButtonWidget extends StatelessWidget {
  const AnswerButtonWidget({super.key, required this.answer, required this.number, required this.isOnePressed, required this.onPressed});

  final String answer;
  final int number;
  final bool isOnePressed;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            isOnePressed && number == 1 || !isOnePressed && number == 2
                ? pColorGreenLight
                : pColorGreeneDarker),
        foregroundColor: MaterialStateProperty.all(
            isOnePressed && number == 1 || !isOnePressed && number == 2
                ? pColorGreeneDarker
                : pColorGrayPalette),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 25,
            fontFamily: 'IRANSans',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      child: SizedBox(
        width: 200,
        child: Row(
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: pColorGrayPalette,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  number == 1 ? '1' : '2',
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
              child: Text(answer),
            ),
          ],
        ),
      ),
    );
  }
}
