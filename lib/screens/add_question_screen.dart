import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/methods/question_crud.dart';
import 'package:quiz_app/models/questions_model.dart';
import 'package:quiz_app/widgets/base_widget.dart';
import 'package:quiz_app/widgets/customize_text_field_widget.dart';

class AddQuestionScreen extends StatelessWidget {
  AddQuestionScreen({super.key});

  TextEditingController questionController = TextEditingController();
  TextEditingController firstAnswerController = TextEditingController();
  TextEditingController secondAnswerController = TextEditingController();
  TextEditingController trueAnswerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      appBar: AppBar(
        title: const Text('ثبت سؤال'),
        titleTextStyle: const TextStyle(
          fontSize: 25,
          fontFamily: 'IRANSans',
          fontWeight: FontWeight.bold,
          color: pColorGrayPalette,
        ),
        centerTitle: true,
        backgroundColor: pColorGreenLight,
        iconTheme: const IconThemeData(color: pColorGrayPalette),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    CustomizeTextFieldWidget(
                      controller: questionController,
                      labelText: 'متن سؤال',
                      focusNode: null,
                    ),
                    CustomizeTextFieldWidget(
                      controller: firstAnswerController,
                      labelText: 'جواب اول',
                      focusNode: null,
                    ),
                    CustomizeTextFieldWidget(
                      controller: secondAnswerController,
                      labelText: 'جواب دوم',
                      focusNode: null,
                    ),
                    CustomizeTextFieldWidget(
                      controller: trueAnswerController,
                      labelText: 'جواب درست',
                      focusNode: null,
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        CRUDQuestion.createQuestion(Question(
                          0,
                          questionController.text,
                          firstAnswerController.text,
                          secondAnswerController.text,
                          int.parse(trueAnswerController.text),
                        ));
                        questionController.clear();
                        firstAnswerController.clear();
                        secondAnswerController.clear();
                        trueAnswerController.clear();
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(pColorGreeneDarker),
                        foregroundColor:
                        MaterialStateProperty.all(pColorGrayPalette),
                        textStyle: MaterialStateProperty.all(
                          const TextStyle(
                            fontSize: 25,
                            fontFamily: 'IRANSans',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      child: const SizedBox(
                        width: 120,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  right: 27.5,
                                  left: 10,
                                  top: 8.0,
                                  bottom: 8.0),
                              child: Text('ثبت'),
                            ),
                            Icon(
                              Icons.check_outlined,
                              size: 35,
                            ),
                          ],
                        ),
                      ),
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
      ),
    );
  }
}
