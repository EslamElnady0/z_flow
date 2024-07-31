import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/widgets/inner_shadow.dart';
import '../ui cubits/timer cubit/timer_cubit.dart';
import 'gradient_circular_progress_indicator_painter.dart';

class CustomTimerWithText extends StatelessWidget {
  final Duration duration;
  final double value;
  const CustomTimerWithText(
      {super.key, required this.duration, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 226.h,
      width: 226.w,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          InnerShadow(
            shadows: [
              BoxShadow(
                  offset: const Offset(-2, -2),
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.5))
            ],
            child: CustomPaint(
              painter: GradientCircularProgressPainter(
                  shadow: BoxShadow(
                      offset: const Offset(0, 4),
                      blurRadius: 21.3,
                      color: const Color(0xff0B3F7D).withOpacity(0.48)),
                  strokeWidth: 30,
                  value: value,
                  gradient: Constants.customTimerGradient),
            ),
          ),
          Center(
            child: Text(
              "${duration.inMinutes.remainder(60).toString().padLeft(2, "0")}:${context.read<TimerCubit>().duration.inSeconds.remainder(60).toString().padLeft(2, "0")}",
              style: Styles.style40w700,
            ),
          )
        ],
      ),
    );
  }
}
