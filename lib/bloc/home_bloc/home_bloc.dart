import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BehaviorSubject<bool> _blurPage =
      BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject<bool> _isPostEmpty =
      BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject _media = BehaviorSubject.seeded([]);

  Stream<bool> get blurPage => _blurPage.stream;

  Stream<bool> get postStatus => _isPostEmpty.stream;

  Stream get postMedia => _media.stream;

  set setPageBlurring(bool val) => _blurPage.sink.add(val);

  set changePostStatus(bool val) => _isPostEmpty.sink.add(val);

  set modifyMedia(val) {
    if (val is List) {
      _media.sink.add([...val, ..._media.stream.value]);
    } else if (val != null) {
      _media.sink.add([val, ..._media.stream.value]);
    } else {
      _media.sink.add([]);
    }
  }

  set deleteMedia(int index) {
    List media = _media.stream.value;
    media.removeAt(index);
    _media.sink.add(media);
  }

  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
