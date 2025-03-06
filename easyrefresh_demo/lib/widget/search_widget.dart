import 'package:easyrefresh_demo/util/color_utils.dart';
import 'package:easyrefresh_demo/widget/paths_painter.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    this.icon,
    required this.height,
    this.width,
    this.onTap,
    this.hintText,
  });

  final IconData? icon;

  final VoidCallback? onTap;

  final double height;
  final double? width;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center, //设置控件内容的位置
      height: height,
      // color: Colors.green,
      // margin: EdgeInsets.all(0),
      child: TextField(
        readOnly: true, //只读
        decoration: InputDecoration(
          hintText:
              (hintText != null && hintText!.length > 0) ? hintText : 'Search',
          filled: true,
          // fillColor: Colors.red,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.symmetric(vertical: 0),
        ),
      ),
    );
  }
}
