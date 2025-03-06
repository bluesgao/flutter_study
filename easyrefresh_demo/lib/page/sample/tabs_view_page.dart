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

class TabsViewPage extends StatefulWidget {
  const TabsViewPage({super.key});

  @override
  TabsViewPageState createState() {
    return TabsViewPageState();
  }
}

class TabsViewPageState extends State<TabsViewPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> _tabs = [
    'Home',
    'Business',
    'School',
    'School',
    'School',
    'School',
    'School',
    'School',
    'School',
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
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            _buildSliverAppBar(),
            // SliverToBoxAdapter(child: _buildAppBar()),
            SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  color: Colors.blue[(index % 9) * 100],
                  child: Center(child: Text('Grid Item $index')),
                );
              }, childCount: 30),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 每行显示 2 个
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSliverAppBar() {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return SliverAppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.red, // 设置状态栏背景颜色（Android）
        statusBarIconBrightness: Brightness.dark, // 状态栏图标颜色（Android）
        statusBarBrightness: Brightness.dark, // 状态栏文字颜色（iOS）
      ),
      backgroundColor: Colors.white,
      expandedHeight: statusBarHeight + getTabBarHeight(),
      pinned: true, // 固定在顶部
      floating: true, // 快速显示
      // snap: true, // 快速展开
      // stretch: true,
      // 固定状态下的高度
      toolbarHeight: getTabBarHeight(),
      elevation: 0.0, // 设置阴影高度
      // 禁止自动添加返回按钮
      automaticallyImplyLeading: false,
      // 定制search
      title: SearchWidget(height: 32),
      // title组件居中
      centerTitle: true,
      //leading和title的间距，默认为 16
      titleSpacing: 8,
      //定制logo
      leading: LogoWidget(height: getTabBarHeight(), width: getTabBarHeight()),
      //定制 tabbar
      bottom: _buildTabBar(),
    );
  }

  PreferredSize _buildTabBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(32), // 这里设置高度
      child: Container(
        child: TabBar(
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

  TabBar _buildNormalTabBar() {
    return TabBar(
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
    );
  }

  Widget _buildAppBar() {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return AppBar(
      backgroundColor: Colors.white,
      // expandedHeight: statusBarHeight + kToolbarHeight,
      // pinned: true, // 固定在顶部
      // floating: true, // 快速显示
      // // snap: true, // 快速展开
      // stretch: true,
      // 固定状态下的高度
      // toolbarHeight: kToolbarHeight,
      // 定制search
      title: SearchWidget(height: 42),
      // title组件居中
      centerTitle: true,
      //leading和title的间距，默认为 16
      titleSpacing: 8,
      //定制logo
      leading: LogoWidget(height: kToolbarHeight, width: kToolbarHeight),
      //定制 tabbar
      bottom: TabBar(
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
