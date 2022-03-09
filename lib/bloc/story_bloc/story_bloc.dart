import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'story_event.dart';

part 'story_state.dart';

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  final BehaviorSubject<bool> _isVideoBuffering =
      BehaviorSubject<bool>.seeded(false);

  Stream<bool> get videoBufferingStatus => _isVideoBuffering.stream;

  set updateVideoBufferingStatus(bool val) => _isVideoBuffering.sink.add(val);

  StoryBloc() : super(StoryInitial()) {
    on<StoryEvent>((event, emit) {});
  }
}
