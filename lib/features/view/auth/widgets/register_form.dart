import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test1/features/providers/auth_provider.dart';
import 'package:flutter_test1/features/view/auth/widgets/custom_button.dart';
import 'package:flutter_test1/features/view/auth/widgets/custom_text_field.dart';
import 'package:flutter_test1/utils/utils/validators.dart';

class RegisterForm extends ConsumerWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rigesterViewModel = ref.watch(registerProvider.notifier);
    final registerState = ref.watch(registerProvider);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 24),
          Form(
            key: rigesterViewModel.registerKey,
            child: Column(
              children: [
                CustomTextField(
                  controller: rigesterViewModel.usernameController,
                  title: "User name",
                  validator: Validators.usernameValidator,
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: rigesterViewModel.phoneController,
                  title: "Phone number",
                  keyboardType: TextInputType.phone,
                  validator: Validators.phoneValidator,
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: rigesterViewModel.emailController,
                  title: "Email",
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.emailValidator,
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: rigesterViewModel.passwordController,
                  title: "Password",
                  visible: registerState.visible,
                  isPassword: true,
                  validator: Validators.passwordValidator,
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: rigesterViewModel.confirmPasswordController,
                  title: "Confirm password",
                  visible: registerState.visible,
                  isPassword: true,
                  validator: (value) {
                    return Validators.confirmPasswordValidator(
                      value,
                      rigesterViewModel.passwordController.text,
                    );
                  },
                ),
                SizedBox(height: 8.h),
                CheckboxListTile(
                  value: registerState.agreeTerms,
                  onChanged: (_) => rigesterViewModel.toggleAgreeTerms(),
                  activeColor: Theme.of(context).primaryColor,
                  title: Text(
                    "I agree to the Terms & Conditions and Privacy Policy of DOOS DOOS.",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                ),
                SizedBox(height: 16.h),
                CustomButton(title: "Sign Up", onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
