import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // For .w and .sp extensions

class GoodsPage extends StatelessWidget {
  const GoodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _tabs = <String>['猜你喜欢', '今日特价', '发现更多', '新品发售', '热门产品', '明星同款'];
    // 构建 tabBar
    return DefaultTabController(
      length: _tabs.length, // tab的数量.
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  leading: Icon(Icons.home),
                  title: const Text('商城'),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.notifications_none_outlined),
                      onPressed: () {},
                    ),
                  ],
                  centerTitle: true,
                  floating: true,
                  pinned: true,
                  snap: true,
                  forceElevated: innerBoxIsScrolled,
                  bottom: TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.start, // 设置为左对齐
                    tabs: _tabs.map((String name) => Tab(text: name)).toList(),
                    //指示器样式设置
                    indicator: UnderlineTabIndicator(
                      borderSide:
                          BorderSide(color: Color(0xff2fcfbb), width: 3),
                      insets: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    ), // Make the indicator color transparent
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: _tabs.map((String name) {
              return Builder(
                builder: (BuildContext context) {
                  return CustomScrollView(
                    key: PageStorageKey<String>(name),
                    slivers: <Widget>[
                      SliverOverlapInjector(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.all(8.0),
                        sliver: buildSliverList(50),
                      ),
                    ],
                  );
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

Widget buildSliverList([int count = 5]) {
  return SliverFixedExtentList(
    itemExtent: 50,
    delegate: SliverChildBuilderDelegate(
      (context, index) => ListTile(
        title: Text('$index'),
        onTap: () {
          print(index);
        },
      ),
      childCount: count,
    ),
  );
}
