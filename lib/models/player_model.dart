import 'package:hive/hive.dart';

part 'player_model.g.dart';

@HiveType(typeId: 2)
class Player extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String family;

  Player(this.id, this.name, this.family);
}