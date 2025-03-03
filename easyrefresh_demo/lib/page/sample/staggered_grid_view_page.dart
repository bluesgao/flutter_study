import 'package:easyrefresh_demo/widget/skeleton_item.dart';
import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// easyrefresh->SingleChildScrollView->StaggeredGrid
class StaggeredGridViewPage extends StatefulWidget {
  const StaggeredGridViewPage({super.key});

  @override
  State<StaggeredGridViewPage> createState() => _StaggeredGridViewPageState();
}

class _StaggeredGridViewPageState extends State<StaggeredGridViewPage> {
  int _count = 15;
  final int _total = 25;

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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildView(context);
  }

  ClassicHeader _buildRefreshHeader() {
    return ClassicHeader(
      clamping: true,
      hitOver: true,
      safeArea: true,
      processedDuration: Duration.zero,
      position: IndicatorPosition.locator,
      mainAxisAlignment: MainAxisAlignment.end,
      showMessage: false, //是否显示消息
      showText: false, //是否显示文本
      dragText: 'Pull to refresh'.tr,
      armedText: 'Release ready'.tr,
      readyText: 'Refreshing...'.tr,
      processingText: 'Refreshing...'.tr,
      processedText: 'Succeeded'.tr,
      noMoreText: 'No more'.tr,
      failedText: 'Failed'.tr,
      messageText: 'Last updated at %T'.tr,
    );
  }

  ClassicHeader _buildRefreshHeaderV2() {
    return ClassicHeader(
      clamping: true,
      hitOver: true,
      safeArea: true,
      processedDuration: Duration.zero,
      position: IndicatorPosition.locator,
      mainAxisAlignment: MainAxisAlignment.end,
      showMessage: false, //是否显示消息
      showText: false, //是否显示文本
      dragText: 'Pull to refresh'.tr,
      armedText: 'Release ready'.tr,
      readyText: 'Refreshing...'.tr,
      processingText: 'Refreshing...'.tr,
      processedText: 'Succeeded'.tr,
      noMoreText: 'No more'.tr,
      failedText: 'Failed'.tr,
      messageText: 'Last updated at %T'.tr,
    );
  }

  ClassicFooter _buildRefreshFooter() {
    return ClassicFooter(
      position: IndicatorPosition.locator,
      showText: false,
      showMessage: false,
      dragText: 'Pull to load'.tr,
      armedText: 'Release ready'.tr,
      readyText: 'Loading...'.tr,
      processingText: 'Loading...'.tr,
      processedText: 'Succeeded'.tr,
      noMoreText: 'No more'.tr,
      failedText: 'Failed'.tr,
      messageText: 'Last updated at %T'.tr,
    );
  }

  Future<void> _onRefresh() async {
    print("------_onRefresh--------");

    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) {
      return;
    }
    setState(() {
      _count = 15;
    });
    _controller.finishRefresh();
    _controller.resetFooter();
  }

  Future<void> _onLoad() async {
    print("------_onLoad--------");
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) {
      return;
    }
    setState(() {
      _count += 5;
    });
    _controller.finishLoad(
      _count >= _total ? IndicatorResult.noMore : IndicatorResult.success,
    );
  }

  Widget _buildView(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      body: EasyRefresh.builder(
        controller: _controller,
        // isNested: true,
        header: _buildRefreshHeader(),
        footer: _buildRefreshFooter(),
        onRefresh: () async {
          _onRefresh();
        },
        onLoad: () async {
          _onLoad();
        },
        childBuilder: (context, physics) {
          return _buildCustomScrollView(context, physics);
        },
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 120,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          'StaggeredGridView',
          style: TextStyle(
            color: Theme.of(context).textTheme.titleLarge?.color,
          ),
        ),
        centerTitle: false,
      ),
    );
  }

  Widget _buildStaggeredGridView() {
    return SliverMasonryGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
      childCount: _count,
      itemBuilder: (BuildContext context, int index) {
        return SkeletonItem(direction: Axis.vertical);
      },
    );
  }

  Widget _buildExtendedNestedScrollView(
    BuildContext context,
    ScrollPhysics physics,
  ) {
    return ExtendedNestedScrollView(
      physics: physics,
      onlyOneScrollInBody: true,
      pinnedHeaderSliverHeightBuilder: () {
        return MediaQuery.of(context).padding.top + kToolbarHeight;
      },
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return <Widget>[
          const HeaderLocator.sliver(clearExtent: false),
          _buildSliverAppBar(),
        ];
      },
      body: _buildStaggeredGridView(),
    );
  }

  Widget _buildCustomScrollView(BuildContext context, ScrollPhysics physics) {
    return CustomScrollView(
      shrinkWrap: true,
      physics: physics,
      slivers: [
        //页面头
        _buildSliverAppBar(),
        //header 定位器
        const HeaderLocator.sliver(clearExtent: false),
        // 瀑布流
        _buildStaggeredGridView(),
        //footer 定位器
        const FooterLocator.sliver(clearExtent: false),
        // 尾部间隔（防止底部navbar挡住内容）
        // SliverToBoxAdapter(
        //   child: SizedBox(
        //     height: MediaQuery.of(context).padding.bottom + 10,
        //     child: Container(
        //       color: Colors.red,
        //       child: const FooterLocator(clearExtent: false),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
