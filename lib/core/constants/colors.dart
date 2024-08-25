import 'package:flutter/material.dart';

class ColorManager {
  static const Color primaryColor = Color(0xff0B3F7D);
  static const Color primaryColorAccent = Color(0xff2387FF);
  static const Color lightCyan = Color(0xff00CF9D);
  static const Color green = Color(0xff4CAF50);
  static const Color lightgreen = Color(0xff00CF08);
  static const Color red = Color(0xffF44336);
  static const Color lightGrey = Color(0xffD9D9D9);

  static const List<Color> backgroundGradientColors = [
    Color(0xff02020F),
    Color(0xff021123),
    Color(0xff010011),
  ];
  static const List<Color> drawerGradientColors = [
    Color(0xff02020F),
    Color(0xff010116),
    Color(0xff010011),
  ];
  static const List<Color> customButtonBackgroundGradientColors = [
    primaryColor,
    Color(0xff1472E3),
  ];
  static const List<Color> customTimerGradientColors = [
    Color(0xff1472E3),
    primaryColor,
  ];
  static const List<Color> customItemsBackgroundGradientColors = [
    Colors.white,
    Color(0xffD7E9FF),
  ];
  static const List<Color> customItemsSuccussSnackBarGradientColors = [
    Color(0xff0F933C),
    Color(0xff14E34E),
  ];
  static const List<Color> customItemsFailureSnackBarGradientColors = [
    Color(0xff930F0F),
    Color(0xffE31414),
  ];
}
