import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController
  _videoPlayerController; //声明 VideoPlayerController 对象
  late Future<void> _initializeVideoPlayerFuture; //声明所需的异步任务 Future 对象

  @override
  void initState() {
    super.initState();
    // 初始化 VideoPlayerController
    // ignore: deprecated_member_use
    _videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
        )
    );
    // 初始化 video_player，等待视频加载完成
    _initializeVideoPlayerFuture = _videoPlayerController.initialize();
  }

  @override
  void dispose() {
    // 释放资源
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          // 判断视频加载状态
          if (snapshot.connectionState == ConnectionState.done) {
            // Chewie 组件用于展示和控制视频播放
            return Chewie(
              controller: ChewieController(
                // 将 VideoPlayerController 传递给 ChewieController
                videoPlayerController: _videoPlayerController,
                aspectRatio: 16 / 9, // 视频宽高比
                autoPlay: false, // 是否自动播放
                looping: false, // 是否循环播放
              ),
            );
          } else {
            // 正在加载视频时显示加载指示器
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}