import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

enum BannerDotType { circle, rectangle }

class BannerWidget extends StatelessWidget {
  final List<String> bannerData;
  final BannerDotType dotType;
  final Function(int) bannerClick;

  const BannerWidget({
    super.key,
    required this.bannerData,
    required this.dotType,
    required this.bannerClick,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Swiper(
        itemBuilder: (context, index) {
          return Image.network(bannerData[index], fit: BoxFit.cover);
        },
        itemCount: bannerData.length,
        pagination: SwiperPagination(),
        onTap: bannerClick,
      ),
    );
  }
} 