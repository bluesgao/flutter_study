import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  //图片列表
  final List<Map<String, dynamic>> dataList;

  const ListViewWidget({super.key, required this.dataList});

  @override
  Widget build(BuildContext context) {
    // return ListView.separated(
    //   itemCount: dataList.length,
    //   // itemBuilder: (BuildContext context, int index)=>ListTile(title: Text("ITEM $index"),),
    //   itemBuilder: (BuildContext context, int index) => CardWidget(
    //     cardInfo: dataList[index],
    //   ),
    //   separatorBuilder: (BuildContext context, int index) => Divider(
    //     color: Colors.white38,
    //   ),
    //   //分割器构造器
    // );

    return ListView.builder(
      itemCount: dataList.length,
      // itemBuilder: (BuildContext context, int index)=>ListTile(title: Text("ITEM $index"),),
      itemBuilder: (BuildContext context, int index) => ListTile(
        title: Text("ITEM $index"),
      ),
    );
  }
}
