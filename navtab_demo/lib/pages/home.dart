import 'package:navtab_demo/pages/constants.dart';

import 'index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _index = 0;
  final PageController _pageController = PageController();

  final List<Widget> _pageList = [
    GamePage(),
    DynamicPage(),
    MinePage(),
  ];

  // 底部导航栏点击
  void _onBottomNagigationBarTapped(index) {
    print('_onBottomNagigationBarTapped index: $index');
    _pageController.jumpToPage(index);
  }

  // 页面切换
  void _onPageChanged(index) {
    print('_onPageChanged index: $index');
    setState(() {
      _index = index;
    });
  }

  // 使用IndexedStack实现
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     // appBar: AppBar(
  //     //   title: Text('岛上码农'),
  //     // ),
  //     body: IndexedStack(
  //       index: _index,
  //       children: _pageList,
  //     ),
  //     bottomNavigationBar: BottomNavigationBar(
  //       type: BottomNavigationBarType.fixed,
  //       currentIndex: _index,
  //       onTap: _onBottomNagigationBarTapped,
  //       items: Constants.navigationBarItems().map(
  //         (item) {
  //           return _buildBottomNavItem(
  //             item['title'],
  //             item['normalIcon'],
  //             item['pressedIcon'],
  //             item['index'],
  //           );
  //         },
  //       ).toList(),
  //     ),
  //   );
  // }

  // 使用PageView实现
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('岛上码农'),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        onTap: _onBottomNagigationBarTapped,
        items: Constants.navigationBarItems().map(
          (item) {
            return _buildBottomNavItem(
              item['title'],
              item['normalIcon'],
              item['pressedIcon'],
              item['index'],
            );
          },
        ).toList(),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(), //禁止手势滑动
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _pageList,
      ),
    );
  }

  // 底部导航栏item
  BottomNavigationBarItem _buildBottomNavItem(
      String title, String normalIcon, String pressedIcon, int index) {
    return BottomNavigationBarItem(
      icon: _index == index
          ? Image.asset(
              pressedIcon,
              width: 32,
              height: 28,
            )
          : Image.asset(
              normalIcon,
              width: 32,
              height: 28,
            ),
      label: title,
    );
  }
}
