import 'package:doos_doos/features/providers/auth_provider.dart';
import 'package:doos_doos/features/view/auth/widgets/custom_outline_button.dart';
import 'package:doos_doos/l10n/app_localizations.dart';
import 'package:doos_doos/utils/constants/const_svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginWithOther extends ConsumerWidget {
  const LoginWithOther({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginViewModel = ref.watch(loginProvider.notifier);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(color: Theme.of(context).colorScheme.secondary),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text(
                AppLocalizations.of(context)!.or,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              child: Divider(color: Theme.of(context).colorScheme.secondary),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        CustomOutlineButton(
          iconPath: ConstSvgs.googleIcon,
          onPressed: () {
            // loginViewModel.signInWithGoogle();
          },
          title: AppLocalizations.of(context)!.loginWithGoogle,
        ),
        SizedBox(height: 16.h),
        CustomOutlineButton(
          iconPath: ConstSvgs.facebookIcon,
          onPressed: () {},
          title: AppLocalizations.of(context)!.loginWithFacebook,
        ),
        SizedBox(height: 16.h),
        CustomOutlineButton(
          iconPath: ConstSvgs.phoneIcon,
          onPressed: () {},
          title: AppLocalizations.of(context)!.loginWithPhone,
        ),
      ],
    );
  }
}
