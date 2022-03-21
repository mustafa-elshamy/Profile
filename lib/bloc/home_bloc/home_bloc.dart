import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BehaviorSubject<bool> _showCreatePost =
      BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject<bool> _isPostEmpty =
      BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject _media = BehaviorSubject.seeded([]);

  Stream<bool> get showCreatePost => _showCreatePost.stream;

  Stream<bool> get postStatus => _isPostEmpty.stream;

  Stream get postMedia => _media.stream;

  set createPostStatus(bool val) => _showCreatePost.sink.add(val);

  set changePostStatus(bool val) => _isPostEmpty.sink.add(val);

  set modifyMedia(val) {
    if (val is List) {
      _media.sink.add([...val, ..._media.value]);
    } else {
      _media.value.add(val);
      _media.sink.add(_media.value);
    }
  }

  set deleteMedia(int index) {
    _media.value.remove(_media.value[index]);
    _media.sink.add(_media.value);
  }

  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
