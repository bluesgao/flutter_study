import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import '../../widgets/index.dart';

class HotPage extends StatefulWidget {
  const HotPage({super.key});

  @override
  State<HotPage> createState() => _HotPageState();
}

class _HotPageState extends State<HotPage> {
  List<String> _items = List.generate(10, (index) => "default Item $index");

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
      // 下拉刷新
      onRefresh: () async {
        print('onRefresh');
        await Future.delayed(Duration(seconds: 2));
        setState(() {
          _items = List.generate(10, (index) => "onRefresh Item $index");
        });
        _controller.finishRefresh(IndicatorResult.success);
      },
      // 上拉加载
      onLoad: () async {
        print('onLoad');
        await Future.delayed(Duration(seconds: 2));
        setState(() {
          _items.addAll(List.generate(
              10, (index) => "onLoad Item ${_items.length + index}"));
        });
        _controller.finishLoad(IndicatorResult.success);
      },
      child: CustomScrollView(
        key: PageStorageKey<String>("hot"),
        slivers: [
          SliverOverlapInjector(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
          ),
          _hotBanner(_hotBannerData),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) => Card(
              margin: EdgeInsets.all(8),
              color: Colors.blueGrey,
              child: Container(
                height: 160,
                child: Text('$index'),
              ),
            ),
            childCount: _items.length,
          ))
        ],
      ),
    );
  }

  ///banner轮播
  Widget _hotBanner(List<String> bannerData) {
    return SliverToBoxAdapter(
      child: BannerWidget(
          dotType: BannerDotType.circle,
          bannerData: bannerData,
          bannerClick: (index) {
            //banner点击
            print('_hotBanner bannerClick $index');
          }),
    );
  }

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
}
