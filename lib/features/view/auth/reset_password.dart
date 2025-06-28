import 'package:doos_doos/features/providers/auth_provider.dart';
import 'package:doos_doos/features/view/auth/widgets/custom_button.dart';
import 'package:doos_doos/features/view/auth/widgets/custom_text_field.dart';
import 'package:doos_doos/features/view/widgets/custom_app_bar.dart';
import 'package:doos_doos/l10n/app_localizations.dart';
import 'package:doos_doos/utils/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPassword extends ConsumerWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resetPasswordViewModel = ref.watch(resetPasswordProvider.notifier);
    final resetPasswordState = ref.watch(resetPasswordProvider);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.createNewPassword,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: SingleChildScrollView(
          child: Form(
            key: resetPasswordViewModel.resetPasswordKey,
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.newPassCondition,
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(height: 24.h),
                CustomTextField(
                  controller: resetPasswordViewModel.passwordController,
                  title: AppLocalizations.of(context)!.newPassword,
                  isPassword: true,
                  visible: resetPasswordState.visible,
                  onVisibilityToggle:
                      resetPasswordViewModel.togglePasswordVisibility,
                  validator: Validators.passwordValidator,
                ),
                SizedBox(height: 8.h),
                Text(
                  AppLocalizations.of(context)!.passwordValidations,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: resetPasswordViewModel.confirmPasswordController,
                  title: AppLocalizations.of(context)!.confirmNewPassword,
                  isPassword: true,
                  visible: resetPasswordState.visible,
                  onVisibilityToggle:
                      resetPasswordViewModel.togglePasswordVisibility,
                  validator: Validators.passwordValidator,
                ),
                Text(
                  AppLocalizations.of(context)!.passwordValidations,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(height: 16.h),
                CustomButton(
                  title: AppLocalizations.of(context)!.resetPassword,
                  onPressed: () {
                    resetPasswordViewModel.resetPassword(ref, context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
