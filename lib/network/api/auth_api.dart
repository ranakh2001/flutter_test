import 'package:doos_doos/features/providers/dio_manager_provider.dart';
import 'package:doos_doos/network/constance_network/constance_network.dart';
import 'package:doos_doos/network/helper/auth_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthApi extends AuthHelper {
  /// Singleton instance
  static final AuthApi _instance = AuthApi._internal();

  AuthApi._internal();

  factory AuthApi() {
    return _instance;
  }

  @override
  Future login({
    required WidgetRef ref,
    required String email,
    required String password,
    required onSuccess,
    required onError,
  }) async {
    final dioManager = ref.read(dioManagerProvider);
    final response = await dioManager.dioPost(
      url: ConstanceNetwork.login,
      body: {'email': email, 'password': password},
    );
    if (response.statusCode == 200) {
      return onSuccess(response.data);
    } else {
      return onError(response.data);
    }
  }

  @override
  Future sendOtp({
    required WidgetRef ref,
    required String email,
    required onSuccess,
    required onError,
  }) async {
    final dioManager = ref.read(dioManagerProvider);
    final response = await dioManager.dioPost(
      url: ConstanceNetwork.sendOTP,
      body: {'email': email},
    );
    if (response.statusCode == 200) {
      onSuccess(response.data);
    } else {
      onError(response.data);
    }
  }

  @override
  Future verifyOtp({
    required WidgetRef ref,
    required String otp,
    required onSuccess,
    required onError,
  }) {
    final dioManager = ref.read(dioManagerProvider);
    return dioManager
        .dioPost(url: ConstanceNetwork.receiveOTP, body: {'otp': otp})
        .then((response) {
          if (response.statusCode == 200) {
            onSuccess(response.data);
          } else {
            onError(response.data);
          }
        });
  }

  @override
  Future resetPassword({
    required WidgetRef ref,
    required String password,
    required String confirmPassword,
    required String otp,
    required onSuccess,
    required onError,
  }) async {
    final dioManager = ref.read(dioManagerProvider);
    final response = await dioManager.dioPost(
      url: ConstanceNetwork.resetpassword,
      body: {
        'password': password,
        'password_confirmation': confirmPassword,
        'otp': otp,
      },
    );
    if (response.statusCode == 200) {
      return onSuccess(response.data);
    } else {
      return onError(response.data);
    }
  }

  @override
  Future register({
    required WidgetRef ref,
    required String name,
    required String email,
    required String phone,
    required String country,

    required String password,
    required onSuccess,
    required onError,
  }) async {
    final dioManager = ref.read(dioManagerProvider);
    final response = await dioManager.dioPost(
      url: ConstanceNetwork.register,
      body: {
        'name': name,
        'email': email,
        'phone': phone,
        'country': country,
        'type': '0',
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      return onSuccess(response.data);
    } else {
      return onError(response.data);
    }
  }

  @override
  Future verifyEmail({
    required WidgetRef ref,
    required String otp,
    required onSuccess,
    required onError,
  }) async {
    final dioManager = ref.read(dioManagerProvider);
    final response = await dioManager.dioPost(
      url: ConstanceNetwork.verifyEmail,
      body: {'otp': otp},
    );
    if (response.statusCode == 200) {
      return onSuccess(response.data);
    } else {
      return onError(response.data);
    }
  }
}
