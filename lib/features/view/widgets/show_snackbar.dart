import 'package:flutter/material.dart';
import 'package:flutter_test1/features/core/theme/color/color_manager.dart';

void showSnackBar(BuildContext context, String message, {Duration duration = const Duration(seconds: 2), bool isError = false}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: duration,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      backgroundColor: isError? ColorManager.instance.redError: ColorManager.instance.greenSuccess,
    ),
  );
}
