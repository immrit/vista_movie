import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Player extends StatefulWidget {
  String url;
  String name;

  Player({
    Key? key,
    required this.url,
    required this.name,
  }) : super(key: key);
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Center(
        child: VideoPlayerWidget(
          videoPlayerController: VideoPlayerController.network(widget.url,
              videoPlayerOptions: VideoPlayerOptions(
                allowBackgroundPlayback: true,
              )),
          looping: false,
        ),
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;

  VideoPlayerWidget(
      {required this.videoPlayerController, this.looping = false});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
        videoPlayerController: widget.videoPlayerController,
        autoPlay: true,
        looping: widget.looping,
        autoInitialize: true,
        draggableProgressBar: true,
        allowFullScreen: true);
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(controller: _chewieController);
  }

  @override
  void dispose() {
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}
