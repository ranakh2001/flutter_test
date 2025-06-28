import 'package:doos_doos/features/providers/auth_provider.dart';
import 'package:doos_doos/features/view/auth/widgets/custom_button.dart';
import 'package:doos_doos/features/view/widgets/custom_app_bar.dart';
import 'package:doos_doos/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends ConsumerWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final verifyOtpViewModel = ref.watch(verifyOtpProvider.notifier);
    return Scaffold(
      appBar: CustomAppBar(title: AppLocalizations.of(context)!.verifyOtp),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.verifyAccount,
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 16.h),
            Text(
              "${AppLocalizations.of(context)!.otpSent} +1234567898",
              style: Theme.of(context).textTheme.bodySmall,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            SizedBox(height: 24.h),
            PinCodeTextField(
              keyboardType: TextInputType.number,
              appContext: context,
              length: 6,
              autoFocus: true,
              obscureText: false,
              animationType: AnimationType.fade,
              cursorColor: Theme.of(context).primaryColor,
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              textStyle: Theme.of(context).textTheme.bodySmall,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(30.r),
                fieldHeight: 50.h,
                fieldWidth: 50.w,
                activeFillColor: Colors.white,
                selectedFillColor: Colors.grey.shade200,
                inactiveFillColor: Colors.grey.shade100,
                activeColor: Theme.of(context).primaryColor,
                selectedColor: Theme.of(context).primaryColor,
                inactiveColor: Theme.of(context).colorScheme.secondary,
              ),
              onChanged: (value) {
                ref.read(otpProvider.notifier).state = value;
              },
              onCompleted: (value) {},
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    AppLocalizations.of(context)!.resendCode,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            CustomButton(
              title: AppLocalizations.of(context)!.submit,
              onPressed: () {
                verifyOtpViewModel.verifyOtp(ref, context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
