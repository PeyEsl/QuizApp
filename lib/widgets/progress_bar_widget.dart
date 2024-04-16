import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class ProgressBarWidget extends StatelessWidget {
  const ProgressBarWidget({super.key, required this.animation});

  final Animation animation;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      decoration: BoxDecoration(
        color: pColorGrayPalette,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: LinearProgressIndicator(
          value: animation.value,
          backgroundColor: pColorGrayPalette,
          valueColor:
          const AlwaysStoppedAnimation(pColorGreeneDarker),
        ),
      ),
    );
  }
}
