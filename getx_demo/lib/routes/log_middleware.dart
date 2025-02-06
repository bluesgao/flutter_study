import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';

class LogMiddleware extends GetMiddleware {
  @override
  void onPageDispose() {
    print("页面被销毁");
    super.onPageDispose();
  }

  @override
  Widget onPageBuilt(Widget page) {
    print("创建页面：${page}");

    return super.onPageBuilt(page);
  }

  // @override
  // GetPage onPageCalled(GetPage page) {
  //   print("页面被创建");
  //   return super.onPageCalled(page);
  // }

  @override
  GetPage? onPageCalled(GetPage? page) {
    print("访问页面: ${page?.name}");
    return super.onPageCalled(page);
  }
}
