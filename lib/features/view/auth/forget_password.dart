import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test1/features/providers/auth_provider.dart';
import 'package:flutter_test1/features/view/auth/widgets/custom_button.dart';
import 'package:flutter_test1/features/view/auth/widgets/custom_text_field.dart';
import 'package:flutter_test1/features/view/widgets/custom_app_bar.dart';
import 'package:flutter_test1/utils/router/routers.dart';
import 'package:flutter_test1/utils/utils/validators.dart';

class ForgetPassword extends ConsumerWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authmodel = ref.watch(authProvider.notifier);

    return Scaffold(
      appBar: CustomAppBar(title: "Forget Password"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Column(
          children: [
            Text(
              "Please enter email address or phone number to reset your password ",
              style: Theme.of(context).textTheme.bodySmall,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            SizedBox(height: 24.h),
            Form(
              key: authmodel.forgetPasswordKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: authmodel.emailController,
                    title: "Email - phone number",
                    validator: Validators.emailValidator,
                  ),
                  SizedBox(height: 24.h),
                  CustomButton(
                    title: "Submit",
                    onPressed: () {
                      Navigator.pushNamed(context, Routers.verifyOtp);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
