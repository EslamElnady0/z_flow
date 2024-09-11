import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/core/widgets/custom_button.dart';
import 'package:z_flow/features/on%20boarding/data/on_boarding_model.dart';
import 'package:z_flow/generated/l10n.dart';

class CustomOnBoardingNextButton extends StatelessWidget {
  const CustomOnBoardingNextButton({
    super.key,
    required this.currentIndex,
    required this.onBoardingScreens,
    required PageController pageController,
  }) : _pageController = pageController;

  final int currentIndex;
  final PageController _pageController;
  final List<OnboardingModel> onBoardingScreens;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      raduis: 16.r,
      text: currentIndex == 3 ? S.of(context).back : S.of(context).next,
      gradient: Constants.customButtonGradient,
      onTap: () {
        if (currentIndex < onBoardingScreens.length - 1) {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeIn,
          );
        } else {
          _pageController.animateToPage(
            0,
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeInOut,
          );
        }
      },
    );
  }
}
