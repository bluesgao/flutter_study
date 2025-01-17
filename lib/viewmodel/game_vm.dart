import 'package:flutter/material.dart';
import 'package:flutter_study/model/game_model.dart';

import '../service/game_service.dart';

class GameViewModel extends ChangeNotifier {
  GameService service = GameService();

  List<GameInfo> get gameList => service.games;

  void fetch() {
    service.genGames();
    notifyListeners(); // 通知 View 更新
  }
}
