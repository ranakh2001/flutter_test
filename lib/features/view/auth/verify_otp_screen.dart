import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test1/features/view/auth/widgets/custom_button.dart';
import 'package:flutter_test1/features/view/auth/widgets/otp_Input-field.dart';
import 'package:flutter_test1/features/view/widgets/custom_app_bar.dart';
import 'package:flutter_test1/utils/router/routers.dart';

class VerifyOtpScreen extends ConsumerStatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  ConsumerState<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends ConsumerState<VerifyOtpScreen> {
  final int otpLength = 4;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    focusNodes = List.generate(otpLength, (_) => FocusNode());
    focusNodes.first.requestFocus();
  }

  @override
  void dispose() {
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "OTP Verification"),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Verify your account",
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 16.h),
            Text(
              "We sent Email with 6-digit OTP Verification Code to +1234567898",
              style: Theme.of(context).textTheme.bodySmall,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                otpLength,
                (index) => OtpInputField(
                  index: index,
                  focusNode: focusNodes[index],
                  nextFocusNode: index + 1 < otpLength
                      ? focusNodes[index + 1]
                      : null,
                ),
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Resend Code",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            CustomButton(
              title: "Submit",
              onPressed: () {
                Navigator.pushNamed(context, Routers.restPassword);
              },
            ),
          ],
        ),
      ),
    );
  }
}
