import 'package:doos_doos/features/providers/auth_provider.dart';
import 'package:doos_doos/features/view/auth/widgets/custom_button.dart';
import 'package:doos_doos/features/view/auth/widgets/custom_text_field.dart';
import 'package:doos_doos/utils/router/routers.dart';
import 'package:doos_doos/utils/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginViewModel = ref.watch(loginProvider.notifier);
    final loginState = ref.watch(loginProvider);
    return Form(
      key: loginViewModel.loginKey,
      child: Column(
        children: [
          CustomTextField(
            controller: loginViewModel.emailController,
            title: "Email",
            validator: Validators.emailValidator,
          ),
          SizedBox(height: 24.h),
          CustomTextField(
            controller: loginViewModel.passwordController,
            title: "Password",
            validator: Validators.passwordValidator,
            isPassword: true,
            visible: loginState.visible,
            onVisibilityToggle: loginViewModel.togglePasswordVisibility,
          ),
          SizedBox(height: 24.h),
          CustomButton(
            title: "Login",
            onPressed: () {
              // loginViewModel.login(ref, context);

              Navigator.pushReplacementNamed(context, Routers.home);
            },
          ),
        ],
      ),
    );
  }
}
