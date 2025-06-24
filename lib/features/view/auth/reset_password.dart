import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test1/features/providers/auth_provider.dart';
import 'package:flutter_test1/features/view/auth/widgets/custom_button.dart';
import 'package:flutter_test1/features/view/auth/widgets/custom_text_field.dart';
import 'package:flutter_test1/features/view/widgets/custom_app_bar.dart';
import 'package:flutter_test1/utils/utils/validators.dart';

class ResetPassword extends ConsumerWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authmodel = ref.watch(authProvider.notifier);
    final authState = ref.watch(authProvider);
    return Scaffold(
      appBar: CustomAppBar(title: "Create new password"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Your new password must be diffrent from your old password",
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              SizedBox(height: 24.h),
              CustomTextField(
                controller: authmodel.passwordController,
                title: "New Password",
                isPassword: true,
                visible: authState.visible,
                validator: Validators.passwordValidator,
              ),
              SizedBox(height: 8.h),
              Text(
                "Password must have at least 6-12 character,a number and special character",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              SizedBox(height: 16.h),
              CustomTextField(
                controller: authmodel.confirmPasswordController,
                title: "Confirm New Password",
                isPassword: true,
                visible: authState.visible,
                validator: Validators.passwordValidator,
              ),
              Text(
                "Password must have at least 6-12 character,a number and special character",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              SizedBox(height: 16.h),
              CustomButton(title: "Reset Password", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
