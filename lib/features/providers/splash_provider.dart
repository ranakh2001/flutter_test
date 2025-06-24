import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashNotifier extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  void complete() {
    state = true;
  }
}

final splashProvider = NotifierProvider<SplashNotifier, bool>(
  SplashNotifier.new,
);
