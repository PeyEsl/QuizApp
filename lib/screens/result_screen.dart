import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/models/grader_model.dart';
import 'package:quiz_app/screens/point_screen.dart';
import 'package:quiz_app/widgets/base_widget.dart';
import 'package:quiz_app/widgets/result_button_widget.dart';
import 'package:quiz_app/widgets/result_row_widget.dart';
import 'dart:io';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.playerId, required this.graderList});

  late Size size;
  final Future<Grader> graderList;
  final int playerId;
  String status = '';

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return FutureBuilder<Grader>(
      future: graderList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          Grader graderData = snapshot.data!;
          String status = '';
          if (graderData.rightAnswer > graderData.wrongAnswer) {
            status = 'Winner';
          } else {
            status = 'Loser';
          }
          return BaseWidget(
            appBar: null,
            body: PopScope(
              canPop: false,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              status == 'Winner'
                                  ? pColorGreenLight
                                  : pColorFalseAnswer,
                              pColorGrayPalette,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.center,
                          ),
                          borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(50),
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 80,
                            ),
                            SizedBox(
                              height: size.height - 210,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    top: 102,
                                    child: Container(
                                      width: size.width - 80,
                                      decoration: const BoxDecoration(
                                        color: pColorGrayPalette,
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(30),
                                          bottom: Radius.circular(30),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 60,
                                            ),
                                            Text(
                                              'شما ${status == 'Winner' ? 'برنده' : 'بازنده'} شدید',
                                              style: TextStyle(
                                                color: status == 'Winner'
                                                    ? pColorGreeneDarker
                                                    : pColorFalseAnswer,
                                                fontSize: 60,
                                                fontFamily: 'IRANSans',
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            const Divider(
                                              thickness: 4,
                                              color: pColorGreeneDarker,
                                              indent: 50,
                                              endIndent: 50,
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            ResultRowWidget(
                                              point: graderData.rightAnswer
                                                  .toString(),
                                              text: 'جواب صحیح',
                                              icon: Icons.check_outlined,
                                              color: pColorTrueAnswer,
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            ResultRowWidget(
                                              point: graderData.wrongAnswer
                                                  .toString(),
                                              text: 'جواب غلط',
                                              icon: Icons.clear,
                                              color: pColorFalseAnswer,
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            ResultRowWidget(
                                              point: graderData.whiteAnswer
                                                  .toString(),
                                              text: 'بدون جواب',
                                              icon: Icons.crop_square_rounded,
                                              color: Colors.grey,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    child: Image.asset(
                                      'assets/images/${status == 'Winner' ? 'youWin.png' : 'youLose.png'}',
                                      width: size.width - 100,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ResultButtonWidget(
                              text: 'از نو',
                              backgroundColor: pColorGreenLight,
                              foregroundColor: pColorGreeneDarker,
                              onPressed: () {
                                onPlayAgainPressed(context);
                              }),
                          ResultButtonWidget(
                            text: 'نتیجه',
                            backgroundColor: pColorGreeneDarker,
                            foregroundColor: pColorGrayPalette,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PointScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  void onPlayAgainPressed(context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.question,
      animType: AnimType.scale,
      headerAnimationLoop: false,
      alignment: Alignment.center,
      title: 'بازی از نو',
      desc: 'آیا می‌خواهید دوباره بازی کنید؟',
      dialogBackgroundColor: pColorGrayPalette,
      titleTextStyle: const TextStyle(
        color: pColorGreeneDarker,
        fontSize: 30,
        fontFamily: 'IRANSans',
        fontWeight: FontWeight.bold,
      ),
      descTextStyle: const TextStyle(
        fontSize: 20,
        fontFamily: 'IRANSans',
        fontWeight: FontWeight.bold,
      ),
      btnOkText: 'بله',
      btnCancelText: 'خیر',
      buttonsTextStyle: const TextStyle(
        color: pColorGrayPalette,
        fontSize: 20,
        fontFamily: 'IRANSans',
        fontWeight: FontWeight.bold,
      ),
      btnOkOnPress: () {
        onYesPressed(context);
      },
      btnCancelOnPress: () {
        onNoPressed(context);
      },
    ).show();
  }

  void onYesPressed(context) {
    Phoenix.rebirth(context);
  }

  void onNoPressed(context) {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    } else {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }
}
