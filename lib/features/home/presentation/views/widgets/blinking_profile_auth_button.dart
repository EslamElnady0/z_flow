import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/core/widgets/custom_button.dart';
import 'package:z_flow/features/on%20boarding/presentaion/views/widgets/custom_on_boarding_skip_button.dart';

import '../../../../../core/styles/styles.dart';

class BlinkingProfileAuthButton extends StatefulWidget {
  final String text;
  const BlinkingProfileAuthButton({
    super.key,
    required this.text,
  });

  @override
  State<BlinkingProfileAuthButton> createState() =>
      _BlinkingProfileAuthButtonState();
}

class _BlinkingProfileAuthButtonState extends State<BlinkingProfileAuthButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
          milliseconds: 2500), // Duration for each fade in/out cycle
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomHollowButton(
            height: 45.h, text: widget.text, style: Styles.style20W700white),
        AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Opacity(
                opacity: _animation.value,
                child: CustomButton(
                  gradient: Constants.customButtonGradient,
                  height: 45.h,
                  text: widget.text,
                  raduis: 14.r,
                ),
              );
            })
      ],
    );
  }
}
