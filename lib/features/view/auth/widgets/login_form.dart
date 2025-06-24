import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test1/features/providers/auth_provider.dart';
import 'package:flutter_test1/features/view/auth/widgets/custom_button.dart';
import 'package:flutter_test1/features/view/auth/widgets/custom_text_field.dart';
import 'package:flutter_test1/utils/utils/validators.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authmodel = ref.watch(authProvider.notifier);
    final authState = ref.watch(authProvider);
    return Form(
      key: authmodel.loginFormKey,
      child: Column(
        children: [
          CustomTextField(
            controller: authmodel.emailController,
            title: "Email",
            validator: Validators.emailValidator,
          ),
          SizedBox(height: 24.h),
          CustomTextField(
            controller: authmodel.passwordController,
            title: "Password",
            validator: Validators.passwordValidator,
            isPassword: true,
            visible: authState.visible,
            onVisibilityToggle: authmodel.togglePasswordVisibility,
          ),
          SizedBox(height: 24.h),
          CustomButton(title: "Login", onPressed: () {}),
        ],
      ),
    );
  }
}
