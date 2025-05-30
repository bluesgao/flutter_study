import '../model/game_model.dart';

class GameService {
  final List<GameInfo> _games = [];

  List<GameInfo> get games => _games;

  void genGames() {
    // var response = await Dio().get("http://v.juhe.cn/joke/content/text.php?page=1&pagesize=20&key=03303e4d34effe095cf6a4257474cda9");
    // if (response.statusCode == 200) {
    //   // 转换模型
    //   JokeModel jokeModel = jokeModelFromJson(json.encode(response.data["result"]));
    //   // 更新数据
    //   jokeViewModel.setJokeList(jokeModel);

    // 模拟 API 请求
    List<String> imgList = [
      'https://p1.ssl.qhimg.com/t01683f3a068943c2e3.png',
      'https://p1.ssl.qhimg.com/t01e9ee778759020ddb.png',
      'https://p1.ssl.qhimg.com/t01f7dfb7391d1f1de2.jpg',
      'https://p1.ssl.qhimg.com/t01aa65ca167724f2c9.jpg',
      'https://p4.ssl.qhimg.com/t01345cf34a1807d669.png'
    ];
    List<GameInfo> gameList = [];
    for (var i = 0; i < imgList.length; i++) {
      gameList.add(GameInfo(i.toString(), "name", imgList[i], "desc"));
    }
    print(gameList);
    _games.clear();
    _games.addAll(gameList);
  }
}
