import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AuthHelper {
  //login request
  Future login({
    required WidgetRef ref,
    required String email,
    required String password,
    required onSuccess,
    required onError,
  });

  // // register request
  Future register({
    required WidgetRef ref,
    required String name,
    required String email,
    required String phone,
    required String country,
    required String password,
    required onSuccess,
    required onError,
  });

  //verify email
  Future verifyEmail({
    required WidgetRef ref,
    required String otp,
    required onSuccess,
    required onError,
  });

  // // send otp to reset password
  Future sendOtp({
    required WidgetRef ref,
    required String email,
    required onSuccess,
    required onError,
  });

  // // verify otp
  Future verifyOtp({
    required WidgetRef ref,
    required String otp,
    required onSuccess,
    required onError,
  });

  // reset password
  Future resetPassword({
    required WidgetRef ref,
    required String password,
    required String confirmPassword,
    required String otp,
    required onSuccess,
    required onError,
  });
}
