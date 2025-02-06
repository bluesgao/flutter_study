import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/router.dart';
import 'home_logic.dart';
import 'home_state.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeLogic logic = Get.put(HomeLogic());
  final HomeState state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GetX 案例")),
      body: ListView(
        children: [
          ListTile(
              leading: Icon(Icons.label),
              title: Text("计算器"),
              trailing: TextButton(
                onPressed: () async {
                  print("点击跳转页面");
                  // Get.to(CounterPage());
                  Get.toNamed(AppRouter.ROUTE_PAGE_COUNTER,
                      arguments: {"title": "counter"});
                },
                child: Icon(Icons.arrow_forward),
              )),
          Divider(color: Colors.grey, thickness: 1), //分割线
          ListTile(
              leading: Icon(Icons.label),
              title: Text("snack bar"),
              trailing: TextButton(
                onPressed: () async {
                  print("点击跳转页面");
                  // Get.to(SnackBarPage());
                  Get.toNamed(AppRouter.ROUTE_PAGE_SNACKBAR,
                      arguments: {"title": "snackbar"});
                },
                child: Icon(Icons.arrow_forward),
              )),
          Divider(color: Colors.grey, thickness: 1), //分割线
          ListTile(
              leading: Icon(Icons.label),
              title: Text("对话框"),
              trailing: TextButton(
                onPressed: () async {
                  print("点击跳转页面");
                  // Get.to(DialogPage());
                  Get.toNamed(AppRouter.ROUTE_PAGE_DIALOG,
                      arguments: {"title": "dialog"});
                },
                child: Icon(Icons.arrow_forward),
              )),
          Divider(color: Colors.grey, thickness: 1), //分割线
          ListTile(
              leading: Icon(Icons.label),
              title: Text("个人中心"),
              subtitle: Text("需要登录，会被重定向到登录页面"),
              trailing: TextButton(
                onPressed: () async {
                  print("点击跳转页面");
                  // Get.to(DialogPage());
                  Get.toNamed(AppRouter.ROUTE_PAGE_PROFILE,
                      arguments: {"title": "profile"});
                },
                child: Icon(Icons.arrow_forward),
              )),
          Divider(color: Colors.grey, thickness: 1), //分割线
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 切换主题
          print("点击切换主题");
          logic.toggleTheme();
        },
        child: Icon(Icons.light_mode),
      ),
    );
  }
}
