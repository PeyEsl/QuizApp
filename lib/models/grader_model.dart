import 'package:hive/hive.dart';

part 'grader_model.g.dart';

@HiveType(typeId: 3)
class Grader extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  int playerId;
  @HiveField(2)
  int rightAnswer;
  @HiveField(3)
  int wrongAnswer;
  @HiveField(4)
  int whiteAnswer;

  Grader(this.id, this.playerId, this.rightAnswer, this.wrongAnswer, this.whiteAnswer);
}