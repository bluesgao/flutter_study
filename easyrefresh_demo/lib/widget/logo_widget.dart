import 'package:easyrefresh_demo/util/color_utils.dart';
import 'package:easyrefresh_demo/widget/paths_painter.dart';
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
    this.icon,
    required this.height,
    required this.width,
    this.onTap,
  });

  final IconData? icon;

  final VoidCallback? onTap;

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 38,
      // width: 38,
      // color: Colors.red,
      // padding: EdgeInsets.only(left: 4, right: 4),
      padding: EdgeInsets.all(4),
      alignment: Alignment.center, //设置控件内容的位置
      child: CircleAvatar(
        backgroundImage: Image.asset('assets/image/user_head.jpg').image,
        radius: height / 2 - 4,
      ),
    );
  }
}
