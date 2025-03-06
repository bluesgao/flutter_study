import 'dart:async';

import 'package:easyrefresh_demo/widget/skeleton_item.dart';
import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
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
  int _listCount = 20;
  int _gridCount = 20;
  bool _isAppBarVisible = true;
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

  @override
  Widget build(BuildContext context) {
    var appbarHeight = Get.statusBarHeight;
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: statusBarHeight + kToolbarHeight,
              pinned: true, // 固定在顶部
              floating: true, // 快速显示
              snap: true, // 快速展开
              toolbarHeight: kToolbarHeight, // 固定状态下的高度
              //定制展开内容
              // flexibleSpace: FlexibleSpaceBar(
              //   title: Container(
              //     height: kTextTabBarHeight,
              //     // child: Text('CustomScrollView'),
              //     child: _buildSearchAppBar(kTextTabBarHeight),
              //   ),
              // ),
              // title: Text('Custom SliverAppBar'),
              // 定制search
              title: SearchWidget(height: 36),
              centerTitle: true,
              // leading: IconButton(
              //   icon: Icon(Icons.menu),
              //   onPressed: () {
              //     print('Menu Button Pressed');
              //   },
              // ),
              //定制logo
              leading: LogoWidget(
                height: kToolbarHeight,
                width: kToolbarHeight,
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.email_outlined),
                  onPressed: () {
                    print('More Button Pressed');
                  },
                ),
              ],
              //定制 tabbar
              bottom: TabBar(
                isScrollable: true, //是否可滚动
                tabAlignment: TabAlignment.start, // 设置为左对齐
                padding: EdgeInsets.zero, // Remove default padding
                //指示器长度=label，即tab文字长度
                indicatorSize: TabBarIndicatorSize.label,
                //指示器长度=tab
                // indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
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

  Widget _buildSearchAppBar(double searchBarHeight) {
    return
    //搜索框
    Container(
      // color: Colors.cyan,
      // color: Colors.white,
      width: double.infinity,
      height: searchBarHeight,
      alignment: Alignment.center, //设置控件内容的位置
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //logo
          Container(
            height: 38,
            width: 38,
            color: Colors.red,
            margin: EdgeInsets.only(left: 10, right: 10),
            alignment: Alignment.center, //设置控件内容的位置
            child: CircleAvatar(
              backgroundImage: Image.asset('assets/image/user_head.jpg').image,
              radius: searchBarHeight / 2 - 4,
            ),
          ),
          // search
          Expanded(
            // flex: 8,
            child: Container(
              alignment: Alignment.center, //设置控件内容的位置
              height: 32,
              // color: Colors.green,
              // margin: EdgeInsets.all(0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  filled: true,
                  // fillColor: Colors.red,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                ),
              ),
            ),
          ),
          // message
          Container(
            // height: 32,
            // width: 32,
            alignment: Alignment.center, //设置控件内容的位置
            // color: Colors.blue,
            // margin: EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.email_outlined),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomAppBar() {
    var appbarHeight = Get.statusBarHeight;
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    print("Get.statusBarHeight ${Get.statusBarHeight}");
    print("statusBarHeight ${statusBarHeight}");
    print("kToolbarHeight ${kToolbarHeight}");
    final double searchBarHeight = 42;

    final double appBarHeight =
        statusBarHeight +
        (kToolbarHeight > searchBarHeight ? searchBarHeight : kToolbarHeight);

    return SliverPersistentHeader(
      pinned: true,
      delegate: _CustomSliverHeaderDelegate(
        minHeight: appBarHeight,
        maxHeight: appBarHeight,
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                alignment: Alignment.center,
                // child: Text(
                //   'Search Header',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 24.0,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
              ),
            ),
            //搜索框
            Container(
              // color: Colors.cyan,
              color: Colors.white,
              width: double.infinity,
              height: searchBarHeight,
              alignment: Alignment.center, //设置控件内容的位置
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //logo
                  Container(
                    // height: 38,
                    // width: 38,
                    // color: Colors.red,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    alignment: Alignment.center, //设置控件内容的位置
                    child: CircleAvatar(
                      backgroundImage:
                          Image.asset('assets/image/user_head.jpg').image,
                      radius: searchBarHeight / 2 - 4,
                    ),
                  ),
                  // search
                  Expanded(
                    // flex: 8,
                    child: Container(
                      alignment: Alignment.center, //设置控件内容的位置
                      height: 32,
                      // color: Colors.green,
                      // margin: EdgeInsets.all(0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          filled: true,
                          // fillColor: Colors.red,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(Icons.search),
                          contentPadding: EdgeInsets.symmetric(vertical: 0),
                        ),
                      ),
                    ),
                  ),
                  // message
                  Container(
                    // height: 32,
                    // width: 32,
                    alignment: Alignment.center, //设置控件内容的位置
                    // color: Colors.blue,
                    // margin: EdgeInsets.only(right: 10),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.email_outlined),
                    ),
                  ),
                ],
              ),
            ),
          ],
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

// 自定义 SliverPersistentHeaderDelegate
class _CustomSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _CustomSliverHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_CustomSliverHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
