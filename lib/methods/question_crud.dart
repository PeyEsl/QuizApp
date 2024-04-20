import 'package:quiz_app/models/questions_model.dart';
import 'package:hive/hive.dart';

class CRUDQuestion{
  static Future<Question> createQuestion(Question question) async {
    var boxQuestion = Hive.box<Question>('question');
    int index = await boxQuestion.add(question);
    question.id = index;
    question.save();
    return question;
  }

  static Future<bool> deleteQuestion(int id) async {
    var boxQuestion = Hive.box<Question>('question');
    await boxQuestion.deleteAt(id);
    return true;
  }
}