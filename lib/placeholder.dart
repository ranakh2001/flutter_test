import 'package:doos_doos/features/providers/shared_prefs_provider.dart';
import 'package:doos_doos/features/view/auth/login_screen.dart';
import 'package:doos_doos/features/view/auth/onboarding.dart';
import 'package:doos_doos/features/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class PlaceHolder extends ConsumerWidget {
  const PlaceHolder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pref = ref.watch(sharedPrefSettings);
    if (!pref.isFirstTime) {
      return Onboarding();
    } else if (!pref.isLoggedIn) {
      return LoginScreen();
    } else {
      return Home();
    }
  }
}
