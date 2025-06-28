

import 'package:doos_doos/features/core/theme/color/color_manager.dart';
import 'package:doos_doos/features/core/theme/text_theme/text_font_size.dart';
import 'package:doos_doos/utils/constants/constants.dart';
import 'package:flutter/cupertino.dart';


abstract class TextManager {
  static TextStyle get inputTheme => TextStyle(
        fontFamily: Constants.montserratFont,
        color: ColorManager.instance.primaryColor,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get headline1 => TextStyle(
      fontFamily: Constants.montserratFont,
      color: ColorManager.instance.primaryColor,
      fontWeight: FontWeight.normal,
      fontSize: TextFontSize.fontSize34,
      overflow: TextOverflow.ellipsis);

  static TextStyle get headline2 => TextStyle(
      fontFamily: Constants.montserratFont,
      color: ColorManager.instance.primaryColor,
      fontWeight: FontWeight.normal,
      fontSize: TextFontSize.fontSize28,
      overflow: TextOverflow.ellipsis);

  static TextStyle get headline3 => TextStyle(
      fontFamily: Constants.montserratFont,
      color: ColorManager.instance.primaryColor,
      fontWeight: FontWeight.normal,
      fontSize: TextFontSize.fontSize24,
      overflow: TextOverflow.ellipsis);

  static TextStyle get headline4 => TextStyle(
      fontFamily: Constants.montserratFont,
      color: ColorManager.instance.primaryColor,
      fontWeight: FontWeight.normal,
      fontSize: TextFontSize.fontSize20,
      overflow: TextOverflow.ellipsis);

  static TextStyle get headline5 => TextStyle(
      fontFamily: Constants.montserratFont,
      color: ColorManager.instance.primaryColor,
      fontWeight: FontWeight.normal,
      fontSize: TextFontSize.fontSize16,
      overflow: TextOverflow.ellipsis);

  static TextStyle get headline6 => TextStyle(
      fontFamily: Constants.montserratFont,
      color: ColorManager.instance.primaryColor,
      fontWeight: FontWeight.normal,
      fontSize: TextFontSize.fontSize12,
      overflow: TextOverflow.ellipsis);

  static TextStyle get subTitle1 => TextStyle(
      fontFamily: Constants.montserratFont,
      color: ColorManager.instance.primaryColor,
      fontWeight: FontWeight.normal,
      fontSize: TextFontSize.fontSize17,
      overflow: TextOverflow.ellipsis);

  static TextStyle get subTitle2 => TextStyle(
      fontFamily: Constants.montserratFont,
      color: ColorManager.instance.primaryColor,
      fontWeight: FontWeight.normal,
      fontSize: TextFontSize.fontSize12,
      overflow: TextOverflow.ellipsis);

  static TextStyle get textBody1 => TextStyle(
      fontFamily: Constants.montserratFont,
      color: ColorManager.instance.primaryColor,
      fontWeight: FontWeight.normal,
      fontSize: TextFontSize.fontSize16,
      overflow: TextOverflow.ellipsis);

  static TextStyle get textBody2 => TextStyle(
      fontFamily: Constants.montserratFont,
      color: ColorManager.instance.primaryColor,
      fontWeight: FontWeight.normal,
      fontSize: TextFontSize.fontSize14,
      overflow: TextOverflow.ellipsis);
}
