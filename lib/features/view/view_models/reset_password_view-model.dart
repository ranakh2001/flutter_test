import 'package:doos_doos/features/providers/auth_provider.dart';
import 'package:doos_doos/features/view/widgets/show_snackbar.dart';
import 'package:doos_doos/network/api/auth_api.dart';
import 'package:doos_doos/utils/router/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResetPasswordViewModel extends StateNotifier<ResetPasswordState> {
  ResetPasswordViewModel() : super(const ResetPasswordState());

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> resetPasswordKey = GlobalKey<FormState>();

  void clearControllers() {
    passwordController.clear();
    confirmPasswordController.clear();
  }

  void togglePasswordVisibility() {
    state = state.copyWith(visible: !state.visible);
  }

  Future resetPassword(WidgetRef ref, BuildContext context) async {
    if (!resetPasswordKey.currentState!.validate()) return;

    final otp = ref.read(otpProvider);
    state = state.copyWith(isLoading: true, error: null);

    await AuthApi().resetPassword(
      ref: ref,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
      otp: otp,
      onSuccess: (data) {
        state = state.copyWith(isLoading: false, error: null);
        clearControllers();
        showSnackBar(context, '${data['message']}');
        Navigator.pushReplacementNamed(context, Routers.login);
      },
      onError: (error) {
        state = state.copyWith(isLoading: false, error: error);
        showSnackBar(context, '${error['message']}', isError: true);
      },
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}

class ResetPasswordState {
  final bool isLoading;
  final String? error;
  final bool visible;

  const ResetPasswordState({
    this.isLoading = false,
    this.error,
    this.visible = false,
  });

  ResetPasswordState copyWith({bool? isLoading, String? error, bool? visible}) {
    return ResetPasswordState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      visible: visible ?? this.visible,
    );
  }
}
