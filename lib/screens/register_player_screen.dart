import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/methods/player_crud.dart';
import 'package:quiz_app/models/player_model.dart';
import 'package:quiz_app/models/questions_model.dart';
import 'package:quiz_app/screens/add_question_screen.dart';
import 'package:quiz_app/screens/home_page_screen.dart';
import 'package:quiz_app/screens/question_list_screen.dart';
import 'package:quiz_app/widgets/base_widget.dart';
import 'package:quiz_app/widgets/customize_text_field_widget.dart';
import 'package:quiz_app/widgets/question_widget.dart';

class RegisterPlayerScreen extends StatelessWidget {
  RegisterPlayerScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController familyController = TextEditingController();

  FocusNode nameFocus = FocusNode();

  late Size size;

  int? playerId;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return BaseWidget(
      appBar: null,
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.2,
                  ),
                  const Image(
                    height: 200,
                    width: 200,
                    image: AssetImage('assets/images/artanLogo.png'),
                  ),
                  const Spacer(),
                  CustomizeTextFieldWidget(
                    controller: nameController,
                    labelText: 'نام',
                    focusNode: nameFocus,
                  ),
                  CustomizeTextFieldWidget(
                    controller: familyController,
                    labelText: 'نام‌خانوادگی',
                    focusNode: null,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      QuestionWidget(
                        icon: Icons.add_circle_rounded,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddQuestionScreen(),
                            ),
                          );
                        },
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(pColorGreeneDarker),
                          foregroundColor:
                              MaterialStateProperty.all(pColorGrayPalette),
                          textStyle: MaterialStateProperty.all(
                            const TextStyle(
                              fontSize: 30,
                              fontFamily: 'IRANSans',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (Hive.box<Question>('question').length <= 0) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddQuestionScreen(),
                              ),
                            );
                          } else {
                            if (nameController.text == '' ||
                                familyController.text == '') {
                              nameFocus.requestFocus();
                            } else {
                              if (Hive.box<Player>('player').length <= 0) {
                                CRUDPlayer.createPlayer(
                                  Player(
                                    0,
                                    nameController.text,
                                    familyController.text,
                                  ),
                                ).then((playerData) {
                                  playerId = playerData.id;
                                });
                              } else {
                                bool findPlayer = false;
                                for (var item
                                    in Hive.box<Player>('player').values) {
                                  if (item.name == nameController.text &&
                                      item.family == familyController.text) {
                                    playerId = item.id;
                                    findPlayer = true;
                                    break;
                                  }
                                }
                                if (findPlayer == false) {
                                  CRUDPlayer.createPlayer(
                                    Player(
                                      0,
                                      nameController.text,
                                      familyController.text,
                                    ),
                                  ).then((playerData) {
                                    playerId = playerData.id;
                                  });
                                }
                              }
                              if (playerId != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePageScreen(
                                      playerId: playerId!,
                                    ),
                                  ),
                                );
                              }
                            }
                          }
                          nameController.clear();
                          familyController.clear();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 8.0),
                          child: Text(Hive.box<Question>('question').length <= 0
                              ? 'ثبت'
                              : 'شروع'),
                        ),
                      ),
                      QuestionWidget(
                        icon: Icons.list_alt_rounded,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuestionListScreen(),
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
      ),
    );
  }
}
