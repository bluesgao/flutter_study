// import 'package:easy_refresh/easy_refresh_bubbles.dart';
// import 'package:easyrefresh_demo/widget/skeleton_item.dart';
// import 'package:flutter/material.dart';
// import 'package:easy_refresh/easy_refresh.dart';
// import 'package:get/get.dart';
//
// class BubblesPage extends StatefulWidget {
//   const BubblesPage({super.key});
//
//   @override
//   State<BubblesPage> createState() => _BubblesPageState();
// }
//
// class _BubblesPageState extends State<BubblesPage> {
//   int _count = 10;
//   late EasyRefreshController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = EasyRefreshController(
//       controlFinishRefresh: true,
//       controlFinishLoad: true,
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: EasyRefresh(
//         controller: _controller,
//         header: const BubblesHeader(position: IndicatorPosition.locator),
//         footer: const BubblesFooter(position: IndicatorPosition.locator),
//         onRefresh: () async {
//           await Future.delayed(const Duration(seconds: 4));
//           if (!mounted) {
//             return;
//           }
//           setState(() {
//             _count = 10;
//           });
//           _controller.finishRefresh();
//           _controller.resetFooter();
//         },
//         onLoad: () async {
//           await Future.delayed(const Duration(seconds: 4));
//           if (!mounted) {
//             return;
//           }
//           setState(() {
//             _count += 5;
//           });
//           _controller.finishLoad(
//             _count >= 20 ? IndicatorResult.noMore : IndicatorResult.success,
//           );
//         },
//         child: CustomScrollView(
//           slivers: [
//             SliverAppBar(title: Text('Bubbles launch'.tr), pinned: true),
//             const HeaderLocator.sliver(),
//             SliverList(
//               delegate: SliverChildBuilderDelegate((context, index) {
//                 return const SkeletonItem();
//               }, childCount: _count),
//             ),
//             const FooterLocator.sliver(),
//           ],
//         ),
//       ),
//     );
//   }
// }
