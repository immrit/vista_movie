// import 'package:flutter/material.dart';
// import 'package:subtitle_wrapper_package/data/models/style/subtitle_style.dart';
// import 'package:subtitle_wrapper_package/subtitle_controller.dart';
// import 'package:subtitle_wrapper_package/subtitle_wrapper_package.dart';
// import 'package:video_player/video_player.dart';
//
// class VideoPlayerScreen extends StatefulWidget {
//   String url;
//   String name;
//   VideoPlayerScreen({
//     Key? key,
//     required this.url,
//     required this.name,
//   }) : super(key: key);
//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }
//
// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   late VideoPlayerController _controller;
//   late SubtitleController _subtitleController;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(widget.url);
//     _subtitleController = SubtitleController(
//       subtitleUrl:
//           'https://saymyname.website/?select=aHR0cHM6Ly9zdWJ0aXRsZS5ta3NlcnZlcnMuaXIvQWxtYXNFZGl0aW9uL01vdmllLzIwMTYvMTk3NDQxOS9UaGUlMjBOZW9uJTIwRGVtb24lMjAyMDE2JTIwLSUyMEJsdVJheS4lNUJBbG1hc01vdmllJTVELnNydCpUaGVfTmVvbl9EZW1vbl8yMDE2XzcyMHBfQnJSaXBfR2Fub29sKnNydA==',
//       subtitleType: SubtitleType.srt,
//       showSubtitles: true,
//     );
//     _controller.addListener(() {
//       setState(() {});
//     });
//     _controller.setLooping(true);
//     _controller.initialize().then((_) => setState(() {}));
//     _controller.play();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     // _subtitleController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Video Player with Subtitle Demo'),
//       ),
//       body: Center(
//         child: _controller.value.isInitialized
//             ? AspectRatio(
//                 aspectRatio: _controller.value.aspectRatio,
//                 child: SubTitleWrapper(
//                   videoPlayerController: _controller,
//                   subtitleController: _subtitleController,
//                   subtitleStyle: SubtitleStyle(
//                     textColor: Colors.white,
//                     hasBorder: true,
//                   ),
//                   videoChild: VideoPlayer(_controller),
//                 ),
//               )
//             : Container(),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             _controller.value.isPlaying
//                 ? _controller.pause()
//                 : _controller.play();
//           });
//         },
//         child: Icon(
//           _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//         ),
//       ),
//     );
//   }
// }
