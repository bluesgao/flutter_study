import 'package:flutter/material.dart';
import '../../widgets/index.dart';

class RecommendPage extends StatefulWidget {
  const RecommendPage({super.key});

  @override
  State<RecommendPage> createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  List<String> items = List.generate(20, (index) => "Item $index");
  final List<String> _recommendBannerData = [
    'https://img.yzcdn.cn/vant/apple-1.jpg',
    'https://img.yzcdn.cn/vant/apple-2.jpg',
    'https://img.yzcdn.cn/vant/apple-3.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildView(),
    );
  }

  Widget _buildView() {
    //刷新组件
    return CustomScrollView(
      key: PageStorageKey<String>("recommend"),
      slivers: [
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
        ),
        SliverToBoxAdapter(
          child: _recommendBanner(_recommendBannerData),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) => ListTile(
            title: Text('$index'),
            onTap: () {
              print(index);
            },
          ),
          childCount: 35,
        ))
      ],
    );
  }

  ///banner轮播
  Widget _recommendBanner(List<String> bannerData) {
    return BannerWidget(
        dotType: BannerDotType.circle,
        bannerData: bannerData,
        bannerClick: (index) {
          //banner点击
          print('_recommendBanner bannerClick $index');
        });
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
