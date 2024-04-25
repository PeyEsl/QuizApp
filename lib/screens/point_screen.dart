import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/models/grader_model.dart';
import 'package:quiz_app/models/player_model.dart';
import 'package:quiz_app/widgets/base_widget.dart';
import 'package:quiz_app/widgets/point_row_widget.dart';

class PointScreen extends StatelessWidget {
  PointScreen({super.key});

  late Size size;
  var grader = Hive.box<Grader>('grader').values;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return BaseWidget(
      appBar: null,
      body: PopScope(
        canPop: false,
        child: SizedBox(
          height: size.height,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/images/scoreBoard.png',
                      height: 200,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: size.height * 0.67,
                    decoration: const BoxDecoration(
                      color: pColorGrayPalette,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 17.0,
                            ),
                            decoration: const BoxDecoration(
                              color: pColorGrayPalette,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(50),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                ),
                              ],
                            ),
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'نام بازیکن',
                                  style: TextStyle(
                                    color: pColorGreeneDarker,
                                    fontSize: 20,
                                    fontFamily: 'IRANSans',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.check_outlined,
                                  color: pColorTrueAnswer,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.clear,
                                  color: pColorFalseAnswer,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.crop_square_rounded,
                                  color: Colors.grey,
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          for (var item in grader)
                            Column(
                              children: [
                                PointRowWidget(
                                  gradientColor:
                                      item.rightAnswer > item.wrongAnswer
                                          ? pColorTrueAnswer
                                          : pColorFalseAnswer,
                                  player: Hive.box<Player>('player')
                                          .getAt(item.playerId)!
                                          .name +
                                      ' ' +
                                      Hive.box<Player>('player')
                                          .getAt(item.playerId)!
                                          .family,
                                  rightAnswer: item.rightAnswer,
                                  wrongAnswer: item.wrongAnswer,
                                  whiteAnswer: item.whiteAnswer,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
