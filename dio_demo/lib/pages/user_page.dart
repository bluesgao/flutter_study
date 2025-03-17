import 'package:dio_demo/model/user.dart';
import 'package:dio_demo/service/user.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key, required this.title});

  final String title;

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final UserService userService = UserService();

  List<UserModel> users = [];

  UserModel userInfo = UserModel(id: 0, name: "");

  Future<void> _fetchUserList() async {
    var resp = await userService.userList();
    print("------resp: ${resp}");
    if (resp != null) {
      setState(() {
        users = resp;
      });
    }
  }

  Future<void> _fetchUser() async {
    var resp = await userService.getUser("1");
    print("------resp: ${resp}");
    if (resp != null) {
      setState(() {
        userInfo = resp;
      });
    }
  }

  @override
  void initState() {
    print("initState");
    super.initState();
    _fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          children: [
            Text(
              "用户信息:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(userInfo.toString()),
            Text(
              "朋友列表:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(users[index].name),
                    subtitle: Text("ID: ${users[index].id}"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchUserList,
        tooltip: '获取用户信息',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
