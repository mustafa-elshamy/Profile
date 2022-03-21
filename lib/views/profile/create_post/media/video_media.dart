import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoMedia extends StatefulWidget {
  final double height;
  final double width;
  final videoPath;

  const VideoMedia({
    Key key,
    this.height,
    this.width,
    @required this.videoPath,
  }) : super(key: key);

  @override
  State<VideoMedia> createState() => _VideoMediaState();
}

class _VideoMediaState extends State<VideoMedia> {
  VideoPlayerController videoPlayerController;
  bool isPlaying = false;

  @override
  void initState() {
    videoPlayerController = VideoPlayerController.file(
      File(widget.videoPath.path),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: false),
    )..initialize();
    videoPlayerController.setLooping(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isPlaying = !isPlaying;
          isPlaying
              ? videoPlayerController.play()
              : videoPlayerController.pause();
        });
      },
      child: Stack(
        children: [
          SizedBox(
            width: widget.width,
            height: widget.height,
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                  height: widget.height,
                  width: widget.width,
                  child: VideoPlayer(videoPlayerController)),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            top: 0,
            bottom: 0,
            child: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow_rounded,
              color: Colors.white,
              size: 35,
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }
}
