import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'recommend.dart';
import 'hot.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  final List<String> _tabs = ['推荐视频', '热门视频'];

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    var pinnedHeaderHeight = statusBarHeight + kToolbarHeight;
    // 构建 tabBar
    return DefaultTabController(
      animationDuration: Duration(milliseconds: 50),
      length: _tabs.length, // tab的数量.
      child: Scaffold(
        body: ExtendedNestedScrollView(
          onlyOneScrollInBody: true,
          pinnedHeaderSliverHeightBuilder: () => pinnedHeaderHeight,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                leading: Icon(Icons.home),
                title: const Text('牛B视频'),
                pinned: true,
                floating: true,
                expandedHeight: 200,
                stretch: true,
                elevation: 0,
                stretchTriggerOffset: 100,
                bottom: TabBar(
                  tabs: _tabs
                      .map((String name) => Tab(
                            child: Text(
                              name,
                            ),
                          ))
                      .toList(),
                ),
              ),
            ];
          },
          body: _buildTabBarView(),
        ),
      ),
    );
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
