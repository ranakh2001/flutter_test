import 'package:doos_doos/features/view/widgets/show_snackbar.dart';
import 'package:doos_doos/network/api/auth_api.dart';
import 'package:doos_doos/utils/router/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ForgetPasswordViewModel extends StateNotifier<ForgetPasswordState> {
  ForgetPasswordViewModel() : super(const ForgetPasswordState());

  final emailController = TextEditingController();

  final GlobalKey<FormState> forgetPasswordKey = GlobalKey<FormState>();

  void clearControllers() {
    emailController.clear();
  }

  // send otp code request
  Future sendOtp(WidgetRef ref, BuildContext context) async {
    if (!forgetPasswordKey.currentState!.validate()) return;
    state = state.copyWith(isLoading: true, error: null);
    await AuthApi().sendOtp(
      ref: ref,
      email: emailController.text,
      onSuccess: (data) {
        state = state.copyWith(isLoading: false, error: null);
        clearControllers();
        showSnackBar(context, '${data['message']}');
        Navigator.pushNamed(context, Routers.verifyOtp);
      },
      onError: (error) {
        state = state.copyWith(isLoading: false, error: error);
        showSnackBar(context, '${error['message']}', isError: true);
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}

class ForgetPasswordState {
  final bool isLoading;
  final String? error;
  final bool visible;

  const ForgetPasswordState({
    this.isLoading = false,
    this.error,
    this.visible = false,
  });

  ForgetPasswordState copyWith({
    bool? isLoading,
    String? error,
    bool? visible,
  }) {
    return ForgetPasswordState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      visible: visible ?? this.visible,
    );
  }
}
