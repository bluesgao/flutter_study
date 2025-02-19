import 'package:flutter/material.dart';
import '../../widgets/index.dart';

class HotPage extends StatefulWidget {
  const HotPage({super.key});

  @override
  State<HotPage> createState() => _HotPageState();
}

class _HotPageState extends State<HotPage> {
  List<String> items = List.generate(20, (index) => "Item $index");
  final List<String> _hotBannerData = [
    'https://img.yzcdn.cn/vant/apple-4.jpg',
    'https://img.yzcdn.cn/vant/apple-5.jpg',
    'https://img.yzcdn.cn/vant/apple-6.jpg',
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
  Widget _hotBanner(List<String> bannerData) {
    return SliverToBoxAdapter(
      child: BannerWidget(
          dotType: BannerDotType.square,
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
