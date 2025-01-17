import 'package:flutter/material.dart';
import 'package:flutter_study/service/banner_service.dart';

import '../model/banner_model.dart';

class BannerViewModel extends ChangeNotifier {
  BannerService service = BannerService();

  List<BannerInfo> get bannerList => service.banners;

  void fetch() {
    service.genBanners();
    notifyListeners(); // 通知 View 更新
  }
}
