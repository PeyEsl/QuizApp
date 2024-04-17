import 'package:quiz_app/models/questions_model.dart';
import 'package:hive/hive.dart';

class CRUDQuestion{
  static Future<Question> createQuestion(Question question) async {
    var box = Hive.box<Question>('question');
    int index = await box.add(question);
    question.id = index;
    question.save();
    return question;
  }

  static Future<List<Question>> readAllQuestion() async {
    var box = Hive.box<Question>('question');
    return box.values.toList();
  }

  static Future<bool> deleteQuestion(int id) async {
    var box = Hive.box<Question>('question');
    await box.deleteAt(id);
    return true;
  }
}