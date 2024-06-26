import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/methods/grader_crud.dart';
import 'package:quiz_app/models/grader_model.dart';
import 'package:quiz_app/models/questions_model.dart';
import 'package:quiz_app/screens/result_screen.dart';
import 'package:quiz_app/widgets/answer_button_widget.dart';
import 'package:quiz_app/widgets/base_widget.dart';
import 'package:quiz_app/widgets/progress_bar_widget.dart';
import 'package:quiz_app/widgets/questions_list_widget.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key, required this.playerId});

  final int playerId;

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  late Size size;

  int currentQuestionNumber = 0;
  bool isOnePressed = true;
  List statusList = [];
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (int i = 0; i < Hive.box<Question>('question').length; i++) {
      statusList.add(0);
    }

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          if ((animation.value * 100).round() > 98) {
            onNextPressed(true);
            if (controller.isAnimating) {
              controller.reset();
              controller.forward();
            }
          }
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return BaseWidget(
      appBar: null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              ProgressBarWidget(
                animation: animation,
              ),
              const SizedBox(
                height: 20,
              ),
              QuestionsListWidget(
                currentQuestionNumber: currentQuestionNumber,
                statusList: statusList,
                scrollController: scrollController,
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 400,
                width: size.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 0,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: pColorGreeneDarker,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      child: Text(
                        ((Hive.box<Question>('question')
                                    .getAt(currentQuestionNumber)!
                                    .id) +
                                1)
                            .toString(),
                        style: const TextStyle(
                          color: pColorGrayPalette,
                          fontSize: 30,
                          fontFamily: 'IRANSans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 55,
                      child: Container(
                        width: size.width - 80,
                        height: 300,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: pColorGreeneDarker,
                        ),
                        child: Center(
                          child: Text(
                            Hive.box<Question>('question')
                                .getAt(currentQuestionNumber)!
                                .question,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: pColorGrayPalette,
                              fontSize: 30,
                              fontFamily: 'IRANSans',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AnswerButtonWidget(
                answer: Hive.box<Question>('question')
                    .getAt(currentQuestionNumber)!
                    .firstAnswer,
                number: 1,
                isOnePressed: isOnePressed,
                onPressed: () {
                  answerPressed(1);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              AnswerButtonWidget(
                answer: Hive.box<Question>('question')
                    .getAt(currentQuestionNumber)!
                    .secondAnswer,
                number: 2,
                isOnePressed: isOnePressed,
                onPressed: () {
                  answerPressed(2);
                },
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Material(
                    color: pColorGreenLight,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    child: InkWell(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      onTap: () {
                        onNextPressed(false);
                      },
                      child: Container(
                        width: 200,
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: const Center(
                          child: Text(
                            'بعدی',
                            style: TextStyle(
                              color: pColorGreeneDarker,
                              fontSize: 25,
                              fontFamily: 'IRANSans',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: pColorGreeneDarker,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    child: InkWell(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      onTap: () {
                        appNavigator();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 13,
                          horizontal: 25,
                        ),
                        decoration: const BoxDecoration(),
                        child: const Center(
                          child: Icon(
                            Icons.flag_rounded,
                            color: pColorGrayPalette,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  onNextPressed(bool isFromTimer) {
    scrollController.animateTo(
      currentQuestionNumber * 55,
      duration: const Duration(microseconds: 800),
      curve: Curves.decelerate,
    );
    if (isFromTimer) {
      statusList[currentQuestionNumber] = false;
    } else {
      checkAnswer();
      controller.reset();
      controller.forward();
    }
    if (currentQuestionNumber < Hive.box<Question>('question').length - 1) {
      currentQuestionNumber++;
      setState(() {});
    } else {
      appNavigator();
    }
  }

  checkAnswer() {
    int playerAnswer = isOnePressed ? 1 : 2;
    bool status = Hive.box<Question>('question')
        .getAt(currentQuestionNumber)!
        .isTrue(playerAnswer);
    statusList[currentQuestionNumber] = status;
  }

  List<int> grader() {
    int rightAnswer = 0;
    int wrongAnswer = 0;
    int whiteAnswer = 0;
    for (var item in statusList) {
      if (item == true) {
        rightAnswer++;
      } else if (item == false) {
        wrongAnswer++;
      } else {
        whiteAnswer++;
      }
    }
    return [rightAnswer, wrongAnswer, whiteAnswer];
  }

  appNavigator() {
    controller.reset();
    controller.dispose();
    var graderResult = CRUDGrader.createGrader(
      Grader(
        0,
        widget.playerId,
        grader()[0],
        grader()[1],
        grader()[2],
      ),
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(playerId: widget.playerId, graderList: graderResult,),
      ),
    );
  }

  answerPressed(int number) {
    if (number == 1) {
      setState(() {
        isOnePressed = true;
      });
    } else if (number == 2) {
      setState(() {
        isOnePressed = false;
      });
    }
  }
}
