import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class RegisterViewModel extends StateNotifier<RegisterState> {
  RegisterViewModel() : super(const RegisterState());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();

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

  RegisterState copyWith({
    bool? isLoading,
    bool? visible,
    bool? agreeTerms,
  }) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      visible: visible ?? this.visible,
      agreeTerms: agreeTerms ?? this.agreeTerms,
    );
  }
}
