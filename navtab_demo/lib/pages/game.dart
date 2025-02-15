import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10, // 长度必须与TabBar的tabs数量一致
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Games'),
          centerTitle: true, // 标题居中
          bottom: _buildTabBar(),
        ),
        body: _buildTabView(),
      ),
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
      isScrollable: true, //是否可滚动
      tabAlignment: TabAlignment.start, // 设置为左对齐
      labelColor: Colors.black, //文字颜色
      padding: EdgeInsets.zero, // Remove default padding
      labelPadding: EdgeInsets.fromLTRB(20, 0, 10, 5),
      //指示器样式设置
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: Color(0xff2fcfbb), width: 3),
        insets: EdgeInsets.fromLTRB(0, 0, 0, 10),
      ), // Make the indicator color transparent
      tabs: [
        Tab(text: 'Car'),
        Tab(text: 'Transit'),
        Tab(text: 'news'),
        Tab(text: 'food'),
        Tab(text: 'sport'),
        Tab(text: 'travel'),
        Tab(text: 'fashion'),
        Tab(text: 'health'),
        Tab(text: 'science'),
        Tab(text: 'politics'),
      ],
    );
  }

  Widget _buildTabView() {
    return TabBarView(
      children: [
        Center(child: Text('Car Tab')),
        Center(child: Text('Transit Tab')),
        Center(child: Text('news Tab')),
        Center(child: Text('food Tab')),
        Center(child: Text('sport Tab')),
        Center(child: Text('travel Tab')),
        Center(child: Text('fashion Tab')),
        Center(child: Text('health Tab')),
        Center(child: Text('science Tab')),
        Center(child: Text('politics Tab')),
      ],
    );
  }
}
