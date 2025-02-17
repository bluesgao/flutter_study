import 'package:navtab_demo/pages/constants.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
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
    // DynamicPage(),
    // OrderPage(),
    BillPage(),
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

  // 使用PageView实现
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('岛上码农'),
      // ),
      // bottomNavigationBar: _buildBottomNavigationBar(),

      bottomNavigationBar: _buildBottomNavigationBar(),
      body: PageView(
        physics: NeverScrollableScrollPhysics(), //禁止手势滑动
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _pageList,
      ),
    );
  }

  // 原生底部导航栏（去掉点击水波纹效果和点击高亮效果）
  Theme _buildBottomNavigationBar() {
    return Theme(
        data: ThemeData(
          splashColor: Colors.transparent, // 去掉点击水波纹效果
          highlightColor: Colors.transparent, // 去掉点击高亮效果
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white, // 背景色
          type: BottomNavigationBarType.fixed, // 类型
          currentIndex: _index, // 当前索引
          onTap: _onBottomNagigationBarTapped, // 点击事件
          selectedItemColor: Colors.grey.shade900, //选中lable颜色
          unselectedItemColor: Colors.grey.shade800, //未选中lable颜色
          selectedLabelStyle:
              TextStyle(fontSize: 12, fontWeight: FontWeight.bold), //选中文字样式
          unselectedLabelStyle:
              TextStyle(fontSize: 12, fontWeight: FontWeight.normal), //未选中文字样式
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
        ));
  }

  // 底部导航栏item
  BottomNavigationBarItem _buildBottomNavItem(
      String title, String normalIcon, String pressedIcon, int index) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.only(top: 4, bottom: 4, left: 18, right: 18),
        decoration: BoxDecoration(
          color: _index == index ? Colors.blueGrey.shade100 : Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: _index == index
            ? Image.asset(pressedIcon, width: 24, height: 24)
            : Image.asset(normalIcon, width: 24, height: 24),
      ),
      label: title,
    );
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

  // 谷歌底部导航栏
  // Container _buildGoogleNavBar() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       boxShadow: [
  //         BoxShadow(
  //           blurRadius: 20,
  //           color: Colors.black.withOpacity(.1),
  //         )
  //       ],
  //     ),
  //     child: SafeArea(
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
  //         child: GNav(
  //           rippleColor: const Color.fromARGB(255, 218, 109, 109),
  //           hoverColor: const Color.fromARGB(255, 143, 84, 84),
  //           tabActiveBorder: Border.all(color: Colors.grey.shade300),
  //           gap: 8,
  //           activeColor: Colors.black,
  //           iconSize: 24,
  //           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
  //           duration: Duration(milliseconds: 400),
  //           tabBackgroundColor: Colors.grey[100]!,
  //           color: Colors.black,
  //           tabs: [
  //             GButton(
  //               icon: LineIcons.gamepad,
  //               text: 'Games',
  //             ),
  //             GButton(
  //               icon: LineIcons.history,
  //               text: 'Likes',
  //             ),
  //             GButton(
  //               icon: LineIcons.user,
  //               text: 'Profile',
  //             ),
  //           ],
  //           selectedIndex: _index,
  //           onTabChange: _onBottomNagigationBarTapped,
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
