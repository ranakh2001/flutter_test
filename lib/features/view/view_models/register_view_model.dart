import 'package:doos_doos/features/view/widgets/show_snackbar.dart';
import 'package:doos_doos/network/api/auth_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class RegisterViewModel extends StateNotifier<RegisterState> {
  RegisterViewModel() : super(const RegisterState());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final contryController = TextEditingController();

  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();

  void togglePasswordVisibility() {
    state = state.copyWith(visible: !state.visible);
  }

  void toggleAgreeTerms() {
    state = state.copyWith(agreeTerms: !state.agreeTerms);
  }

  bool validate() {
    return registerKey.currentState?.validate() ?? false;
  }

  void clearControllers() {
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    usernameController.clear();
    phoneController.clear();
  }

  // register request
  Future register(WidgetRef ref, BuildContext context) async {
    if (!validate()) return;
    state = state.copyWith(isLoading: true);
    await AuthApi().register(
      ref: ref,
      name: usernameController.text,
      email: emailController.text,
      phone: phoneController.text,
      country: contryController.text,
      password: passwordController.text,
      onSuccess: (data) {
        state = state.copyWith(isLoading: false);
        showSnackBar(context, data['message']);
      },
      onError: (error) {
        state = state.copyWith(isLoading: false);
        showSnackBar(context, 'something went wrong', isError: true);
      },
    );
  }
  

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    usernameController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}

class RegisterState {
  final bool isLoading;
  final bool visible;
  final bool agreeTerms;

  const RegisterState({
    this.isLoading = false,
    this.visible = true,
    this.agreeTerms = false,
  });

  RegisterState copyWith({bool? isLoading, bool? visible, bool? agreeTerms}) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      visible: visible ?? this.visible,
      agreeTerms: agreeTerms ?? this.agreeTerms,
    );
  }
}
