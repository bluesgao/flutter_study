import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:getx_demo/bak/controller_binding.dart';
import 'package:getx_demo/routes/auth_middleware.dart';

import '../pages/counter/counter_view.dart';
import '../pages/dialog/dialog_view.dart';
import '../pages/home/home_view.dart';
import '../pages/login/login_view.dart';
import '../pages/profile/profile_view.dart';
import '../pages/snackbar/snackbar_view.dart';
import 'log_middleware.dart';

class AppRouter {
  static const String ROUTE_PAGE_LOGIN = "/login";
  static const String ROUTE_PAGE_HOME = "/";
  static const String ROUTE_PAGE_COUNTER = "/counter";
  static const String ROUTE_PAGE_SNACKBAR = "/snackbar";
  static const String ROUTE_PAGE_DIALOG = "/dialog";
  static const String ROUTE_PAGE_PROFILE = "/profile";

  //页面注册
  static final routes = [
    GetPage(
        name: ROUTE_PAGE_LOGIN,
        page: () => LoginPage(),
        middlewares: [LogMiddleware()]),
    GetPage(
        name: ROUTE_PAGE_HOME,
        page: () => HomePage(),
        middlewares: [LogMiddleware()]),
    GetPage(
        name: ROUTE_PAGE_COUNTER,
        page: () => CounterPage(),
        binding: ControllerBinding(),
        middlewares: [LogMiddleware()]),
    GetPage(
        name: ROUTE_PAGE_SNACKBAR,
        page: () => SnackbarPage(),
        middlewares: [LogMiddleware()]),
    GetPage(
        name: ROUTE_PAGE_DIALOG,
        page: () => DialogPage(),
        middlewares: [LogMiddleware()]),
    GetPage(
        name: ROUTE_PAGE_PROFILE,
        page: () => ProfilePage(),
        middlewares: [LogMiddleware(), AuthMiddleware()]),
  ];
}
