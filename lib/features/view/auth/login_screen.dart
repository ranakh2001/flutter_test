import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test1/features/providers/auth_provider.dart';
import 'package:flutter_test1/features/view/auth/widgets/login_form.dart';
import 'package:flutter_test1/features/view/auth/widgets/login_with_other.dart';
import 'package:flutter_test1/utils/router/routers.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authmodel = ref.watch(authProvider.notifier);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Sign In",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w500,
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
                        "Forget password?",
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
                      'Don’t hava an account ?',
                      style: Theme.of(context).textTheme.bodySmall!,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routers.register);
                        authmodel.toggleMode(); // Toggle to register mode
                      },
                      child: Text(
                        'Sign Up',
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
