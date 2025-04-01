import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class ChewieVideoPage extends StatefulWidget {
  const ChewieVideoPage({super.key});
  @override
  State<ChewieVideoPage> createState() => _ChewieVideoPageState();
}

class _ChewieVideoPageState extends State<ChewieVideoPage> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  @override
  void initState() {
// TODO: implement initState
    super.initState();
    _initVideo();
  }

  _initVideo() async {
    videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
        )
    );
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 3 / 2, //视频宽高比
      autoPlay: false,
      looping: false,
    );
  }

/*销毁*/
  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('在线视频播放'),
      ),
      body: Center(
          child: SizedBox(
            child: AspectRatio(
              aspectRatio: 3 / 2,
              child: Chewie(
                controller: chewieController,
              ),
            ),
          )),
    );
  }
}