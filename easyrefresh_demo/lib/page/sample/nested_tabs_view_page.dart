import 'dart:async';

import 'package:easyrefresh_demo/widget/skeleton_item.dart';
import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:easyrefresh_demo/widget/logo_widget.dart';
import 'package:easyrefresh_demo/widget/search_widget.dart';
import 'package:easyrefresh_demo/widget/actions_widget.dart';

import 'package:easyrefresh_demo/widget/common_sliver_header_delegate.dart';

class NestedTabsViewPage extends StatefulWidget {
  const NestedTabsViewPage({super.key});

  @override
  NestedTabsViewPageState createState() {
    return NestedTabsViewPageState();
  }
}

class NestedTabsViewPageState extends State<NestedTabsViewPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> _tabs = [
    'Home',
    'Business',
    'School1',
    'School2',
    'School3',
    'School4',
    'School5',
    'School6',
    'School7',
  ];

  final double tabBarHeight = 40;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  double getTabBarHeight() {
    return kToolbarHeight > tabBarHeight ? tabBarHeight : kToolbarHeight;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: _buildNestedScrollView()));
  }

  Widget _buildNestedScrollView() {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          //searchbar
          SliverPersistentHeader(
            delegate: CommonSliverHeaderDelegate(
              islucency: false,
              child: PreferredSize(
                preferredSize: Size.fromHeight(48),
                child: Container(
                  color: Colors.cyan,
                  padding: EdgeInsets.all(8),
                  child: SearchWidget(height: 36),
                ),
              ),
              backgroundColor: Colors.red,
            ),
          ),
          //tab bar 悬停
          SliverPersistentHeader(
            pinned: true, // 让 header 固定在顶部
            floating: true,
            delegate: CommonSliverHeaderDelegate(
              islucency: false,
              child: buildCustomTabBar(),
              backgroundColor: Colors.yellow,
            ),
          ),
        ];
      },
      body: buildCustomTabBarView(),
    );
  }

  Widget _buildSliverGrid() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Container(
          color: Colors.blue[(index % 9) * 100],
          child: Center(child: Text('Grid Item $index')),
        );
      }, childCount: 30),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 每行显示 2 个
      ),
    );
  }

  Widget _buildListView(String title) {
    return ListView.builder(
      itemCount: 20, // 列表项数量
      itemBuilder: (context, index) {
        return Card(
          color: Colors.blueGrey[(index % 9) * 100],
          child: Container(height: 100, child: Text('Grid Item $title $index')),
        );
      },
    );
  }

  Widget buildCustomTabBarView() {
    return TabBarView(
      controller: _tabController, //tabbar控制器
      children: <Widget>[
        // Scaffold(
        //   body: Text('sdf'),
        // ),
        _buildListView("home"),
        _buildListView('Business'),
        _buildListView('School1'),
        _buildListView('School2'),
        _buildListView('School3'),
        _buildListView('School4'),
        _buildListView('School5'),
        _buildListView('School6'),
        _buildListView('School7'),
      ],
    );
  }

  PreferredSize buildCustomTabBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(38), // 这里设置高度
      child: Container(
        child: TabBar(
          controller: _tabController,
          isScrollable: true, //是否可滚动
          tabAlignment: TabAlignment.start, // 设置为左对齐
          padding: EdgeInsets.zero, // Remove default padding
          //指示器长度=label，即tab文字长度
          indicatorSize: TabBarIndicatorSize.label,
          //指示器长度=tab
          // indicatorSize: TabBarIndicatorSize.tab,
          labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
          tabs:
              _tabs.map((String tab) {
                return Tab(text: tab);
              }).toList(),
        ),
      ),
    );
  }
}

class _AutomaticKeepAlive extends StatefulWidget {
  final Widget child;

  const _AutomaticKeepAlive({required this.child});

  @override
  State<_AutomaticKeepAlive> createState() => _AutomaticKeepAliveState();
}

class _AutomaticKeepAliveState extends State<_AutomaticKeepAlive>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
