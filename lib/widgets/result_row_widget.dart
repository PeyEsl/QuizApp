import 'package:flutter/material.dart';

class ResultRowWidget extends StatelessWidget {
  const ResultRowWidget({super.key, required this.point, required this.text, required this.icon, required this.color});

  final String point;
  final String text;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          point,
          style: TextStyle(
            color: color,
            fontSize: 30,
            fontFamily: 'IRANSans',
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 30,
            fontFamily: 'IRANSans',
            fontWeight: FontWeight.bold,
          ),
        ),
        Icon(
          icon,
          color: color,
          size: 50,
        ),
      ],
    );
  }
}
