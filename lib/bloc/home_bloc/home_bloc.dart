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

  Stream<bool> get showCreatePost => _showCreatePost.stream;
  Stream<bool> get postStatus => _isPostEmpty.stream;

  set createPostStatus(bool val) => _showCreatePost.sink.add(val);
  set changePostStatus(bool val) => _isPostEmpty.sink.add(val);

  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
