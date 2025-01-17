// import 'package:flutter/material.dart';
// import 'package:flutter_study/pages/home/slider_widget.dart';
//
// import '../../viewmodel/game_vm.dart';
// import 'card_widget.dart';
//
// class ScrollViewWidget extends ScrollView {
//   //list列表
//   final List<GameViewModel>? dataList;
//   //banner列表
//   final List<String> imgList;
//
//   // final Widget? banner;
//   // final IndexedWidgetBuilder itemBuilder;
//   // final double itemExtent;
//   // final int itemCount;
//   const ScrollViewWidget(
//       {super.key, required this.imgList, required this.dataList});
//
//   @override
//   List<Widget> buildSlivers(BuildContext context) {
//     List<Widget> list = [];
//     list.add(SliverToBoxAdapter(child: SliderWidget(imgList: imgList)));
//     list.add(SliverList(
//       delegate: SliverChildBuilderDelegate(
//           (BuildContext context, int index) => CardWidget(
//                 cardInfo: dataList[index],
//               ),
//           childCount: dataList.length),
//     ));
//     return list;
//   }
// }
