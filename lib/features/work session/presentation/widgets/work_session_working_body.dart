import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/core/styles/styles.dart';

import '../ui cubits/timer cubit/timer_cubit.dart';

class WorkSessionWorkingBody extends StatefulWidget {
  const WorkSessionWorkingBody({super.key});

  @override
  State<WorkSessionWorkingBody> createState() => _WorkSessionWorkingBodyState();
}

class _WorkSessionWorkingBodyState extends State<WorkSessionWorkingBody> {
  late Timer timer;
  void startWorkingTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (context.read<TimerCubit>().workingCounter >= 0) {
        context.read<TimerCubit>().duration =
            Duration(seconds: context.read<TimerCubit>().workingCounter);
        context.read<TimerCubit>().workingCounter--;
        context.read<TimerCubit>().updateTimer();
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    startWorkingTimer();

    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerState>(
      builder: (context, state) {
        return Column(
          children: [
            const Divider(),
            SizedBox(
              height: 14.h,
            ),
            Text(
              AppTexts.inWorkSession,
              style: Styles.style14w400,
            ),
            SizedBox(
              height: 80.h,
            ),
            SizedBox(
              height: 226.h,
              width: 226.w,
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  // ShaderMask(
                  //   shaderCallback: (rect) {
                  //     return Constants.customTimerGradient.createShader(rect);
                  //   },
                  //   child:
                  //   CircularProgressIndicator(
                  //     value: (context.read<TimerCubit>().workingCounter /
                  //         context.read<TimerCubit>().workingSeconds),
                  //     color: ColorManager.primaryColorAccent,
                  //     strokeWidth: 30.r,
                  //   ),
                  // ),
                  CustomPaint(
                    painter: GradientCircularProgressPainter(
                        shadow: BoxShadow(
                            offset: const Offset(0, 4),
                            blurRadius: 21.3,
                            color: const Color(0xff0B3F7D).withOpacity(0.48)),
                        strokeWidth: 30,
                        value: (context.read<TimerCubit>().workingCounter /
                            context.read<TimerCubit>().workingSeconds),
                        gradient: Constants.customTimerGradient),
                  ),
                  Center(
                    child: Text(
                      "${context.read<TimerCubit>().duration.inMinutes.remainder(60).toString().padLeft(2, "0")}:${context.read<TimerCubit>().duration.inSeconds.remainder(60).toString().padLeft(2, "0")}",
                      style: Styles.style40w700,
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class GradientCircularProgressPainter extends CustomPainter {
  final double strokeWidth;
  final double value;
  final LinearGradient gradient;
  final BoxShadow? shadow;

  GradientCircularProgressPainter({
    required this.strokeWidth,
    required this.value,
    required this.gradient,
    this.shadow,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Offset.zero & size;

    if (shadow != null) {
      Paint shadowPaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..color = shadow!.color.withOpacity(shadow!.color.opacity)
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, shadow!.blurRadius);

      double startAngle = -3.14 / 2;
      double sweepAngle = 2 * 3.14 * value;

      canvas.drawArc(rect.deflate(strokeWidth / 2), startAngle, sweepAngle,
          false, shadowPaint);
    }

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..shader = gradient.createShader(rect);

    double startAngle = -3.14 / 2;
    double sweepAngle = 2 * 3.14 * value;

    canvas.drawArc(
        rect.deflate(strokeWidth / 2), startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
