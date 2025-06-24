import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test1/features/providers/shared_prefs_provider.dart';
import 'package:flutter_test1/features/view/auth/login_screen.dart';
import 'package:flutter_test1/features/view/auth/onboarding.dart';

class PlaceHolder extends ConsumerWidget {
  const PlaceHolder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pref = ref.watch(sharedPrefSettings);
    if (!pref.isFirstTime) {
      return Onboarding();
    } else {
      return LoginScreen();
    }
  }
}
