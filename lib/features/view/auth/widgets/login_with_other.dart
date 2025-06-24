import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test1/features/view/auth/widgets/custom_outline_button.dart';
import 'package:flutter_test1/utils/constants/const_svgs.dart';

class LoginWithOther extends StatelessWidget {
  const LoginWithOther({super.key});

  @override
  Widget build(BuildContext context) {
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
                "Or",
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
          onPressed: () {},
          title: "Login with Google",
        ),
        SizedBox(height: 16.h),
        CustomOutlineButton(
          iconPath: ConstSvgs.facebookIcon,
          onPressed: () {},
          title: "Login with Facebook",
        ),
        SizedBox(height: 16.h),
        CustomOutlineButton(
          iconPath: ConstSvgs.phoneIcon,
          onPressed: () {},
          title: "Login with Phone",
        ),
      ],
    );
  }
}
