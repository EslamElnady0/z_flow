import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/assets.dart';

class ImageSwitcher extends StatefulWidget {
  const ImageSwitcher({super.key});

  @override
  State<ImageSwitcher> createState() => _ImageSwitcherState();
}

class _ImageSwitcherState extends State<ImageSwitcher> {
  List<String> switchingImages = [
    Assets.twentyForSevenBot,
    Assets.continuedUse,
    Assets.twentyFourSeven
  ];
  int _currentIndex = 0;
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % switchingImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: Image.asset(
        switchingImages[_currentIndex],
        height: 296.h,
        key: ValueKey<int>(_currentIndex),
        fit: BoxFit.cover,
      ),
    );
  }
}
