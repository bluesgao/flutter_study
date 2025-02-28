import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyBitApp());
}

class MyBitApp extends StatelessWidget {
  const MyBitApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NestedScrollView Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<ScrollController> _scrollControllers;
  late ScrollController nestedScrollController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _scrollControllers = [ScrollController(), ScrollController()];
    nestedScrollController = ScrollController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    for (var controller in _scrollControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var tabBarHeight = primaryTabBar.preferredSize.height;
    double statusBarHeight = MediaQuery.of(context).padding.top;
    var pinnedHeaderHeight = statusBarHeight + kToolbarHeight;
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: ExtendedNestedScrollView(
          onlyOneScrollInBody: true,
          pinnedHeaderSliverHeightBuilder: () => pinnedHeaderHeight,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: Text('NestedScrollView Demo'),
                pinned: true,
                floating: true,
                expandedHeight: 200,
                stretch: true,
                elevation: 0,
                stretchTriggerOffset: 100,
                bottom: TabBar(
                  controller: _tabController,
                  tabs: [Tab(text: 'Tab 1'), Tab(text: 'Tab 2')],
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              KeepAliveWrapper(
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView.builder(
                    itemCount: 1000,
                    itemBuilder: (context, index) {
                      return ListTile(title: Text('Tab 1 Item $index'));
                    },
                  ),
                ),
              ),
              KeepAliveWrapper(
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView.builder(
                    itemCount: 1000,
                    itemBuilder: (context, index) {
                      return ListTile(title: Text('Tab 2 Item $index'));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KeepAliveWrapper extends StatefulWidget {
  final Widget child;

  const KeepAliveWrapper({Key? key, required this.child}) : super(key: key);

  @override
  _KeepAliveWrapperState createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
