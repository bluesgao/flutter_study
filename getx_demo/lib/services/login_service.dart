import '../utils/log.dart';

class LoginService {
  final log = Log();
  // 业务操作
  void login(String username, String password) {
    log.debug("login username: ${username}, password: ${password}");
  }
}
