import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_study/pages/grouplist/grouplist_page.dart';
import 'package:flutter_study/viewmodel/common_vm.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';

//在应用的顶层绑定 Provider，确保状态在整个应用中共享。
// 在应用启动时执行一次
// 场景：用户登录信息、主题、设置等
void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CommonViewModel()),
      // ChangeNotifierProvider(create: (context) => GameViewModel())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      localeListResolutionCallback: (locales, supportedLocales) {
        print('当前系统语言环境$locales');
        return null;
      },
      title: 'Flutter Demo',
      // onGenerateTitle: (context) {
      //   return S.of(context).app_name;
      // },
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        // colorScheme: ColorScheme.dark(),
        useMaterial3: true,
      ),
      // home: const DrawerPage(title: 'DrawerPage'),
      // home: const BottomNavBarLayout(title: "BottomNavPage"),
      // home: const TabBarPage(title: "TabBarPage"),
      // home: const GoogleNavBarLayout(),
      home: GroupListPage(),
    );
  }
}
