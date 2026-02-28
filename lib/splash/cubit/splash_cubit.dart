import 'dart:async';

import 'package:bloc/bloc.dart';

class SplashCubit extends Cubit<String> {
  SplashCubit() : super(_subtitles[0]) {
    _startCycling();
  }

  static const _subtitles = ['imagine', 'build', 'wonder'];
  int _index = 0;
  Timer? _timer;

  void _startCycling() {
    _timer = Timer.periodic(const Duration(milliseconds: 3640), (_) {
      _index = (_index + 1) % _subtitles.length;
      emit(_subtitles[_index]);
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
