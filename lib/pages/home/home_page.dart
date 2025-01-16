import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/pages/home/grouplist_widget.dart';
import 'package:flutter_study/pages/home/listview_widget.dart';
import 'package:flutter_study/pages/home/slider_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //图片列表
  List<String> imgList = [
    'https://p1.ssl.qhimg.com/t01683f3a068943c2e3.png',
    'https://p1.ssl.qhimg.com/t01e9ee778759020ddb.png',
    'https://p1.ssl.qhimg.com/t01f7dfb7391d1f1de2.jpg',
    'https://p1.ssl.qhimg.com/t01aa65ca167724f2c9.jpg',
    'https://p4.ssl.qhimg.com/t01345cf34a1807d669.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.red,
          child:SliderWidget(imgList: imgList,),
        ),
        // Expanded(child: ListViewWidget(imgList: imgList))
        Expanded(child: GroupListWidget())

      ],
    );
  }
}
