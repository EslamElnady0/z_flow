import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/constants/colors.dart';

class Constants {
  static const String tasksBox = 'tasksBox';
  static const String constantsBox = 'constantsBox';
  static const String habitsBox = 'habitsBox';
  static const String goalsBox = 'goalsBox';
  static const String eventsBox = 'eventsBox';
  static const String linksBox = 'linksBox';
  static const String categoriesBox = 'categoriesBox';
  static const String usersCollection = 'users';
  static const String tasksCollection = 'tasks';
  static const String habitsCollection = 'habits';
  static const String goalsCollection = 'goals';
  static const String eventsCollection = 'events';
  static const String linksCollection = 'links';
  static const String categoriesCollection = 'categories';

  static const LinearGradient customButtonGradient = LinearGradient(
      colors: ColorManager.customButtonBackgroundGradientColors,
      stops: [0, 1],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight);
  static const LinearGradient customCloudyGradient = LinearGradient(
      colors: ColorManager.customSuggestCategorySelectionGradientColors,
      stops: [0, 1],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);
  static const LinearGradient customTimerGradient = LinearGradient(
      colors: ColorManager.customTimerGradientColors,
      stops: [0, 1],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  static LinearGradient buildCustomSnackBarGradient(List<Color> colors) {
    return LinearGradient(
      colors: colors,
      stops: const [0, 1],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );
  }

  static const LinearGradient customItemsGradient = LinearGradient(
      colors: ColorManager.customItemsBackgroundGradientColors,
      stops: [0, 1],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);
  static const LinearGradient customAboutDialogGradient = LinearGradient(
      colors: ColorManager.customAboutDialogGradientColors,
      stops: [0, 0.2, 1],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);
  static const LinearGradient drawerGradient = LinearGradient(
      colors: ColorManager.drawerGradientColors,
      stops: [0, 0.5, 1],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  static BoxShadow shadow =
      const BoxShadow(offset: Offset(0, 4), blurRadius: 4);

  static OutlineInputBorder authTextFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(color: Colors.white, width: 1.5));
  static OutlineInputBorder dataEntryTextFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(color: Color(0xffD9D9D9), width: 1));

  static List<String> switchingTimeManagementImages = [
    Assets.twentyForSevenBot,
    Assets.continuedUse,
    Assets.twentyFourSeven
  ];
  static List<String> switchingReminderImages = [
    Assets.calenderReminder,
    Assets.businessPlanningReminder,
  ];
  static List<String> switchingWorkSessionImages = [
    Assets.stopWatch,
    Assets.officeWorking,
    Assets.breakTime,
  ];
  static List<String> hoursForward =
      List<String>.generate(12, (index) => (index + 1).toString());

  static List<String> hours = hoursForward + ["0"] + hoursForward;
  ///////////////////////////////////////
  static List<String> minutesForward =
      List<String>.generate(59, (index) => (index + 1).toString());

  static List<String> minutes = minutesForward + ["0"] + minutesForward;
}
