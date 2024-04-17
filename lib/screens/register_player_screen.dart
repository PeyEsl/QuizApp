import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
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

  late Size size;

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
                  ),
                  CustomizeTextFieldWidget(
                    controller: familyController,
                    labelText: 'نام‌خانوادگی',
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePageScreen(),
                              ));
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 8.0),
                          child: Text('شروع'),
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
