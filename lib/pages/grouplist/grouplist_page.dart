import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import 'grouplist_vm.dart';

/// 数据源
/// https://github.com/yixiaolunhui/flutter_xy

/// 分组列表
class GroupListPage extends StatelessWidget {
  const GroupListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('分组列表')),
      appBar: AppBar(title: Text(S.current.app_name)),
      body: CustomScrollView(
        slivers: ItemBean.groupListData.map(_buildGroup).toList(),
      ),
    );
  }

  Widget _buildGroup(ItemBean itemBean) {
    return SliverMainAxisGroup(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: HeaderDelegate(itemBean.groupName),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, index) => _buildItemByUser(itemBean.items[index]),
            childCount: itemBean.items.length,
          ),
        ),
      ],
    );
  }

  Widget _buildItemByUser(String item) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 10.0),
            child: FlutterLogo(size: 30),
          ),
          Text(
            item,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  final String title;

  const HeaderDelegate(this.title);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.grey,
      padding: const EdgeInsets.only(left: 20),
      height: 40,
      child: Text(title, style: const TextStyle(fontSize: 16)),
    );
  }

  @override
  double get maxExtent => 40;

  @override
  double get minExtent => 40;

  @override
  bool shouldRebuild(covariant HeaderDelegate oldDelegate) {
    return title != oldDelegate.title;
  }
}
