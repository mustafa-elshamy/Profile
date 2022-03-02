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
  final BehaviorSubject<bool> _showAds = BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject<bool> _showSettings =
      BehaviorSubject<bool>.seeded(false);

  Stream<String> get selectedCvSection => _selectedCvSection.stream;

  Stream<double> get appBarWidth => _appBarWidth.stream;

  Stream<bool> get showCvTitle => _showCvTitle.stream;

  Stream<bool> get showAds => _showAds.stream;

  Stream<bool> get showSettings => _showSettings.stream;

  set updateSelectedCvSection(String val) => _selectedCvSection.sink.add(val);

  set updateAppBarWidth(double val) => _appBarWidth.sink.add(val);

  set updateCvTitle(bool val) => _showCvTitle.sink.add(val);

  set updateShowAds(bool val) => _showAds.sink.add(val);

  set updateShowSettings(bool val) => _showSettings.sink.add(val);

  void toggleShowAds() => _showAds.sink.add(!_showAds.value);

  void toggleShowSettings() => _showSettings.sink.add(!_showSettings.value);

  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {});
  }

  @override
  Future<void> close() {
    _appBarWidth.close();
    _showCvTitle.close();
    _showAds.close();
    _selectedCvSection.close();
    _showSettings.close();
    return super.close();
  }
}
