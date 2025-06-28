import 'package:doos_doos/features/providers/auth_provider.dart';
import 'package:doos_doos/features/view/auth/widgets/custom_button.dart';
import 'package:doos_doos/features/view/auth/widgets/custom_text_field.dart';
import 'package:doos_doos/features/view/widgets/custom_app_bar.dart';
import 'package:doos_doos/l10n/app_localizations.dart';
import 'package:doos_doos/utils/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassword extends ConsumerWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forgetPasswordViewModel = ref.watch(forgetPasswordProvider.notifier);

    return Scaffold(
      appBar: CustomAppBar(title: AppLocalizations.of(context)!.forgetPassword),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.enterEmailToResrtPassword,
              style: Theme.of(context).textTheme.bodySmall,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            SizedBox(height: 24.h),
            Form(
              key: forgetPasswordViewModel.forgetPasswordKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: forgetPasswordViewModel.emailController,
                    title:
                        "${AppLocalizations.of(context)!.email} - ${AppLocalizations.of(context)!.phoneNumber}",
                    validator: Validators.emailValidator,
                  ),
                  SizedBox(height: 24.h),
                  CustomButton(
                    title: AppLocalizations.of(context)!.submit,
                    onPressed: () {
                      forgetPasswordViewModel.sendOtp(ref, context);
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
