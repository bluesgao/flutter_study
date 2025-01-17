import 'package:flutter/material.dart';
import 'package:flutter_study/pages/home/card_widget.dart';
import 'package:flutter_study/pages/home/slider_widget.dart';
import 'package:flutter_study/viewmodel/game_vm.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/banner_vm.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // BannerViewModel bannerViewModel = BannerViewModel();

  @override
  void initState() {
    super.initState();
    // bannerViewModel.fetch();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return CustomScrollView(
  //     slivers: [
  //       SliverToBoxAdapter(
  //         child: SliderWidget(banners: bannerViewModel.bannerList,),
  //       ),
  //       // SliverList(
  //       //     delegate: SliverChildBuilderDelegate(
  //       //             (context, index) => ListTile(
  //       //           title: Text('Item $index'),
  //       //         ),
  //       //         childCount: 10))
  //     ],
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   // 自定义
  //   return ChangeNotifierProvider(create: (_)=> BannerViewModel()..fetch(),
  //     child:Consumer<BannerViewModel>(
  //       builder: (context, mv, child){
  //         return CustomScrollView(
  //           slivers: [
  //             SliverToBoxAdapter(
  //               child: SliderWidget(banners: mv.bannerList,),
  //             ),
  //             // SliverList(
  //             //     delegate: SliverChildBuilderDelegate(
  //             //             (context, index) => ListTile(
  //             //           title: Text('Item $index'),
  //             //         ),
  //             //         childCount: 10))
  //           ],
  //         );
  //       },
  //     ) ,
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return CustomScrollView(
  //     slivers: [
  //       SliverToBoxAdapter(
  //         child: ChangeNotifierProvider(
  //           create: (_) => BannerViewModel()..fetch(),
  //           child: Consumer<BannerViewModel>(builder: (context, mv, child) {
  //             return SliderWidget(banners: mv.bannerList);
  //           }),
  //         ),
  //       ),
  //       SliverList(
  //           delegate: SliverChildBuilderDelegate(
  //               (context, index) => ListTile(
  //                     title: Text('Item $index'),
  //                   ),
  //               childCount: 10)
  //       )
  //     ],
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        maintainBottomViewPadding: true,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ChangeNotifierProvider(
                create: (_) => BannerViewModel()..fetch(),
                child: Consumer<BannerViewModel>(builder: (context, mv, child) {
                  return SliderWidget(banners: mv.bannerList);
                }),
              ),
            ),
            ChangeNotifierProvider(
              create: (_) => GameViewModel()..fetch(),
              child: Consumer<GameViewModel>(
                builder: (context, mv, child) {
                  return SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                    return CardWidget(gameInfo: mv.gameList[index]);
                  }, childCount: mv.gameList.length));
                },
              ),
            ),
            // 添加底部填充
            SliverToBoxAdapter(
              child: SizedBox(height: 10),
            ),
          ],
        ));
  }

// @override
// Widget build(BuildContext context) {
//   // 自定义
//   return Consumer<BannerViewModel>(
//     builder: (context, mv, child){
//       return CustomScrollView(
//         slivers: [
//           SliverToBoxAdapter(
//             child: SliderWidget(banners: mv.bannerList,),
//           ),
//           // SliverList(
//           //     delegate: SliverChildBuilderDelegate(
//           //             (context, index) => ListTile(
//           //           title: Text('Item $index'),
//           //         ),
//           //         childCount: 10))
//         ],
//       );
//     },
//   );
// }

// @override
// Widget build(BuildContext context) {
//   return Column(
//     children: [
//       Container(
//         color: Colors.red,
//         child: SliderWidget(
//           imgList: imgList,
//         ),
//       ),
//       Expanded(child: ListViewWidget(dataList: dataList))
//       // Expanded(child: GroupListWidget())
//     ],
//   );
// }
}
