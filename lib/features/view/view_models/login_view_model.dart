import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test1/features/model/models/user.dart';
import 'package:flutter_test1/features/providers/shared_prefs_provider.dart';
import 'package:flutter_test1/features/view/widgets/show_snackbar.dart';
import 'package:flutter_test1/network/api/auth_api.dart';
import 'package:flutter_test1/utils/router/routers.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginViewModel extends StateNotifier<LoginState> {
  LoginViewModel() : super(const LoginState());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loginKey = GlobalKey<FormState>();

  void togglePasswordVisibility() {
    state = state.copyWith(visible: !state.visible);
  }

  bool validate() {
    return loginKey.currentState?.validate() ?? false;
  }

  void clearControllers() {
    emailController.clear();
    passwordController.clear();
  }

  // login request
  Future<void> login(WidgetRef ref, BuildContext context) async {
    // shared pref provider to save user data
    final prefs = ref.read(sharedPrefSettings);
    if (!loginKey.currentState!.validate()) return;
    state = state.copyWith(isLoading: true);

    await AuthApi().login(
      ref: ref,
      email: emailController.text,
      password: passwordController.text,
      onSuccess: (data) {
        if (data['user'] != null && data['access_token'] != null) {
          AppUser user = AppUser.fromJson(data['user']);
          prefs.setUserId(user.id.toString());
          prefs.setUserToken(data['access_token']);
          prefs.setLoggedIn(true);
        }
        clearControllers();
        state = state.copyWith(isLoading: false);
        showSnackBar(context, 'logged in successfully');
        Navigator.pushReplacementNamed(context, Routers.home);
      },
      onError: (error) {
        state = state.copyWith(isLoading: false);
        showSnackBar(context, '${error['message']}', isError: true);
      },
    );
  }

  final GoogleSignIn googleSignIn = GoogleSignIn.instance;

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.authenticate();

    if (googleUser == null) {
      throw FirebaseAuthException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in aborted by user',
      );
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: null,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

class LoginState {
  final bool isLoading;
  final bool visible;

  const LoginState({this.isLoading = false, this.visible = true});

  LoginState copyWith({bool? isLoading, bool? visible}) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      visible: visible ?? this.visible,
    );
  }
}
