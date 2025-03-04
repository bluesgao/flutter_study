import 'package:flutter/material.dart';
import 'dart:math';

/// Skeleton list item.
class SkeletonItem extends StatelessWidget {
  /// Scrollable direction.
  final Axis direction;

  const SkeletonItem({super.key, this.direction = Axis.vertical});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final backgroundColor = themeData.colorScheme.surfaceContainerHighest;
    final foregroundColor = themeData.colorScheme.surface;
    if (direction == Axis.vertical) {
      return Card(
        elevation: 0,
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 16),
                height: 80 + Random().nextInt(80).toDouble(),
                width: 80,
                color: foregroundColor,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 8, right: 24),
                      height: 12,
                      width: double.infinity,
                      constraints: const BoxConstraints(maxWidth: 200),
                      color: foregroundColor,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      height: 12,
                      width: 80,
                      color: foregroundColor,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      height: 12,
                      width: 80,
                      color: foregroundColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0), // 设置圆角半径
          side: BorderSide(
            color: Colors.blue, // 边框颜色
            width: 1, // 边框宽度
          ),
        ),
        color: backgroundColor,
        // 外边距
        margin: EdgeInsets.only(left: 4, right: 2),
        child: Padding(
          padding: EdgeInsets.all(4),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: [
              // 图片
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                height: 150 + Random().nextInt(100).toDouble(), //模拟图片高度变化
                // width: 400,
                color: Colors.blueGrey,
              ),
              Text(
                "111111111111111111111111111111111111111111111111111111111111111111111111111111111111111",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),

              // 底部
              Row(
                // mainAxisSize: MainAxisSize.min,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 24,
                    color: foregroundColor,
                    child: Text("用户名"),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 24,
                    color: foregroundColor,
                    child: Text("hello"),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }
}
