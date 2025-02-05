import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/counter_page.dart';
import 'package:getx_demo/dialog_page.dart';
import 'package:getx_demo/snack_bar_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                title: Text("getx 计算器"),
                trailing: TextButton(
                  onPressed: () async {
                    print("点击跳转页面");
                    Get.to(CounterPage());
                  },
                  child: Icon(Icons.arrow_forward),
                )),
            Divider(color: Colors.grey, thickness: 1), //分割线
            ListTile(
                leading: Icon(Icons.label),
                title: Text("getx snack bar"),
                trailing: TextButton(
                  onPressed: () async {
                    print("点击跳转页面");
                    Get.to(SnackBarPage());
                  },
                  child: Icon(Icons.arrow_forward),
                )),
            Divider(color: Colors.grey, thickness: 1), //分割线
            ListTile(
                leading: Icon(Icons.label),
                title: Text("getx dialog"),
                trailing: TextButton(
                  onPressed: () async {
                    print("点击跳转页面");
                    // Get.to(DialogPage());
                    Get.toNamed("/dialogpage");
                  },
                  child: Icon(Icons.arrow_forward),
                )),
            Divider(color: Colors.grey, thickness: 1), //分割线
          ],
        ));
  }
}
