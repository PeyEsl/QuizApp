import 'package:quiz_app/models/player_model.dart';
import 'package:hive/hive.dart';

class CRUDPlayer{
  static Future<Player> createPlayer(Player player) async {
    var boxPlayer = Hive.box<Player>('player');
    int index = await boxPlayer.add(player);
    player.id = index;
    player.save();
    return player;
  }
}