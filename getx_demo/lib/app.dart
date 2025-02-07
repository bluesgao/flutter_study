import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/routes/router.dart';

import 'common/themes.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      // themeMode: ,
      defaultTransition: Transition.rightToLeftWithFade,
      initialRoute: AppRouter.ROUTE_PAGE_HOME,
      // initialBinding: ControllerBinding(), //在项目启动时进行初始化绑定状态
      getPages: AppRouter.routes, //设置页面路由
    );
  }
}
