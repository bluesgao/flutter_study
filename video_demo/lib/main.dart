import 'package:flutter/material.dart';
// import 'package:video_demo/counter_page.dart';
import 'package:video_demo/chewie_page..dart';
// import 'package:video_demo/video_player_page.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ChewiePage(title: ''),
    );
  }
}
