import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import '../../widgets/index.dart';

class HotPage extends StatefulWidget {
  const HotPage({super.key});

  @override
  State<HotPage> createState() => _HotPageState();
}

class _HotPageState extends State<HotPage> {
  List<String> items = List.generate(10, (index) => "default Item $index");
  static const total = 35;

  late EasyRefreshController _controller;

  final List<String> _hotBannerData = [
    'https://img.yzcdn.cn/vant/apple-4.jpg',
    'https://img.yzcdn.cn/vant/apple-5.jpg',
    'https://img.yzcdn.cn/vant/apple-6.jpg',
  ];

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

  Widget _buildView() {
    return EasyRefresh(
        controller: _controller,
        header: ClassicHeader(),
        footer: ClassicFooter(),
        onLoad: () async {
          print('HotPage onLoad');
          await Future.delayed(Duration(seconds: 2));
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
        onRefresh: () async {
          print('HotPage onRefresh');
          await Future.delayed(Duration(seconds: 1));
          setState(() {
            items.clear();
            items.addAll(List.generate(
                10, (index) => "onLoad Item ${items.length + index}"));
          });
          _controller.finishLoad(IndicatorResult.success);
        },
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(8),
              color: Colors.red,
              child: Container(
                height: 160,
                child: Text('HotPage $index'),
              ),
            );
          },
        ));
  }
}
