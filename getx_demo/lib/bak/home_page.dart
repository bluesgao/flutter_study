import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/routes/router.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // final List<String> items = ["counter page", "demo", "demo"];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("GetX 案例")),
//       body: ListView.separated(
//         itemCount: items.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             leading: Icon(Icons.label),
//             title: Text(items[index]),
//             // subtitle: Text("这是第 ${index + 1} 个项目"),
//             trailing: OutlinedButton(
//               onPressed: () async {
//                 print("点击");
//                 Get.to(CounterPage());
//               },
//               child: Icon(Icons.arrow_forward),
//             ),
//           );
//         },
//         separatorBuilder: (context, index) {
//           return Divider(color: Colors.grey, thickness: 1); // 分割线
//         },
//       ),
//     );
//   }
// }

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
        ));
  }
}
