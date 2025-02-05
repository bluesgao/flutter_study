import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      defaultTransition: Transition.rightToLeftWithFade,
      initialRoute: "/",
      getPages: AppRoutes.routes,
    );
  }
}
