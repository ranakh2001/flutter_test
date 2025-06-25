import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test1/features/core/theme/button_theme/app_button_theme.dart';
import 'package:flutter_test1/features/core/theme/color/color_manager.dart';
import 'package:flutter_test1/features/core/theme/size/app_size.dart';
import 'package:flutter_test1/features/core/theme/text_theme/text_manager.dart';
import 'package:flutter_test1/features/core/theme/text_theme/text_theme.dart';
import 'package:flutter_test1/utils/constants/constants.dart';

class AppTheme {
  static AppTheme inatance = AppTheme._internal();
  AppTheme._internal();
  //light theme
  ThemeData get lightTheme {
    return ThemeData(
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.all(ColorManager.instance.primaryColor),
      ),
      primaryColor: ColorManager.instance.primaryColor,
      hintColor: ColorManager.instance.primaryColor,
      colorScheme: ColorScheme.light(
        primary: ColorManager.instance.primaryColor,
        surface: ColorManager.instance.backgroundColor,
        secondary: ColorManager.instance.secondaryColor,
        error: ColorManager.instance.redError,
      ),
      fontFamily: Constants.fontFamily,
      cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
        primaryColor: ColorManager.instance.primaryColor,
        primaryContrastingColor: ColorManager.instance.primaryColor,
      ),
      secondaryHeaderColor: ColorManager.instance.secondaryColor,
      scaffoldBackgroundColor: ColorManager.instance.backgroundColor,
      dividerColor: ColorManager.instance.secondaryColor,
      appBarTheme: AppBarTheme(
        color: ColorManager.instance.primaryColor,
        iconTheme: IconThemeData(color: ColorManager.instance.primaryColor),
        titleTextStyle: AppTextTheme.textAppTheme.headlineSmall?.copyWith(
          color: ColorManager.instance.primaryColor,
          fontWeight: FontWeight.w400,
        ),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.instance.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      ),
      textTheme: AppTextTheme.textAppTheme,
      elevatedButtonTheme: AppButtonTheme.instance.elevatedButtonStyle,
      outlinedButtonTheme: AppButtonTheme.instance.outlinedButtonStyle,
      textButtonTheme: AppButtonTheme.instance.textButtonStyle,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ColorManager.instance.primaryColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextManager.headline6.copyWith(
          color: ColorManager.instance.primaryColor,
          fontWeight: FontWeight.w500,
        ),
        labelStyle: AppTextTheme.textAppTheme.titleMedium?.copyWith(
          color: ColorManager.instance.primaryColor,
          fontWeight: FontWeight.w500,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 28),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.r8),
          borderSide: BorderSide(color: ColorManager.instance.secondaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.r8),
          borderSide: BorderSide(color: ColorManager.instance.secondaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.r8),
          borderSide: BorderSide(color: ColorManager.instance.primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.r8),
          borderSide: BorderSide(color: ColorManager.instance.redError),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.r8),
          borderSide: BorderSide(color: ColorManager.instance.redError),
        ),
      ),
      // bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //   type: BottomNavigationBarType.fixed,
      //   backgroundColor: ColorManager.instance.bottomNavigationBackgroundColor,
      //   selectedItemColor: ColorManager.instance.primaryColor,
      //   unselectedItemColor: ColorManager.instance.secondaryColor,
      //   selectedLabelStyle: TextManager.headline6.copyWith(
      //     color: ColorManager.instance.primaryColor,
      //     fontSize: TextFontSize.fontSize12,
      //   ),
      //   unselectedLabelStyle: TextManager.headline6.copyWith(
      //     color: ColorManager.instance.secondaryColor,
      //     fontSize: TextFontSize.fontSize1,
      //   ),
      // ),
      popupMenuTheme: PopupMenuThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.r12),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.all(
          ColorManager.instance.backgroundColor,
        ),
        checkColor: WidgetStateProperty.all(
          ColorManager.instance.backgroundColor,
        ),
        side: BorderSide(
          color: ColorManager.instance.secondaryColor,
          width: 0.5,
          style: BorderStyle.solid,
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.all(
          ColorManager.instance.backgroundColor,
        ),
        trackColor: WidgetStateProperty.all(ColorManager.instance.primaryColor),
        trackOutlineColor: WidgetStateColor.resolveWith(
          (states) => ColorManager.instance.secondaryColor,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorManager.instance.primaryColor,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: ColorManager.instance.primaryColor,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: ColorManager.instance.backgroundColor,
      ),
    );
  }
}
