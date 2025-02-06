import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/services/token_service.dart';

import '../../routes/router.dart';
import '../../utils/gid.dart';
import '../../utils/log.dart';
import 'login_logic.dart';
import 'login_state.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final LoginLogic logic = Get.put(LoginLogic());
  final LoginState state = Get.find<LoginLogic>().state;

  final log = Log();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("登录页面"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("登录页面"),
            ElevatedButton(
              child: Text("登录"),
              onPressed: () async {
                var token = Gid.uuidV4();
                log.debug("点击生成user token，并存储到storage中 ${token}");

                TokenService.setUserToken(token);

                log.debug(
                    "user token存储到storage ${TokenService.getUserToken()}");

                //登录成功，跳转首页
                Get.toNamed(AppRouter.ROUTE_PAGE_HOME);
              },
            ),
          ],
        )));
  }
}
