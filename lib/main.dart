import 'package:flutter/material.dart';
import 'package:flutter_study/layout/google_nav_bar_layout.dart';

import 'layout/bottom_nav_bar_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        // colorScheme: ColorScheme.dark(),
        useMaterial3: true,
      ),
      // home: const HomePage(title: 'HomePage'),
      // home: const DrawerPage(title: 'DrawerPage'),
      home: const BottomNavBarLayout(title: "BottomNavPage"),
      // home: const TabBarPage(title: "TabBarPage"),
      // home: const GoogleNavBarLayout(),
    );
  }
}
