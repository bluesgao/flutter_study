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
  int _gridCount = 10;
  int _total = 45;

  @override
  Widget build(BuildContext context) {
    return _buildView(context);
  }

  Widget _buildView(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      body: EasyRefresh.builder(
        // isNested: true,
        header: ClassicHeader(
          clamping: true,
          position: IndicatorPosition.locator,
          mainAxisAlignment: MainAxisAlignment.end,
          dragText: 'Pull to refresh'.tr,
          armedText: 'Release ready'.tr,
          readyText: 'Refreshing...'.tr,
          processingText: 'Refreshing...'.tr,
          processedText: 'Succeeded'.tr,
          noMoreText: 'No more'.tr,
          failedText: 'Failed'.tr,
          messageText: 'Last updated at %T'.tr,
        ),
        footer: ClassicFooter(
          position: IndicatorPosition.locator,
          dragText: 'Pull to load'.tr,
          armedText: 'Release ready'.tr,
          readyText: 'Loading...'.tr,
          processingText: 'Loading...'.tr,
          processedText: 'Succeeded'.tr,
          noMoreText: 'No more'.tr,
          failedText: 'Failed'.tr,
          messageText: 'Last updated at %T'.tr,
        ),
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 2), () {
            print("onRefresh------");
            if (mounted) {
              setState(() {
                _gridCount = 10;
              });
            }
          });
        },
        onLoad: () async {
          await Future.delayed(const Duration(seconds: 2), () {
            print("onLoad------");

            if (mounted) {
              setState(() {
                _gridCount += 10;
                if (_gridCount >= _total) {
                  print("no more data");
                }
              });
            }
          });
        },
        childBuilder: (context, physics) {
          return ExtendedNestedScrollView(
            physics: physics,
            onlyOneScrollInBody: true,
            pinnedHeaderSliverHeightBuilder: () {
              return MediaQuery.of(context).padding.top + kToolbarHeight;
            },
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                const HeaderLocator.sliver(clearExtent: false),
                SliverAppBar(
                  expandedHeight: 120,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      'TabBarView',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.titleLarge?.color,
                      ),
                    ),
                    centerTitle: false,
                  ),
                ),
              ];
            },
            body: GridView.custom(
              gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                pattern: [
                  // QuiltedGridTile(2, 2),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                  // QuiltedGridTile(1, 2),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate((context, index) {
                return const SkeletonItem();
              }),
            ),
          );
        },
      ),
    );
  }
}
