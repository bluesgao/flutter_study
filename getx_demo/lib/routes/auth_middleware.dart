import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/routes/router.dart';

import '../services/token_service.dart';
import '../utils/log.dart';

class AuthMiddleware extends GetMiddleware {
  final log = Log();

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

  @override
  GetPage? onPageCalled(GetPage? page) {
    print("访问页面: ${page?.name}");
    return super.onPageCalled(page);
  }

  @override
  RouteSettings? redirect(String? route) {
    var token = TokenService.getUserToken();

    log.debug("从storage 中获取 user token ${token}");
    bool isAuthenticated = !GetUtils.isNullOrBlank(token)!; // 获取登录状态
    //没有登录态，则跳转登录页
    if (isAuthenticated == false) {
      return RouteSettings(
          name: AppRouter.ROUTE_PAGE_LOGIN, arguments: {"title": "请登录..."});
    }
    return null; // 正常跳转
  }
}
