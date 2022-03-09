import 'package:profile/constants/enums.dart';

class Story {
  final StoryMediaType mediaType;
  final String url;
  final Duration storyImageDuration;

  Story({
    this.url,
    this.mediaType,
    this.storyImageDuration,
  });
}
