import 'package:flutter/material.dart';

class TabBarLayout extends StatefulWidget {
  const TabBarLayout({super.key, required this.title});

  final String title;

  @override
  State<TabBarLayout> createState() => _TabBarLayoutState();
}

class _TabBarLayoutState extends State<TabBarLayout> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //  导航标签控制组件，选项卡必须使用TabController
    return DefaultTabController(
        length: 8, //// 选项卡的数量
        child: SafeArea(
            child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
            bottom: _buildTabBar(),
            // 导航栏右侧菜单
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () {},
              ),
            ],
          ),
          body: _buildTabBarView(),
        )));
  }

  TabBar _buildTabBar() {
    List<Tab> tabs = [];
    tabs.add(Tab(
      text: "关注",
    ));
    tabs.add(Tab(
      text: "热门",
    ));
    tabs.add(Tab(
      text: "财经",
    ));
    tabs.add(Tab(
      text: "体育",
    ));
    tabs.add(Tab(
      text: "时政",
    ));
    tabs.add(Tab(
      text: "娱乐",
    ));
    tabs.add(Tab(
      text: "民生",
    ));
    tabs.add(Tab(
      text: "科技",
    ));
    //isScrollable可左右滑动
    return TabBar(
      tabs: tabs,
      isScrollable: true,
    );
  }

  TabBarView _buildTabBarView() {
    List<Widget> views = [];
    views.add(Center(
      child: Text("关注内容"),
    ));
    views.add(Center(
      child: Text("热门内容"),
    ));
    views.add(Center(
      child: Text("财经内容"),
    ));
    views.add(Center(
      child: Text("体育内容"),
    ));
    views.add(Center(
      child: Text("时政内容"),
    ));
    views.add(Center(
      child: Text("娱乐内容"),
    ));
    views.add(Center(
      child: Text("民生内容"),
    ));
    views.add(Center(
      child: Text("科技内容"),
    ));

    return TabBarView(children: views);
  }
}
