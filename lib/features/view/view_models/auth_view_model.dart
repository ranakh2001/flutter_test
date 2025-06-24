import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test1/features/model/enums/auth_mode.dart';

class AuthViewModel extends StateNotifier<AuthFormState> {
  AuthViewModel() : super(AuthFormState.initial());

  // Controllers and FormKey for login
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  final registerFormKey = GlobalKey<FormState>();
  final forgetPasswordKey = GlobalKey<FormState>();
  final otpKey = GlobalKey<FormState>();

  void toggleMode() {
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    usernameController.clear();
    phoneController.clear();
    //used the mode to clear the controllers and don't initialize them again
    state = state.copyWith(
      mode: state.mode == AuthMode.login ? AuthMode.register : AuthMode.login,
    );
  }

  //form validation
  bool loginValidate() {
    return loginFormKey.currentState?.validate() ?? false;
  }

  bool registerValidate() {
    return registerFormKey.currentState?.validate() ?? false;
  }

  // toogle visiblity of password
  void togglePasswordVisibility() {
    state = state.copyWith(visible: !state.visible);
  }

  void toggleAgreeTerms() {
    state = state.copyWith(agreeTerms: !state.agreeTerms);
  }

  // clear controllers
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

//form states
class AuthFormState {
  final bool isLoading;
  final String? error;
  final bool visible;
  final bool agreeTerms;
  final AuthMode mode;

  const AuthFormState({
    this.isLoading = false,
    this.error,
    this.visible = true,
    this.agreeTerms = false,
    this.mode = AuthMode.login,
  });

  factory AuthFormState.initial() => const AuthFormState();

  AuthFormState copyWith({
    bool? isLoading,
    String? error,
    bool? visible,
    bool? agreeTerms,
    AuthMode? mode,
  }) {
    return AuthFormState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      visible: visible ?? this.visible,
      agreeTerms: agreeTerms ?? this.agreeTerms,
      mode: mode ?? this.mode,
    );
  }
}
