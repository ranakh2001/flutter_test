import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtpState {
  final List<String> otpValues;

  OtpState(this.otpValues);

  OtpState copyWith({List<String>? otpValues}) {
    return OtpState(otpValues ?? this.otpValues);
  }
}

class OtpNotifier extends StateNotifier<OtpState> {
  OtpNotifier() : super(OtpState(List.filled(6, '')));

  void setOtpAt(int index, String value) {
    final newOtp = List<String>.from(state.otpValues);
    newOtp[index] = value;
    state = state.copyWith(otpValues: newOtp);
  }

  bool isComplete() {
    return state.otpValues.every((element) => element.length == 1);
  }

  String getOtp() {
    return state.otpValues.join();
  }
}