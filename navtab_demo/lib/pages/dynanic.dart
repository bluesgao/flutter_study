import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class DynamicPage extends StatefulWidget {
  const DynamicPage({super.key});

  @override
  State<DynamicPage> createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage> {
  List<String> items = List.generate(20, (index) => "Item $index");

  // final RefreshController _refreshController =
  //     RefreshController(initialRefresh: false);

  /// **下拉刷新**
  // void _onRefresh() async {
  //   await Future.delayed(Duration(seconds: 2)); // 模拟网络请求
  //   setState(() {
  //     items = List.generate(10, (index) => "New Item $index"); // 替换数据
  //   });
  //   _refreshController.refreshCompleted(); // 完成刷新
  // }

  /// **上拉加载更多**
  // void _onLoading() async {
  //   await Future.delayed(Duration(seconds: 2)); // 模拟网络请求
  //   setState(() {
  //     items.addAll(
  //         List.generate(5, (index) => "More Item ${items.length + index}"));
  //   });
  //   _refreshController.loadComplete(); // 加载完成
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildView(),
    );
  }

  // appbar，公告，通知，上新
  Widget _buildView() {
    //刷新组件
    return CustomScrollView(
      slivers: [
        _buildSliverAppBar("动态"),
        _buildNoticeHeader(),
        _buildNoticeList(),
        _buildNoticeHeader(),
        _buildNoticeList(),
      ],
    );
  }

  // SmartRefresher _buildView() {
  //   //刷新组件
  //   return SmartRefresher(
  //     controller: _refreshController, //刷新控制器
  //     enablePullDown: false, //下拉刷新
  //     enablePullUp: true, //上拉加载更多
  //     onLoading: _onLoading, //上拉加载更多
  //     // onRefresh: _onRefresh, // 下拉刷新
  //     //下拉头部UI样式
  //     // header: const WaterDropHeader(
  //     //   idleIcon: Icon(
  //     //     Icons.car_repair,
  //     //     color: Colors.blue,
  //     //     size: 30,
  //     //   ),
  //     // ),
  //     //上拉底部UI样式
  //     footer: CustomFooter(
  //       builder: (BuildContext context, LoadStatus? mode) {
  //         Widget body;
  //         if (mode == LoadStatus.idle) {
  //           body = Text("上拉加载更多");
  //         } else if (mode == LoadStatus.loading) {
  //           body = CircularProgressIndicator();
  //         } else if (mode == LoadStatus.failed) {
  //           body = Text("加载失败，点击重试！");
  //         } else if (mode == LoadStatus.canLoading) {
  //           body = Text("松手加载更多");
  //         } else {
  //           body = Text("没有更多数据了");
  //         }
  //         return SizedBox(
  //           height: 55.0,
  //           child: Center(child: body),
  //         );
  //       },
  //     ),
  //     //customScrollview拼接轮播图和信息流。
  //     child: CustomScrollView(
  //       slivers: [
  //         _buildSliverAppBar('动态'),
  //         _buildSliverList(),
  //       ],
  //     ),
  //   );
  // }

  SliverAppBar _buildSliverAppBar(String title) {
    return SliverAppBar(
      pinned: true,
      snap: false,
      floating: false,
      expandedHeight: 120,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(title),
        centerTitle: true,
        background: Image.network(
          'https://images.pexels.com/photos/30699925/pexels-photo-30699925.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // SliverList _buildSliverList() {
  //   return SliverList(
  //     delegate: SliverChildBuilderDelegate((content, index) {
  //       return ListTile(title: Text(items[index]));
  //     }, childCount: items.length),
  //   );
  // }

  //公告
  Widget _buildNoticeHeader() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _StickyHeaderDelegate(title: "公告"),
    );
  }

  Widget _buildNoticeList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((content, index) {
        return ListTile(title: Text(items[index]));
      }, childCount: items.length),
    );
  }
}

// Widget _buildSection(String title) {
//   return SliverToBoxAdapter(
//       child: RepaintBoundary(
//     child: Container(
//       height: 50,
//       color: Colors.brown,
//       alignment: Alignment.center,
//       child: Text(title),
//     ),
//   ));
// }

// Widget _buildItem(String title) {
//   return SliverToBoxAdapter(
//       child: RepaintBoundary(
//     child: Container(
//       padding: const EdgeInsets.symmetric(horizontal: 15),
//       height: 70,
//       color: Colors.cyanAccent,
//       alignment: Alignment.centerLeft,
//       child: Text(title),
//     ),
//   ));
// }

class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String title;

  _StickyHeaderDelegate({required this.title});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // 根据 shrinkOffset 计算透明度
    double opacity = (1 - shrinkOffset / maxExtent).clamp(0.0, 1.0);

    return Container(
      color: Colors.blueAccent.withOpacity(opacity),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 22),
      ),
    );
  }

  @override
  double get maxExtent => 36.0; // Header 的最大高度
  @override
  double get minExtent => 36.0; // Header 的最小高度

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false; // 这里不需要重新构建
  }
}
