import 'package:doos_doos/features/view/view_models/forget_password_view_model.dart';
import 'package:doos_doos/features/view/view_models/login_view_model.dart';
import 'package:doos_doos/features/view/view_models/register_view_model.dart';
import 'package:doos_doos/features/view/view_models/reset_password_view-model.dart';
import 'package:doos_doos/features/view/view_models/verify_otp_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = StateNotifierProvider<LoginViewModel, LoginState>((ref) {
  return LoginViewModel();
});
final registerProvider =
    StateNotifierProvider<RegisterViewModel, RegisterState>((ref) {
      return RegisterViewModel();
    });
final forgetPasswordProvider =
    StateNotifierProvider<ForgetPasswordViewModel, ForgetPasswordState>(
      (ref) => ForgetPasswordViewModel(),
    );
final otpProvider = StateProvider<String>((ref) => '');
final verifyOtpProvider =
    StateNotifierProvider<VerifyOtpViewModel, VerifyOtpState>(
      (ref) => VerifyOtpViewModel(),
    );
final resetPasswordProvider =
    StateNotifierProvider<ResetPasswordViewModel, ResetPasswordState>(
      (ref) => ResetPasswordViewModel(),
    );
