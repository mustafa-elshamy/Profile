import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  BehaviorSubject<double> _appBarWidth = BehaviorSubject<double>.seeded(20);

  Stream<double> get appBarWidth => _appBarWidth.stream;

  Function(double) get updateAppBarWidth => _appBarWidth.sink.add;

  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {});
  }
}
