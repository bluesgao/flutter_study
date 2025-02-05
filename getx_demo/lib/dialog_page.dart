import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogPage extends StatefulWidget {
  const DialogPage({super.key});

  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("snack bar"),
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
