import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:getx_demo/snack_bar_page.dart';

import 'counter_page.dart';
import 'dialog_page.dart';
import 'home_page.dart';

class AppRoutes {
  //页面注册
  static final routes = [
    // GetPage(name: "/shop", page: () => const ShopPage(),
    //     middlewares:[
    //     ]),
    GetPage(name: "/", page: () => const MyHomePage()),
    GetPage(name: "/counterpage", page: () => const CounterPage()),
    GetPage(name: "/snackbarpage", page: () => const SnackBarPage()),
    GetPage(name: "/dialogpage", page: () => const DialogPage()),
  ];
}
