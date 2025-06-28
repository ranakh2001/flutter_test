import 'package:doos_doos/features/view/auth/widgets/login_form.dart';
import 'package:doos_doos/features/view/auth/widgets/login_with_other.dart';
import 'package:doos_doos/l10n/app_localizations.dart';
import 'package:doos_doos/utils/constants/constants.dart';
import 'package:doos_doos/utils/router/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.signIn,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: Constants.cormorantFont,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 52.h),
                LoginForm(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routers.forgetPassword);
                      },
                      child: Text(
                        "${AppLocalizations.of(context)!.forgetPassword}?",
                        style: Theme.of(context).textTheme.labelMedium!,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                LoginWithOther(),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.dontHaveAccount,
                      style: Theme.of(context).textTheme.bodySmall!,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routers.register);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.signUp,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
