import 'package:get/get.dart';

import 'home_state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();

  // 保存当前主题（默认是亮色主题）
  var isDarkTheme = false.obs;

  // 切换主题
  void toggleTheme() {
    isDarkTheme.value = !isDarkTheme.value;
  }
}
