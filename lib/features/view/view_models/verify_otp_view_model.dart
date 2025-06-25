import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test1/features/providers/auth_provider.dart';
import 'package:flutter_test1/features/view/widgets/show_snackbar.dart';
import 'package:flutter_test1/network/api/auth_api.dart';
import 'package:flutter_test1/utils/router/routers.dart';

class VerifyOtpViewModel extends StateNotifier<VerifyOtpState> {
  VerifyOtpViewModel() : super(const VerifyOtpState());

  Future<void> verifyOtp(WidgetRef ref, BuildContext context) async {
    final otp = ref.read(otpProvider);
    state = state.copyWith(isLoading: true, error: null);

    await AuthApi().verifyOtp(
      ref: ref,
      otp: otp,
      onSuccess: (data) {
        state = state.copyWith(isLoading: false, error: null);
        showSnackBar(context, '${data['message']}');
        Navigator.pushNamed(context, Routers.restPassword);
      },
      onError: (error) {
        state = state.copyWith(isLoading: false, error: error);
        showSnackBar(context, '${error['message']}', isError: true);
      },
    );
  }
}

class VerifyOtpState {
  final bool isLoading;
  final String? error;

  const VerifyOtpState({this.isLoading = false, this.error});

  VerifyOtpState copyWith({bool? isLoading, String? error}) {
    return VerifyOtpState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
