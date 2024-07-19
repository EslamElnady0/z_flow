import 'package:flutter/material.dart';
import 'package:z_flow/core/constants/colors.dart';

class MainTheme {
  static final mainTheme = ThemeData(
      useMaterial3: true,
      primaryColor: ColorManager.primaryColor,
      iconTheme: const IconThemeData(color: Colors.white),
      popupMenuTheme: const PopupMenuThemeData(iconColor: Colors.black),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
          foregroundColor: Colors.white),
      dividerTheme: const DividerThemeData(color: Colors.grey),
      fontFamily: "Cairo");
}
