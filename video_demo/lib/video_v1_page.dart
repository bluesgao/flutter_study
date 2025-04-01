import 'package:flutter/material.dart';
import 'package:better_player_plus/better_player_plus.dart';


class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("通用视频播放控件")),
      body: Center(
        child: BetterPlayer.network(
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
        ),
      ),
    );
  }
}