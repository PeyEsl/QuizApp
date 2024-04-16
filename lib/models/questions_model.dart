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

List<Question> questionList = [
  Question(1, 'آیا ایران در آسیا قرار دارد؟', 'بله', 'خیر', 1),
  Question(2, 'آیا تابستان یکی از ماه های سال است؟', 'بله', 'خیر', 2),
  Question(3, 'آیا ما جوراب را روی کفش می پوشیم؟', 'بله', 'خیر', 2),
  Question(4, 'آیا باران از آسمان به زمین می بارد؟', 'بله', 'خیر', 1),
  Question(5, 'آیا حضرت محمد 63 سالگی به پیامبری رسید؟', 'بله', 'خیر', 2),
  Question(6, 'آیا به بیماری قند خون، دیابت هم می گویند؟', 'بله', 'خیر', 1),
  Question(7, 'آیا ماهی در خشکی زندگی می کند؟', 'بله', 'خیر', 2),
  Question(8, 'آیا خورشید در صبح غروب می کند؟', 'بله', 'خیر', 2),
  Question(9, 'آیا سه وعده غذایی داریم؟', 'بله', 'خیر', 1),
  Question(10, 'آیا بخاری خنک می کند؟', 'بله', 'خیر', 2),
];
