import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'utils/index.dart';

void main() async {
  // 确保Flutter初始化完成
  WidgetsFlutterBinding.ensureInitialized();
  // 初始化
  await init();
  runApp(const MyApp());
}

Future<void> init() async {
  // 检查权限
  await checkPermission();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
