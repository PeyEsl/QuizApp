import 'package:quiz_app/models/grader_model.dart';
import 'package:hive/hive.dart';

class CRUDGrader{
  static Future<Grader> createGrader(Grader grader) async {
    var boxGrader = Hive.box<Grader>('grader');
    int index = await boxGrader.add(grader);
    grader.id = index;
    grader.save();
    return grader;
  }
}