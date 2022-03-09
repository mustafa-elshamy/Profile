import 'package:flutter/material.dart';
import 'package:profile/bloc/story_bloc/story_bloc.dart';
import 'package:profile/constants/colors.dart';
import 'package:profile/constants/enums.dart';
import 'package:profile/models/story.dart';
import 'package:profile/views/light_profile/stories/animated_bar.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoryScreen extends StatefulWidget {
  List<Story> stories = [
    Story(
      mediaType: StoryMediaType.image,
      url:
          "https://upload.wikimedia.org/wikipedia/commons/9/91/F-15_vertical_deploy.jpg",
      storyImageDuration: const Duration(seconds: 5),
    ),
    Story(
      mediaType: StoryMediaType.video,
      url:
          "https://biteable.com/static-assets/homepage/HubpageVideo_Short_16x9_01.mp4",
    ),
  ];

  StoryScreen({Key key}) : super(key: key);

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen>
    with SingleTickerProviderStateMixin {
  PageController pageController;
  VideoPlayerController videoController;
  AnimationController animationController;
  int currentStoryIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    animationController = AnimationController(vsync: this);

    _loadStory(story: widget.stories[0], animateToPage: false);

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.stop();
        animationController.reset();
        setState(() {
          if (currentStoryIndex + 1 == widget.stories.length) {
            Navigator.pop(context);
          }
          currentStoryIndex = (currentStoryIndex + 1) % widget.stories.length;
          _loadStory(story: widget.stories[currentStoryIndex]);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Story story = widget.stories[currentStoryIndex];
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onVerticalDragEnd: _onVerticalDragDown,
        onTapDown: _onTapDown,
        child: Stack(
          children: [
            PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: pageController,
              itemCount: widget.stories.length,
              itemBuilder: (context, index) {
                /// video
                if (story.mediaType == StoryMediaType.video) {
                  if (videoController.value.isInitialized) {
                    return Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: SizedBox(
                              height: videoController.value.size.height,
                              width: videoController.value.size.width,
                              child: VideoPlayer(videoController),
                            ),
                          ),
                        ),
                        StreamBuilder<bool>(
                            stream:
                                context.read<StoryBloc>().videoBufferingStatus,
                            builder: (context, snapshot) {
                              if (snapshot.hasData && snapshot.data) {
                                return Align(
                                  alignment: Alignment.center,
                                  child: CircularProgressIndicator(
                                      color: MyColors.primaryColor),
                                );
                              }
                              return Container();
                            }),
                      ],
                    );
                  }
                  return Center(
                    child:
                        CircularProgressIndicator(color: MyColors.primaryColor),
                  );
                }

                /// image
                else {
                  return Image.network(
                    story.url,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        animationController.forward();
                        return child;
                      }
                      animationController.stop();
                      return Center(
                        child: CircularProgressIndicator(
                          color: MyColors.primaryColor,
                          value: loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes,
                        ),
                      );
                    },
                  );
                }
              },
            ),
            Positioned(
              top: 40.0,
              left: 5,
              right: 5,
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      for (int i = 0; i < widget.stories.length; i++)
                        AnimatedBar(
                          animController: animationController,
                          position: i,
                          currentIndex: currentStoryIndex,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onVerticalDragDown(DragEndDetails dragDownDetails) {
    Navigator.pop(context);
  }

  void _onTapDown(TapDownDetails tapDownDetails) {
    double screenWidth = MediaQuery.of(context).size.width;
    double dx = tapDownDetails.globalPosition.dx;

    if (dx < screenWidth / 4) {
      setState(() {
        currentStoryIndex = currentStoryIndex > 0
            ? (currentStoryIndex - 1) % widget.stories.length
            : 0;
        _loadStory(story: widget.stories[currentStoryIndex]);
      });
    } else if (dx > screenWidth * 3 / 4) {
      if (currentStoryIndex + 1 == widget.stories.length) {
        Navigator.pop(context);
      }
      setState(() {
        currentStoryIndex = currentStoryIndex + 1;
        _loadStory(story: widget.stories[currentStoryIndex]);
      });
    } else {
      if (widget.stories[currentStoryIndex].mediaType == StoryMediaType.video) {
        if (videoController.value.isPlaying) {
          videoController.pause();
        } else {
          videoController.play();
        }
      }
      if (animationController.isAnimating) {
        animationController.stop();
      } else {
        animationController.forward();
      }
    }
  }

  void _loadStory({Story story, bool animateToPage = true}) {
    animationController.stop();
    animationController.reset();
    if (story.mediaType == StoryMediaType.video) {
      if (videoController != null) {
        videoController.dispose();
      }
      videoController = null;
      videoController = VideoPlayerController.network(story.url)
        ..initialize().then((value) {
          setState(() {});
          if (videoController.value.isInitialized) {
            animationController.duration = videoController.value.duration;
            videoController.play();
            animationController.forward();
          }
        })
        ..addListener(() {
          if (videoController.value.isBuffering) {
            animationController.stop();
            context.read<StoryBloc>().updateVideoBufferingStatus = true;
          } else {
            animationController.duration = videoController.value.duration;
            context.read<StoryBloc>().updateVideoBufferingStatus = false;
            animationController.forward();
          }
        });
    } else {
      if (videoController != null) {
        videoController.dispose();
      }
      animationController.duration = story.storyImageDuration;
      animationController.forward();
    }
    if (animateToPage) {
      pageController.animateToPage(currentStoryIndex,
          duration: const Duration(milliseconds: 1), curve: Curves.easeInOut);
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    if (videoController != null) {
      videoController.dispose();
    }
    animationController.dispose();
    super.dispose();
  }
}
