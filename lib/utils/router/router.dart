import 'package:flutter/widgets.dart';
import 'package:flutter_test1/features/view/auth/forget_password.dart';
import 'package:flutter_test1/features/view/auth/login_screen.dart';
import 'package:flutter_test1/features/view/auth/onboarding.dart';
import 'package:flutter_test1/features/view/auth/register.dart';
import 'package:flutter_test1/features/view/auth/reset_password.dart';
import 'package:flutter_test1/features/view/auth/verify_otp_screen.dart';
import 'package:flutter_test1/features/view/home/home.dart';
import 'package:flutter_test1/features/view/splash_screen.dart';
import 'package:flutter_test1/placeholder.dart';
import 'package:flutter_test1/utils/router/routers.dart';

class AppRouter {
  static Map<String, Widget Function(BuildContext)> routes = {
    Routers.splash: (context) => const SplashScreen(),
    Routers.onboarding: (context) => const Onboarding(),
    Routers.placeholder: (context) => const PlaceHolder(),
    Routers.login: (context) => const LoginScreen(),
    Routers.register: (context) => const Register(),
    Routers.forgetPassword: (context) =>  ForgetPassword(),
    Routers.verifyOtp: (context) => const VerifyOtpScreen(),
    Routers.restPassword: (context)=>  ResetPassword(),
    Routers.home: (context)=> const Home()
  };
}
