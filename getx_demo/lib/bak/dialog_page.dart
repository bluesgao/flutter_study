import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogPage extends StatelessWidget {
  const DialogPage({super.key});

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
                  Get.defaultDialog(
                      title: "提示",
                      middleText: "您确定退出登录？",
                      confirm: ElevatedButton(
                          onPressed: () {
                            print("确定");
                            Get.back();
                          },
                          child: const Text("确定")),
                      cancel: ElevatedButton(
                          onPressed: () {
                            print("取消");
                            Get.back();
                          },
                          child: const Text("取消")));
                },
                child: const Text("显示默认的Dialog")),
          ],
        ),
      ),
    );
  }
}
