import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final BehaviorSubject<double> _appBarWidth =
      BehaviorSubject<double>.seeded(1);
  final BehaviorSubject<String> _selectedCvSection =
      BehaviorSubject<String>.seeded("");
  final BehaviorSubject<bool> _showCvTitle =
      BehaviorSubject<bool>.seeded(false);

  Stream<double> get appBarWidth => _appBarWidth.stream;

  Stream<bool> get showCvTitle => _showCvTitle.stream;

  Stream<String> get selectedCvSection => _selectedCvSection.stream;

  set updateAppBarWidth(double val) => _appBarWidth.sink.add(val);

  set updateCvTitle(bool val) => _showCvTitle.sink.add(val);

  set updateSelectedCvSection(String val) => _selectedCvSection.sink.add(val);


  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {});
  }


  @override
  Future<void> close() {
    _appBarWidth.close();
    _showCvTitle.close();
    return super.close();
  }
}
