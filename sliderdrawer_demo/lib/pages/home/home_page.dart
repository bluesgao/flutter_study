import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:sliderdrawer_demo/pages/home/widget/author_list.dart';
import 'package:sliderdrawer_demo/pages/home/widget/slider_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
      GlobalKey<SliderDrawerState>();

  late String title;

  @override
  void initState() {
    title = "Home";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SliderDrawer(
        key: _sliderDrawerKey,
        appBar: SliderAppBar(
          config: SliderAppBarConfig(
              title: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
        sliderOpenSize: 180,
        slideDirection: SlideDirection.leftToRight,
        sliderBoxShadow: SliderBoxShadow(
          color: Colors.blueGrey,
        ),
        slider: SliderMenu(
          onItemClick: (title) {
            _sliderDrawerKey.currentState?.closeSlider();
            setState(() {
              this.title = title;
            });
          },
        ),
        child: const AuthorList(),
      ),
    );
  }
}
