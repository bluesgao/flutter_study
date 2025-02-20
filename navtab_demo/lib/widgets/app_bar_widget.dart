import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    print('padding.top: ${padding.top}');
    return Container(
      padding: EdgeInsets.only(top: padding.top, left: 20, right: 20),
      alignment: Alignment.center,
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 30,
            height: 30,
            color: Colors.yellow,
          ),
          Text(
            '完全自定义的导航栏',
            style: TextStyle(fontSize: 16),
          ),
          Container(
            width: 30,
            height: 30,
            color: Colors.red,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(kToolbarHeight); // Standard AppBar height + padding
  }
}
