import 'package:flutter/material.dart';

class DynamicPage extends StatelessWidget {
  const DynamicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动态'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('动态'),
      ),
    );
  }
}
