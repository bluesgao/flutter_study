import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  //图片列表
  final List<String> imgList;

  const ListViewWidget({super.key, required this.imgList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index)=>ListTile(title: Text("ITEM $index"),),
        itemCount: 100,
      separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.blue,),
      //分割器构造器
    );
  }
}
