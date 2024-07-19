import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/constants/colors.dart';
import 'package:z_flow/features/home/presentation/ui%20models/bottom_nav_bar_item_model.dart';

import '../../features/on boarding/data/on_boarding_model.dart';

class Constants {
  static final List<OnboardingModel> onBoardingScreens = [
    OnboardingModel(
        image: Assets.firstOnBoarding,
        text: "Mental Health",
        height: 239.67.h,
        desc:
            "Explore the importance of mental health and common psychological issues in this introductory screen."),
    OnboardingModel(
        image: Assets.secondOnBoarding,
        text: "Techniques",
        height: 254.h,
        desc:
            "Unwind and harness the power of breathing with relaxation techniques. Learn how to use breathing and meditation to calm the mind and enhance mental well-being in this essential screen."),
    OnboardingModel(
        image: Assets.thirdOnBoarding,
        text: "Community",
        height: 226.h,
        desc:
            "Join our private community where you can post, comment, and interact with others. Share your experiences, seek advice, and find solutions together in this inclusive space."),
  ];

  static const LinearGradient customButtonGradient = LinearGradient(
      colors: ColorManager.customButtonBackgroundGradientColors,
      stops: [0, 1],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight);
  static const LinearGradient customItemsGradient = LinearGradient(
      colors: ColorManager.customItemsBackgroundGradientColors,
      stops: [0, 1],
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

  static OutlineInputBorder textFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(color: Colors.white, width: 1.5));
}
