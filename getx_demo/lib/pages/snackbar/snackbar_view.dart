import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'snackbar_logic.dart';
import 'snackbar_state.dart';

class SnackbarPage extends StatelessWidget {
  SnackbarPage({Key? key}) : super(key: key);

  final SnackbarLogic logic = Get.put(SnackbarLogic());
  final SnackbarState state = Get.find<SnackbarLogic>().state;

  @override
  Widget build(BuildContext context) {
    // 获取路由传递的参数
    Map routeArgs = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("案例: ${routeArgs["title"]}"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Get.snackbar("Snackbar 标题", "欢迎使用Snackbar");
                },
                child: Text("Snack bar(默认)")),
            ElevatedButton(
                onPressed: () {
                  Get.snackbar("Snackbar 标题", "欢迎使用Snackbar",
                      snackPosition: SnackPosition.BOTTOM);
                },
                child: Text("Snack bar(下方)"))
          ],
        ),
      ),
    );
  }
}
