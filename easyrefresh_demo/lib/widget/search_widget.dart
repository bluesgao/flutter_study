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
      width: width != null ? width : double.infinity,
      // color: Colors.green,
      // margin: EdgeInsets.all(0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              readOnly: true, //只读
              decoration: InputDecoration(
                hintText:
                    (hintText != null && hintText!.length > 0)
                        ? hintText
                        : 'Search',
                filled: true,
                // fillColor: Colors.red,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.search_sharp),
                contentPadding: EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),
          Container(
            // color: Colors.red,
            child: IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(Icons.email_outlined),
              onPressed: () {
                print('More Button Pressed');
              },
            ),
          ),
          // Container(
          //   // color: Colors.green,
          //   child: IconButton(
          //     padding: EdgeInsets.all(0),
          //     icon: Icon(Icons.more_vert_outlined),
          //     onPressed: () {
          //       print('More Button Pressed');
          //     },
          //   ),
          // ),
          SizedBox(width: 4),
        ],
      ),
    );
  }
}
