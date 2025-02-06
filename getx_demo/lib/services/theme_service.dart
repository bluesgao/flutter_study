import 'package:get/get.dart';

import '../utils/store.dart';

class ThemeService {
  static final String theme_mode_key = "theme_mode";
  static final Duration default_duration = Duration(seconds: 3 * 60); //3分钟
  // 业务操作
  static void setThemeMode(bool flag) {
    Store.write(theme_mode_key, flag);
    print("set theme mode : ${flag}");
  }

  static dynamic getThemeMode() {
    var v = Store.read(theme_mode_key);
    print("get theme mode : ${v}");
    if (GetUtils.isNull(v)) {
      return null;
    }
    return v;
  }

  static void removeThemeMode() {
    print("remove theme mode");
    Store.remove(theme_mode_key);
  }
}
