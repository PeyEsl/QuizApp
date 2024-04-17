import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class BaseWidget extends StatelessWidget {
  const BaseWidget({super.key, required this.appBar, required this.body});

  final Widget body;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            pColorGreenLight,
            pColorGreeneDark,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        appBar: appBar,
        backgroundColor: Colors.transparent,
        body: body,
      ),
    );
  }
}
