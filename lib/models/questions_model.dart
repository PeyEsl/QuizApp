import 'package:hive/hive.dart';

part 'questions_model.g.dart';

@HiveType(typeId: 1)
class Question extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String question;
  @HiveField(2)
  String firstAnswer;
  @HiveField(3)
  String secondAnswer;
  @HiveField(4)
  int trueAnswer;

  Question(this.id, this.question, this.firstAnswer, this.secondAnswer,
      this.trueAnswer);

  bool isTrue(int playerAnswer) {
    if (playerAnswer == 1 || playerAnswer == 2) {
      if (playerAnswer == 1 && trueAnswer == 1) {
        return true;
      } else if (playerAnswer == 2 && trueAnswer == 2) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }
}
