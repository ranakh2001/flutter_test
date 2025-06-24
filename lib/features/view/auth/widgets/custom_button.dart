import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.onPressed,
    this.isOnboarding = false,
  });
  final String title;
  final VoidCallback? onPressed;
  final bool isOnboarding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isOnboarding
            ? Theme.of(context).scaffoldBackgroundColor
            : Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
        ),
        minimumSize: Size(double.infinity, 48.h),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: isOnboarding
              ? Theme.of(context).primaryColor
              : Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
