import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class DynamicPage extends StatefulWidget {
  const DynamicPage({super.key});

  @override
  State<DynamicPage> createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage> {
  List<String> items = List.generate(10, (index) => "Item $index");

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  /// **下拉刷新**
  // void _onRefresh() async {
  //   await Future.delayed(Duration(seconds: 2)); // 模拟网络请求
  //   setState(() {
  //     items = List.generate(10, (index) => "New Item $index"); // 替换数据
  //   });
  //   _refreshController.refreshCompleted(); // 完成刷新
  // }

  /// **上拉加载更多**
  void _onLoading() async {
    await Future.delayed(Duration(seconds: 2)); // 模拟网络请求
    setState(() {
      items.addAll(
          List.generate(5, (index) => "More Item ${items.length + index}"));
    });
    _refreshController.loadComplete(); // 加载完成
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildView(),
    );
  }

  SmartRefresher _buildView() {
    //刷新组件
    return SmartRefresher(
      controller: _refreshController, //刷新控制器
      enablePullDown: false, //下拉刷新
      enablePullUp: true, //上拉加载更多
      onLoading: _onLoading, //上拉加载更多
      // onRefresh: _onRefresh, // 下拉刷新
      //下拉头部UI样式
      // header: const WaterDropHeader(
      //   idleIcon: Icon(
      //     Icons.car_repair,
      //     color: Colors.blue,
      //     size: 30,
      //   ),
      // ),
      //上拉底部UI样式
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus? mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text("上拉加载更多");
          } else if (mode == LoadStatus.loading) {
            body = CircularProgressIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text("加载失败，点击重试！");
          } else if (mode == LoadStatus.canLoading) {
            body = Text("松手加载更多");
          } else {
            body = Text("没有更多数据了");
          }
          return SizedBox(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      //customScrollview拼接轮播图和信息流。
      child: CustomScrollView(
        slivers: [
          _buildSliverAppBar('动态'),
          _buildSliverList(),
        ],
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(String title) {
    return SliverAppBar(
      pinned: true,
      snap: false,
      floating: false,
      expandedHeight: 180,
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

  SliverList _buildSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((content, index) {
        return ListTile(title: Text(items[index]));
      }, childCount: items.length),
    );
  }
}
