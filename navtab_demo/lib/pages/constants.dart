class Constants {
  static List<Map<String, dynamic>> navigationBarItems() {
    return [
      {
        'title': '游戏',
        'normalIcon': 'assets/images/home_line.png',
        'pressedIcon': 'assets/images/home_fill.png',
        'index': 0,
      },
      {
        'index': 1,
        'title': '福利',
        'normalIcon': 'assets/images/bill_line.png',
        'pressedIcon': 'assets/images/bill_fill.png'
      },
      {
        'index': 2,
        'title': '我的',
        'normalIcon': 'assets/images/mine_line.png',
        'pressedIcon': 'assets/images/mine_fill.png'
      },
    ];
  }

  static List<Map<String, String>> headerGrids() {
    return [
      {'name': '收付款', 'icon': 'assets/images/grid-buttons/grid-3-1.png'},
      {'name': '钱包', 'icon': 'assets/images/grid-buttons/grid-3-2.png'},
    ];
  }

  static List<Map<String, String>> financeGrids() {
    return [
      {'name': '信用卡还款', 'icon': 'assets/images/grid-buttons/grid-1-1.png'},
      {'name': '借钱', 'icon': 'assets/images/grid-buttons/grid-1-2.png'},
      {'name': '理财', 'icon': 'assets/images/grid-buttons/grid-1-3.png'},
      {'name': '保险', 'icon': 'assets/images/grid-buttons/grid-1-4.png'},
    ];
  }

  static List<Map<String, String>> serviceGrids() {
    return [
      {'name': '手机充值', 'icon': 'assets/images/grid-buttons/grid-2-1.png'},
      {'name': '生活缴费', 'icon': 'assets/images/grid-buttons/grid-2-2.png'},
      {'name': '充值', 'icon': 'assets/images/grid-buttons/grid-2-3.png'},
      {'name': '城市服务', 'icon': 'assets/images/grid-buttons/grid-2-4.png'},
      {'name': '公益', 'icon': 'assets/images/grid-buttons/grid-4-1.png'},
      {'name': '医疗', 'icon': 'assets/images/grid-buttons/grid-4-2.png'},
      {'name': '健康码', 'icon': 'assets/images/grid-buttons/grid-4-3.png'},
    ];
  }

  static List<Map<String, String>> thirdpartyGrids() {
    return [
      {'name': '某东购物', 'icon': 'assets/images/grid-buttons/grid-5-1.png'},
      {'name': '某团外卖', 'icon': 'assets/images/grid-buttons/grid-5-2.png'},
      {'name': '电影票务', 'icon': 'assets/images/grid-buttons/grid-5-3.png'},
      {'name': '某团团购', 'icon': 'assets/images/grid-buttons/grid-5-4.png'},
      {'name': '拼夕夕', 'icon': 'assets/images/grid-buttons/grid-5-5.png'},
      {'name': '女装', 'icon': 'assets/images/grid-buttons/grid-5-6.png'},
      {'name': '某特卖', 'icon': 'assets/images/grid-buttons/grid-5-7.png'},
      {'name': '某二手', 'icon': 'assets/images/grid-buttons/grid-5-8.png'},
      {'name': '找房', 'icon': 'assets/images/grid-buttons/grid-5-9.png'},
    ];
  }
}
