import 'package:flutter/material.dart';

class ResultButton extends StatelessWidget {
  const ResultButton(
      {super.key,
      required this.text,
      required this.backgroundColor,
      required this.foregroundColor,
      required this.onPressed});

  final String text;
  final Color backgroundColor;
  final Color foregroundColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        foregroundColor: MaterialStateProperty.all(foregroundColor),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 30,
            fontFamily: 'IRANSans',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
        child: Text(text),
      ),
    );
  }
}
