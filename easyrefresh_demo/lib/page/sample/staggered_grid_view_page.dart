import 'package:easyrefresh_demo/widget/skeleton_item.dart';
import 'package:easyrefresh_demo/widget/tabbar_underline_indicator.dart';

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

class _StaggeredGridViewPageState extends State<StaggeredGridViewPage>
    with SingleTickerProviderStateMixin {
  int _count = 15;
  final int _total = 25;

  late EasyRefreshController refreshController;

  late TabController tabController;
  @override
  void initState() {
    super.initState();
    refreshController = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );

    tabController = TabController(length: 9, vsync: this);
  }

  @override
  void dispose() {
    refreshController.dispose();
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
    refreshController.finishRefresh();
    refreshController.resetFooter();
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
    refreshController.finishLoad(
      _count >= _total ? IndicatorResult.noMore : IndicatorResult.success,
    );
  }

  Widget _buildView(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      body: EasyRefresh.builder(
        controller: refreshController,
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
      // expandedHeight: Get.statusBarHeight,
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

  Widget _buildTabBar() {
    return TabBar(
      isScrollable: true, //是否可滚动
      tabAlignment: TabAlignment.start, // 设置为左对齐
      padding: EdgeInsets.zero, // Remove default padding
      controller: tabController,
      //指示器长度=label，即tab文字长度
      indicatorSize: TabBarIndicatorSize.label,
      //指示器长度=tab
      // indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),

      //圆角指示器(渐变色)
      // indicator: BoxDecoration(
      //   gradient: LinearGradient(
      //     colors: [Colors.redAccent, Colors.orangeAccent],
      //   ),
      //   color: Colors.redAccent,
      //   borderRadius: BorderRadius.circular(50),
      // ),

      //自定义指示器
      indicator: TabBarUnderlineTabIndicator(
        insets: const EdgeInsets.only(top: 0, bottom: 4),
        borderSide: BorderSide(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(50),
      ),
      tabs: [
        Tab(text: "热门"),
        Tab(text: "好看推荐"),
        Tab(text: "关注"),
        Tab(text: "美剧"),
        Tab(text: "韩剧"),
        Tab(text: "韩剧"),
        Tab(text: "韩剧"),
        Tab(text: "韩剧"),
        Tab(text: "韩剧"),
      ],
    );
  }

  Widget _buildStaggeredGridView() {
    return SliverMasonryGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
      childCount: _count,
      itemBuilder: (BuildContext context, int index) {
        return SkeletonItem(direction: Axis.horizontal);
      },
    );
  }

  Widget _buildCustomAppBar() {
    var appbarHeight = Get.statusBarHeight;
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    print("Get.statusBarHeight ${Get.statusBarHeight}");
    print("statusBarHeight ${statusBarHeight}");
    print("kToolbarHeight ${kToolbarHeight}");

    return SliverPersistentHeader(
      pinned: true,
      delegate: _CustomSliverHeaderDelegate(
        minHeight: statusBarHeight + kToolbarHeight,
        maxHeight: statusBarHeight + kToolbarHeight,
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.yellow,
                alignment: Alignment.center,
                // child: Text(
                //   'Search Header',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 24.0,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
              ),
            ),
            Container(
              // color: Colors.cyan,
              color: Colors.white,
              width: double.infinity,
              height: kToolbarHeight > 48 ? 48 : kToolbarHeight,
              alignment: Alignment.center, //设置控件内容的位置
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //logo
                  Container(
                    height: 40,
                    width: 40,
                    // color: Colors.red,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    alignment: Alignment.center, //设置控件内容的位置
                    child: CircleAvatar(
                      backgroundImage:
                          Image.asset('assets/image/user_head.jpg').image,
                    ),
                  ),
                  // search
                  Expanded(
                    // flex: 8,
                    child: Container(
                      alignment: Alignment.center, //设置控件内容的位置
                      height: 40,
                      // color: Colors.green,
                      // margin: EdgeInsets.all(0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          filled: true,
                          // fillColor: Colors.red,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(Icons.search),
                          contentPadding: EdgeInsets.symmetric(vertical: 0),
                        ),
                      ),
                    ),
                  ),
                  // message
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center, //设置控件内容的位置
                    color: Colors.blue,
                    // margin: EdgeInsets.only(right: 10),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.email_outlined),
                      iconSize: 28.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomScrollView(BuildContext context, ScrollPhysics physics) {
    return CustomScrollView(
      shrinkWrap: true,
      physics: physics,
      slivers: [
        //appbar
        // _buildSliverAppBar(),
        _buildCustomAppBar(),
        //tabbar
        SliverToBoxAdapter(child: _buildTabBar()),
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

// 自定义 SliverPersistentHeaderDelegate
class _CustomSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _CustomSliverHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_CustomSliverHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
