// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get hello => 'Hello';

  @override
  String get welcome => 'Welcome to our app';

  @override
  String get onboarding1 => 'Book your trip now easy and safe !!';

  @override
  String get onboarding2 =>
      'Choose how you want your ride and when all over the country.';

  @override
  String get getStarted => 'Get Started';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get signIn => 'Sign In';

  @override
  String get or => 'OR';

  @override
  String get loginWithGoogle => 'Login with Google';

  @override
  String get loginWithFacebook => 'Login with Facebook';

  @override
  String get loginWithPhone => 'Login with Phone';

  @override
  String get dontHaveAccount => 'Don\'t have an account?';

  @override
  String get signUp => 'Sign Up';

  @override
  String get userName => 'User name';

  @override
  String get phoneNumber => 'Phone number';

  @override
  String get confirmPassword => 'Confirm password';

  @override
  String get forgetPassword => 'Forget password';

  @override
  String get enterEmailToResrtPassword =>
      'Please enter email address or phone number to reset your password ';

  @override
  String get submit => 'Submit';

  @override
  String get verifyOtp => 'OTP Verification';

  @override
  String get verifyAccount => 'Verify your account';

  @override
  String get otpSent => 'We sent Email with 6-digit OTP Verification Code to';

  @override
  String get resendCode => 'Resend Code';

  @override
  String get createNewPassword => 'Create new password';

  @override
  String get newPassCondition =>
      'Your new password must be diffrent from your old password';

  @override
  String get newPassword => 'New Password';

  @override
  String get passwordValidations =>
      'Password must have at least 6-12 character,a number and special character';

  @override
  String get confirmNewPassword => 'Confirm new password';

  @override
  String get resetPassword => 'Reset password';
}
