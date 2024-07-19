import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/constants/colors.dart';
import 'package:z_flow/core/routes/app_router.dart';
import 'package:z_flow/core/widgets/custom_scaffold.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _positionController;
  late AnimationController _rotationController;
  late AnimationController _scaleController;

  late Animation<Offset> _offsetAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    initSplashAnimations();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, AppRouter.onBoarding);
    });
    super.initState();
  }

  @override
  void dispose() {
    _positionController.dispose();
    _rotationController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SlideTransition(
              position: _offsetAnimation,
              child: RotationTransition(
                turns: _rotationAnimation,
                child: SizedBox(
                  width: 80.w, // Set the desired width
                  height: 80.h, // Set the desired height
                  child: Image.asset(
                    Assets.logo,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: const CircleAvatar(
                backgroundColor: ColorManager.primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  void initSplashAnimations() {
    _positionController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..forward();
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, -7.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _positionController,
      curve: Curves.easeInBack,
    ));
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 1, // 90 degrees in terms of turns (0.25 turn = 90 degrees)
    ).animate(CurvedAnimation(
      parent: _rotationController,
      curve: Curves.easeInOut,
    ));

    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(
      begin: 0,
      end: 100,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.easeInCubic,
    ));
    _positionController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _rotationController.forward();
      }
    });
    _rotationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Timer(const Duration(seconds: 1), () {
          _scaleController.forward();
        });
      }
    });
  }
}
