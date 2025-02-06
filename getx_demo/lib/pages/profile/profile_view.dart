import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile_logic.dart';
import 'profile_state.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final ProfileLogic logic = Get.put(ProfileLogic());
  final ProfileState state = Get.find<ProfileLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("个人中心页面"),
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("个人中心"),
          ElevatedButton(
            onPressed: () {
              print("点击切换主题");
              // 切换主题
              logic.toggleTheme();
            },
            child: Text('Toggle Theme'),
          )
        ])));
  }
}
