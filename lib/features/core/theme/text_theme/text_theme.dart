
import 'package:flutter/material.dart';
import 'package:flutter_test1/features/core/theme/color/color_manager.dart';
import 'package:flutter_test1/features/core/theme/text_theme/text_manager.dart';

abstract class AppTextTheme {
  static TextTheme textAppTheme = TextTheme(
    displayMedium: TextManager.headline1,
    displaySmall: TextManager.headline2,
    headlineMedium: TextManager.headline3,
    headlineSmall: TextManager.headline4,
    titleLarge: TextManager.headline5,
    titleMedium: TextManager.headline6,
    titleSmall: TextManager.subTitle1,
    bodyLarge: TextManager.subTitle2,
    bodyMedium: TextManager.textBody1,
    bodySmall: TextManager.textBody2,
  );

  static TextTheme textAppThemeDark = TextTheme(
    displayMedium: TextManager.headline1.copyWith(
      color: ColorManager.instance.backgroundColor,
    ),
    displaySmall: TextManager.headline2.copyWith(
      color: ColorManager.instance.backgroundColor,
    ),
    headlineMedium: TextManager.headline3.copyWith(
      color: ColorManager.instance.backgroundColor,
    ),
    headlineSmall: TextManager.headline4.copyWith(
      color: ColorManager.instance.backgroundColor,
    ),
    titleLarge: TextManager.headline5.copyWith(
      color: ColorManager.instance.backgroundColor,
    ),
    titleMedium: TextManager.headline6.copyWith(
      color: ColorManager.instance.backgroundColor,
    ),
    titleSmall: TextManager.subTitle1.copyWith(
      color: ColorManager.instance.backgroundColor,
    ),
    bodyLarge: TextManager.subTitle2.copyWith(
      color: ColorManager.instance.backgroundColor,
    ),
    bodyMedium: TextManager.textBody1.copyWith(
      color: ColorManager.instance.backgroundColor,
    ),
    bodySmall: TextManager.textBody2.copyWith(
      color: ColorManager.instance.backgroundColor,
    ),
  );
}
