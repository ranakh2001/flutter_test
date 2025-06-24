import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test1/features/providers/splash_provider.dart';
import 'package:flutter_test1/utils/constants/const_images.dart';
import 'package:flutter_test1/utils/router/routers.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    await Future.delayed(const Duration(seconds: 1));
    ref.read(splashProvider.notifier).complete();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<bool>(splashProvider, (_, isComplete) {
      if (isComplete) {
        Navigator.pushReplacementNamed(context, Routers.placeholder);
      }
    });

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).colorScheme.surface,
          statusBarIconBrightness: Brightness.light,
        ),
        child: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Theme.of(context).primaryColor,
            child: Image.asset(ConstImages.logo),
          ),
        ),
      ),
    );
  }
}
