import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'profile_state.dart';

class ProfileLogic extends GetxController {
  final ProfileState state = ProfileState();

  // 切换主题
  void toggleTheme() {
    state.isDarkTheme.value = !state.isDarkTheme.value;
    Get.changeThemeMode(
        state.isDarkTheme.value ? ThemeMode.dark : ThemeMode.light);
  }
}
