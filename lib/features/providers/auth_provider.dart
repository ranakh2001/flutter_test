import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test1/features/view/view_models/auth_view_model.dart';
import 'package:flutter_test1/features/view/view_models/otp_state.dart';

final authProvider =
    StateNotifierProvider.autoDispose<AuthViewModel, AuthFormState>(
      (ref) => AuthViewModel(),
    );
final otpProvider = StateNotifierProvider<OtpNotifier, OtpState>((ref) {
  return OtpNotifier();
});
