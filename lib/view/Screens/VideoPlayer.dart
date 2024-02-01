import 'package:chewie/chewie.dart';
import 'package:subtitle_wrapper_package/subtitle_wrapper_package.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;
  final String subtitleUrl;

  VideoPlayerScreen({
    required this.videoUrl,
    required this.subtitleUrl,
  });

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  late SubtitleController subtitleController;

  @override
  void initState() {
    super.initState();

    subtitleController = SubtitleController(
      subtitleUrl: widget.subtitleUrl,
      subtitleType: SubtitleType.srt,
    );

    videoPlayerController = VideoPlayerController.network(
      widget.videoUrl,
    );

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SubtitleWrapper(
        videoPlayerController: videoPlayerController,
        subtitleController: subtitleController,
        subtitleStyle: SubtitleStyle(
          textColor: Colors.black,
        ),
        videoChild: Chewie(
          controller: chewieController,
        ),
      ),
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }
}
