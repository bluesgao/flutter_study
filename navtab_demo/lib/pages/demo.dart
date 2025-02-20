import 'package:flutter/material.dart';
import '../widgets/index.dart';

class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildCustomSearchAppBar(),
      body: Center(
        child: Text('Hello, World!'),
      ),
    );
  }

  /// 自定义appbar
  AppBarWidget _buildCustomAppBar() {
    return AppBarWidget();
  }

  /// 自定义搜索appbar
  AppBarSearch _buildCustomSearchAppBar() {
    return AppBarSearch();
  }

  /// 默认appbar
  AppBar _buildDefaultAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text('Custom AppBar'),
      backgroundColor: Colors.blueAccent,
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            print('Search button pressed');
          },
        ),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {
            print('More options button pressed');
          },
        ),
      ],
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          print('Menu button pressed');
        },
      ),
    );
  }
}
