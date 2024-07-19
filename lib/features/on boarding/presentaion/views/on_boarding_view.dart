import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:z_flow/core/constants/colors.dart';
import 'package:z_flow/core/styles/styles.dart';
import 'package:z_flow/core/widgets/custom_scaffold.dart';
import 'package:z_flow/features/on%20boarding/presentaion/views/widgets/custom_on_boarding_next_button.dart';
import 'package:z_flow/features/on%20boarding/presentaion/views/widgets/custom_on_boarding_skip_button.dart';
import 'package:z_flow/features/on%20boarding/presentaion/views/widgets/on_boarding_item.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/routes/app_router.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late PageController _pageController;
  int currentIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(
              height: 40.36.h,
            ),
            SizedBox(
              height: 290.h,
              child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  controller: _pageController,
                  itemCount: Constants.onBoardingScreens.length,
                  itemBuilder: (context, index) {
                    var scale = index == currentIndex ? 1.0 : 0.5;
                    return TweenAnimationBuilder(
                      duration: const Duration(milliseconds: 350),
                      tween: Tween(begin: scale, end: scale),
                      curve: Curves.easeInOut,
                      child: OnBoardingItem(
                        onboardingModel: Constants.onBoardingScreens[index],
                      ),
                      builder: (context, value, child) {
                        return Transform.scale(scale: value, child: child);
                      },
                    );
                  }),
            ),
            Text(
              Constants.onBoardingScreens[currentIndex].text,
              style: Styles.style35W700blue,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              Constants.onBoardingScreens[currentIndex].desc,
              style: Styles.style16W600grey,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 34.h,
            ),
            const Spacer(),
            SmoothPageIndicator(
              controller: _pageController,
              count: Constants.onBoardingScreens.length,
              effect: const SwapEffect(
                dotHeight: 8,
                dotWidth: 10,
                paintStyle: PaintingStyle.stroke,
                activeDotColor: ColorManager.primaryColor,
                type: SwapType.zRotation,
                dotColor: Colors.grey,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            CustomOnBoardingNextButton(
                currentIndex: currentIndex, pageController: _pageController),
            SizedBox(
              height: 17.h,
            ),
            CustomHollowButton(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, AppRouter.auth, (route) => false);
              },
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}
