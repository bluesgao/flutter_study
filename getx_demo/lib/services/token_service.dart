import 'package:get/get.dart';

import '../utils/store.dart';

class TokenService {
  static final String user_token_key = "user_token";
  static final Duration default_duration = Duration(seconds: 3 * 60); //3分钟
  // 业务操作
  static void setUserToken(String token) {
    Store.writeWithExpiry(user_token_key, token, default_duration);
    print("set user token : ${token}");
  }

  static dynamic getUserToken() {
    var t = Store.readWithExpiry(user_token_key);
    print("get user token : ${t}");
    if (GetUtils.isNull(t)) {
      return null;
    }
    return t;
  }

  static void removeUserToken() {
    print("remove user token");
    Store.remove(user_token_key);
  }
}
