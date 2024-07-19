import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/constants/colors.dart';
import 'package:z_flow/core/styles/styles.dart';

class TextSwitcher extends StatefulWidget {
  const TextSwitcher({super.key});

  @override
  State<TextSwitcher> createState() => _TextSwitcherState();
}

class _TextSwitcherState extends State<TextSwitcher> {
  List<String> switchingTexts = [
    AppTexts.twentyFourHoursADay7Days,
    AppTexts.yourContinuedUse,
    AppTexts.toSetUsageLimitsForEach
  ];
  int _currentIndex = 0;
  late PageController _pageController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        if (_currentIndex == switchingTexts.length - 1) {
          _currentIndex = 0;
          _pageController.animateToPage(_currentIndex,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn);
        } else {
          _currentIndex += 1;
          _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn);
        }
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: PageView.builder(
          scrollDirection: Axis.vertical,
          controller: _pageController,
          itemCount: switchingTexts.length,
          itemBuilder: (context, index) {
            return Center(
              child: Text(
                switchingTexts[index],
                style: Styles.style24W600
                    .copyWith(color: ColorManager.primaryColorAccent),
              ),
            );
          }),
    );
  }
}
