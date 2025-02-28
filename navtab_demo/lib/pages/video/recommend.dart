import 'package:flutter/material.dart';
import '../../widgets/index.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class RecommendPage extends StatefulWidget {
  const RecommendPage({super.key});

  @override
  State<RecommendPage> createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  List<String> items = List.generate(20, (index) => "Item $index");

  static const total = 55;
  final List<String> _recommendBannerData = [
    'https://img.yzcdn.cn/vant/apple-1.jpg',
    'https://img.yzcdn.cn/vant/apple-2.jpg',
    'https://img.yzcdn.cn/vant/apple-3.jpg',
  ];

  late EasyRefreshController _controller;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildView(),
    );
  }

  // 高度自适应的grid瀑布流
  Widget _buildStaggeredGridView() {
    return MasonryGridView.count(
      // physics: const NeverScrollableScrollPhysics(), // 禁止滑动,避免与外部滑动冲突
      shrinkWrap: true,
      crossAxisCount: 2, // 列数
      mainAxisSpacing: 2, // 主轴间距
      crossAxisSpacing: 2, // 交叉轴间距
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(8),
          color: Colors.blueGrey,
          child: Container(
            height: 160,
            child: Text('RecommendPage $index'),
          ),
        );
      },
      itemCount: items.length,
    );
  }

  Widget _buildView() {
    return EasyRefresh(
        controller: _controller,
        header: ClassicHeader(),
        footer: ClassicFooter(),
        // 下拉刷新
        onRefresh: () async {
          print('RecommendPage onRefresh');
          await Future.delayed(Duration(seconds: 2));
          setState(() {
            items.clear();
            items = List.generate(10, (index) => "onRefresh Item $index");
          });
          _controller.finishRefresh(IndicatorResult.success);
        },
        // 上拉加载
        onLoad: () async {
          print('RecommendPage onLoad');
          await Future.delayed(Duration(seconds: 1));
          if (items.length >= total) {
            _controller.finishLoad(IndicatorResult.noMore);
          } else {
            setState(() {
              items.addAll(List.generate(
                  10, (index) => "onLoad Item ${items.length + index}"));
            });
            _controller.finishLoad(IndicatorResult.success);
          }
        },
        child: _buildStaggeredGridView());
  }
}
