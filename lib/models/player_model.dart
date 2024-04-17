import 'package:hive/hive.dart';
import 'package:quiz_app/models/grader_model.dart';

part 'player_model.g.dart';

@HiveType(typeId: 2)
class Player extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String family;
  @HiveField(3)
  List<Grader> graders;

  Player(this.id, this.name, this.family, this.graders);
}