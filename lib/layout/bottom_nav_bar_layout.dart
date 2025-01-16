import 'package:flutter/material.dart';

import '../pages/home/home_page.dart';
import '../pages/profile/profile_page.dart';
import '../pages/settings/settings_page.dart';

class BottomNavBarLayout extends StatefulWidget {
  const BottomNavBarLayout({super.key, required this.title});

  final String title;

  @override
  State<BottomNavBarLayout> createState() => _BottomNavBarLayoutState();
}

class _BottomNavBarLayoutState extends State<BottomNavBarLayout> {
  int _currentIndex = 0;

  //定义显示的页面,自备点击的时候所显示的页面
  final pages = [HomePage(), SettingsPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: _buildBottomNavBar(),
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<BottomNavigationBarItem> _buildBottomNavBar() {
    List<BottomNavigationBarItem> items = [];
    items.add(BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        activeIcon: Icon(Icons.home),
        label: "Home"));
    items.add(BottomNavigationBarItem(
        icon: Icon(Icons.settings_outlined),
        activeIcon: Icon(Icons.settings),
        label: "Settings"));
    items.add(BottomNavigationBarItem(
        icon: Icon(Icons.person_outlined),
        activeIcon: Icon(Icons.person),
        label: "Profile"));

    return items;
  }
}
