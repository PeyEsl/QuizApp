import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:quiz_app/models/grader_model.dart';
import 'package:quiz_app/models/player_model.dart';
import 'package:quiz_app/models/questions_model.dart';
import 'package:quiz_app/screens/splash_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(QuestionAdapter());
  Hive.registerAdapter(PlayerAdapter());
  Hive.registerAdapter(GraderAdapter());
  await Hive.openBox<Question>('question');
  await Hive.openBox<Player>('player');
  await Hive.openBox<Grader>('grader');
  runApp(Phoenix(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
