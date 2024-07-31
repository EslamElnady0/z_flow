import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/constants/colors.dart';
import 'package:z_flow/core/routes/app_router.dart';
import 'package:z_flow/features/home/presentation/ui%20logic/ui%20models/bottom_nav_bar_item_model.dart';

import '../../features/home/presentation/ui logic/ui models/drawer_item_model.dart';
import '../../features/on boarding/data/on_boarding_model.dart';

class Constants {
  static const String tasksBox = 'tasksBox';
  static const String constantsBox = 'constantsBox';
  static const String habitsBox = 'habitsBox';
  static const String usersCollection = 'users';
  static const String tasksCollection = 'tasks';
  static const String habitsCollection = 'habits';
  static const String targetsCollection = 'targets';
  static final List<OnboardingModel> onBoardingScreens = [
    const OnboardingModel(
        image: Assets.firstOnBoarding,
        text: AppTexts.firstOnBoarding,
        desc: AppTexts.firstOnBoardingDesc),
    const OnboardingModel(
        image: Assets.secondOnBoarding,
        text: AppTexts.secondOnBoarding,
        desc: AppTexts.secondOnBoardingDesc),
    const OnboardingModel(
        image: Assets.thirdOnBoarding,
        text: AppTexts.thirdOnBoarding,
        desc: AppTexts.thirdOnBoardingDesc),
    const OnboardingModel(
        image: Assets.forthOnBoarding,
        text: AppTexts.fourthOnBoarding,
        desc: AppTexts.fourthOnBoardingDesc),
  ];

  static const LinearGradient customButtonGradient = LinearGradient(
      colors: ColorManager.customButtonBackgroundGradientColors,
      stops: [0, 1],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight);

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
  static const LinearGradient drawerGradient = LinearGradient(
      colors: ColorManager.drawerGradientColors,
      stops: [0, 0.5, 1],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  static List<BottomNavBarItemModel> bottomNavBarItems = [
    BottomNavBarItemModel(title: AppTexts.tasks, icon: Assets.tasksIcon),
    BottomNavBarItemModel(title: AppTexts.calender, icon: Assets.calenderIcon),
    BottomNavBarItemModel(title: AppTexts.time, icon: Assets.timeIcon),
    BottomNavBarItemModel(title: AppTexts.habits, icon: Assets.habitsIcon),
    BottomNavBarItemModel(title: AppTexts.profile, icon: Assets.profileIcon),
  ];

  static BoxShadow shadow =
      const BoxShadow(offset: Offset(0, 4), blurRadius: 4);

  static OutlineInputBorder authTextFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(color: Colors.white, width: 1.5));
  static OutlineInputBorder dataEntryTextFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(color: Color(0xffD9D9D9), width: 1));

  static List<DrawerItem> drawerItems = [
    DrawerItem(
        title: AppTexts.startWorkSession,
        icon: Assets.clock,
        route: AppRouter.workSession),
    DrawerItem(title: AppTexts.myLists, icon: Assets.list, route: ""),
    DrawerItem(title: AppTexts.reminder, icon: Assets.reminder, route: ""),
    DrawerItem(
        title: AppTexts.stayAway,
        icon: Assets.lockSafety,
        route: AppRouter.stayAway),
    DrawerItem(title: AppTexts.myGoals, icon: Assets.goals, route: ""),
    DrawerItem(
        title: AppTexts.taskCats, icon: Assets.listWithArrows, route: ""),
    DrawerItem(
        title: AppTexts.favoriteTasks,
        icon: Assets.starOutLined,
        route: AppRouter.favTasks),
    DrawerItem(
        title: AppTexts.favoriteHabits,
        icon: Assets.starOutLined,
        route: AppRouter.favHabits),
    DrawerItem(
        title: AppTexts.addHomeWidget, icon: Assets.addWidget, route: ""),
    DrawerItem(
        title: AppTexts.financialSupport, icon: Assets.dollar, route: ""),
    DrawerItem(title: AppTexts.settings, icon: Assets.settingDrawer, route: ""),
    DrawerItem(title: AppTexts.shareApp, icon: Assets.share, route: ""),
  ];

  static List<String> hoursForward =
      List<String>.generate(12, (index) => (index + 1).toString());

  static List<String> hours = hoursForward + ["0"] + hoursForward;
  ///////////////////////////////////////
  static List<String> minutesForward =
      List<String>.generate(59, (index) => (index + 1).toString());

  static List<String> minutes = minutesForward + ["0"] + minutesForward;
}
