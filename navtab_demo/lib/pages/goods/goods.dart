import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // For .w and .sp extensions
import '../../widgets/index.dart';
import 'recommend.dart';
import 'hot.dart';

class GoodsPage extends StatefulWidget {
  const GoodsPage({super.key});

  @override
  State<GoodsPage> createState() => _GoodsPageState();
}

class _GoodsPageState extends State<GoodsPage> {
  final List<String> _tabs = ['推荐', '热门'];
  int _currentIndex = 0; // 当前选中索引

  @override
  Widget build(BuildContext context) {
    // 构建 tabBar
    return DefaultTabController(
      animationDuration: Duration(milliseconds: 50),
      length: _tabs.length, // tab的数量.
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return _buildHeaderSliver(context, innerBoxIsScrolled);
          },
          body: _buildTabBarView(),
        ),
      ),
    );
  }

  // 构建sliver appb bar
  List<Widget> _buildHeaderSliver(
      BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      SliverOverlapAbsorber(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        sliver: SliverAppBar(
          leading: Icon(Icons.home),
          title: const Text('商城'),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_none_outlined),
              onPressed: () {
                print('onPressed notifications');
              },
            ),
          ],
          centerTitle: true,
          floating: true,
          pinned: true,
          snap: true,
          forceElevated: false,
          bottom: TabBar(
            onTap: (index) {
              setState(() {
                print('onTap $index');
                _currentIndex = index;
              });
            },
            isScrollable: true, // 设置为可滚动
            tabAlignment: TabAlignment.start, // 设置为左对齐
            // 注意：当为TabBar设置选择和未选择不同大小字体尺寸时滑动Tabbar字体大小动效变化有明显的抖动，需要手工设置文字大小
            labelStyle:
                TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // 设置字体大小
            unselectedLabelStyle: TextStyle(
                fontSize: 16, fontWeight: FontWeight.normal), // 设置未选中字体大小
            tabs: _tabs
                .map((String name) => Tab(
                      child: Text(
                        name,
                        // style: TextStyle(
                        //     fontSize: tabIndex == 0 ? 20 : 16),
                      ),
                    ))
                .toList(),
            //指示器样式设置
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: Colors.red.shade300, width: 2),
              insets: EdgeInsets.fromLTRB(0, 0, 0, 8),
            ),
          ),
        ),
      ),
    ];
  }

  // 构建tabBarView
  Widget _buildTabBarView() {
    return TabBarView(
      children: [
        RecommendPage(),
        HotPage(),
      ],
    );
  }
}
