
import 'package:flutter/material.dart';
import 'package:flutter_test1/features/core/theme/color/color_manager.dart';
import 'package:flutter_test1/features/core/theme/size/app_size.dart';
import 'package:flutter_test1/features/core/theme/text_theme/text_font_size.dart';
import 'package:flutter_test1/features/core/theme/text_theme/text_manager.dart';
import 'package:flutter_test1/utils/constants/constants.dart';


class AppButtonTheme {
  AppButtonTheme._();
  static AppButtonTheme instance = AppButtonTheme._();

  ElevatedButtonThemeData get elevatedButtonStyle => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.instance.transparent,
          foregroundColor: ColorManager.instance.backgroundColor,
          side: BorderSide.none,
          elevation: 0.5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.r8),
          ),
          minimumSize: const Size(double.infinity, 48),
          textStyle: TextStyle(
            fontFamily: Constants.fontFamily,
            color: ColorManager.instance.backgroundColor,
            fontSize: TextFontSize.fontSize16,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  OutlinedButtonThemeData get outlinedButtonStyle => OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: ColorManager.instance.transparent,
          side: BorderSide(
            color: ColorManager.instance.backgroundColor,
            width: 0.86,
          ),
          elevation: 0,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.r10),
          ),
          minimumSize: Size(double.infinity, AppSize.h44),
          textStyle: TextManager.headline5.copyWith(
            color: ColorManager.instance.backgroundColor,
          ),
        ),
      );

  ButtonStyle outlinedButtonTheme({Color? textColor, Color? borderColor}) =>
      OutlinedButton.styleFrom(
          backgroundColor: textColor ?? ColorManager.instance.backgroundColor,
          disabledBackgroundColor: ColorManager.instance.secondaryColor,
          elevation: 0,
          side: BorderSide(
            color: borderColor ?? ColorManager.instance.backgroundColor,
            width: 0.5,
          ),
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.r8),
            side: BorderSide(
              color: borderColor ?? ColorManager.instance.backgroundColor,
            ),
          ),
          minimumSize: Size(double.infinity, AppSize.h44),
          textStyle: TextStyle(
            fontSize: TextFontSize.fontSize12,
            fontFamily: Constants.fontFamily,
          ));

  TextButtonThemeData get textButtonStyle => TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: ColorManager.instance.primaryColor,
          backgroundColor: ColorManager.instance.transparent,
          textStyle: TextStyle(
            fontFamily: Constants.fontFamily,
            color: ColorManager.instance.primaryColor,
            fontSize: TextFontSize.fontSize16,
          ),
        ),
      );

 
}
